// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dtmtest/common/extentions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class ThemesBackgroundContainer extends StatefulWidget {
  Color? color;
  Gradient? gradient;
  Widget? child;
  ThemesBackgroundContainer({
    super.key,
    this.color,
    this.child,
    this.gradient,
  });

  @override
  State<ThemesBackgroundContainer> createState() =>
      _ThemesBackgroundContainerState();
}

class _ThemesBackgroundContainerState extends State<ThemesBackgroundContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        30.h,
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              color: widget.color,
              gradient: widget.gradient,
            ),
            child: widget.child,
          ),
        ),
      ],
    );
  }
}
