import 'package:auto_route/auto_route.dart';
import 'package:dtmtest/common/components/admin_row_widget.dart';
import 'package:dtmtest/common/costomaizable.dart';
import 'package:dtmtest/common/enums/bloc_status.dart';
import 'package:dtmtest/common/enums/edit_add.dart';
import 'package:dtmtest/common/extentions.dart';
import 'package:dtmtest/common/gradient_button.dart';
import 'package:dtmtest/common/res/dialog_mixin.dart';
import 'package:dtmtest/common/ui.dart';
import 'package:dtmtest/features/admin_panel/web_users/presentation/blocs/bloc/web_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class WebTarifsPage extends StatelessWidget with DialogMixin {
  const WebTarifsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          context.read<WebBloc>()..add(GetPlansEvent()),
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
                      addTarifDialog(context, EditAdd.add, null);
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
                    width: 80,
                    text: 'Tarif',
                  ),
                  AdminRowWidget(
                    width: 100,
                    text: 'Days',
                  ),
                  AdminRowWidget(
                    width: 100,
                    text: 'Price',
                  ),
                  AdminRowWidget(
                    width: 100,
                    text: 'Description',
                    disableDivider: true,
                  ),
                ],
              ),
            ),
            10.h,
            Expanded(
              child: BlocBuilder<WebBloc, WebState>(
                builder: (context, state) {
                  if (state.getAllPlansStatus == BlocStatus.inProgress) {
                    return Center(child: UI.spinner());
                  }
                  return ListView.separated(
                    itemCount: state.listPlans?.length ?? 0,
                    itemBuilder: (_, index) => SizedBox(
                      height: 30,
                      child: Row(
                        children: [
                          AdminRowWidget(
                            width: 50,
                            text: '${index + 1}',
                          ),
                          AdminRowWidget(
                            width: 80,
                            text: state.listPlans?[index].name ?? "",
                          ),
                          AdminRowWidget(
                            width: 100,
                            text: state.listPlans?[index].days.toString() ?? '',
                          ),
                          AdminRowWidget(
                            width: 100,
                            text: state.listPlans?[index].price ?? "",
                          ),
                          AdminRowWidget(
                            width: 100,
                            text: state.listPlans?[index].desciption ?? "",
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
                                  onTap: () {
                                    context.read<WebBloc>().add(
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
