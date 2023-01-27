import 'dart:async';

import 'package:todo_app_clean_arch/0_data/datasources/signup_remote_datasource.dart';
import 'package:todo_app_clean_arch/0_data/exceptions/exceptions.dart';
import 'package:todo_app_clean_arch/1_domain/failures/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:todo_app_clean_arch/1_domain/repositories/signup_repo.dart';

class SignupRepoImpl implements SignupRepo {
  final SignupRemoteDatasource signupRemoteDatasource;
  SignupRepoImpl({required this.signupRemoteDatasource});
  @override
  Future<Either<Failure, String>> setNewUserRepo({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      await signupRemoteDatasource.setNewUserRemoteDatasource(
          name: name, email: email, password: password);
      return right('Succesfully passed to remote data source');
    } on ServerException catch (_) {
      return left(ServerFailure());
    } catch (e) {
      return left(GeneralFailure());
    }
  }
}
