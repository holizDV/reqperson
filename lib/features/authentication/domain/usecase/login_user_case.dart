import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../config/error/failures.dart';
import '../../../../config/usecase/usecase.dart';
import '../entity/auth_entity.dart';
import '../repository/auth_repository.dart';

@lazySingleton
class LoginUserCase implements UseCase<AuthEntity, Params> {
  LoginUserCase(this.repository);

  final AuthRepository repository;

  @override
  Future<Either<Failure, AuthEntity>> execute(Params params) async {
    return await repository.login(
      email: params.email,
      password: params.password,
    );
  }
}

class Params extends Equatable {
  final String email;
  final String password;

  const Params({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}
