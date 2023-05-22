import 'package:login_app/app/data/models/login_model.dart';

abstract class LoginService {
  Future<LoginModel?> login(dynamic json);
}
