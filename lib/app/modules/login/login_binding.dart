import 'package:get/get.dart';
import 'package:login_app/app/data/repositories/login/login_repository.dart';
import 'package:login_app/app/modules/login/login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(
        loginService: Get.find(),
      ),
    );
  }
}
