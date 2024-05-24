// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dtmtest/common/res/res.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InnerShadowWidget extends StatelessWidget {
  Widget child;
  EdgeInsetsGeometry? padding;
  final double? width, height;
  final AlignmentGeometry? alignment;
  final void Function()? onTap;
  InnerShadowWidget({
    super.key,
    required this.child,
    this.padding,
    this.width,
    this.height,
    this.alignment, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        alignment: alignment,
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: ColorName.customInnerShadowColor,
            ),
            BoxShadow(
              color: ColorName.customColor,
              blurRadius: 4,
              spreadRadius: -2,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
