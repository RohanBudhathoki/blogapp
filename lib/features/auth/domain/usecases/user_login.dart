import 'package:blogapp/core/error/failure.dart';
import 'package:blogapp/core/usecase/use_case.dart';
import 'package:blogapp/core/common/entities/user.dart';
import 'package:blogapp/features/auth/domain/repository/auth_repo.dart';
import 'package:fpdart/fpdart.dart';

class UserLogin implements UseCase<User, UserLoginParams> {
  final AuthRepo authRepo;
  UserLogin(this.authRepo);

  @override
  Future<Either<Failure, User>> call(UserLoginParams params) async {
    return await authRepo.loginWithEmailPassword(
      email: params.email,
      password: params.password,
    );
  }
}

class UserLoginParams {
  final String email;
  final String password;

  UserLoginParams({required this.password, required this.email});
}
