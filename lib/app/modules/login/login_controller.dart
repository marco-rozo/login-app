import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/app/data/enums/enum_snackbar_type.dart';
import 'package:login_app/app/data/repositories/login/login_repository.dart';
import 'package:login_app/app/data/services/auth/auth_service.dart';
import 'package:login_app/app/data/services/login/login_service.dart';
import 'package:login_app/app/widgets/snackbar.dart';
import 'package:login_app/routes/app_pages.dart';

class LoginController extends GetxController {
  final LoginService _loginService;

  LoginController({
    required LoginService loginService,
  }) : _loginService = loginService;

  AuthService? auth;
  RxBool isLoading = false.obs;
  RxBool isObscureText = true.obs;
  RxString titleTest = ''.obs;

  @override
  void onInit() async {
    auth = Get.find<AuthService>();
    await reauth();
    super.onInit();
  }

  reauth() async {
    await Future.delayed(Duration.zero, () {
      if (auth!.isLogged()) {
        Get.offNamed(Routes.HOME);
      }
    });
  }

  onChangedObscureText() {
    isObscureText.value = !isObscureText.value;
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    isLoading.value = true;
    var login = {
      "email": email,
      "password": password,
    };

    try {
      await _loginService.login(login).then((value) {
        if (value != null) {
          auth!.changeApiToken(value.token);
          auth!.changeIsLogged(true);
          auth!.changeDisplayName(value.name);
          Snack.show(
            content: 'Success',
            snackType: SnackType.success,
            behavior: SnackBarBehavior.floating,
          );
          reauth();
        } else {
          Snack.show(
            content: 'Login error',
            snackType: SnackType.error,
            behavior: SnackBarBehavior.floating,
          );

          update();
        }
      });
    } catch (e) {
      Snack.show(
        content: 'Login error',
        snackType: SnackType.error,
        behavior: SnackBarBehavior.floating,
      );
    }

    isLoading.value = false;
  }
}
