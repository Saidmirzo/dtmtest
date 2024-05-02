import 'package:dtmtest/common/extentions.dart';
import 'package:dtmtest/common/ui.dart';
import 'package:dtmtest/features/mobile/tests/presentation/widget/inner_shadow_widget.dart';
import 'package:flutter/material.dart';

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
      height: 100,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: ColorName.customColor)),
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
              Flexible(
                child: Text(
                  question,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.body12w7,
                ),
              ),
            ],
          ),
          Row(
            children: [
              currentAnswer != answer
                  ? Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Xato: ",
                            style: AppTextStyles.body12w7
                                .copyWith(color: ColorName.red),
                          ),
                          Flexible(
                              child: Text(
                            answer,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ))
                        ],
                      ),
                    )
                  : UI.nothing,
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Togri: ",
                      style: AppTextStyles.body12w7
                          .copyWith(color: ColorName.customColor),
                    ),
                    Flexible(
                      child: Text(
                        currentAnswer,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
