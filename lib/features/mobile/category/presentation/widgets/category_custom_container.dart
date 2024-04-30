import 'package:auto_route/auto_route.dart';
import 'package:dtmtest/common/res/app_router.dart';
import 'package:dtmtest/features/admin_panel/web_categories/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:dtmtest/common/res/res.dart';

class CategoryCustomContainer extends StatelessWidget {
  final Widget child;
  final CategoryModel categoryModel;
  const CategoryCustomContainer({
    super.key,
    required this.child,
    required this.categoryModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        context.pushRoute(
          ThemesRoute(categoryModel: categoryModel),
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
              categoryModel.name ?? "Unknown",
              style: AppTextStyles.body20w6,
            ),
          ],
        ),
      ),
    );
  }
}
