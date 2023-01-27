import 'dart:async';

import 'package:dartz/dartz.dart';

abstract class SignupRepo {
  Future<Either<String, String>> setNewUserRepo({
    required String name,
    required String email,
    required String password,
  });
}
