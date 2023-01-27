import 'dart:async';

import 'package:todo_app_clean_arch/0_data/datasources/signup_remote_datasource.dart';
import 'package:todo_app_clean_arch/0_data/exceptions/exceptions.dart';
import 'package:dartz/dartz.dart';
import 'package:todo_app_clean_arch/1_domain/repositories/signup_repo.dart';

class SignupRepoImpl implements SignupRepo {
  final SignupRemoteDatasource signupRemoteDatasource;
  SignupRepoImpl({required this.signupRemoteDatasource});
  @override
  Future<Either<String, String>> setNewUserRepo({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final result = await signupRemoteDatasource.setNewUserRemoteDatasource(
          name: name, email: email, password: password);
      return result;
    } on ServerException catch (e) {
      return left(e.toString());
    } catch (e) {
      return left(e.toString());
    }
  }
}
