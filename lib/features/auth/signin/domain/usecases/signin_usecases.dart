// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:todo_app_clean_arch/core/errors/failures/failures.dart';
import 'package:todo_app_clean_arch/features/auth/signin/domain/entities/signin_entity.dart';
import 'package:todo_app_clean_arch/features/auth/signin/domain/repositories/signin_repo.dart';

class SigninUseCases {
  final SigninRepo signinRepo;
  const SigninUseCases({
    required this.signinRepo,
  });

  Future<Either<Failure, SigninEntity>> signinUserUseCase(
    String email,
    String password,
  ) async {
    final result = await signinRepo.signinExistingUserRepo(
        email: email, password: password);
    return result;
  }
}
