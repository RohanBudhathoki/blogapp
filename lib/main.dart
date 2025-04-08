import 'package:blogapp/blog_app.dart';
import 'package:blogapp/core/common/cubit/app_user/app_user_cubit.dart';

import 'package:blogapp/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:blogapp/features/blog/presentation/bloc/blog_bloc_bloc.dart';
import 'package:blogapp/init_dependecies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initDependecies();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => serviceLocater<AuthBloc>()),
        BlocProvider(create: (_) => serviceLocater<AppUserCubit>()),
        BlocProvider(create: (_) => serviceLocater<BlogBlocBloc>()),
      ],
      child: BlogApp(),
    ),
  );
}
