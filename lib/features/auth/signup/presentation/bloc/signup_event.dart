// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'signup_bloc.dart';

@immutable
abstract class SignupEvent extends Equatable {
  const SignupEvent();
  @override
  List<Object?> get props => [];
}

class GetNewUserCredentials extends SignupEvent {
  final String name;
  final String email;
  final String password;
  const GetNewUserCredentials(
      {required this.name, required this.email, required this.password});

  @override
  List<Object?> get props => [name, email, password];
}
