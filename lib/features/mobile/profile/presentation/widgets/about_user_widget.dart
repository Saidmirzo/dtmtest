// ignore: must_be_immutable
import 'package:dtmtest/common/res/res.dart';
import 'package:flutter/material.dart';

class UserInfoWidget extends StatelessWidget {
  String userInfo;
  String infoText;
  bool isEditInfo;
  TextEditingController controller = TextEditingController();
  UserInfoWidget({
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
        isEditInfo
            ? Expanded(
                child: TextField(
                  controller: controller,
                  readOnly: true,
                  style:
                      AppTextStyles.body20w4.copyWith(color: ColorName.white),
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
            : Text(
                userInfo,
                style: AppTextStyles.body20w4.copyWith(
                  color: ColorName.white,
                ),
              ),
      ],
    );
  }
}
