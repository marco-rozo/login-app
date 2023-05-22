import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/core/theme/ui_colors.dart';

class UiStyle {
  UiStyle._();

  static String get title => 'IDR Mobile App';

  static ThemeData get theme => ThemeData(
        fontFamily: 'Segoe-UI',
        // colorScheme: ThemeData().colorScheme.copyWith(secondary: Colors.white),
      );

  static ButtonStyle get elevatedButtonStyle => ElevatedButton.styleFrom(
        backgroundColor: UIColors.primaryColor,
        maximumSize: Size(Get.width, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      );

  static ButtonStyle get outlineButtonStyle => OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        side:
            const BorderSide(color: Color(0xFF0059AA), width: 1), //<-- SEE HERE
        textStyle: TextStyle(
          color: UIColors.blackColor,
        ),
      );

  static TextStyle get titleStyle => TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: UIColors.primaryColor,
      );

  static TextStyle get subtextStyle => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
        color: UIColors.primaryColor,
      );
}
