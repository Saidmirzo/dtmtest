import 'package:dtmtest/common/ui.dart';
import 'package:flutter/material.dart';

class AdminRowWidget extends StatelessWidget {
  const AdminRowWidget({
    super.key,
    required this.width,
    required this.text,
    this.disableDivider = false,
  });
  final double width;
  final String text;
  final bool? disableDivider;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: width,
          child: Text(
            text,
          ),
        ),
        disableDivider != true ? const VerticalDivider() : UI.nothing,
      ],
    );
  }
}
