import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../config/error/error_object.dart';
import '../../../../config/network/local_storage.dart';
import '../../../../utils/helper/validator_form.dart';
import '../../../../utils/injection/injection.dart';
import '../../domain/usecase/registration_user_case.dart';

part 'registration_cubit.freezed.dart';
part 'registration_state.dart';

@injectable
class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit() : super(const RegistrationState.initial());

  final _registerUserCase = getIt<RegistrationUserCase>();
  final _localStorage = getIt<LocalStorage>();

  Future<void> onRegister({
    required String email,
    required String password,
  }) async {
    emit(const RegistrationState.loading(isLoading: true));

    final result = await _registerUserCase.execute(Params(
      email: email.trim(),
      password: password.trim(),
    ));

    result.fold((failure) {
      emit(const RegistrationState.loading(isLoading: false));
      emit(RegistrationState.error(
          ErrorObject.mapFailureToErrorObject(failure)));
    }, (success) {
      if (success.token != null) {
        _localStorage.setTokenUser(success.token!);
      }

      emit(const RegistrationState.loading(isLoading: false));
      emit(const RegistrationState.loaded());
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

    emit(const RegistrationState.formValid(isValid: true));

    for (var i = 0; i < validators.length; i++) {
      if (validators[i] != null) {
        emit(const RegistrationState.formValid(isValid: false));
        break;
      }
    }
  }
}
