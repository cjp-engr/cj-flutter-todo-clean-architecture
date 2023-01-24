part of 'signup_bloc.dart';

@immutable
abstract class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object> get props => [];
}

class SignupInitial extends SignupState {}

class SignupAuthenticating extends SignupState {}

class SignupAuthenticated extends SignupState {}
