import 'package:blogapp/core/error/exception.dart';
import 'package:blogapp/core/error/failure.dart';
import 'package:blogapp/features/auth/data/datasources/auth_remote_data_sources.dart';
import 'package:blogapp/core/common/entities/user.dart';
import 'package:blogapp/features/auth/domain/repository/auth_repo.dart';
import 'package:fpdart/fpdart.dart';
import 'package:supabase/supabase.dart' as sb;

class AuthRepoImple implements AuthRepo {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepoImple(this.remoteDataSource);
  @override
  Future<Either<Failure, User>> loginWithEmailPassword({
    required String email,
    required String password,
  }) {
    return _getUser(
      () async => await remoteDataSource.loginWithEmailPassword(
        email: email,
        password: password,
      ),
    );
  }

  @override
  Future<Either<Failure, User>> signupWitchEmailPassword({
    required String name,
    required String email,
    required String password,
  }) {
    return _getUser(
      () async => await remoteDataSource.signupWithEmailPassword(
        name: name,
        email: email,
        password: password,
      ),
    );
  }

  Future<Either<Failure, User>> _getUser(Future<User> Function() fn) async {
    try {
      final user = await fn();
      return right(user);
    } on sb.AuthException catch (e) {
      return left(Failure(message: e.message));
    } on ServerException catch (e) {
      return left(Failure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, User>> currentUser() async {
    try {
      final user = await remoteDataSource.currentUser();
      if (user == null) {
        return left(Failure(message: 'User not Loged in !'));
      }
      return right(user);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
