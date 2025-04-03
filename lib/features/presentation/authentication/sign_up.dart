import 'package:blogapp/core/controller/controller_text.dart';
import 'package:blogapp/core/theme/color.dart';
import 'package:blogapp/features/presentation/authentication/widget/common_authbutton.dart';
import 'package:blogapp/features/presentation/authentication/widget/common_textform.dart';
import 'package:blogapp/features/presentation/bloc/auth_bloc.dart';
import 'package:blogapp/features/res/space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingControllers();
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              SpaceH200(),
              RegisterTextfield(
                obscureText: false,
                keyboardType: TextInputType.emailAddress,
                controller: controller.nameController,
                hintText: 'Name',
              ),
              SpaceH20(),
              RegisterTextfield(
                controller: controller.emailController,
                obscureText: false,
                keyboardType: TextInputType.emailAddress,

                hintText: 'Email',
              ),

              const SpaceH20(),
              RegisterTextfield(
                controller: controller.passwordController,
                obscureText: true,
                keyboardType: TextInputType.text,

                hintText: ' Password',
              ),
              const SpaceH28(),
              CommonAuthButton(
                onPressed: () async {
                  context.read<AuthBloc>().add(
                    AuthSignUp(
                      email: controller.emailController.text,
                      password: controller.passwordController.text,
                      name: controller.nameController.text,
                    ),
                  );
                },
                text: 'Sign up',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
