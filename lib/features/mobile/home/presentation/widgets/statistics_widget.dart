// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:dtmtest/common/enums/bloc_status.dart';
import 'package:dtmtest/common/ui.dart';
import 'package:dtmtest/features/mobile/home/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:dtmtest/common/costomaizable.dart';
import 'package:dtmtest/common/extentions.dart';
import 'package:dtmtest/common/material_button.dart';
import 'package:dtmtest/common/res/res.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatisticsWidget extends StatefulWidget {
  const StatisticsWidget({
    super.key,
  });

  @override
  State<StatisticsWidget> createState() => _StatisticsWidgetState();
}

class _StatisticsWidgetState extends State<StatisticsWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomeBloc>().add(GetAllStatisticsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        40.h,
        Text(
          "Statistika",
          style: AppTextStyles.body32w5.copyWith(
            fontWeight: FontWeight.w700,
            color: ColorName.white,
          ),
        ),
        20.h,
        BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state.getAllStatisticsStatus == BlocStatus.inProgress) {
              return UI.spinner();
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                alignment: Alignment.topCenter,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                decoration: BoxDecoration(
                  color: ColorName.white,
                  boxShadow: [
                    AppShadow.dropShadow,
                  ],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListView.separated(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.listStatistics?.length ?? 0,
                  itemBuilder: (context, index) {
                    return MaterialInkWellButton(
                      function: () {
                        
                      },
                      margin: EdgeInsets.zero,
                      borderRadius: BorderRadius.circular(12),
                      color: index != state.listStatistics!.length - 1
                          ? Colors.transparent
                          : const Color(0xffE7E7E7),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      width: double.infinity,
                      height: 52,
                      child: StatisticsFavoriteWIdget(
                        index: index,
                        name: state.listStatistics?[index].fullName ?? '',
                        textXp: "30/30",
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return 10.h;
                  },
                ),
              ),
            );
          },
        ),
        30.h,
      ],
    );
  }
}

// ignore: must_be_immutable
class StatisticsFavoriteWIdget extends StatelessWidget {
  int index;
  String name;
  String textXp;
  StatisticsFavoriteWIdget({
    super.key,
    required this.index,
    required this.name,
    required this.textXp,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            color: ColorName.customColor,
          ),
          child: Text(
            index != (context.read<HomeBloc>().state.listStatistics!.length - 1) ? " ${index + 1}" : "...",
            style: AppTextStyles.body12w5.copyWith(color: ColorName.white),
            textAlign: TextAlign.center,
          ),
        ),
        const Spacer(),
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Assets.images.statisticsProfileImage.image(
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const Spacer(),
        SizedBox(
          width: 130,
          child: Text(
            name,
            style: AppTextStyles.body12w6,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const Spacer(),
        Text(
          textXp,
          style: AppTextStyles.body10w4,
        )
      ],
    );
  }
}
