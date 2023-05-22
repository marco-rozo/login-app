import 'package:get/get.dart';
import 'package:login_app/app/modules/home/home_controller.dart';
import 'package:login_app/app/modules/login/login_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
