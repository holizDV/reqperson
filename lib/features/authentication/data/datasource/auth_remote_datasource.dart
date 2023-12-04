import 'package:injectable/injectable.dart';

import '../../../../config/network/network.dart';
import '../model/auth_model.dart';

abstract class AuthRemoteDataSource {
  Future<AuthModel> login({
    required String email,
    required String password,
  });

  Future<AuthModel> registration({
    required String email,
    required String password,
  });
}

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl(this.client);

  final ApiClient client;

  final _baseUrl = AppNetwork().baseUrl;

  @override
  Future<AuthModel> login({
    required String email,
    required String password,
  }) async {
    Map<String, dynamic> body = {
      'email': email,
      'password': password,
    };

    final response = await client.post(
      url: "$_baseUrl${ApiEndPoint.login}",
      body: body,
    );
    if (response != null) {
      return AuthModel.fromJson(response);
    }
    return response;
  }

  @override
  Future<AuthModel> registration({
    required String email,
    required String password,
  }) async {
    Map<String, dynamic> body = {
      'email': email,
      'password': password,
    };

    final response = await client.post(
      url: "$_baseUrl${ApiEndPoint.registration}",
      body: body,
    );
    if (response != null) {
      return AuthModel.fromJson(response);
    }
    return response;
  }
}
