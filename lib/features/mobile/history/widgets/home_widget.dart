import 'package:dtmtest/common/components/circular_percent_indicator.dart';
import 'package:dtmtest/common/extentions.dart';
import 'package:dtmtest/common/res/app_text_style.dart';
import 'package:dtmtest/common/res/colors.gen.dart';
import 'package:flutter/material.dart';

class HistoryWidget extends StatelessWidget {
  const HistoryWidget({
    super.key,
    required this.name,
    required this.subname,
    required this.date,
    required this.time,
    required this.correctCount,
    required this.quizCount,
    this.onTap,
  });
  final String name, subname, date, time;
  final num correctCount, quizCount;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 65,
        decoration: (BoxDecoration(
            border: Border.all(color: ColorName.customColor),
            borderRadius: BorderRadius.circular(7))),
        child: Row(
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: ColorName.white),
            ),
            10.w,
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: AppTextStyles.body16w7
                      .copyWith(color: ColorName.customColor),
                ),
                Text(
                  subname,
                  style: AppTextStyles.body12w6
                      .copyWith(color: ColorName.customColor),
                ),
              ],
            ),
            const Spacer(),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  date,
                  style: AppTextStyles.body12w7
                      .copyWith(color: ColorName.customColor),
                ),
                Text(
                  time,
                  style: AppTextStyles.body11w7
                      .copyWith(color: ColorName.customColor),
                ),
              ],
            ),
            10.w,
            CircularPercentIndicator(
              radius: 20.0,
              lineWidth: 3.0,
              percent: (correctCount) / (quizCount),
              center: Text(
                "${((correctCount) * 100) ~/ (quizCount)}%",
                style: AppTextStyles.body12w4,
              ),
              progressColor: Colors.yellow,
              backgroundColor: ColorName.white,
            )
          ],
        ),
      ),
    );
  }
}
