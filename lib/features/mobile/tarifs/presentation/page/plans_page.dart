import 'package:auto_route/auto_route.dart';
import 'package:dtmtest/common/enums/bloc_status.dart';
import 'package:dtmtest/common/extentions.dart';
import 'package:dtmtest/common/ui.dart';
import 'package:dtmtest/features/mobile/auth/data/datasource/auth_locale_datasource.dart';
import 'package:dtmtest/features/mobile/auth/data/model/user_model.dart';
import 'package:dtmtest/features/mobile/tarifs/data/plans_local_data.dart';
import 'package:dtmtest/features/mobile/tarifs/presentation/bloc/plans_bloc.dart';
import 'package:dtmtest/features/mobile/tarifs/presentation/widget/plan_switch_adapter.dart';
import 'package:dtmtest/features/mobile/tarifs/presentation/widget/plans_custom_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class PlansPage extends StatefulWidget {
  const PlansPage({super.key});

  @override
  State<PlansPage> createState() => _PlansPageState();
}

class _PlansPageState extends State<PlansPage> {
  bool switchAdapter = false;
  final plansLocalData = PlansLocalData();

  @override
  void initState() {
    super.initState();
    context.read<PlansBloc>().add(GetAllPlansEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Plans",
        ),
        leading: IconButton(
          alignment: Alignment.center,
          onPressed: () {
            // ignore: deprecated_member_use
            AutoRouter.of(context).pop();
          },
          icon: const Icon(
            CupertinoIcons.back,
          ),
          color: ColorName.black,
          iconSize: 30,
        ),
      ),
      body: BlocConsumer<PlansBloc, PlansState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state.getAllPlanStatus == BlocStatus.inProgress) {
            return Center(
              child: UI.spinner(),
            );
          }
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                20.h,
                Text(
                  "Our Plans",
                  style: AppTextStyles.body40w5.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                20.h,
                // SwitchApdapterWidget(
                //   switchAdapter: switchAdapter,
                //   function: () {
                //     setState(() {
                //       switchAdapter = !switchAdapter;
                //     });
                //   },
                // ),
                // 25.h,
                SizedBox(
                  child: ListView.separated(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero.copyWith(bottom: 30),
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 25,
                      );
                    },
                    itemCount: state.listCategories?.length ?? 0,
                    itemBuilder: (context, index) {
                      return PlansContainer(
                        plansPrice: state.listCategories?[index].price ?? '0',
                        plansType: state.listCategories?[index].name ?? '',
                        assets: Assets.images.proPlanImage.image(
                          width: 200,
                          height: 125,
                        ),
                        period: state.listCategories?[index].days ?? 0,
                        dataList: [
                          state.listCategories?[index].desciption ?? "",
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
