// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MaterialInkWellButton extends StatelessWidget {
  Function()? function;
  Widget? child;
  BorderRadius? borderRadius;
  Color? color;
  Gradient? gradient;
  BoxBorder? border;
  BoxShape? boxShape;
  double? width;
  double? height;
  EdgeInsetsGeometry margin;
  EdgeInsets? padding;
  Alignment? alignment;
  MaterialInkWellButton({
    super.key,
    required this.function,
    required this.child,
    required this.borderRadius,
    this.color,
    this.gradient,
    this.border,
    this.boxShape,
    this.width,
    this.height,
    this.margin = EdgeInsets.zero,
    this.padding,
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: color,
          gradient: gradient,
          border: border,
          shape: boxShape ?? BoxShape.rectangle,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: borderRadius,
            onTap: function,
            child: Container(
              alignment: alignment,
              padding: padding,
              width: width,
              height: height,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
