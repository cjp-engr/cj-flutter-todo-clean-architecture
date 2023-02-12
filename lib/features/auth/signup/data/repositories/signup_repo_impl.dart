import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:todo_app_clean_arch/core/errors/exceptions/exceptions.dart';
import 'package:todo_app_clean_arch/core/errors/failures/failures.dart';
import 'package:todo_app_clean_arch/features/auth/signup/data/datasources/signup_remote_datasource.dart';
import 'package:todo_app_clean_arch/features/auth/signup/domain/entities/signup_entity.dart';
import 'package:todo_app_clean_arch/features/auth/signup/domain/repositories/signup_repo.dart';

class SignupRepoImpl implements SignupRepo {
  final SignupRemoteDatasource signupRemoteDatasource;
  SignupRepoImpl({required this.signupRemoteDatasource});

  @override
  Future<Either<Failure, SignupEntity>> setNewUserRepo({
    required String userId,
    required String name,
    required String email,
    required String password,
    required String profileImage,
  }) async {
    try {
      final result = await signupRemoteDatasource.setNewUserRemoteDatasource(
        userId: userId,
        name: name,
        email: email,
        password: password,
        profileImage: profileImage,
      );
      return right(result);
    } on SignupException catch (_) {
      return left(SignupFailure());
    } catch (_) {
      return left(GeneralFailure());
    }
  }
}
