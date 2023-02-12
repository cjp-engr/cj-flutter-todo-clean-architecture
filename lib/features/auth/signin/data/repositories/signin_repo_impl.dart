// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:todo_app_clean_arch/core/errors/exceptions/exceptions.dart';

import 'package:todo_app_clean_arch/core/errors/failures/failures.dart';
import 'package:todo_app_clean_arch/features/auth/signin/data/datasources/signin_remote_datasource.dart';
import 'package:todo_app_clean_arch/features/auth/signin/domain/entities/signin_entity.dart';
import 'package:todo_app_clean_arch/features/auth/signin/domain/repositories/signin_repo.dart';

class SigninRepoImpl implements SigninRepo {
  final SigninRemoteDatasource signinRemoteDatasource;
  SigninRepoImpl({
    required this.signinRemoteDatasource,
  });
  @override
  Future<Either<Failure, SigninEntity>> signinExistingUserRepo(
      {required String email, required String password}) async {
    try {
      final result = await signinRemoteDatasource.signinUserRemoteDataSource(
          email: email, password: password);
      return right(result);
    } on SigninException catch (_) {
      return left(SigninFailure());
    } catch (_) {
      return left(GeneralFailure());
    }
  }
}
