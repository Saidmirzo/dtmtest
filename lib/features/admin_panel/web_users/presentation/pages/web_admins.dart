import 'package:auto_route/auto_route.dart';
import 'package:dtmtest/common/components/admin_row_widget.dart';
import 'package:dtmtest/common/costomaizable.dart';
import 'package:dtmtest/common/enums/edit_add.dart';
import 'package:dtmtest/common/extentions.dart';
import 'package:dtmtest/common/gradient_button.dart';
import 'package:dtmtest/common/res/dialog_mixin.dart';
import 'package:dtmtest/common/ui.dart';
import 'package:dtmtest/features/admin_panel/web_users/presentation/blocs/users_bloc/web_users_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class WebAdminsPage extends StatelessWidget with DialogMixin {
  const WebAdminsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => context.read<WebUsersBloc>()..add(GetAdminsEvent()),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
            boxShadow: [AppShadow.defShadow],
            borderRadius: BorderRadius.circular(30),
            color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 110,
                  child: GradientButton(
                    replaceTextVSIcon: true,
                    radius: 50,
                    onPressed: () {
                      addAdminsDialog(context, EditAdd.add);
                    },
                    text: "Add",
                    icon: Assets.icons.add.svg(),
                  ),
                )
              ],
            ),
            20.h,
            const SizedBox(
              height: 30,
              child: Row(
                children: [
                  AdminRowWidget(
                    width: 50,
                    text: '№',
                  ),
                  AdminRowWidget(
                    width: 200,
                    text: 'Name',
                  ),
                  AdminRowWidget(
                    width: 250,
                    text: 'Login',
                  ),
                  AdminRowWidget(
                    width: 100,
                    text: 'Password',
                    disableDivider: true,
                  ),
                ],
              ),
            ),
            10.h,
            Expanded(
              child: BlocBuilder<WebUsersBloc, WebUsersState>(
                builder: (context, state) {
                  if (state.getAllAdminsStatus.isProgress) {
                    Center(
                      child: UI.spinner(),
                    );
                  }
                  return ListView.separated(
                    itemCount: state.listAdmins?.length ?? 0,
                    itemBuilder: (_, index) => SizedBox(
                      height: 30,
                      child: Row(
                        children: [
                          AdminRowWidget(
                            width: 50,
                            text: '${index + 1}',
                          ),
                          AdminRowWidget(
                            width: 200,
                            text: state.listAdmins?[index].name ?? '',
                          ),
                          AdminRowWidget(
                            width: 250,
                            text: state.listAdmins?[index].login ?? '',
                          ),
                          AdminRowWidget(
                            width: 100,
                            text: state.listAdmins?[index].password ?? "",
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
                              return [
                                PopupMenuItem(
                                  value: '/Delete',
                                  child: const Text("Delete"),
                                  onTap: () {},
                                ),
                                PopupMenuItem(
                                  value: '/Edit',
                                  child: const Text("Edit"),
                                  onTap: () {
                                    addAdminsDialog(context, EditAdd.edit);
                                  },
                                ),
                              ];
                            },
                          ),
                        ],
                      ),
                    ),
                    separatorBuilder: (_, index) => 10.h,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
