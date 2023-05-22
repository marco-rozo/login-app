import 'dart:io';

import 'package:login_app/app/data/models/login_model.dart';
import 'package:login_app/app/data/providers/api/rest_client.dart';
import 'package:login_app/app/data/repositories/login/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final RestClient _restClient;

  LoginRepositoryImpl({
    required RestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<LoginModel?> login(dynamic json) async {
    final result = await _restClient.post(
      'auth',
      json,
      decoder: (data) {
        final resultData = data;
        if (resultData != null) {
          return LoginModel.fromMap(resultData);
        } else {
          return null;
        }
      },
    );

    // Caso houver erro
    if (result.hasError) {
      throw Exception('Erro [${result.statusText}]');
    }

    return result.body;
  }

  Future<LoginModel?> logout() async {}
}
