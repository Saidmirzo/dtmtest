import 'package:auto_route/auto_route.dart';
import 'package:dtmtest/common/costomaizable.dart';
import 'package:dtmtest/common/enums/bloc_status.dart';
import 'package:dtmtest/common/extentions.dart';
import 'package:dtmtest/common/res/app_router.dart';
import 'package:dtmtest/common/ui.dart';
import 'package:dtmtest/di/di.dart';
import 'package:dtmtest/features/mobile/history/bloc/history_bloc.dart';
import 'package:dtmtest/features/mobile/history/widgets/home_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<HistoryBloc>()..add(GetAllHistoryEvent()),
      child: BlocBuilder<HistoryBloc, HistoryState>(
        builder: (context, state) {
          if (state.getAllHistoryStatus == BlocStatus.inProgress) {
            return Center(child: UI.spinner());
          }
          return Container(
            decoration: BoxDecoration(
              gradient: AppGradient.backgroundGradient,
            ),
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: Colors.transparent,
                  title: Text(
                    "History",
                    style:
                        AppTextStyles.body20w5.copyWith(color: ColorName.white),
                  ),
                ),
                SliverFillRemaining(
                  child: Container(
                    margin: const EdgeInsets.only(top: 50),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
                        color: ColorName.white),
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemCount: state.listHistory?.length ?? 0,
                      padding: const EdgeInsets.all(18),
                      itemBuilder: (_, index) => HistoryWidget(
                        onTap: () {
                          context.pushRoute(HistoryDatailRoute(
                              historyList:
                                  state.listHistory?[index].quizCollection ??
                                      []));
                        },
                        name: state.listHistory?[index].categoryName ?? '',
                        subname: state.listHistory?[index].categoryName ?? '',
                        date: '',
                        time: state.listHistory?[index].time ?? '',
                        correctCount:
                            state.listHistory?[index].correctCount ?? 0,
                        quizCount: state.listHistory?[index].quizCount ?? 0,
                      ),
                      separatorBuilder: (_, index) => 10.h,
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
