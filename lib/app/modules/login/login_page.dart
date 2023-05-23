import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/app/modules/login/login_controller.dart';
import 'package:login_app/app/widgets/custom_elevated_button.dart';
import 'package:login_app/app/widgets/custom_input_field.dart';
import 'package:login_app/core/theme/ui_colors.dart';
import 'package:login_app/core/theme/ui_styles.dart';

class LoginPage extends GetView<LoginController> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                right: 32,
                left: 32,
                top: (Get.height / 5),
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Welcome Back',
                              style: UiStyle.titleStyle,
                            ),
                            Text(
                              'Login to your account',
                              style: UiStyle.subtextStyle,
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 15.0),
                            child: CustomInputField(
                              inputController: _emailController,
                              onTapCallBack: () {},
                              labelText: 'E-mail',
                              icon: Icons.person,
                              validator: (email) {
                                if (email == null || email.isEmpty) {
                                  return "Type your e-mail";
                                } else if (!GetUtils.isEmail(email)) {
                                  return "Enter a valid email";
                                }

                                return null;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Obx(() => CustomInputField(
                                inputController: _passwordController,
                                onTapCallBack: () {},
                                onPressedIcon: () =>
                                    controller.onChangedObscureText(),
                                isObscureText: controller.isObscureText.value,
                                labelText: 'Password',
                                icon: controller.isObscureText.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                validator: (password) {
                                  if (password == null ||
                                      password.toString().trim().isEmpty) {
                                    return "Type your password";
                                  }

                                  return null;
                                },
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 32,
                    left: 32,
                    bottom: 32,
                    top: 32,
                  ),
                  child: SizedBox(
                    height: 48,
                    child: Obx(
                      () => CustomElevatedButton(
                        onPressedCallBack: () {
                          if (_formKey.currentState!.validate()) {
                            controller.signIn(
                              email: _emailController.text,
                              password: _passwordController.text,
                            );
                          }
                        },
                        content: controller.isLoading.value
                            ? Center(
                                child: SizedBox(
                                  height: 24,
                                  width: 24,
                                  child: CircularProgressIndicator(
                                    color: UIColors.whiteColor,
                                  ),
                                ),
                              )
                            : Text('Login'),
                      ),
                    ),
                  ),
                ),
              ),
            )
            // ),
          ],
        ),
      ),
    );
  }
}
