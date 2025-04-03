import 'package:blogapp/blog_app.dart';

import 'package:blogapp/features/presentation/bloc/auth_bloc.dart';
import 'package:blogapp/init_dependecies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  initDependecies();
  runApp(
    MultiBlocProvider(
      providers: [BlocProvider(create: (_) => serviceLocater<AuthBloc>())],
      child: BlogApp(),
    ),
  );
}
