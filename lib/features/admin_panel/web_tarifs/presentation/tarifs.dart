import 'package:auto_route/auto_route.dart';
import 'package:dtmtest/common/costomaizable.dart';
import 'package:dtmtest/common/enums/bloc_status.dart';
import 'package:dtmtest/common/enums/edit_add.dart';
import 'package:dtmtest/common/extentions.dart';
import 'package:dtmtest/common/gradient_button.dart';
import 'package:dtmtest/common/res/dialog_mixin.dart';
import 'package:dtmtest/common/ui.dart';
import 'package:dtmtest/features/admin_panel/web_tarifs/presentation/bloc/tarifs_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class WebTarifsPage extends StatefulWidget {
  const WebTarifsPage({super.key});

  @override
  State<WebTarifsPage> createState() => _WebTarifsPageState();
}

class _WebTarifsPageState extends State<WebTarifsPage> with DialogMixin {
  @override
  void initState() {
    context.read<TarifsBloc>().add(GetPlansEvent());
    super.initState();
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
                    addTarifDialog(context, EditAdd.add, null);
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
            child: BlocConsumer<TarifsBloc, TarifsState>(
              builder: (context, state) {
                if (state.getAllPlansStatus == BlocStatus.inProgress) {
                  return Center(
                    child: UI.spinner(),
                  );
                }
                return DataTable(
                  columns: const [
                    DataColumn(label: Text('№')),
                    DataColumn(label: Text('Tarif')),
                    DataColumn(label: Text('Days')),
                    DataColumn(label: Text('Price')),
                    DataColumn(label: Text('Description')),
                    DataColumn(label: Text('')),
                  ],
                  rows: List<DataRow>.generate(
                    state.listPlans?.length ?? 0,
                    (index) => DataRow(
                      cells: [
                        DataCell(Text('${index + 1}')),
                        DataCell(Text(state.listPlans?[index].name ?? '')),
                        DataCell(Text(
                            state.listPlans?[index].days.toString() ?? '')),
                        DataCell(Text(state.listPlans?[index].price ?? '')),
                        DataCell(
                            Text(state.listPlans?[index].desciption ?? '')),
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
                                    context.read<TarifsBloc>().add(
                                          DeletePlanEvent(
                                            model: state.listPlans?[index],
                                          ),
                                        );
                                  },
                                  value: '/Delete',
                                  child: const Text("Delete"),
                                ),
                                PopupMenuItem(
                                  onTap: () {
                                    addTarifDialog(context, EditAdd.edit,
                                        state.listPlans?[index]);
                                  },
                                  value: '/Edit',
                                  child: const Text("Edit"),
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
                if (state.addPlanStatus == BlocStatus.completed ||
                    state.editPlanStatus == BlocStatus.completed ||
                    state.deletePlanStatus == BlocStatus.completed) {
                  context.read<TarifsBloc>().add(GetPlansEvent());
                }
              },
              listenWhen: (previous, current) {
                return previous.getAllPlansStatus == current.getAllPlansStatus;
              },
            ),
          ))
        ],
      ),
    );
  }
}
