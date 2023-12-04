import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../error/exceptions.dart';
import 'network.dart';

abstract class ApiClient {
  Future<dynamic> get({
    required String url,
    Map<String, dynamic>? params,
  });

  Future<dynamic> post({
    required String url,
    Map<String, dynamic>? body,
  });

  Future<dynamic> postFile({
    required String url,
    dynamic formData,
  });
}

@LazySingleton(as: ApiClient)
class ApiClentImpl implements ApiClient {
  ApiClentImpl(this.dio);
  final Dio dio;

  _returnResponse({required Response response}) {
    switch (response.statusCode) {
      case 200:
        return response.data;
      case 201:
        return response.data;
      case 400:
        throw BadRequestException(response.data['error']);
      case 401:
        throw UnAuthorizedException(response.data['error']);
      case 403:
        throw ForbiddenException(response.data['error']);
      case 404:
        throw NotFoundException("Exception: ${response.statusMessage}");
      case 422:
        throw UnprocessableEntityException(response.data['error']);
      case 500:
        throw ServerException(response.data['messages']);

      default:
        throw OtherException("Something wrong: ${response.statusCode}");
    }
  }

  @override
  Future get({
    required String url,
    Map<String, dynamic>? params,
  }) async {
    final response = await dio.get(
      url,
      queryParameters: params,
    );
    return _returnResponse(response: response);
  }

  @override
  Future post({
    required String url,
    Map<String, dynamic>? body,
  }) async {
    final response = await dio.post(
      url,
      data: body,
    );

    return _returnResponse(response: response);
  }

  @override
  Future postFile({
    required String url,
    dynamic formData,
  }) async {
    final response = await dio.post(
      url,
      data: formData,
    );

    return _returnResponse(response: response);
  }
}

@module
abstract class DioModule {
  @singleton
  Dio get instance {
    Dio dio = Dio(BaseOptions(
      baseUrl: AppNetwork().baseUrl,
      receiveDataWhenStatusError: true,
      responseType: ResponseType.json,
      connectTimeout: AppNetwork.connectionTimeout,
      receiveTimeout: AppNetwork.receiveTimeout,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      followRedirects: false,
      validateStatus: (status) => status! <= 500,
    ));

    dio.interceptors.addAll([
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
      ),
    ]);

    return dio;
  }
}
