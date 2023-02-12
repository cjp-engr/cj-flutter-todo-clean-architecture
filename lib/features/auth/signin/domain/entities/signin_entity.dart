// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class SigninEntity extends Equatable {
  final String email;
  final String password;
  const SigninEntity({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}
