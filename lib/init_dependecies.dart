import 'package:blogapp/core/secrets/app_secret.dart';
import 'package:blogapp/features/data/datasources/auth_remote_data_sources.dart';
import 'package:blogapp/features/data/repository/auth_repo_imple.dart';
import 'package:blogapp/features/domain/repository/auth_repo.dart';
import 'package:blogapp/features/domain/usecases/user_current.dart';
import 'package:blogapp/features/domain/usecases/user_login.dart';
import 'package:blogapp/features/domain/usecases/user_sign_up.dart';
import 'package:blogapp/features/presentation/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final serviceLocater = GetIt.instance;
Future<void> initDependecies() async {
  final supabase = await Supabase.initialize(
    url: AppSecret.superBaseUrl,
    anonKey: AppSecret.supaBaseSecretKey,
  );
  serviceLocater.registerLazySingleton(() => supabase.client);
  _initAuth();
}

void _initAuth() {
  serviceLocater
    ..registerFactory<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(serviceLocater()),
    )
    ..registerFactory<AuthRepo>(() => AuthRepoImple(serviceLocater()))
    ..registerFactory(() => UserSignUp(serviceLocater()))
    ..registerFactory(() => UserLogin(serviceLocater()))
    ..registerFactory(() => UserCurrent(serviceLocater()))
    ..registerLazySingleton(
      () => AuthBloc(
        userSignup: serviceLocater(),
        userLogin: serviceLocater(),
        userCurrent: serviceLocater(),
      ),
    );
}
