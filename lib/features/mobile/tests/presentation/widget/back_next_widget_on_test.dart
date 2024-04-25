import 'dart:math';

import 'package:dtmtest/common/res/app_text_style.dart';
import 'package:dtmtest/common/res/colors.gen.dart';
import 'package:dtmtest/features/mobile/tests/presentation/widget/inner_shadow_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BackNextWidgetOnTest extends StatelessWidget {
  final Function()? nextFunction;
  final Function()? backFunction;
  const BackNextWidgetOnTest({
    super.key,
    this.nextFunction,
    this.backFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: backFunction,
            child: InnerShadowWidget(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    CupertinoIcons.back,
                    color: ColorName.white,
                    size: 25,
                  ),
                  Text(
                    "Orqaga",
                    style: AppTextStyles.body16w6.copyWith(
                      color: ColorName.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: nextFunction,
            child: InnerShadowWidget(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Oldinga",
                    style: AppTextStyles.body16w6.copyWith(
                      color: ColorName.white,
                    ),
                  ),
                  Transform.rotate(
                    angle: pi,
                    child: const Icon(
                      CupertinoIcons.back,
                      color: ColorName.white,
                      size: 25,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
