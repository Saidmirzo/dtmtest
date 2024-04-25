import 'package:flutter/material.dart';

import '../../../../../common/res/res.dart';

class AdminHomeWidget extends StatelessWidget {
  const AdminHomeWidget({
    super.key,
    required this.title,
    required this.subtitle,
  });
  final String title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.body33w7.copyWith(fontSize: 36),
        ),
        Text(
          subtitle,
          style: AppTextStyles.body14w7.copyWith(color: ColorName.grey),
        ),
      ],
    );
  }
}
