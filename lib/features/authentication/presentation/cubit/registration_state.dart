part of 'registration_cubit.dart';

@freezed
class RegistrationState with _$RegistrationState {
  const factory RegistrationState.initial() = _Initial;
  const factory RegistrationState.loading({@Default(false) bool isLoading}) =
      _Loading;
  const factory RegistrationState.error(ErrorObject error) = _Error;
  const factory RegistrationState.loaded() = _Loaded;
  const factory RegistrationState.formValid({@Default(false) bool isValid}) =
      _FormValid;
}
