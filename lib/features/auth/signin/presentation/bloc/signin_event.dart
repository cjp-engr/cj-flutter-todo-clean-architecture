// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'signin_bloc.dart';

abstract class SigninEvent extends Equatable {
  const SigninEvent();

  @override
  List<Object?> get props => [];
}

class GetExistingUserCredentials extends SigninEvent {
  final String email;
  final String password;
  const GetExistingUserCredentials({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}
