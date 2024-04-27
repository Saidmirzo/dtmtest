// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dtmtest/common/res/res.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    this.preficWidget,
    this.suffixWidget,
    required this.onTap,
    this.color,
    this.borderColor,
    this.borderRadius,
  });
  final Widget? preficWidget;
  final Widget? suffixWidget;
  final Function() onTap;
  final Color? color;
  final Color? borderColor;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: AppDecorations.buttonStyle(
        bgColor: color ?? ColorName.grey.withOpacity(.25),
        border: BorderSide(
          color: borderColor ?? ColorName.white.withOpacity(.35),
        ),
        borderRadius:borderRadius?? 50,
      ),
      onPressed: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          preficWidget ?? const SizedBox.shrink(),
          const SizedBox(width: 10),
          suffixWidget ?? const SizedBox.shrink(),
        ],
      ),
    );
  }
}
