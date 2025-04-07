import 'package:blogapp/core/error/failure.dart';
import 'package:blogapp/core/usecase/use_case.dart';
import 'package:blogapp/features/domain/entities/user.dart';
import 'package:blogapp/features/domain/repository/auth_repo.dart';
import 'package:fpdart/fpdart.dart';

class UserCurrent implements UseCase<User, NoParams> {
  final AuthRepo authRepo;

  UserCurrent(this.authRepo);

  @override
  Future<Either<Failure, User>> call(NoParams params) async {
    return await authRepo.currentUser();
  }
}
