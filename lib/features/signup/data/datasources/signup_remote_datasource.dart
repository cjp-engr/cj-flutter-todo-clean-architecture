import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb_auth;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app_clean_arch/core/errors/exceptions/exceptions.dart';
import 'package:todo_app_clean_arch/features/signup/data/models/signup_model.dart';

abstract class SignupRemoteDatasource {
  Future<SignupModel> setNewUserRemoteDatasource({
    required String userId,
    required String name,
    required String email,
    required String password,
    required String profileImage,
  });
}

class SignupRemoteDatasourceImpl implements SignupRemoteDatasource {
  final fb_auth.FirebaseAuth firebaseAuth;

  SignupRemoteDatasourceImpl({required this.firebaseAuth});

  Stream<fb_auth.User?> get user => firebaseAuth.userChanges();

  @override
  Future<SignupModel> setNewUserRemoteDatasource({
    required String userId,
    required String name,
    required String email,
    required String password,
    required String profileImage,
  }) async {
    try {
      final usersRef = FirebaseFirestore.instance.collection('users');
      final fb_auth.UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      final signedInUser = userCredential.user!;

      Map<String, dynamic> details = {
        'userId': signedInUser.uid,
        'name': name,
        'email': email,
        'password': 'secret',
        'profileImage': profileImage,
      };

      await usersRef.doc(signedInUser.uid).set(details);

      return SignupModel.fromJson(details);
    } on FirebaseAuthException catch (e) {
      log(e.message!);
      throw SignupException();
    } catch (_) {
      throw GeneralException();
    }
  }
}