import 'package:get/get.dart';
import 'package:login_app/app/data/services/auth/auth_service.dart';
import 'package:login_app/routes/app_pages.dart';

class HomeController extends GetxController {
  AuthService? auth;
  RxBool isLoading = false.obs;
  RxString userName = ''.obs;

  @override
  void onInit() async {
    auth = Get.find<AuthService>();
    userName.value = await auth!.displayName();
    super.onInit();
  }

  logout() async {
    auth!.logout();
    Get.offNamed(Routes.LOGIN);
  }
}
