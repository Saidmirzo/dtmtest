import 'package:auto_route/auto_route.dart';
import 'package:dtmtest/common/components/circular_percent_indicator.dart';
import 'package:dtmtest/common/enums/bloc_status.dart';
import 'package:dtmtest/common/extentions.dart';
import 'package:dtmtest/common/res/app_text_style.dart';
import 'package:dtmtest/common/res/colors.gen.dart';
import 'package:dtmtest/di/di.dart';
import 'package:dtmtest/features/mobile/history/bloc/history_bloc.dart';
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
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.separated(
            itemCount: state.listHistory?.length ?? 0,
            padding: const EdgeInsets.all(18),
            itemBuilder: (_, index) => Container(
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
                        "Tarix",
                        style: AppTextStyles.body16w7
                            .copyWith(color: ColorName.customColor),
                      ),
                      Text(
                        "Tarix",
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
                        "18.04.2024",
                        style: AppTextStyles.body12w7
                            .copyWith(color: ColorName.customColor),
                      ),
                      Text(
                        "16:30",
                        style: AppTextStyles.body11w7
                            .copyWith(color: ColorName.customColor),
                      ),
                    ],
                  ),
                  10.w,
                  CircularPercentIndicator(
                    radius: 20.0,
                    lineWidth: 3.0,
                    percent: 0.6,
                    center: const Text("100%"),
                    progressColor: Colors.green,
                  )
                ],
              ),
            ),
            separatorBuilder: (_, index) => 10.h,
          );
        },
      ),
    );
  }
}
