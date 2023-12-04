import 'package:dartz/dartz.dart';

import '../../../../config/error/failures.dart';
import '../entity/auth_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthEntity>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, AuthEntity>> resgistration({
    required String email,
    required String password,
  });
}
