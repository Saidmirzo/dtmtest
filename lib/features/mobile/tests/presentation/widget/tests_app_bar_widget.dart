// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dtmtest/common/res/res.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TestsAppBarWidget extends StatelessWidget {
  String text;
  TestsAppBarWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          border: Border.all(
            color: ColorName.customColor,
            width: 1,
          ),
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          style: AppTextStyles.body24w7.copyWith(
            color: ColorName.customColor,
          ),
        ),
      ),
    );
  }
}
