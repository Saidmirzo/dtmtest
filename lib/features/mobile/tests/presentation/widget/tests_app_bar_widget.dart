// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:dtmtest/common/extentions.dart';
import 'package:dtmtest/common/res/res.dart';
import 'package:dtmtest/features/mobile/tests/presentation/widget/inner_shadow_widget.dart';

// ignore: must_be_immutable
class TestsAppBarWidget extends StatelessWidget {
  String text;
  TestsAppBarWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          border: Border.all(
            color: ColorName.customColor,
            width: 1,
          ),
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            70.w,
            Text(
              text,
              style: AppTextStyles.body24w7.copyWith(
                color: ColorName.customColor,
              ),
            ),
            InkWell(
              onTap: () {},
              child: InnerShadowWidget(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Test",
                      style: AppTextStyles.body16w6.copyWith(
                        color: ColorName.white,
                      ),
                    ),
                    Transform.rotate(
                      angle: 3 * pi / 2,
                      child: const Icon(
                        CupertinoIcons.back,
                        size: 25,
                        color: ColorName.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
