import 'package:dtmtest/common/extentions.dart';
import 'package:dtmtest/common/ui.dart';
import 'package:dtmtest/features/mobile/tests/presentation/widget/inner_shadow_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HistoryDetailWidget extends StatelessWidget {
  const HistoryDetailWidget({
    super.key,
    required this.question,
    required this.currentAnswer,
    required this.answer,
    required this.index,
  });
  final String question, currentAnswer, answer;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: ColorName.customColor),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InnerShadowWidget(
                width: 40,
                height: 33,
                alignment: Alignment.center,
                child: Text(
                  "${index + 1}",
                  style:
                      AppTextStyles.body16w4.copyWith(color: ColorName.white),
                ),
              ),
              10.w,
              Expanded(
                child: Text(
                  question,
                  style: AppTextStyles.body14w7,
                ),
              ),
            ],
          ),
          10.h,
          Column(
            children: [
              currentAnswer != answer
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${LocaleKeys.wrong.tr()}: ",
                          style: AppTextStyles.body14w7
                              .copyWith(color: ColorName.red),
                        ),
                        Expanded(
                          child: Text(
                            answer,
                          ),
                        )
                      ],
                    )
                  : UI.nothing,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${LocaleKeys.correct.tr()}: ",
                    style: AppTextStyles.body14w7
                        .copyWith(color: ColorName.customColor),
                  ),
                  Expanded(
                    child: Text(
                      currentAnswer,
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
