import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/create_person_entity.dart';

part 'create_person_model.freezed.dart';
part 'create_person_model.g.dart';

@freezed
class CreatePersonModel extends CreatePersonEntity with _$CreatePersonModel {
  const factory CreatePersonModel({
    String? name,
    String? job,
    String? id,
    String? createdAt,
  }) = _CreatePersonModel;

  factory CreatePersonModel.fromJson(Map<String, dynamic> json) =>
      _$CreatePersonModelFromJson(json);
}
