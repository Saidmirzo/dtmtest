import 'package:dtmtest/core/widgets/custom_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../common/res/res.dart';

// ignore: must_be_immutable
class LeadersWidget extends StatelessWidget {
  String text;
  String textNumber;
  String? networkImage;
  LeadersWidget({
    super.key,
    required this.text,
    required this.textNumber,
    this.networkImage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 60,
          child: Stack(
            children: [
              CustomNetworkImage(
                shape: BoxShape.circle,
                width: 50,
                height: 50,
                border: Border.all(
                  width: 1,
                  color: ColorName.customColor,
                ),
                networkImage: networkImage,
                defWidget: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Assets.icons.profileBold.svg(
                    width: 50,
                    height: 50,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 15,
                child: Container(
                  width: 20,
                  height: 20,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorName.green,
                  ),
                  child: Text(
                    textNumber,
                    style: AppTextStyles.body12w7.copyWith(
                      color: ColorName.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 100,
          child: Text(
            text,
            style: AppTextStyles.body12w7.copyWith(
              color: ColorName.white,
            ),
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
