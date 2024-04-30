import 'package:auto_route/auto_route.dart';
import 'package:dtmtest/common/res/res.dart';
import 'package:dtmtest/features/mobile/auth/presentation/widgets/custom_text_button.dart';
import 'package:dtmtest/features/mobile/tests/data/models/history_model.dart';
import 'package:flutter/material.dart';

@RoutePage()
class TestsResultPage extends StatelessWidget {
  const TestsResultPage({super.key, required this.historyModel});
  final HistoryModel historyModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.backgroundColor,
      body: Stack(
        children: [
          Center(
            child: SizedBox(
              height: 200,
              width: 200,
              child: CircularProgressIndicator(
                backgroundColor: ColorName.white,
                strokeWidth: 20,
                color: ColorName.green,
                semanticsLabel: '10/20',
                semanticsValue: '10',
                value: (historyModel.correctCount ?? 0) /
                    (historyModel.quizCount ?? 1),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${historyModel.correctCount}/${historyModel.quizCount}',
                  style: AppTextStyles.body18w5,
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Umumiy - ${((historyModel.correctCount ?? 0) / (historyModel.quizCount ?? 1) * 100).floor()}%',
                  style: AppTextStyles.body18w5,
                ),
                Text(
                  '${historyModel.correctCount} ball',
                  style: AppTextStyles.body18w5,
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextButton(
                    onTap: () {},
                    color: ColorName.white,
                    preficWidget: const Text('Natijalar'),
                  ),
                  CustomTextButton(
                    onTap: () {
                      context.maybePop();
                    },
                    color: ColorName.white,
                    preficWidget: const Text('Davom ettirish'),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
