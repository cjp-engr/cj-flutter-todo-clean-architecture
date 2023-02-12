import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_app_clean_arch/features/auth/signin/data/datasources/signin_remote_datasource.dart';
import 'package:todo_app_clean_arch/features/auth/signin/data/repositories/signin_repo_impl.dart';
import 'package:todo_app_clean_arch/features/auth/signin/domain/repositories/signin_repo.dart';
import 'package:todo_app_clean_arch/features/auth/signin/domain/usecases/signin_usecases.dart';
import 'package:todo_app_clean_arch/features/auth/signin/presentation/bloc/signin_bloc.dart';
import 'package:todo_app_clean_arch/features/auth/signup/data/datasources/signup_remote_datasource.dart';
import 'package:todo_app_clean_arch/features/auth/signup/data/repositories/signup_repo_impl.dart';
import 'package:todo_app_clean_arch/features/auth/signup/domain/repositories/signup_repo.dart';
import 'package:todo_app_clean_arch/features/auth/signup/domain/usecases/signup_usecases.dart';
import 'package:todo_app_clean_arch/features/auth/signup/presentation/bloc/signup_bloc.dart';

final sl = GetIt.I;

Future<void> init() async {
  /// * Start [Signup] /////////////////////////////////////
  // !application layer
  sl.registerFactory(() => SignupBloc(signupUseCases: sl()));

  // !domain layer
  sl.registerFactory(() => SignupUseCases(signupRepo: sl()));

  // ! data layer
  sl.registerFactory<SignupRepo>(
      () => SignupRepoImpl(signupRemoteDatasource: sl()));
  sl.registerFactory<SignupRemoteDatasource>(
      () => SignupRemoteDatasourceImpl(firebaseAuth: sl()));

  /// * End [Signup] ///////////////////////////////////////
  ///
  /// * Start [Signin] /////////////////////////////////////
  // !application layer
  sl.registerFactory(() => SigninBloc(signinUseCases: sl()));

  // !domain layer
  sl.registerFactory(() => SigninUseCases(signinRepo: sl()));

  // ! data layer
  sl.registerFactory<SigninRepo>(
      () => SigninRepoImpl(signinRemoteDatasource: sl()));
  sl.registerFactory<SigninRemoteDatasource>(
      () => SigninRemoteDatasourceImpl(firebaseAuth: sl()));

  /// * End [Signin] /////////////////////////////////////
  // ! externs
  sl.registerFactory(() => FirebaseAuth.instance);
}
