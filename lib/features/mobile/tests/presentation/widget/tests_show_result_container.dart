import 'dart:math';

import 'package:dtmtest/common/extentions.dart';
import 'package:dtmtest/common/res/app_text_style.dart';
import 'package:dtmtest/common/res/colors.gen.dart';
import 'package:dtmtest/features/mobile/tests/presentation/widget/inner_shadow_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestsShowResultContainer extends StatefulWidget {
  const TestsShowResultContainer({super.key});

  @override
  State<TestsShowResultContainer> createState() =>
      _TestsShowResultContainerState();
}

class _TestsShowResultContainerState extends State<TestsShowResultContainer> {
  @override
  Widget build(BuildContext context) {
    return InnerShadowWidget(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: SizedBox(
        width: 239,
        height: 239,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Test",
                    style: AppTextStyles.body16w6.copyWith(
                      color: ColorName.white,
                    ),
                  ),
                  10.w,
                  Transform.rotate(
                    angle: pi / 2,
                    child: const Icon(
                      CupertinoIcons.back,
                      size: 25,
                      color: ColorName.white,
                    ),
                  ),
                ],
              ),
            ),
            15.h,
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 8,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
              itemBuilder: (context, index) {
                return Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: ColorName.green,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
