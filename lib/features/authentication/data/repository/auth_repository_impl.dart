import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../config/error/failures.dart';
import '../../../../config/network/response_exception.dart';
import '../../domain/entity/auth_entity.dart';
import '../../domain/repository/auth_repository.dart';
import '../datasource/auth_remote_datasource.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(
    this.remoteDataSource,
    this.exception,
  );

  final AuthRemoteDataSource remoteDataSource;
  final ResponseException exception;

  @override
  Future<Either<Failure, AuthEntity>> login({
    required String email,
    required String password,
  }) {
    return exception.exc<AuthEntity>(
        () => remoteDataSource.login(email: email, password: password));
  }

  @override
  Future<Either<Failure, AuthEntity>> resgistration(
      {required String email, required String password}) {
    return exception.exc<AuthEntity>(
        () => remoteDataSource.registration(email: email, password: password));
  }
}
