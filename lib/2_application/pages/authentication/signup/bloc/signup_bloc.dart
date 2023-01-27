import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:todo_app_clean_arch/1_domain/failures/failures.dart';
import 'package:todo_app_clean_arch/1_domain/usecases/signup_usecases.dart';

part 'signup_event.dart';
part 'signup_state.dart';

const serverFailureMessage = 'serverFailureMessage';
const cacheFailureMessage = 'cacheFailureMessage';

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
    final failureOrSignup = await signupUseCases.registerUserUseCase(
      event.name,
      event.email,
      event.password,
    );
    failureOrSignup.fold(
      (failure) =>
          emit(SignupStateError(message: _mapFailureToMessage(failure))),
      (signup) => emit(SignupStateAuthenticated()),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return serverFailureMessage;
      case CacheFailure:
        return cacheFailureMessage;
      default:
        return '---';
    }
  }
}
