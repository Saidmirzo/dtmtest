import 'package:dtmtest/common/extentions.dart';
import 'package:dtmtest/common/res/app_text_style.dart';
import 'package:dtmtest/common/res/colors.gen.dart';
import 'package:dtmtest/features/admin_panel/web_categories/data/models/theme_model.dart';
import 'package:dtmtest/features/mobile/tests/data/models/history_model.dart';
import 'package:flutter/material.dart';

class NavigateButtonsWidget extends StatelessWidget {
  const NavigateButtonsWidget({
    super.key,
    required this.themeModel,
    required this.activeIndex,
    required this.pageController,
    required this.quizColllection,
  });

  final ThemeModel themeModel;
  final int activeIndex;
  final PageController pageController;
  final List<QuizCollection> quizColllection;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        padding: EdgeInsets.zero.copyWith(left: 30, right: 30),
        separatorBuilder: (context, index) {
          return 10.w;
        },
        itemCount: themeModel.quiz?.length ?? 0,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final bool isSelected = quizColllection[index].answer != null;
          return InkWell(
            onTap: () {
              pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.bounceInOut,
              );
            },
            child: Container(
              width: 40,
              height: 35,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: isSelected
                    ? ColorName.blue
                    : (activeIndex == index
                        ? ColorName.yellow
                        : ColorName.white),
              ),
              child: Text(
                "${index + 1}",
                style: AppTextStyles.body24w7.copyWith(
                  color: ColorName.customColor,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
