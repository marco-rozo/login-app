import 'package:login_app/app/data/models/login_model.dart';
import 'package:login_app/app/data/repositories/login/login_repository.dart';
import 'package:login_app/app/data/services/login/login_service.dart';

class LoginServiceImpl implements LoginService {
  final LoginRepository _loginRepository;

  LoginServiceImpl({
    required LoginRepository loginRepository,
  }) : _loginRepository = loginRepository;

  @override
  Future<LoginModel?> login(dynamic json) => _loginRepository.login(json);
}
