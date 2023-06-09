import 'package:get/get.dart';
import 'package:login_app/app/data/providers/api/rest_client.dart';
import 'package:login_app/app/data/repositories/login/login_repository.dart';
import 'package:login_app/app/data/repositories/login/login_repository_impl.dart';
import 'package:login_app/app/data/services/auth/auth_service.dart';
import 'package:login_app/app/data/services/login/login_service.dart';
import 'package:login_app/app/data/services/login/login_service_impl.dart';

class ApplicationBindings implements Bindings {
  @override
  void dependencies() {
    // Entrego o gerenciamento das dependecias para o GetX administrar
    // .lazyPut para dependencias que são necessárias mas só "precisam" ser carregaadas/encontradas
    // quando forem solicitadas
    // .put para dependencias que precisam serem "verificadas"/carregaadas/encontradas/INSTANCIADAS "logo"
    //para torná-la disponível para todas as rotas "filhos".
    Get.lazyPut(
      () => RestClient(),
      fenix: true,
    );

    //classes que "não" finalizam durante o tempo de vida da aplicação dado "fenix: true"
    Get.lazyPut<LoginRepository>(
      () => LoginRepositoryImpl(restClient: Get.find()),
      fenix: true,
    );

    Get.lazyPut<LoginService>(
      () => LoginServiceImpl(loginRepository: Get.find()),
      fenix: true,
    );

    //ao carregar a aplicação verifica se está logado ou nao e faz o direcionamento para a rota inicial
    Get.put(AuthService()).init();
  }
}
