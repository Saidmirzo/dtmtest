import 'package:dtmtest/common/ui.dart';
import 'package:flutter/material.dart';

abstract class AppDecorations {
  static BoxDecoration defDecor = BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    // color: AppColors.metalColor.shade10,
  );

  static ButtonStyle buttonStyle({
    double? borderRadius,
    Color? bgColor,
    EdgeInsets? padding,
    BorderSide? border,
    Size? size,
  }) {
    return ButtonStyle(
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 10),
          side: border ?? BorderSide.none,
        ),
      ),
      // maximumSize: MaterialStatePropertyAll(size),
      fixedSize: MaterialStatePropertyAll(size),

      backgroundColor: MaterialStateProperty.all(bgColor ?? ColorName.white),
      overlayColor: MaterialStateProperty.all(ColorName.black.withOpacity(.2)),
      padding: MaterialStateProperty.all(padding),
    );
  }
}
