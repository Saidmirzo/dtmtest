import 'package:auto_route/auto_route.dart';
import 'package:dtmtest/common/costomaizable.dart';
import 'package:dtmtest/common/enums/bloc_status.dart';
import 'package:dtmtest/common/extentions.dart';
import 'package:dtmtest/common/res/app_router.dart';
import 'package:dtmtest/common/ui.dart';
import 'package:dtmtest/di/di.dart';
import 'package:dtmtest/features/mobile/history/bloc/history_bloc.dart';
import 'package:dtmtest/features/mobile/history/widgets/history_widget.dart';
import 'package:dtmtest/features/mobile/tests/data/models/history_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
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
          final List<HistoryModel> listHistory = state.listHistory ?? [];

          if (state.getAllHistoryStatus == BlocStatus.inProgress) {
            return Center(child: UI.spinner());
          }
          if (listHistory.isEmpty) {
            return const Center(
              child: Text('History list is empty'),
            );
          }
          return Container(
            decoration: BoxDecoration(
              gradient: AppGradient.backgroundGradient,
            ),
            child: SafeArea(
              child: Column(
                children: [
                  Text(
                    LocaleKeys.history.tr(),
                    style:
                        AppTextStyles.body20w5.copyWith(color: ColorName.white),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(top: 50),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                          color: ColorName.white),
                      child: RefreshIndicator(
                        displacement: 40,
                        edgeOffset: 20,
                        onRefresh: () async {
                          context.read<HistoryBloc>().add(GetAllHistoryEvent());
                        },
                        child: ListView.separated(
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemCount: listHistory.length,
                          padding: const EdgeInsets.all(18),
                          itemBuilder: (_, index) => HistoryWidget(
                            onTap: () {
                              context.pushRoute(HistoryDatailRoute(
                                  historyModel: listHistory[index]));
                            },
                            name: listHistory[index].categoryName ?? '',
                            subname: '',
                            date: '',
                            time: DateTime.fromMillisecondsSinceEpoch(
                                    int.parse(listHistory[index].time ?? "0"))
                                .toString()
                                .formatDate(),
                            correctCount: listHistory[index].correctCount ?? 0,
                            quizCount: listHistory[index].quizCount ?? 0,
                            index: index,
                          ),
                          separatorBuilder: (_, index) => 10.h,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
