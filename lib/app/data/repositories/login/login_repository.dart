import 'package:login_app/app/data/models/login_model.dart';

abstract class LoginRepository {
  Future<LoginModel?> login(dynamic json);
  Future<void> logout();
}
