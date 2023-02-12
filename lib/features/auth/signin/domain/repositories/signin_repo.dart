import 'package:dartz/dartz.dart';
import 'package:todo_app_clean_arch/core/errors/failures/failures.dart';
import 'package:todo_app_clean_arch/features/auth/signin/domain/entities/signin_entity.dart';

abstract class SigninRepo {
  Future<Either<Failure, SigninEntity>> signinExistingUserRepo({
    required String email,
    required String password,
  });
}
