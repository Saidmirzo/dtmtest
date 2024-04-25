import 'package:dtmtest/common/components/admin_row_widget.dart';
import 'package:dtmtest/features/mobile/auth/data/model/user_model.dart';
import 'package:flutter/material.dart';

import '../../../../../common/res/res.dart';

class AdminUsersRowWidget extends StatelessWidget {
  const AdminUsersRowWidget({
    super.key,
    required this.userModel,
    required this.number,
  });
  final UserModel userModel;
  final int number;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AdminRowWidget(
          width: 50,
          text: '${number + 1}',
        ),
        AdminRowWidget(
          width: 200,
          text: userModel.fullName ?? "Unknown",
        ),
        AdminRowWidget(
          width: 250,
          text: userModel.email ?? "Unknown",
        ),
        AdminRowWidget(
          width: 100,
          text: userModel.plan ?? '',
        ),
        AdminRowWidget(
          width: 100,
          text: (userModel.rating ?? 0).toString(),
          disableDivider: true,
        ),
        PopupMenuButton(
          iconColor: ColorName.blue,
          surfaceTintColor: ColorName.white,
          position: PopupMenuPosition.under,
          onSelected: (value) {
            // your logic
          },
          itemBuilder: (BuildContext bc) {
            return const [
              PopupMenuItem(
                value: '/Delete',
                child: Text("Delete"),
              ),
              PopupMenuItem(
                value: '/Edit',
                child: Text("Edit"),
              ),
            ];
          },
        ),
      ],
    );
  }
}
