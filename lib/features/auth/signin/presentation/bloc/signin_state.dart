// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'signin_bloc.dart';

abstract class SigninState extends Equatable {
  const SigninState();

  @override
  List<Object> get props => [];
}

class SigninStateInitial extends SigninState {}

class SigninStateAuthenticating extends SigninState {}

class SigninStateAuthenticated extends SigninState {}

class SigninStateError extends SigninState {
  final String message;
  const SigninStateError({
    required this.message,
  });
  @override
  List<Object> get props => [message];
}
