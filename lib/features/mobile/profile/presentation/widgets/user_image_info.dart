import 'package:dtmtest/common/res/res.dart';
import 'package:dtmtest/common/ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserImageInfoWidget extends StatelessWidget {
  bool isEditInfo;
  UserImageInfoWidget({
    super.key,
    required this.isEditInfo,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      height: 70,
      child: isEditInfo
          ? InkWell(
              onTap: () {},
              child: Stack(
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: ColorName.borderColor,
                        width: 1,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(35),
                      child: Assets.images.statisticsProfileImage.image(
                        width: 70,
                        height: 70,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Visibility(
                      child: Container(
                        width: 30,
                        height: 30,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorName.white,
                        ),
                        child: const Icon(
                          CupertinoIcons.plus,
                          color: ColorName.customColor,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Container(
              width: 70,
              height: 70,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: ColorName.borderColor,
                  width: 1,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(35),
                child: Assets.images.statisticsProfileImage.image(
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                ),
              ),
            ),
    );
  }
}
