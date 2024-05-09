import 'package:auto_route/auto_route.dart';
import 'package:dtmtest/common/costomaizable.dart';
import 'package:dtmtest/common/custom_textfield.dart';
import 'package:dtmtest/common/enums/bloc_status.dart';
import 'package:dtmtest/common/extentions.dart';
import 'package:dtmtest/common/ui.dart';
import 'package:dtmtest/features/admin_panel/web_users/presentation/blocs/users_bloc/web_users_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class WebUsersPage extends StatefulWidget {
  const WebUsersPage({super.key});

  @override
  State<WebUsersPage> createState() => _WebUsersPageState();
}

class _WebUsersPageState extends State<WebUsersPage> {
  @override
  void initState() {
    super.initState();
    context.read<WebUsersBloc>().add(GetUsersEvent());
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
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
                  width: size.width * .25,
                  child: CustomTextField(
                    backgroundColor: ColorName.backgroundColor,
                    hintText: "Search",
                    onChanged: (value) => context
                        .read<WebUsersBloc>()
                        .add(SearchChangedEvent(query: value)),
                    leading: const Padding(
                      padding: EdgeInsets.only(left: 25, right: 10),
                      child: Icon(Icons.search),
                    ),
                    borderColor: Colors.transparent,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 17),
                  ),
                ),
                const Spacer(),
                UI.nothing
              ],
            ),
            20.h,
            Expanded(
                child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: BlocConsumer<WebUsersBloc, WebUsersState>(
                builder: (context, state) {
                  if (state.getAllUsersStatus == BlocStatus.inProgress) {
                    return Center(
                      child: UI.spinner(),
                    );
                  }
                  return DataTable(
                    columns: const [
                      DataColumn(label: Text('№')),
                      DataColumn(label: Text('Name')),
                      DataColumn(label: Text('Email')),
                      DataColumn(label: Text('Plan')),
                      DataColumn(label: Text('Rating')),
                      DataColumn(label: Text('')),
                    ],
                    rows: List<DataRow>.generate(
                      state.searchedUserList?.length ?? 0,
                      (index) => DataRow(
                        cells: [
                          DataCell(Text('${index + 1}')),
                          DataCell(Text(
                              state.searchedUserList?[index].fullName ?? '')),
                          DataCell(Text(
                              state.searchedUserList?[index].email.toString() ??
                                  '')),
                          DataCell(
                              Text(state.searchedUserList?[index].plan ?? '')),
                          DataCell(Text(state.searchedUserList?[index].rating
                                  .toString() ??
                              '')),
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
                                    onTap: () {
                                      context.read<WebUsersBloc>().add(
                                            DeleteUserEvent(
                                              id: state.searchedUserList?[index]
                                                      .uid ??
                                                  '',
                                            ),
                                          );
                                    },
                                    value: '/Delete',
                                    child: const Text("Delete"),
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
                  if (state.deleteUserStatus == BlocStatus.completed) {
                    context.read<WebUsersBloc>().add(GetUsersEvent());
                  }
                },
                listenWhen: (previous, current) {
                  return previous.getAllUsersStatus ==
                      current.getAllUsersStatus;
                },
              ),
            ))
          ],
        ),
      ),
    );
  }
}
