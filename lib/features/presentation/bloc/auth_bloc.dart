import 'package:blogapp/features/domain/entities/user.dart';
import 'package:blogapp/features/domain/usecases/user_sign_up.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  AuthBloc({required UserSignUp userSignup})
    : _userSignUp = userSignup,
      super(AuthInitial()) {
    on<AuthSignUp>((event, emit) async {
      final response = await _userSignUp(
        UserSignUpParams(
          email: event.email,
          password: event.password,
          name: event.name,
        ),
      );
      response.fold(
        (l) => emit(AuthFailure(l.message)),
        (user) => emit(AuthSucess(user)),
      );
    });
  }
}
