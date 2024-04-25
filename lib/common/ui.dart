import 'package:flutter/cupertino.dart';
export './res/res.dart';

abstract class UI {
  static Widget spinner({Color? color}) => Center(
        child: CupertinoActivityIndicator(
          color: color,
        ),
      );

  static const spacer = Spacer();
  static const neverScroll = NeverScrollableScrollPhysics();
  static const clampingScroll = ClampingScrollPhysics();
  static const nothing = SizedBox.shrink();

  static const noRequiredText = '???';

  static const defaultMyAppBarHeight = 40.0;
  static const defaultSidePad = 24.0;

  static final circularBorderRadius = BorderRadius.circular(8);
}
