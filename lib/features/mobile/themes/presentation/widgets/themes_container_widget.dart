// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dtmtest/common/extentions.dart';
import 'package:dtmtest/common/res/res.dart';
import 'package:dtmtest/features/mobile/tests/presentation/widget/inner_shadow_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

// ignore: must_be_immutable
class ThemesContainerWidget extends StatelessWidget {
  int? index;
  String? mavzunomi;
  int? savollarSoni;
  ThemesContainerWidget({
    super.key,
    required this.mavzunomi,
    required this.savollarSoni,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InnerShadowWidget(
          width: 40,
          height: 33,
          alignment: Alignment.center,
          child: Text(
            "$index",
            style: AppTextStyles.body16w4.copyWith(color: ColorName.white),
          ),
        ),
        20.w,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              mavzunomi ?? '',
              style: AppTextStyles.body16w4
                  .copyWith(color: ColorName.blackTextColor),
            ),
            Text(
             "${LocaleKeys.category_numberofquestions.tr()} : $savollarSoni",
              style: AppTextStyles.body16w4
                  .copyWith(color: ColorName.greyTextColor),
            ),
          ],
        )
      ],
    );
  }
}
