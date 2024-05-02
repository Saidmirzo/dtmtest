// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:dtmtest/common/enums/bloc_status.dart';
import 'package:dtmtest/common/ui.dart';
import 'package:dtmtest/features/mobile/auth/data/model/user_model.dart';
import 'package:dtmtest/features/mobile/auth/domain/repository/auth_repository.dart';
import 'package:dtmtest/features/mobile/auth/presentation/bloc/bloc/auth_bloc.dart';
import 'package:dtmtest/features/mobile/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:dtmtest/common/costomaizable.dart';
import 'package:dtmtest/common/extentions.dart';
import 'package:dtmtest/common/material_button.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatisticsWidget extends StatefulWidget {
  const StatisticsWidget({
    super.key,
  });

  @override
  State<StatisticsWidget> createState() => _StatisticsWidgetState();
}

class _StatisticsWidgetState extends State<StatisticsWidget> {
  List<UserModel?> raitingList = [];
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(GetAllStatisticsEvent());
  }

  void func() {
    List<UserModel?> usersList =
        (context.read<HomeBloc>().state.listStatistics ?? [])
            .map((e) => e)
            .toList();

    if (!usersList.any((element) =>
        element?.uid == context.read<AuthBloc>().state.userModel?.uid)) {
      usersList.add(context.read<AuthBloc>().state.userModel);
    }

    usersList.sort((a, b) => (b?.rating ?? 0).compareTo(a?.rating ?? 0));

    raitingList = usersList.take(3).toList();
    if (!raitingList.any(
        (user) => user?.uid == context.read<AuthBloc>().state.userModel?.uid)) {
      raitingList.add(context.read<AuthBloc>().state.userModel);
    }
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
            if (state.getAllStatisticsStatus == BlocStatus.completed) {
              func();
            }
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
                  itemCount: raitingList.length ?? 0,
                  itemBuilder: (context, index) {
                    final currentUser = raitingList[index];
                    bool isLocalUserTopThree = currentUser != null &&
                        currentUser.uid ==
                            context.read<AuthBloc>().state.userModel?.uid &&
                        index < 4;
                    return MaterialInkWellButton(
                      function: () {},
                      margin: EdgeInsets.zero,
                      borderRadius: BorderRadius.circular(12),
                      color: isLocalUserTopThree
                          ? const Color(0xffE7E7E7)
                          : Colors.transparent,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      width: double.infinity,
                      height: 52,
                      child: StatisticsFavoriteWidget(
                        index: index,
                        name: currentUser?.fullName ?? '',
                        raiting: currentUser?.rating ?? 0,
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
class StatisticsFavoriteWidget extends StatelessWidget {
  int index;
  String name;
  int? raiting;
  StatisticsFavoriteWidget({
    super.key,
    required this.index,
    required this.name,
    required this.raiting,
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
            index != 3 ? " ${index + 1}" : "...",
            style: AppTextStyles.body12w5.copyWith(color: ColorName.white),
            textAlign: TextAlign.center,
          ),
        ),
        15.w,
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
        10.w,
        SizedBox(
          width: 150,
          child: Text(
            name,
            style:
                AppTextStyles.body16w6.copyWith(color: ColorName.customColor),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const Spacer(),
        Text(
          "$raiting",
          style: AppTextStyles.body12w4.copyWith(color: ColorName.customColor),
        )
      ],
    );
  }
}
