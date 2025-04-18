import 'package:blogapp/core/common/cubit/app_user/app_user_cubit.dart';
import 'package:blogapp/core/secrets/app_secret.dart';
import 'package:blogapp/features/auth/data/datasources/auth_remote_data_sources.dart';
import 'package:blogapp/features/auth/data/repository/auth_repo_imple.dart';
import 'package:blogapp/features/auth/domain/repository/auth_repo.dart';
import 'package:blogapp/features/auth/domain/usecases/user_current.dart';
import 'package:blogapp/features/auth/domain/usecases/user_login.dart';
import 'package:blogapp/features/auth/domain/usecases/user_sign_up.dart';
import 'package:blogapp/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:blogapp/features/blog/data/datasources/blog_data_sources.dart';
import 'package:blogapp/features/blog/data/repository/blog_repo_imple.dart';
import 'package:blogapp/features/blog/domain/repository/blog_repo.dart';
import 'package:blogapp/features/blog/domain/usecases/get_blogs.dart';
import 'package:blogapp/features/blog/domain/usecases/update_blog.dart';
import 'package:blogapp/features/blog/presentation/bloc/blog_bloc_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

GetIt serviceLocater = GetIt.instance;
Future<void> initDependecies() async {
  final supabase = await Supabase.initialize(
    url: AppSecret.superBaseUrl,
    anonKey: AppSecret.supaBaseSecretKey,
  );

  serviceLocater.registerLazySingleton(() => supabase.client);
  serviceLocater.registerLazySingleton(() => AppUserCubit());
  _initAuth();
  _initBlog();
  if (!serviceLocater.isRegistered<SupabaseClient>()) {
    serviceLocater.registerLazySingleton(() => supabase.client);
  }
  if (!serviceLocater.isRegistered<AppUserCubit>()) {
    serviceLocater.registerLazySingleton(() => AppUserCubit());
  }
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
        appUser: serviceLocater(),
      ),
    );
}

void _initBlog() {
  //datasource
  serviceLocater
    ..registerFactory<BlogRemoteDataSources>(
      () => BlogDataSourcesimpl(serviceLocater()),
    )
    //repository
    ..registerFactory<BlogRepo>(() => BlogRepoImple(serviceLocater()))
    //usecases
    ..registerFactory(() => UpdateBlog(serviceLocater()))
    ..registerFactory(() => GetBlogs(serviceLocater()))
    //Bloc
    ..registerLazySingleton(
      () => BlogBlocBloc(
        uploadBlog: serviceLocater(),
        getBlogs: serviceLocater(),
      ),
    );
}
