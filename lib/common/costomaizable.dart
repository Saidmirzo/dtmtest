import 'package:dtmtest/common/res/colors.gen.dart';
import 'package:flutter/material.dart';

class AppGradient {
  static LinearGradient backgroundGradient = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xff006566),
      Color(0xff00D2FF),
    ],
  );
  static LinearGradient gradient = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xff00D2FF),
      Color(0xff2C3CFE),
    ],
  );
  static LinearGradient profileImageGradient = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xffEAEEF1),
      Color(0xffFFFFFF),
    ],
  );
  static LinearGradient switchAdapterGradient = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xffD6DDE2),
      Color(0xffEAEEF1),
    ],
  );
}

class AppShadow {
  static BoxShadow get defShadow => BoxShadow(
        color: ColorName.black.withOpacity(0.1),
        blurRadius: 40,
        offset: const Offset(0, 30),
      );
  static BoxShadow get dropShadow => BoxShadow(
        color: ColorName.black.withOpacity(0.1),
        blurRadius: 15,
        offset: const Offset(0, 5),
      );
  static BoxShadow get planDropShadow => BoxShadow(
        color: ColorName.black.withOpacity(0.1),
        blurRadius: 20,
        offset: const Offset(0, 10),
      );
  static BoxShadow get switchDropShadow => BoxShadow(
        color: ColorName.black.withOpacity(0.1),
        blurRadius: 10,
        offset: const Offset(0, 5),
      );
}
