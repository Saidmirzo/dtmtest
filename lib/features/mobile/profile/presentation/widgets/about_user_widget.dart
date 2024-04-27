// ignore: must_be_immutable
import 'package:dtmtest/common/res/res.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UserInfoWidget extends StatelessWidget {
  String userInfo;
  String infoText;
  bool isEditInfo;
  TextEditingController controller;
  UserInfoWidget({
    required this.controller,
    required this.infoText,
    required this.userInfo,
    required this.isEditInfo,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          width: 200,
          child: Text(
            infoText,
            style: AppTextStyles.body24w7.copyWith(
              color: ColorName.white,
            ),
            textAlign: TextAlign.start,
          ),
        ),
        // Spacer(),
        if (isEditInfo)
          Expanded(
            child: TextField(
              controller: controller,
              // readOnly: true,
              style: AppTextStyles.body20w4.copyWith(color: ColorName.white),
              cursorColor: ColorName.white,
              decoration: InputDecoration(
                isDense: true,
                border: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorName.white,
                    width: 1,
                  ),
                ),
                hintText: userInfo,
                hintStyle: AppTextStyles.body20w4.copyWith(
                  color: ColorName.white,
                ),
              ),
            ),
          )
        else
          Expanded(
            child: Text(
              userInfo,
              style: AppTextStyles.body20w4.copyWith(
                color: ColorName.white,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
      ],
    );
  }
}
