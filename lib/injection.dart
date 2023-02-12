import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_app_clean_arch/features/auth/signup/data/datasources/signup_remote_datasource.dart';
import 'package:todo_app_clean_arch/features/auth/signup/data/repositories/signup_repo_impl.dart';
import 'package:todo_app_clean_arch/features/auth/signup/domain/repositories/signup_repo.dart';
import 'package:todo_app_clean_arch/features/auth/signup/domain/usecases/signup_usecases.dart';
import 'package:todo_app_clean_arch/features/auth/signup/presentation/bloc/signup_bloc.dart';

final sl = GetIt.I;

Future<void> init() async {
  // !application layer

  sl.registerFactory(() => SignupBloc(signupUseCases: sl()));

  // !domain layer
  sl.registerFactory(() => SignupUseCases(signupRepo: sl()));

  // ! data layer
  sl.registerFactory<SignupRepo>(
      () => SignupRepoImpl(signupRemoteDatasource: sl()));
  sl.registerFactory<SignupRemoteDatasource>(
      () => SignupRemoteDatasourceImpl(firebaseAuth: sl()));

  // ! externs
  sl.registerFactory(() => FirebaseAuth.instance);
}
