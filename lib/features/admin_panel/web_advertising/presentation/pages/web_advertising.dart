import 'package:auto_route/auto_route.dart';
import 'package:dtmtest/common/components/admin_row_widget.dart';
import 'package:dtmtest/common/costomaizable.dart';
import 'package:dtmtest/common/enums/bloc_status.dart';
import 'package:dtmtest/common/enums/edit_add.dart';
import 'package:dtmtest/common/extentions.dart';
import 'package:dtmtest/common/gradient_button.dart';
import 'package:dtmtest/common/res/dialog_mixin.dart';
import 'package:dtmtest/common/ui.dart';
import 'package:dtmtest/features/admin_panel/web_advertising/model/advertising_model.dart';
import 'package:dtmtest/features/admin_panel/web_users/presentation/blocs/bloc/web_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class WebAdvrtisingPage extends StatefulWidget {
  const WebAdvrtisingPage({super.key});

  @override
  State<WebAdvrtisingPage> createState() => _WebAdvrtisingPageState();
}

class _WebAdvrtisingPageState extends State<WebAdvrtisingPage>
    with DialogMixin {
  @override
  void initState() {
    super.initState();
    context.read<WebBloc>().add(GetAllAdvertisingEvent());
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
                    addAdvertisingDialog(context, EditAdd.add);
                  },
                  text: "Add",
                  icon: Assets.icons.add.svg(),
                ),
              )
            ],
          ),
          20.h,
          SizedBox(
            height: 30,
            child: Row(
              children: [
                const AdminRowWidget(
                  width: 50,
                  text: '№',
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(5)),
                  child: const Text("Image"),
                ),
                const VerticalDivider(),
                const AdminRowWidget(
                  width: 200,
                  text: 'Title',
                ),
                const AdminRowWidget(
                  width: 200,
                  text: 'Description',
                  disableDivider: true,
                ),
                const VerticalDivider(),
                const AdminRowWidget(
                  width: 100,
                  text: 'Link',
                  disableDivider: true,
                ),
              ],
            ),
          ),
          10.h,
          Expanded(
            child: BlocConsumer<WebBloc, WebState>(
              listener: (context, state) {
                if (state.getAllAdvertisingStatus == BlocStatus.failed) {
                  showSnackBar(context, text: "Error");
                }
              },
              builder: (context, state) {
                if (state.getAllAdvertisingStatus.isProgress) {
                  return UI.spinner();
                }
                final List<AdvertisingModel> listAdvertising =
                    state.listAdvertising ?? [];
                return ListView.separated(
                  itemCount: listAdvertising.length,
                  itemBuilder: (_, index) => SizedBox(
                    height: 50,
                    child: Row(
                      children: [
                        AdminRowWidget(
                          width: 50,
                          text: (index + 1).toString(),
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              color: ColorName.backgroundColor,
                              borderRadius: BorderRadius.circular(5)),
                        ),
                        const VerticalDivider(),
                        AdminRowWidget(
                          width: 200,
                          text: listAdvertising[index].title ?? "Unknown",
                        ),
                        AdminRowWidget(
                          width: 200,
                          text: listAdvertising[index].description ?? 'Unknown',
                          disableDivider: true,
                        ),
                        const VerticalDivider(),
                        AdminRowWidget(
                          width: 100,
                          text: listAdvertising[index].link ?? 'Unknown',
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
                                  addAdvertisingDialog(context, EditAdd.edit);
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
    );
  }
}
