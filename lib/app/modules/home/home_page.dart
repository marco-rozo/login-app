import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/app/modules/home/home_controller.dart';
import 'package:login_app/app/widgets/custom_outlined_button.dart';
import 'package:login_app/core/utils/functions/size_config.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() => Text(controller.userName.value)),
                SizedBox(
                  height: 20,
                ),
                CustomOutlinedButton(
                  onPressedCallBack: () => controller.logout(),
                  title: 'Logout',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
