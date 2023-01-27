import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:todo_app_clean_arch/1_domain/failures/failures.dart';

abstract class SignupRepo {
  Future<Either<Failure, String>> setNewUserRepo({
    required String name,
    required String email,
    required String password,
  });
}
