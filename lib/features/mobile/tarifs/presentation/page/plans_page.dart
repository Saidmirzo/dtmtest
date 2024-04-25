import 'package:dtmtest/common/ui.dart';
import 'package:dtmtest/features/mobile/tarifs/data/plans_local_data.dart';
import 'package:dtmtest/features/mobile/tarifs/presentation/widget/plan_switch_adapter.dart';
import 'package:dtmtest/features/mobile/tarifs/presentation/widget/plans_custom_container.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dtmtest/common/extentions.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Premium",
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
      body: SingleChildScrollView(
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
            SwitchApdapterWidget(
              switchAdapter: switchAdapter,
              function: () {
                setState(() {
                  switchAdapter = !switchAdapter;
                });
              },
            ),
            25.h,
            PlansContainer(
              plansPrice: plansLocalData.plansPrice[0],
              plansType: plansLocalData.plansType[0],
              assets: Assets.images.proPlanImage.image(
                width: 200,
                height: 125,
              ),
              dataList: plansLocalData.proList,
            ),
            const SizedBox(
              height: 25,
            ),
            PlansContainer(
              plansPrice: plansLocalData.plansPrice[1],
              plansType: plansLocalData.plansType[1],
              assets: Assets.images.premiumPlansImage.image(
                width: 200,
                height: 125,
              ),
              dataList: plansLocalData.premuimList,
            ),
            const SizedBox(
              height: 25,
            ),
            PlansContainer(
              plansPrice: plansLocalData.plansPrice[2],
              plansType: plansLocalData.plansType[2],
              assets: Assets.images.businessPlanImage.image(
                width: 200,
                height: 125,
              ),
              dataList: plansLocalData.businessList,
            ),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}
