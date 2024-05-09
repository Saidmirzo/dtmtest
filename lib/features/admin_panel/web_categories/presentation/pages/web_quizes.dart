import 'package:auto_route/auto_route.dart';
import 'package:dtmtest/common/components/admin_row_widget.dart';
import 'package:dtmtest/common/costomaizable.dart';
import 'package:dtmtest/common/enums/edit_add.dart';
import 'package:dtmtest/common/extentions.dart';
import 'package:dtmtest/common/gradient_button.dart';
import 'package:dtmtest/common/material_button.dart';
import 'package:dtmtest/common/res/dialog_mixin.dart';
import 'package:dtmtest/common/ui.dart';
import 'package:dtmtest/features/admin_panel/web_categories/data/models/theme_model.dart';

import 'package:dtmtest/features/admin_panel/web_categories/presentation/bloc/quizs_bloc/web_quizs_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class WebQuizesPage extends StatefulWidget {
  const WebQuizesPage({super.key});

  @override
  State<WebQuizesPage> createState() => _WebQuizesPageState();
}

class _WebQuizesPageState extends State<WebQuizesPage> with DialogMixin {
  @override
  void initState() {
    super.initState();
    context.read<WebQuizsBloc>().add(GetAllQuizThemesEvent());
    context.read<WebQuizsBloc>().add(GetAllQuizsEvent());
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 110,
                child: GradientButton(
                  replaceTextVSIcon: true,
                  radius: 50,
                  onPressed: () {
                    addThemeDialog(context, EditAdd.add);
                  },
                  text: "Add",
                  icon: Assets.icons.add.svg(),
                ),
              ),
              MaterialInkWellButton(
                borderRadius: BorderRadius.circular(25),
                width: 50,
                height: 50,
                function: () {
                  context.read<WebQuizsBloc>().add(GetAllQuizThemesEvent());
                },
                gradient: AppGradient.gradient,
                child: const Icon(
                  Icons.refresh,
                  color: ColorName.white,
                ),
              ),
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
                  text: 'Theme name',
                ),
                AdminRowWidget(
                  width: 100,
                  text: 'Question count',
                ),
              ],
            ),
          ),
          10.h,
          Expanded(
            child: BlocConsumer<WebQuizsBloc, WebQuizsState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state.getAllThemesStatus.isProgress) {
                  return UI.spinner();
                }
                final List<ThemeModel> listTheme = state.listThemes ?? [];
                return ListView.separated(
                  itemCount: listTheme.length,
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
                          text: listTheme[index].name ?? "Unknown",
                        ),
                        AdminRowWidget(
                          width: 100,
                          text: (listTheme[index].quiz?.length).toString(),
                        ),
                        // const AdminRowWidget(
                        //   width: 100,
                        //   text: 'ontion2',
                        // ),
                        // const AdminRowWidget(
                        //   width: 100,
                        //   text: 'ontion3',
                        // ),
                        // const AdminRowWidget(
                        //   width: 100,
                        //   text: 'ontion',
                        //   disableDivider: true,
                        // ),
                        // PopupMenuButton(
                        //   iconColor: ColorName.blue,
                        //   surfaceTintColor: ColorName.white,
                        //   position: PopupMenuPosition.under,
                        //   onSelected: (value) {
                        //     // your logic
                        //   },
                        //   itemBuilder: (BuildContext bc) {
                        //     return [
                        //       PopupMenuItem(
                        //         value: '/Delete',
                        //         child: const Text("Delete"),
                        //         onTap: () {},
                        //       ),
                        //       PopupMenuItem(
                        //         value: '/Edit',
                        //         child: const Text("Edit"),
                        //         onTap: () {
                        //           addAdminsDialog(context, EditAdd.edit);
                        //         },
                        //       ),
                        //     ];
                        //   },
                        // ),
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
