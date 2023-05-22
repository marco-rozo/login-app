import 'package:get/get.dart';
import 'package:login_app/app/modules/home/home_binding.dart';
import 'package:login_app/app/modules/home/home_page.dart';
import 'package:login_app/app/modules/login/login_binding.dart';
import 'package:login_app/app/modules/login/login_page.dart';

part './routes.dart';

abstract class AppPages {
  //Lista de páginas com suas rotas definidas
  static final pages = [
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
      bindings: [
        LoginBinding(),
      ],
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      bindings: [
        HomeBinding(),
      ],
    ),
  ];
}
