import 'package:dartz/dartz.dart';
import 'package:todo_app_clean_arch/core/errors/failures/failures.dart';
import 'package:todo_app_clean_arch/features/signup/domain/entities/signup_entity.dart';
import 'package:todo_app_clean_arch/features/signup/domain/repositories/signup_repo.dart';

class SignupUseCases {
  final SignupRepo signupRepo;
  SignupUseCases({required this.signupRepo});

  Future<Either<Failure, SignupEntity>> registerUserUseCase(
    String userId,
    String name,
    String email,
    String password,
    String profileImage,
  ) async {
    final result = await signupRepo.setNewUserRepo(
      userId: userId,
      name: name,
      email: email,
      password: password,
      profileImage: profileImage,
    );
    return result;
  }
}
