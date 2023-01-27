import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_app_clean_arch/0_data/datasources/signup_remote_datasource.dart';
import 'package:todo_app_clean_arch/0_data/repositories/signup_repo_impl.dart';
import 'package:todo_app_clean_arch/1_domain/repositories/signup_repo.dart';
import 'package:todo_app_clean_arch/1_domain/usecases/signup_usecases.dart';
import 'package:todo_app_clean_arch/2_application/pages/authentication/signup/bloc/signup_bloc.dart';

final sl = GetIt.I;

Future<void> init() async {
  // !application layer

  sl.registerFactory(() => SignupBloc(signupUseCases: sl()));

  // !domain layer
  sl.registerFactory(() => SignupUseCases(signupRepo: sl()));

  // ! data layer
  sl.registerFactory<SignupRepo>(
      () => SignupRepoImpl(signupRemoteDatasource: sl()));
  sl.registerFactory<SignupRemoteDatasource>(() =>
      SignupRemoteDatasourceImpl(firebaseFirestore: sl(), firebaseAuth: sl()));

  // ! externs
  sl.registerFactory(() => FirebaseFirestore.instance);
  sl.registerFactory(() => FirebaseAuth.instance);
}
