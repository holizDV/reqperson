import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../config/error/error_object.dart';
import '../../../../config/usecase/usecase.dart';
import '../../../../utils/injection/injection.dart';
import '../../domain/entity/person_entity.dart';
import '../../domain/usecase/get_person_case.dart';

part 'fetch_person_cubit.freezed.dart';
part 'fetch_person_state.dart';

@injectable
class FetchPersonCubit extends Cubit<FetchPersonState> {
  FetchPersonCubit() : super(const FetchPersonState.initial());

  final _personCase = getIt<GetPersonCase>();

  Future<void> onRefresh() async => fetchPerson();

  Future<void> fetchPerson() async {
    emit(const FetchPersonState.loading());

    final result = await _personCase.execute(NoParams());

    result.fold((failure) {
      emit(
          FetchPersonState.error(ErrorObject.mapFailureToErrorObject(failure)));
    }, (success) {
      emit(FetchPersonState.loaded(success.data!));
    });
  }
}
