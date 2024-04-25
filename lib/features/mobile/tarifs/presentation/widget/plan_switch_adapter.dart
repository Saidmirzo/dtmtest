// ignore: must_be_immutable
import 'package:dtmtest/common/costomaizable.dart';
import 'package:dtmtest/common/extentions.dart';
import 'package:dtmtest/common/res/res.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SwitchApdapterWidget extends StatefulWidget {
  bool switchAdapter = false;
  Function()? function;
  SwitchApdapterWidget({
    super.key,
    required this.switchAdapter,
    this.function,
  });

  @override
  State<SwitchApdapterWidget> createState() => _SwitchApdapterWidgetState();
}

class _SwitchApdapterWidgetState extends State<SwitchApdapterWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Monthly",
          style: AppTextStyles.body13w6.copyWith(
            color: const Color(0xff222222),
          ),
        ),
        10.w,
        GestureDetector(
          onTap: widget.function,
          child: Container(
            width: 42,
            height: 28,
            alignment: widget.switchAdapter
                ? Alignment.centerRight
                : Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              gradient: widget.switchAdapter
                  ? AppGradient.gradient
                  : AppGradient.switchAdapterGradient,
              border: Border.all(
                width: 1,
                color: ColorName.borderColor,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorName.white,
                boxShadow: [
                  AppShadow.switchDropShadow,
                ],
              ),
            ),
          ),
        ),
        10.w,
        Text(
          "Yearly",
          style: AppTextStyles.body13w6.copyWith(
            color: ColorName.greyTextColor,
          ),
        ),
      ],
    );
  }
}
