import 'package:blogapp/core/error/exception.dart';
import 'package:blogapp/core/error/failure.dart';
import 'package:blogapp/features/data/datasources/auth_remote_data_sources.dart';
import 'package:blogapp/features/domain/entities/user.dart';
import 'package:blogapp/features/domain/repository/auth_repo.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepoImple implements AuthRepo {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepoImple(this.remoteDataSource);
  @override
  Future<Either<Failure, User>> loginWithEmailPassword({
    required String email,
    required String password,
  }) {
    // TODO: implement loginWithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, User>> signupWitchEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final user = await remoteDataSource.signupWithEmailPassword(
        name: name,
        email: email,
        password: password,
      );
      return right(user);
    } on ServerException catch (e) {
      return left(Failure(message: e.message));
    }
  }
}
