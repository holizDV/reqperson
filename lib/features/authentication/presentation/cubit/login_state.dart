part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading({@Default(false) bool isLoading}) = _Loading;
  const factory LoginState.error(ErrorObject error) = _Error;
  const factory LoginState.loaded() = _Loaded;
  const factory LoginState.formValid({@Default(false) bool isValid}) =
      _FormValid;
}
