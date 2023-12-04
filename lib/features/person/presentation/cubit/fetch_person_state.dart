part of 'fetch_person_cubit.dart';

@freezed
class FetchPersonState with _$FetchPersonState {
  const factory FetchPersonState.initial() = _Initial;
  const factory FetchPersonState.loading() = _Loading;
  const factory FetchPersonState.error(ErrorObject error) = _Error;
  const factory FetchPersonState.loaded(List<DataEntity> users) = _Loaded;
}
