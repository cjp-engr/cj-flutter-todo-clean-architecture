// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart' as fb_auth;
import 'package:todo_app_clean_arch/core/errors/exceptions/exceptions.dart';
import 'package:todo_app_clean_arch/features/auth/signin/data/models/signin_model.dart';

abstract class SigninRemoteDatasource {
  Future<SigninModel> signinUserRemoteDataSource({
    required String email,
    required String password,
  });
}

class SigninRemoteDatasourceImpl implements SigninRemoteDatasource {
  final fb_auth.FirebaseAuth firebaseAuth;
  SigninRemoteDatasourceImpl({
    required this.firebaseAuth,
  });

  @override
  Future<SigninModel> signinUserRemoteDataSource(
      {required String email, required String password}) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final userDetails = SigninModel(email: email, password: password);
      return SigninModel.fromJson(userDetails.toJson());
    } on fb_auth.FirebaseAuthException catch (e) {
      log(e.message!);
      throw SigninException();
    } catch (_) {
      throw GeneralException();
    }
  }
}
