import 'package:auto_route/auto_route.dart';
import 'package:dtmtest/common/components/admin_row_widget.dart';
import 'package:dtmtest/common/costomaizable.dart';
import 'package:dtmtest/common/enums/bloc_status.dart';
import 'package:dtmtest/common/enums/edit_add.dart';
import 'package:dtmtest/common/extentions.dart';
import 'package:dtmtest/common/gradient_button.dart';
import 'package:dtmtest/common/res/dialog_mixin.dart';
import 'package:dtmtest/common/ui.dart';
import 'package:dtmtest/features/admin_panel/web_categories/presentation/bloc/category_bloc/web_categories_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class WebCategoriesPage extends StatefulWidget {
  const WebCategoriesPage({super.key});

  @override
  State<WebCategoriesPage> createState() => _WebCategoriesPageState();
}

class _WebCategoriesPageState extends State<WebCategoriesPage>
    with DialogMixin {
  @override
  void initState() {
    super.initState();
    context.read<WebCategoriesBloc>().add(GetAllCategoriesEvent());
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
                    addCategoryDialog(context, EditAdd.add, null, 0);
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
                // Container(
                //   width: 30,
                //   height: 30,
                //   decoration: BoxDecoration(
                //       color: ColorName.backgroundColor,
                //       borderRadius: BorderRadius.circular(5)),
                // ),
                // const VerticalDivider(),
                AdminRowWidget(
                  width: 250,
                  text: 'Name',
                ),
                AdminRowWidget(
                  width: 100,
                  text: 'Theme count',
                ),
                AdminRowWidget(
                  width: 100,
                  text: 'Quiz count',
                  disableDivider: true,
                ),
              ],
            ),
          ),
          10.h,
          Expanded(
            child: BlocBuilder<WebCategoriesBloc, WebCategoriesState>(
              builder: (context, state) {
                if (state.editategoryStatus == BlocStatus.inProgress ||
                    state.getAllCategoriesStatus == BlocStatus.inProgress ||
                    state.deleteCategoryStatus == BlocStatus.inProgress) {
                  return UI.spinner();
                }

                return ListView.separated(
                  itemCount: state.listCategories?.length ?? 0,
                  itemBuilder: (_, index) => SizedBox(
                    height: 30,
                    child: Row(
                      children: [
                        AdminRowWidget(
                          width: 50,
                          text: '${index + 1}',
                        ),
                        // CustomImageChangerWidget(
                        //   file: null,
                        //   width: 30,
                        //   height: 30,
                        //   image: state.listCategories?[index].image ?? '',
                        //   borderRadiusDef: BorderRadius.circular(5),
                        // ),
                        // const VerticalDivider(),
                        AdminRowWidget(
                          width: 250,
                          text: state.listCategories?[index].name ?? "",
                        ),
                        AdminRowWidget(
                          width: 100,
                          text: state.listCategories?[index].themeCount
                                  .toString() ??
                              '',
                        ),
                        AdminRowWidget(
                          width: 100,
                          text: state.listCategories?[index].quizCount
                                  .toString() ??
                              '',
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
                                onTap: () {
                                  context.read<WebCategoriesBloc>().add(
                                      DeleteCategoryEvent(
                                          model: state.listCategories?[index]));
                                },
                              ),
                              PopupMenuItem(
                                value: '/Edit',
                                child: const Text("Edit"),
                                onTap: () {
                                  addCategoryDialog(context, EditAdd.edit,
                                      state.listCategories?[index], index);
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
