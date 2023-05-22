import 'package:flutter/material.dart';

class UIColors {
  UIColors._();

  static Color get primaryColor => const Color(0xFF263940);
  static Color get secondaryColor => const Color(0xFFED1B24);
  static Color get whiteColor => const Color(0xFFF8F8FF);
  static Color get blackColor => const Color(0xFF121212);
  static Color get dangerColor => Colors.red[400] ?? const Color(0xFFff4444);
  static Color get warningColor =>
      Colors.orange[300] ?? const Color(0xFFffbb33);
  static Color get successColor => Colors.green[400] ?? const Color(0xFF00C851);
  static Color get infoColor => const Color(0xFF33b5e5);
  static Color get disableColor => const Color(0xFFC7C7C7);
}
