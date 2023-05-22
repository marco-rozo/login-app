import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:login_app/app/bindings/application_bindings.dart';
import 'package:login_app/app/data/services/auth/auth_service.dart';
import 'package:login_app/core/theme/ui_styles.dart';
import 'package:login_app/routes/app_pages.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //  AuthService? auth = Get.find<AuthService>();

    return GetMaterialApp(
      title: UiStyle.title,
      theme: UiStyle.theme,
      initialBinding: ApplicationBindings(),
      getPages: AppPages.pages,
      // initialRoute: auth.isLogged() ? Routes.HOME : Routes.LOGIN,
      initialRoute: Routes.LOGIN,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
    );
  }
}
