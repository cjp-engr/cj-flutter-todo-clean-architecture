import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb_auth;
import 'package:firebase_auth/firebase_auth.dart';

abstract class SignupRemoteDatasource {
  Future<Either<String, String>> setNewUserRemoteDatasource({
    required String name,
    required String email,
    required String password,
  });
}

class SignupRemoteDatasourceImpl implements SignupRemoteDatasource {
  final FirebaseFirestore firebaseFirestore;
  final fb_auth.FirebaseAuth firebaseAuth;

  SignupRemoteDatasourceImpl(
      {required this.firebaseFirestore, required this.firebaseAuth});

  Stream<fb_auth.User?> get user => firebaseAuth.userChanges();

  @override
  Future<Either<String, String>> setNewUserRemoteDatasource({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final usersRef = FirebaseFirestore.instance.collection('users');
      final fb_auth.UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      final signedInUser = userCredential.user!;

      await usersRef.doc(signedInUser.uid).set({
        'name': name,
        'email': email,
        'profileImage': 'https://picsum.photos/300',
        'point': 0,
        'rank': 'bronze',
      });
      return right('I am succesfully registered');
    } on FirebaseAuthException catch (e) {
      return left(e.message!);
    } catch (e) {
      return left(e.toString());
    }
  }
}