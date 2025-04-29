import 'package:auto_route/auto_route.dart';
import 'package:blogapp/core/common/widgets/loader.dart';

import 'package:blogapp/core/controller/controller_text.dart';
import 'package:blogapp/core/theme/color.dart';
import 'package:blogapp/core/config/utils/utils.dart';
import 'package:blogapp/features/auth/presentation/authentication/widget/common_authbutton.dart';
import 'package:blogapp/features/auth/presentation/authentication/widget/common_textform.dart';
import 'package:blogapp/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:blogapp/core/res/space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingControllers();
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSucess) {}
          if (state is AuthFailure) {
            flushBar(context, state.message);
          }
        },

        builder: (context, state) {
          if (state is AuthLoading) {
            return const LoadingWidget();
          }
          return SingleChildScrollView(
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
          );
        },
      ),
    );
  }
}
