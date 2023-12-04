import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../error/exceptions.dart';
import '../error/failures.dart';

typedef F = Future<dynamic> Function();

@lazySingleton
class ResponseException {
  Future<Either<Failure, T>> exc<T>(F func) async {
    try {
      T remote = await func();
      return Right(remote);
    } on ServerException catch (e) {
      return Left(Failure.serverFailure(e.message));
    } on UnAuthorizedException catch (e) {
      return Left(Failure.unAuthorizeFailure(e.message));
    } on UnprocessableEntityException catch (e) {
      return Left(Failure.unprocessableEntityFailure(e.message));
    } on BadRequestException catch (e) {
      return Left(Failure.badRequestFailure(e.message));
    } on NotFoundException catch (e) {
      return Left(Failure.notFoundFailure(e.message));
    } on ForbiddenException catch (e) {
      return Left(Failure.forbiddenFailure(e.message));
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        return const Left(Failure.lostConnectionFailure());
      }
      if (e.type == DioExceptionType.connectionTimeout) {
        return const Left(Failure.timeoutConnectionFailure());
      }
      if (e.type == DioExceptionType.unknown) {
        return Left(
            Failure.dioFailure(e.message ?? "Something wrong connection !!!"));
      }
      return Left(Failure.dioFailure(e.message ?? "Something wrong !!!"));
    }
  }
}
