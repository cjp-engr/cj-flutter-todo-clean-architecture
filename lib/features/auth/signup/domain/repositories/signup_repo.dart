import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:todo_app_clean_arch/core/errors/failures/failures.dart';
import 'package:todo_app_clean_arch/features/auth/signup/domain/entities/signup_entity.dart';

abstract class SignupRepo {
  Future<Either<Failure, SignupEntity>> setNewUserRepo({
    required String userId,
    required String name,
    required String email,
    required String password,
    required String profileImage,
  });
}
