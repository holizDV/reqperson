import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../config/error/error_object.dart';
import '../../../../config/network/local_storage.dart';
import '../../../../utils/helper/validator_form.dart';
import '../../../../utils/injection/injection.dart';
import '../../domain/usecase/login_user_case.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState.initial());

  final _loginUserCase = getIt<LoginUserCase>();
  final _localStorage = getIt<LocalStorage>();

  Future<void> onLogin({
    required String email,
    required String password,
  }) async {
    emit(const LoginState.loading(isLoading: true));

    final result = await _loginUserCase.execute(Params(
      email: email.trim(),
      password: password.trim(),
    ));

    result.fold((failure) {
      emit(const LoginState.loading(isLoading: false));
      emit(LoginState.error(ErrorObject.mapFailureToErrorObject(failure)));
    }, (success) {
      if (success.token != null) {
        _localStorage.setTokenUser(success.token!);
      }

      emit(const LoginState.loading(isLoading: false));
      emit(const LoginState.loaded());
    });
  }

  void onChangeForm({
    required String email,
    required String password,
  }) {
    final validators = [
      ValidatorForm.validateRequired(value: email),
      ValidatorForm.validateRequired(value: password),
    ];

    emit(const LoginState.formValid(isValid: true));

    for (var i = 0; i < validators.length; i++) {
      if (validators[i] != null) {
        emit(const LoginState.formValid(isValid: false));
        break;
      }
    }
  }
}
