import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:login_app/core/theme/ui_styles.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressedCallBack;
  final Widget? content;
  final IconData? icon;
  final double? height;

  const CustomElevatedButton({
    super.key,
    required this.onPressedCallBack,
    required this.content,
    this.icon,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 48,
      child: ElevatedButton(
        style: UiStyle.elevatedButtonStyle,
        onPressed: onPressedCallBack,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon != null
                ? Icon(
                    icon,
                    size: 16,
                  )
                : Container(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: content,
            ),
          ],
        ),
      ),
    );
  }
}
