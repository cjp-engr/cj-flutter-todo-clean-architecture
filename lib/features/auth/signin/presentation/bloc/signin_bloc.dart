// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app_clean_arch/core/errors/failures/failures.dart';
import 'package:todo_app_clean_arch/features/auth/signin/domain/entities/signin_entity.dart';

import 'package:todo_app_clean_arch/features/auth/signin/domain/usecases/signin_usecases.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  final SigninUseCases signinUseCases;
  SigninBloc({
    required this.signinUseCases,
  }) : super(SigninStateInitial()) {
    on<GetExistingUserCredentials>(_getExistingUserCredentials);
  }
  _getExistingUserCredentials(
      GetExistingUserCredentials event, Emitter<SigninState> emit) async {
    emit(SigninStateAuthenticating());

    final Either<Failure, SigninEntity> failureOrSignin =
        await signinUseCases.signinUserUseCase(event.email, event.password);

    failureOrSignin.fold(
        (failure) => emit(const SigninStateError(message: 'error')),
        (right) => emit(SigninStateAuthenticated()));
  }
}
