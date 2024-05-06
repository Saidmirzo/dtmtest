import 'package:dtmtest/common/extentions.dart';
import 'package:dtmtest/common/res/res.dart';
import 'package:dtmtest/core/widgets/custom_network_image.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NumberOneLeaderWidget extends StatelessWidget {
  String nameLeaderKing;
  String? networkImage;
  NumberOneLeaderWidget({
    super.key,
    required this.nameLeaderKing,
    this.networkImage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 80,
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Assets.images.numberOneKing.image(
                    width: 20,
                    height: 20,
                  ),
                  CustomNetworkImage(
                    networkImage: networkImage,
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 1,
                      color: ColorName.customColor,
                    ),
                    width: 50,
                    height: 50,
                    defWidget: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Assets.icons.profileBold.svg(
                        width: 50,
                        height: 50,
                      ),
                    ),
                  ),
                ],
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
                    color: ColorName.yellow,
                  ),
                  child: Text(
                    "1",
                    style: AppTextStyles.body12w7.copyWith(
                      color: ColorName.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        5.h,
        SizedBox(
          width: 100,
          child: Text(
            nameLeaderKing,
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
