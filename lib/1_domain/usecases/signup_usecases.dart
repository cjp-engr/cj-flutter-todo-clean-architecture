import 'package:dartz/dartz.dart';
import 'package:todo_app_clean_arch/1_domain/failures/failures.dart';
import 'package:todo_app_clean_arch/1_domain/repositories/signup_repo.dart';

class SignupUseCases {
  final SignupRepo signupRepo;
  SignupUseCases({required this.signupRepo});
  Future<Either<Failure, String>> registerUserUseCase(
      String name, String email, String password) async {
    try {
      signupRepo.setNewUserRepo(name: name, email: email, password: password);
      return right('Successfully set new user repo');
    } catch (e) {
      return left(GeneralFailure());
    }
  }
}
