import 'package:auto_route/auto_route.dart';
import 'package:dtmtest/common/components/custom_appbar.dart';
import 'package:dtmtest/common/costomaizable.dart';
import 'package:dtmtest/common/enums/bloc_status.dart';
import 'package:dtmtest/common/extentions.dart';
import 'package:dtmtest/common/res/app_router.dart';
import 'package:dtmtest/common/res/dialog_mixin.dart';
import 'package:dtmtest/common/res/res.dart';
import 'package:dtmtest/features/admin_panel/web_categories/data/models/theme_model.dart';
import 'package:dtmtest/features/mobile/tests/data/models/history_model.dart';
import 'package:dtmtest/features/mobile/tests/presentation/bloc/bloc/tests_bloc.dart';
import 'package:dtmtest/features/mobile/tests/presentation/widget/back_next_widget_on_test.dart';
import 'package:dtmtest/features/mobile/tests/presentation/widget/container.dart';
import 'package:dtmtest/features/mobile/tests/presentation/widget/end_and_time_widget.dart';
import 'package:dtmtest/features/mobile/tests/presentation/widget/navigation_button_widget.dart';
import 'package:dtmtest/features/mobile/tests/presentation/widget/test_item_widget.dart';
import 'package:dtmtest/features/mobile/tests/presentation/widget/tests_app_bar_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class TestsPage extends StatefulWidget {
  final ThemeModel themeModel;
  const TestsPage({
    super.key,
    required this.themeModel,
  });

  @override
  State<TestsPage> createState() => _TestsPageState();
}

class _TestsPageState extends State<TestsPage> with DialogMixin {
  late PageController pageController;
  late List<QuizCollection> quizColection;

  _genrateCollection() {
    quizColection = List.generate(
      widget.themeModel.quizCount ?? 0,
      (index) => QuizCollection(
        question: widget.themeModel.quiz?[index].question,
        correctAnswer: widget.themeModel.quiz?[index].options?.first,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _genrateCollection();
    pageController = PageController();
    pageController.addListener(
      () {
        setState(
          () {
            final int index = pageController.page!.ceil();
            if (activeIndex != index) {
              activeIndex = index;
            }
          },
        );
      },
    );
  }

  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    final ThemeModel themeModel = widget.themeModel;
    return Scaffold(
      backgroundColor: ColorName.white,
      appBar: CustomAppBar(
        child: TestsAppBarWidget(
          text: themeModel.name ?? LocaleKeys.category_unknown.tr(),
        ),
      ),
      body: ThemesBackgroundContainer(
        gradient: AppGradient.backgroundGradient,
        child: BlocConsumer<TestsBloc, TestsState>(
          listener: (context, state) {
            if (state.saveToHistoryStatus == BlocStatus.failed) {
              showSnackBar(context, text: LocaleKeys.category_error.tr());
            }
            if (state.saveToHistoryStatus.isComplated) {
              _genrateCollection();
              context.maybePop();
            }
          },
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.zero.copyWith(top: 30, bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NavigateButtonsWidget(
                    themeModel: themeModel,
                    activeIndex: activeIndex,
                    pageController: pageController,
                    quizColllection: quizColection,
                  ),
                  20.h,
                  EndTestsAndTimeWidget(
                    isLoading: state.saveToHistoryStatus.isProgress,
                    onTap: () {
                      showAccessDialog(
                        context,
                        text: LocaleKeys.category_areyoushureclosetest.tr(),
                        onYes: () {
                          final HistoryModel historyModel = HistoryModel(
                            quizCollection: quizColection,
                            correctCount: calcCorrectCount(),
                            quizCount: quizColection.length,
                            time: DateTime.now()
                                .millisecondsSinceEpoch
                                .toString(),
                            categoryName: widget.themeModel.name,
                          );
                          context.replaceRoute(
                            TestsResultRoute(historyModel: historyModel),
                          );
                          context.read<TestsBloc>().add(
                              SaveToHistoryEvent(historyModel: historyModel));
                        },
                      );
                    },
                    time: themeModel.duration ?? 0,
                  ),
                  10.h,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      "${LocaleKeys.category_question.tr()}: ${activeIndex + 1}/${themeModel.quiz?.length}",
                      style: AppTextStyles.body24w5.copyWith(
                        color: ColorName.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  15.h,
                  Expanded(
                    child: PageView(
                      controller: pageController,
                      children: List.generate(
                        themeModel.quiz!.length,
                        (index) => TestItemWidget(
                          activeIndex: activeIndex,
                          quiz: themeModel.quiz![index],
                          onChange: (QuizCollection value) {
                            quizColection[index] = value;
                          },
                        ),
                      ),
                    ),
                  ),
                  BackNextWidgetOnTest(
                    backFunction: !(activeIndex >= 1)
                        ? null
                        : () {
                            if (activeIndex >= 1) {
                              _animateToPage(--activeIndex);
                            }
                          },
                    nextFunction: (activeIndex == themeModel.quiz!.length - 1)
                        ? null
                        : () {
                            if (activeIndex < themeModel.quiz!.length) {
                              _animateToPage(++activeIndex);
                            }
                          },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  _animateToPage(int index) {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
  }

  int calcCorrectCount() {
    int count = 0;
    for (var element in quizColection) {
      if ((element.answer != null && element.correctAnswer != null) &&
          (element.answer == element.correctAnswer)) {
        count++;
      }
    }
    return count;
  }
}
