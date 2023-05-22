import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:login_app/core/values/consts.dart';

class AuthService extends GetxService {
  late GetStorage storage;

  void init() async {
    storage = GetStorage();

    //Caso seja null seta como falso
    await storage.writeIfNull(IS_LOGGED, false);
    await storage.writeIfNull(TOKEN, '');
    await storage.writeIfNull(DISPLAY_NAME, '');
  }

  //Retorna a leitura da chave local
  isLogged() => storage.read(IS_LOGGED);
  apiToken() => storage.read(TOKEN);
  displayName() => storage.read(DISPLAY_NAME);

  changeIsLogged(bool isLogged) async => storage.write(IS_LOGGED, isLogged);
  changeApiToken(String token) async => storage.write(TOKEN, token);
  changeDisplayName(String displayName) async =>
      storage.write(DISPLAY_NAME, displayName);

  logout() async => {
        changeIsLogged(false),
        changeApiToken(''),
        changeDisplayName(''),
      };
}
