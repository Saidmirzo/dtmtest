import 'package:auto_route/auto_route.dart';
import 'package:dtmtest/common/costomaizable.dart';
import 'package:dtmtest/common/enums/bloc_status.dart';
import 'package:dtmtest/common/enums/edit_add.dart';
import 'package:dtmtest/common/extentions.dart';
import 'package:dtmtest/common/gradient_button.dart';
import 'package:dtmtest/common/res/dialog_mixin.dart';
import 'package:dtmtest/common/ui.dart';
import 'package:dtmtest/features/admin_panel/web_users/presentation/blocs/users_bloc/web_users_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class WebAdminsPage extends StatefulWidget {
  const WebAdminsPage({super.key});

  @override
  State<WebAdminsPage> createState() => _WebAdminsPageState();
}

class _WebAdminsPageState extends State<WebAdminsPage> with DialogMixin {
  @override
  void initState() {
    super.initState();
    context.read<WebUsersBloc>().add(GetAdminsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    addAdminsDialog(context, EditAdd.add, null);
                  },
                  text: "Add",
                  icon: Assets.icons.add.svg(),
                ),
              )
            ],
          ),
          20.h,
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: BlocConsumer<WebUsersBloc, WebUsersState>(
                builder: (context, state) {
                  if (state.getAllAdminsStatus == BlocStatus.inProgress) {
                    return Center(
                      child: UI.spinner(),
                    );
                  }
                  return DataTable(
                    columns: const [
                      DataColumn(label: Text('№')),
                      DataColumn(label: Text('Name')),
                      DataColumn(label: Text('Login')),
                      DataColumn(label: Text('Password')),
                      DataColumn(label: Text('')),
                    ],
                    rows: List<DataRow>.generate(
                      state.listAdmins?.length ?? 0,
                      (index) => DataRow(
                        cells: [
                          DataCell(Text('${index + 1}')),
                          DataCell(Text(state.listAdmins?[index].name ?? '')),
                          DataCell(Text(
                              state.listAdmins?[index].login.toString() ?? '')),
                          DataCell(
                              Text(state.listAdmins?[index].password ?? '')),
                          DataCell(
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
                                    onTap: () {
                                      context.read<WebUsersBloc>().add(
                                          DeleteAdminEvent(
                                              id: state.listAdmins?[index].id ??
                                                  ''));
                                    },
                                  ),
                                  PopupMenuItem(
                                    value: '/Edit',
                                    child: const Text("Edit"),
                                    onTap: () {
                                      addAdminsDialog(context, EditAdd.edit,
                                          state.listAdmins?[index]);
                                    },
                                  ),
                                ];
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                listener: (context, state) {
                  if (state.addAdminStatus == BlocStatus.completed ||
                      state.editAdminStatus == BlocStatus.completed ||
                      state.deleteAdminStatus == BlocStatus.completed) {
                    context.read<WebUsersBloc>().add(GetAdminsEvent());
                  }
                },
                listenWhen: (previous, current) {
                  return previous.getAllAdminsStatus ==
                      current.getAllAdminsStatus;
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
