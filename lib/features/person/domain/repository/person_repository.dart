import 'package:dartz/dartz.dart';

import '../../../../config/error/failures.dart';
import '../entity/create_person_entity.dart';
import '../entity/person_entity.dart';

abstract class PersonRepository {
  Future<Either<Failure, PersonEntity>> getPerson();

  Future<Either<Failure, CreatePersonEntity>> create({
    required String name,
    required String job,
  });
}
