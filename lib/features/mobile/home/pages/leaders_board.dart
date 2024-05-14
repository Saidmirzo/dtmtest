import 'package:auto_route/auto_route.dart';
import 'package:dtmtest/common/components/custom_appbar.dart';
import 'package:dtmtest/common/costomaizable.dart';
import 'package:dtmtest/common/enums/bloc_status.dart';
import 'package:dtmtest/common/extentions.dart';
import 'package:dtmtest/common/ui.dart';
import 'package:dtmtest/core/widgets/custom_network_image.dart';
import 'package:dtmtest/features/mobile/auth/data/model/user_model.dart';
import 'package:dtmtest/features/mobile/home/bloc/home_bloc.dart';
import 'package:dtmtest/features/mobile/home/widgets/leader_number_one_widget.dart';
import 'package:dtmtest/features/mobile/home/widgets/leaders_wiget.dart';
import 'package:dtmtest/features/mobile/tests/presentation/widget/inner_shadow_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class LeaderBoardPage extends StatefulWidget {
  const LeaderBoardPage({super.key});

  @override
  State<LeaderBoardPage> createState() => _LeaderBoardPageState();
}

class _LeaderBoardPageState extends State<LeaderBoardPage> {
  List<UserModel?> raitingList = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppGradient.backgroundGradient,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: CustomAppBar(
          text: LocaleKeys.home_leaderboard.tr(),
        ),
        body: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state.getAllStatisticsStatus == BlocStatus.inProgress) {
              return UI.spinner();
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                NumberOneLeaderWidget(
                  nameLeaderKing: state.listSortUsers?.first.fullName ?? '',
                  networkImage: state.listSortUsers?.first.userImage,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    LeadersWidget(
                      text: state.listSortUsers?[1].fullName ?? '',
                      textNumber: '2',
                      networkImage: state.listSortUsers?[1].userImage,
                    ),
                    LeadersWidget(
                      text: state.listSortUsers?[2].fullName ?? '',
                      textNumber: '3',
                      networkImage: state.listSortUsers?[2].userImage ?? '',
                    ),
                  ],
                ),
                20.h,
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      color: ColorName.white,
                    ),
                    child: ListView.separated(
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(horizontal: 30)
                          .copyWith(top: 50, bottom: 30),
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(
                              color: ColorName.customColor,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              InnerShadowWidget(
                                width: 40,
                                height: 33,
                                alignment: Alignment.center,
                                child: Text(
                                  "${index + 4}",
                                  style: AppTextStyles.body16w4
                                      .copyWith(color: ColorName.white),
                                ),
                              ),
                              10.w,
                              CustomNetworkImage(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 1,
                                  color: ColorName.customColor,
                                ),
                                width: 30,
                                height: 30,
                                networkImage:
                                    state.listSortUsers?[index + 3].userImage,
                                defImage: Assets.images.defimage.path,
                              ),
                              20.w,
                              Expanded(
                                child: Text(
                                  state.listSortUsers?[index + 3].fullName ??
                                      '',
                                  style: AppTextStyles.body20w7.copyWith(
                                    color: ColorName.customColor,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              15.w,
                              Text(
                                state.listSortUsers?[index + 3].rating
                                        .toString() ??
                                    '',
                                style: AppTextStyles.body16w7.copyWith(
                                  color: ColorName.customColor,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return 10.h;
                      },
                      itemCount: state.listSortUsers == null
                          ? 0
                          : state.listSortUsers!.length - 3,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
