import 'package:equatable/equatable.dart';
import 'package:todo_app_clean_arch/features/signup/domain/entities/signup_entity.dart';

class SignupModel extends SignupEntity with EquatableMixin {
  SignupModel({
    required String userId,
    required String name,
    required String email,
    required String password,
    required String profileImage,
  }) : super(
          userId: userId,
          name: name,
          email: email,
          password: password,
          profileImage: profileImage,
        );

  factory SignupModel.fromJson(Map<String, dynamic> json) {
    return SignupModel(
      userId: json['userId'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      profileImage: json['profileImage'],
    );
  }
}
