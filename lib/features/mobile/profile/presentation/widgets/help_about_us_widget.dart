import 'dart:math';

import 'package:dtmtest/common/res/res.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HelpAboutUsWIdget extends StatelessWidget {
  String nameSectionText;
  Function()? function;
  HelpAboutUsWIdget({
    required this.nameSectionText,
    this.function,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: function,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            nameSectionText,
            style: AppTextStyles.body24w7.copyWith(
              color: ColorName.white,
            ),
          ),
          Transform.rotate(
            angle: pi,
            child: const Icon(
              CupertinoIcons.back,
              size: 25,
              color: ColorName.customColor,
            ),
          ),
        ],
      ),
    );
  }
}
