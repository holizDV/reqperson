import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../config/error/failures.dart';
import '../../../../config/network/response_exception.dart';
import '../../domain/entity/create_person_entity.dart';
import '../../domain/entity/person_entity.dart';
import '../../domain/repository/person_repository.dart';
import '../datasource/person_remote_datasource.dart';

@LazySingleton(as: PersonRepository)
class PersonRepositoryImpl implements PersonRepository {
  PersonRepositoryImpl(
    this.remoteDataSource,
    this.exception,
  );

  final PersonRemoteDataSource remoteDataSource;
  final ResponseException exception;

  @override
  Future<Either<Failure, PersonEntity>> getPerson() {
    return exception.exc<PersonEntity>(() => remoteDataSource.getPerson());
  }

  @override
  Future<Either<Failure, CreatePersonEntity>> create(
      {required String name, required String job}) {
    return exception.exc<CreatePersonEntity>(
        () => remoteDataSource.create(name: name, job: job));
  }
}
