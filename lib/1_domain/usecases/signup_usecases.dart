import 'package:dartz/dartz.dart';
import 'package:todo_app_clean_arch/1_domain/repositories/signup_repo.dart';

class SignupUseCases {
  final SignupRepo signupRepo;
  SignupUseCases({required this.signupRepo});
  Future<Either<String, String>> registerUserUseCase(
      String name, String email, String password) async {
    try {
      final result = await signupRepo.setNewUserRepo(
          name: name, email: email, password: password);
      return result;
    } catch (e) {
      return left(e.toString());
    }
  }
}
