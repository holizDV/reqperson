import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../config/error/failures.dart';
import '../../../../config/usecase/usecase.dart';
import '../entity/create_person_entity.dart';
import '../repository/person_repository.dart';

@lazySingleton
class CreatePersonCase implements UseCase<CreatePersonEntity, Params> {
  CreatePersonCase(this.repository);

  final PersonRepository repository;

  @override
  Future<Either<Failure, CreatePersonEntity>> execute(Params params) async {
    return await repository.create(
      name: params.name,
      job: params.job,
    );
  }
}

class Params extends Equatable {
  final String name;
  final String job;

  const Params({
    required this.name,
    required this.job,
  });

  @override
  List<Object> get props => [name, job];
}
