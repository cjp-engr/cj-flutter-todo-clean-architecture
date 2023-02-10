// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'signup_bloc.dart';

@immutable
abstract class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object> get props => [];
}

class SignupStateInitial extends SignupState {}

class SignupStateAuthenticating extends SignupState {}

class SignupStateAuthenticated extends SignupState {}

class SignupStateError extends SignupState {
  final String message;
  const SignupStateError({required this.message});
  @override
  List<Object> get props => [message];
}
