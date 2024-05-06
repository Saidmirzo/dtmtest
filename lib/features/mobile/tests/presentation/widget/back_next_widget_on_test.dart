import 'dart:math';

import 'package:dtmtest/common/res/app_text_style.dart';
import 'package:dtmtest/common/res/colors.gen.dart';
import 'package:dtmtest/common/ui.dart';
import 'package:dtmtest/features/mobile/tests/presentation/widget/inner_shadow_widget.dart';
import 'package:easy_localization/easy_localization.dart';
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
          backFunction == null
              ? const SizedBox.shrink()
              : InkWell(
                  onTap: backFunction,
                  child: InnerShadowWidget(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          CupertinoIcons.back,
                          color: ColorName.white,
                          size: 25,
                        ),
                        Text(
                          LocaleKeys.category_back.tr(),
                          style: AppTextStyles.body16w6.copyWith(
                            color: ColorName.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
          nextFunction == null
              ? const SizedBox.shrink()
              : InkWell(
                  onTap: nextFunction,
                  child: InnerShadowWidget(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          LocaleKeys.category_forward.tr(),
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
