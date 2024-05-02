import 'package:dtmtest/common/res/colors.gen.dart';
import 'package:dtmtest/core/widgets/shimmer_widget.dart';
import 'package:flutter/material.dart';

class EmptyShimmerWidget extends StatelessWidget {
  const EmptyShimmerWidget({
    super.key,
    this.size,
    this.radius,
  });
  final double? size;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return ShimmerWidget(
      radius: radius ?? 100,
      child: Container(
        height: size ?? 100,
        decoration: BoxDecoration(
          color: ColorName.black,
          shape: radius == null ? BoxShape.circle : BoxShape.rectangle,
        ),
        child: const SizedBox.shrink(),
      ),
    );
  }
}
