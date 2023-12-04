import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/person_entity.dart';

part 'person_model.freezed.dart';
part 'person_model.g.dart';

@freezed
class PersonModel extends PersonEntity with _$PersonModel {
  const factory PersonModel({
    @JsonSerializable(fieldRename: FieldRename.snake) int? page,
    int? perPage,
    int? total,
    int? totalPages,
    List<Data>? data,
    Support? support,
  }) = _PersonModel;

  factory PersonModel.fromJson(Map<String, dynamic> json) =>
      _$PersonModelFromJson(json);
}

@freezed
class Data extends DataEntity with _$Data {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Data({
    int? id,
    String? email,
    String? firstName,
    String? lastName,
    String? avatar,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@freezed
class Support extends SupportEntity with _$Support {
  const factory Support({
    String? url,
    String? text,
  }) = _Support;

  factory Support.fromJson(Map<String, dynamic> json) =>
      _$SupportFromJson(json);
}
