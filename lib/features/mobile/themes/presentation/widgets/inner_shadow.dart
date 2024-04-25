import 'dart:ui';

import 'package:flutter/material.dart';

class InnerShadowContainer extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final Color color;
  final double blur;
  final double spread;

  const InnerShadowContainer({
    super.key,
    required this.child,
    this.borderRadius = 0,
    this.color = Colors.black,
    this.blur = 5,
    this.spread = 0.5,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: color,
            blurRadius: blur,
            spreadRadius: spread,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              color: Colors.transparent,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
