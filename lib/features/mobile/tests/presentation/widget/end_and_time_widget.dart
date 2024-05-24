// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:dtmtest/common/extentions.dart';
import 'package:dtmtest/common/ui.dart';
import 'package:dtmtest/features/mobile/tests/presentation/widget/inner_shadow_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class EndTestsAndTimeWidget extends StatefulWidget {
  const EndTestsAndTimeWidget({
    super.key,
    required this.time,
    required this.onTap,
    this.isLoading = false,
  });
  final int time;
  final Function() onTap;
  final bool isLoading;

  @override
  State<EndTestsAndTimeWidget> createState() => _EndTestsAndTimeWidgetState();
}

class _EndTestsAndTimeWidgetState extends State<EndTestsAndTimeWidget> {
  late int time;
  late final Timer timer;

  @override
  void initState() {
    super.initState();
    time = widget.time * 60;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timer.tick == time) {
        timer.cancel();
      }
      if (mounted) {
        setState(() {
          time--;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: LinearProgressIndicator(
            value: time / (widget.time * 60),
            borderRadius: BorderRadius.circular(10),
            minHeight: 6,
            color: ColorName.yellow,
          ),
        ),
        15.h,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InnerShadowWidget(
                onTap: widget.onTap,
                height: 35,
                alignment: Alignment.center,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                child: widget.isLoading
                    ? UI.spinner()
                    : Text(
                        "${LocaleKeys.category_finish.tr()}...",
                        style: AppTextStyles.body12w7.copyWith(
                          color: ColorName.white,
                        ),
                      ),
              ),
              InnerShadowWidget(
                height: 35,
                alignment: Alignment.center,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                child: Text(
                  "${fillZero(time ~/ 60)}:${fillZero(time % 60)}",
                  style: AppTextStyles.body12w7.copyWith(
                    color: ColorName.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String fillZero(int number) {
    if (number.toString().length == 2) {
      return number.toString();
    } else {
      return '0$number';
    }
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
