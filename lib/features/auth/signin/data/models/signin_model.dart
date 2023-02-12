import 'package:equatable/equatable.dart';
import 'package:todo_app_clean_arch/features/auth/signin/domain/entities/signin_entity.dart';

class SigninModel extends SigninEntity with EquatableMixin {
  SigninModel({
    required String email,
    required String password,
  }) : super(
          email: email,
          password: password,
        );

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }

  factory SigninModel.fromJson(Map<String, dynamic> json) {
    return SigninModel(email: json['email'], password: '');
  }
}
