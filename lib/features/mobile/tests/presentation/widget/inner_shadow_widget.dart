// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:dtmtest/common/res/res.dart';

// ignore: must_be_immutable
class InnerShadowWidget extends StatelessWidget {
  Widget child;
  EdgeInsetsGeometry? padding;
  InnerShadowWidget({
    super.key,
    required this.child,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
