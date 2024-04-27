import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:dtmtest/common/res/app_router.dart';
import 'package:dtmtest/common/res/res.dart';

class CategoryCustomContainer extends StatelessWidget {
  final int index;
  final Widget child;
  final String scienceName;
  const CategoryCustomContainer({
    super.key,
    required this.index,
    required this.child,
    required this.scienceName,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        AutoRouter.of(context).push(
          ThemesRoute(
            scienceName: scienceName,
            index: index,
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ColorName.white,
          border: Border.all(
            color: ColorName.customColor,
            width: 2,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 67,
              height: 60,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorName.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4,
                    color: ColorName.black.withOpacity(0.25),
                    offset: const Offset(3, 4),
                  ),
                ],
              ),
              child: child,
            ),
            Text(
              scienceName,
              style: AppTextStyles.body20w6,
            ),
          ],
        ),
      ),
    );
  }
}
