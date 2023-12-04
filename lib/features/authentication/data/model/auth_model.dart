import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/auth_entity.dart';

part 'auth_model.freezed.dart';
part 'auth_model.g.dart';

@freezed
class AuthModel extends AuthEntity with _$AuthModel {
  const factory AuthModel({
    String? token,
  }) = _AuthModel;

  factory AuthModel.fromJson(Map<String, dynamic> json) =>
      _$AuthModelFromJson(json);
}
