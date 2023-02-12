import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:todo_app_clean_arch/core/errors/failures/failures.dart';
import 'package:todo_app_clean_arch/features/auth/signup/domain/entities/signup_entity.dart';
import 'package:todo_app_clean_arch/features/auth/signup/domain/usecases/signup_usecases.dart';

part 'signup_event.dart';
part 'signup_state.dart';

const signupFailureMessage = 'signupFailureMessage';
const generalFailureMessage = 'generalFailureMessage';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final SignupUseCases signupUseCases;
  SignupBloc({
    required this.signupUseCases,
  }) : super(SignupStateInitial()) {
    on<GetNewUserCredentials>(_getNewUserCredentials);
  }

  _getNewUserCredentials(
      GetNewUserCredentials event, Emitter<SignupState> emit) async {
    emit(SignupStateAuthenticating());

    const String profileImage = 'https://picsum.photos/300';

    final Either<Failure, SignupEntity> failureOrSignup =
        await signupUseCases.registerUserUseCase(
      'tempId',
      event.name,
      event.email,
      event.password,
      profileImage,
    );

    failureOrSignup.fold(
        (failure) =>
            emit(SignupStateError(message: _mapFailureToMessage(failure))),
        (right) => emit(SignupStateAuthenticated()));
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case SignupFailure:
        return signupFailureMessage;
      default:
        return generalFailureMessage;
    }
  }
}
