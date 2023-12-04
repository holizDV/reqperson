import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../config/error/failures.dart';
import '../../../../config/usecase/usecase.dart';
import '../entity/person_entity.dart';
import '../repository/person_repository.dart';

@lazySingleton
class GetPersonCase implements UseCase<PersonEntity, NoParams> {
  GetPersonCase(this.repository);

  final PersonRepository repository;

  @override
  Future<Either<Failure, PersonEntity>> execute(NoParams params) async {
    return await repository.getPerson();
  }
}
