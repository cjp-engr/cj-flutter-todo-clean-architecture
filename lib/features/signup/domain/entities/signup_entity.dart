import 'package:equatable/equatable.dart';

class SignupEntity extends Equatable {
  final String userId;
  final String name;
  final String email;
  final String password;
  final String profileImage;

  const SignupEntity({
    required this.userId,
    required this.name,
    required this.email,
    required this.password,
    required this.profileImage,
  });

  @override
  List<Object?> get props => [userId, name, email, password, profileImage];
}
