import 'package:dtmtest/common/extentions.dart';
import 'package:dtmtest/common/material_button.dart';
import 'package:dtmtest/common/ui.dart';
import 'package:dtmtest/features/admin_panel/web_categories/data/models/theme_model.dart';
import 'package:dtmtest/features/mobile/tests/data/models/history_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TestItemWidget extends StatefulWidget {
  const TestItemWidget({
    super.key,
    required this.activeIndex,
    required this.quiz,
    required this.onChange,
  });

  final Quiz quiz;
  final int activeIndex;
  final ValueChanged<QuizCollection> onChange;

  @override
  State<TestItemWidget> createState() => _TestItemWidgetState();
}

class _TestItemWidgetState extends State<TestItemWidget>
    with AutomaticKeepAliveClientMixin {
  late List<String> listOptions;

  @override
  void initState() {
    super.initState();
    listOptions =
        (widget.quiz.options != null) ? _shuffleList(widget.quiz.options!) : [];
  }

  int activeIndex = -1;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              widget.quiz.question ?? LocaleKeys.category_unknown.tr(),
              style: AppTextStyles.body16w7.copyWith(
                color: ColorName.white,
              ),
            ),
          ),
          21.h,
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 30),
            height: 3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: ColorName.customColor,
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 30,
            ),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return MaterialInkWellButton(
                color: activeIndex == index
                    ? ColorName.blueAccent
                    : ColorName.white,
                function: () {
                  widget.onChange(
                    QuizCollection(
                      answer: listOptions[index],
                      correctAnswer: widget.quiz.options?.first,
                      question: widget.quiz.question,
                      time: DateTime.now().millisecondsSinceEpoch.toString(),
                    ),
                  );
                  setState(() {
                    activeIndex = index;
                  });
                },
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                border: Border.all(
                  color: ColorName.customColor,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10),
                child: Text(
                  listOptions[index],
                  style: AppTextStyles.body16w7.copyWith(
                    color: ColorName.testTextColor,
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return 10.h;
            },
            itemCount: widget.quiz.options!.length,
          ),
          30.h,
        ],
      ),
    );
  }

  List<String> _shuffleList(List<String> list) {
    List<String> result = [];
    result.addAll(list);
    result.shuffle();
    return result;
  }

  @override
  bool get wantKeepAlive => true;
}
