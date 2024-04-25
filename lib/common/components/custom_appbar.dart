import 'package:auto_route/auto_route.dart';
import 'package:dtmtest/common/extentions.dart';
import 'package:dtmtest/common/res/res.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? child;
  final String? text;
  const CustomAppBar({
    super.key,
    this.child,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size(double.infinity, 100),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: child ??
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      // ignore: deprecated_member_use
                      AutoRouter.of(context).pop();
                    },
                    icon: const Icon(
                      CupertinoIcons.back,
                    ),
                    iconSize: 25,
                    color: ColorName.white,
                  ),
                  Text(
                    text ?? '',
                    style: AppTextStyles.body24w5.copyWith(
                      color: ColorName.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  25.w,
                ],
              ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
