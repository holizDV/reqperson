import 'dart:io';

import 'package:equatable/equatable.dart';

class ServerException extends Equatable implements Exception {
  final String message;

  const ServerException(this.message);
  @override
  List<Object?> get props => [message];
}

class CacheException extends Equatable implements Exception {
  @override
  List<Object?> get props => [];
}

class LostConnectionException extends Equatable implements IOException {
  @override
  List<Object?> get props => [];
}

class TimeoutConnectionException extends Equatable implements IOException {
  @override
  List<Object?> get props => [];
}

class DataParsingException extends Equatable implements Exception {
  @override
  List<Object?> get props => [];
}

class UnAuthorizedException extends Equatable implements Exception {
  final String message;

  const UnAuthorizedException(this.message);
  @override
  List<Object?> get props => [message];
}

class UnprocessableEntityException extends Equatable implements Exception {
  final String message;

  const UnprocessableEntityException(this.message);
  @override
  List<Object?> get props => [message];
}

class BadRequestException extends Equatable implements Exception {
  final String message;

  const BadRequestException(this.message);
  @override
  List<Object?> get props => [message];
}

class ForbiddenException extends Equatable implements Exception {
  final String message;

  const ForbiddenException(this.message);
  @override
  List<Object?> get props => [message];
}

class NotFoundException extends Equatable implements Exception {
  final String message;

  const NotFoundException(this.message);
  @override
  List<Object?> get props => [message];
}

class OtherException extends Equatable implements Exception {
  final String message;

  const OtherException(this.message);
  @override
  List<Object?> get props => [message];
}
