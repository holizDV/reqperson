import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../config/error/error_object.dart';
import '../../../../utils/helper/validator_form.dart';
import '../../../../utils/injection/injection.dart';
import '../../domain/usecase/create_person_case.dart';

part 'person_cubit.freezed.dart';
part 'person_state.dart';

@injectable
class PersonCubit extends Cubit<PersonState> {
  PersonCubit() : super(const PersonState.initial());

  final _createUserCase = getIt<CreatePersonCase>();

  Future<void> onCreate({
    required String name,
    required String job,
  }) async {
    emit(const PersonState.loading(isLoading: true));

    final result = await _createUserCase.execute(Params(
      name: name.trim(),
      job: job.trim(),
    ));

    result.fold((failure) {
      emit(const PersonState.loading(isLoading: false));
      emit(PersonState.error(ErrorObject.mapFailureToErrorObject(failure)));
    }, (success) {
      emit(const PersonState.loading(isLoading: false));
      emit(const PersonState.loaded());
    });
  }

  void onChangeForm({
    required String name,
    required String job,
  }) {
    final validators = [
      ValidatorForm.validateRequired(value: name),
      ValidatorForm.validateRequired(value: job),
    ];

    emit(const PersonState.formValid(isValid: true));

    for (var i = 0; i < validators.length; i++) {
      if (validators[i] != null) {
        emit(const PersonState.formValid(isValid: false));
        break;
      }
    }
  }
}
