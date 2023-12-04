import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
class Failure with _$Failure {
  const factory Failure.serverFailure(String message) = _ServerFailure;
  const factory Failure.cacheFailure() = _CacheFailure;
  const factory Failure.lostConnectionFailure() = _LostConnectionFailure;
  const factory Failure.timeoutConnectionFailure() = _TimeoutConnectionFailure;
  const factory Failure.dataParsingFailure() = _DataParsingFailure;
  const factory Failure.unAuthorizeFailure(String message) =
      _UnAuthorizeFailure;
  const factory Failure.unprocessableEntityFailure(String message) =
      _UnprocessableEntityFailure;
  const factory Failure.badRequestFailure(String message) = _BadRequestFailure;
  const factory Failure.notFoundFailure(String message) = _NotFoundFailure;
  const factory Failure.forbiddenFailure(String message) = _ForbiddenFailure;
  const factory Failure.otherFailure({String? message}) = _OtherFailure;
  const factory Failure.dioFailure(String message) = _DioFailure;
}
