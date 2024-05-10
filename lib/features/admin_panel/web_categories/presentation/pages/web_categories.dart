import 'package:auto_route/auto_route.dart';
import 'package:dtmtest/common/costomaizable.dart';
import 'package:dtmtest/common/enums/bloc_status.dart';
import 'package:dtmtest/common/enums/edit_add.dart';
import 'package:dtmtest/common/extentions.dart';
import 'package:dtmtest/common/gradient_button.dart';
import 'package:dtmtest/common/res/dialog_mixin.dart';
import 'package:dtmtest/common/ui.dart';
import 'package:dtmtest/core/widgets/custom_network_image.dart';
import 'package:dtmtest/features/admin_panel/web_categories/data/models/category_model.dart';
import 'package:dtmtest/features/admin_panel/web_categories/presentation/bloc/category_bloc/web_categories_bloc.dart';
import 'package:dtmtest/features/admin_panel/widgets/custom_table_widget.dart';
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 110,
                child: GradientButton(
                  replaceTextVSIcon: true,
                  radius: 50,
                  onPressed: () {
                    addCategoryDialog(
                      context,
                      EditAdd.add,
                      null,
                    );
                  },
                  text: "Add",
                  icon: Assets.icons.add.svg(),
                ),
              ),
            ],
          ),
          20.h,
          Expanded(
            child: BlocConsumer<WebCategoriesBloc, WebCategoriesState>(
              builder: (context, state) {
                if (state.getAllCategoriesStatus.isProgress) {
                  return UI.spinner();
                }
                final List<CategoryModel> listCategory =
                    state.listCategories ?? [];
                return CustomTable(
                  columnNames: const [
                    '№',
                    'Image',
                    'Name',
                    'Theme count',
                    'Quiz count',
                    ""
                  ],
                  columnList: List.generate(
                    state.listCategories?.length ?? 0,
                    (index) => [
                      Text(
                        '${index + 1}',
                      ),
                      CustomNetworkImage(
                        networkImage: listCategory[index].image,
                      ),
                      Text(
                        listCategory[index].name ?? 'Unk',
                      ),
                      Text(
                        listCategory[index].themeCount.toString(),
                      ),
                      Text(
                        listCategory[index].quizCount.toString(),
                      ),
                    ],
                  ),
                  onDelete: (index) {
                    context.read<WebCategoriesBloc>().add(DeleteCategoryEvent(
                        id: state.listCategories?[index].id ?? ''));
                  },
                  onEdit: (index) {
                    addCategoryDialog(
                      context,
                      EditAdd.edit,
                      state.listCategories?[index],
                    );
                  },
                );
              },
              listener: (context, state) {
                if (state.addCategoryStatus == BlocStatus.completed ||
                    state.editCategoryStatus == BlocStatus.completed ||
                    state.deleteCategoryStatus == BlocStatus.completed) {
                  context
                      .read<WebCategoriesBloc>()
                      .add(GetAllCategoriesEvent());
                }
              },
              listenWhen: (previous, current) {
                return previous.getAllCategoriesStatus ==
                    current.getAllCategoriesStatus;
              },
            ),
          )
        ],
      ),
    );
  }
}
