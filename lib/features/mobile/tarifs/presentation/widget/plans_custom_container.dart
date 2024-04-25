// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:dtmtest/common/costomaizable.dart';
import 'package:dtmtest/common/extentions.dart';
import 'package:dtmtest/common/gradient_button.dart';
import 'package:dtmtest/common/res/res.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlansContainer extends StatelessWidget {
  List<String> dataList;
  Widget assets;
  String plansType;
  String plansPrice;
  PlansContainer({
    super.key,
    required this.dataList,
    required this.assets,
    required this.plansType,
    required this.plansPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          color: ColorName.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            AppShadow.planDropShadow,
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              plansType,
              style: AppTextStyles.body20w6.copyWith(
                color: ColorName.greyTextColor,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  plansPrice,
                  style: AppTextStyles.body32w5.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    "/Month",
                    style: AppTextStyles.body16w6.copyWith(
                      color: ColorName.greyTextColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.center,
              child: assets,
            ),
            36.h,
            SizedBox(
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Assets.icons.checkIcon.svg(),
                      10.w,
                      Text(
                        dataList[index],
                        style: AppTextStyles.body14w6,
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 17),
                    child: Divider(
                      height: 1,
                      thickness: 1,
                      indent: 0,
                      endIndent: 0,
                      color: Color(0xffE7E7E7),
                    ),
                  );
                },
              ),
            ),
            34.h,
            GradientButton(
              onPressed: () {},
              icon: Transform.rotate(
                angle: pi,
                child: const Icon(
                  CupertinoIcons.back,
                  color: ColorName.white,
                ),
              ),
              text: "Select plan",
              radius: 30,
              height: 52,
              elevation: 2,
            ),
          ],
        ),
      ),
    );
  }
}
