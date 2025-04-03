import 'package:blogapp/features/presentation/authentication/sign_up.dart';
import 'package:flutter/material.dart';

class BlogApp extends StatelessWidget {
  const BlogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SignUpScreen());
  }
}
