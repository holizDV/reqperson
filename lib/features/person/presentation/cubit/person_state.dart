part of 'person_cubit.dart';

@freezed
class PersonState with _$PersonState {
  const factory PersonState.initial() = _Initial;
  const factory PersonState.loading({@Default(false) bool isLoading}) =
      _Loading;
  const factory PersonState.error(ErrorObject error) = _Error;
  const factory PersonState.loaded() = _Loaded;
  const factory PersonState.formValid({@Default(false) bool isValid}) =
      _FormValid;
}
