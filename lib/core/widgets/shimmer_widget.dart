import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({
    super.key,
    required this.child,
    this.enabled = true,
    this.baseColor,
    this.radius,
  });
  final Widget child;
  final bool enabled;
  final Color? baseColor;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      enabled: enabled,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius ?? 0),
        child: child,
      ),
    );
  }
}
