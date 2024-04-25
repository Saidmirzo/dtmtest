// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:dtmtest/common/costomaizable.dart';
import 'package:dtmtest/common/extentions.dart';
import 'package:dtmtest/common/material_button.dart';
import 'package:dtmtest/common/res/res.dart';

class StatisticsWidget extends StatelessWidget {
  const StatisticsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Statistika",
          style: AppTextStyles.body32w5.copyWith(
            fontWeight: FontWeight.w700,
            color: ColorName.white,
          ),
        ),
        20.h,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            decoration: BoxDecoration(
              color: ColorName.white,
              boxShadow: [
                AppShadow.dropShadow,
              ],
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 4,
              itemBuilder: (context, index) {
                return MaterialInkWellButton(
                  function: () {},
                  borderRadius: BorderRadius.circular(12),
                  color:
                      index != 3 ? Colors.transparent : const Color(0xffE7E7E7),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  width: double.infinity,
                  height: 52,
                  child: StatisticsFavoriteWIdget(
                    index: index,
                    name: "Akramjon Usmonov",
                    textXp: "30/30",
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return 10.h;
              },
            ),
          ),
        ),
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
            index != 3 ? " ${index + 1}" : "...",
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
