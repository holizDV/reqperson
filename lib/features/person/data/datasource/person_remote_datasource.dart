import 'package:injectable/injectable.dart';

import '../../../../config/network/network.dart';
import '../model/create_person_model.dart';
import '../model/person_model.dart';

abstract class PersonRemoteDataSource {
  Future<PersonModel> getPerson();

  Future<CreatePersonModel> create({
    required String name,
    required String job,
  });
}

@LazySingleton(as: PersonRemoteDataSource)
class PersonRemoteDataSourceImpl implements PersonRemoteDataSource {
  PersonRemoteDataSourceImpl(this.client);

  final ApiClient client;

  final _baseUrl = AppNetwork().baseUrl;

  @override
  Future<PersonModel> getPerson() async {
    final response = await client.get(
      url: "$_baseUrl${ApiEndPoint.person}",
    );
    if (response != null) {
      return PersonModel.fromJson(response);
    }
    return response;
  }

  @override
  Future<CreatePersonModel> create({
    required String name,
    required String job,
  }) async {
    Map<String, dynamic> body = {
      'name': name,
      'job': job,
    };

    final response = await client.post(
      url: "$_baseUrl${ApiEndPoint.person}",
      body: body,
    );
    if (response != null) {
      return CreatePersonModel.fromJson(response);
    }
    return response;
  }
}
