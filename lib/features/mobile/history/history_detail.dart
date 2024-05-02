import 'package:auto_route/auto_route.dart';
import 'package:dtmtest/common/components/custom_appbar.dart';
import 'package:dtmtest/common/costomaizable.dart';
import 'package:dtmtest/common/extentions.dart';
import 'package:dtmtest/common/res/colors.gen.dart';
import 'package:dtmtest/features/mobile/history/widgets/history_detail_widget.dart';
import 'package:dtmtest/features/mobile/tests/data/models/history_model.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HistoryDatailPage extends StatelessWidget {
  const HistoryDatailPage({super.key, required this.historyList});
  final List<QuizCollection> historyList;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppGradient.backgroundGradient,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const CustomAppBar(
          text: "Tarix",
        ),
        body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 50),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                      color: ColorName.white),
                  child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.all(20),
                      itemBuilder: (_, index) => HistoryDetailWidget(
                            question: historyList[index].question ?? '',
                            currentAnswer:
                                historyList[index].correctAnswer ?? '',
                            answer: historyList[index].answer ?? '',
                            index: index,
                          ),
                      separatorBuilder: (_, indx) => 10.h,
                      itemCount: historyList.length),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
