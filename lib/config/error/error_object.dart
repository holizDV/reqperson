import 'package:equatable/equatable.dart';

import 'failures.dart';

class ErrorObject extends Equatable {
  final String title;
  final String message;

  const ErrorObject({
    required this.title,
    required this.message,
  });

  @override
  List<Object> get props => [title, message];

  static ErrorObject mapFailureToErrorObject(Failure failure) {
    return failure.when(
      serverFailure: (message) {
        return ErrorObject(
          title: 'Server',
          message: message,
        );
      },
      cacheFailure: () {
        return const ErrorObject(
          title: 'Cache',
          message: 'Cache failed',
        );
      },
      lostConnectionFailure: () {
        return const ErrorObject(
          title: 'Connection Failed',
          message: 'Connection failed',
        );
      },
      timeoutConnectionFailure: () {
        return const ErrorObject(
          title: 'Connection Timeout',
          message: 'Connection timeout',
        );
      },
      dataParsingFailure: () {
        return const ErrorObject(
          title: 'Parsing Data',
          message: 'message',
        );
      },
      unAuthorizeFailure: (message) {
        return ErrorObject(
          title: 'UnAuthorize',
          message: message,
        );
      },
      unprocessableEntityFailure: (message) {
        return ErrorObject(
          title: 'UnprocessableEntity',
          message: message,
        );
      },
      badRequestFailure: (message) {
        return ErrorObject(
          title: 'Bad Request',
          message: message,
        );
      },
      notFoundFailure: (message) {
        return ErrorObject(
          title: "Not Found",
          message: message,
        );
      },
      dioFailure: (message) {
        return ErrorObject(
          title: 'Dio Failure',
          message: message,
        );
      },
      otherFailure: (message) {
        return ErrorObject(
          title: "Other Failure",
          message:
              message ?? "Ops, Sedang terjadi kesalahan. Silahkan coba lagi",
        );
      },
      forbiddenFailure: (message) {
        return ErrorObject(
          title: "Forbidden Failure",
          message: message,
        );
      },
    );
  }
}
