import 'package:auto_route/auto_route.dart';
import 'package:dtmtest/common/costomaizable.dart';
import 'package:dtmtest/common/enums/edit_add.dart';
import 'package:dtmtest/common/extentions.dart';
import 'package:dtmtest/common/gradient_button.dart';
import 'package:dtmtest/common/res/dialog_mixin.dart';
import 'package:dtmtest/common/ui.dart';
import 'package:dtmtest/features/admin_panel/web_categories/presentation/bloc/quizs_bloc/web_quizs_bloc.dart';
import 'package:dtmtest/features/admin_panel/web_categories/presentation/widgets/about_quiz_widget.dart';
import 'package:dtmtest/features/admin_panel/web_categories/presentation/widgets/about_themes_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class WebQuizesPage extends StatefulWidget {
  const WebQuizesPage({super.key});

  @override
  State<WebQuizesPage> createState() => _WebQuizesPageState();
}

class _WebQuizesPageState extends State<WebQuizesPage> with DialogMixin {
  TextEditingController? categoryController = TextEditingController();
  TextEditingController quizsController = TextEditingController();
  String idCategory = '';
  String idTheme = '';
  @override
  void initState() {
    super.initState();
    context.read<WebQuizsBloc>().add(GetAllQuizCategoryEvent());
    final String? id = context.read<WebQuizsBloc>().categoryId;

    if (id != null) {
      context.read<WebQuizsBloc>().add(GetAllQuizThemesEvent(id: id));

      idCategory = id;
      idTheme = '';
    }
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
                    addThemeDialog(context, EditAdd.add, null);
                  },
                  text: "Add",
                  icon: Assets.icons.add.svg(),
                ),
              ),
              20.w,
              BlocConsumer<WebQuizsBloc, WebQuizsState>(
                  listener: (context, state) {
                if (state.getAllCategoriesStatus.isProgress) {
                  UI.spinner();
                }
              }, builder: (context, state) {
                if (state.getAllCategoriesStatus.isComplated) {
                  return DropdownMenu<String>(
                    controller: categoryController,
                    initialSelection: context.read<WebQuizsBloc>().categoryId,
                    inputDecorationTheme: InputDecorationTheme(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(
                          width: 3,
                          color: ColorName.blue,
                        ),
                      ),
                      contentPadding: const EdgeInsets.only(left: 20),
                      isDense: true,
                    ),
                    onSelected: (value) {
                      if (value != null) {
                        context
                            .read<WebQuizsBloc>()
                            .add(GetAllQuizThemesEvent(id: value));

                        setState(() {
                          idCategory = value;
                          idTheme = '';
                        });
                      }
                    },
                    textStyle: AppTextStyles.body16w4,
                    dropdownMenuEntries: state.listCategories!
                        .map<DropdownMenuEntry<String>>((e) {
                      return DropdownMenuEntry(
                        value: e.id ?? '',
                        label: e.name ?? '',
                      );
                    }).toList(),
                    menuHeight: 300,
                  );
                }
                return const SizedBox.shrink();
              }),
              20.w,
              idCategory == ''
                  ? const SizedBox(
                      width: 300,
                    )
                  : SizedBox(
                      width: 300,
                      child: BlocConsumer<WebQuizsBloc, WebQuizsState>(
                          listener: (context, state) {},
                          builder: (context, state) {
                            if (state.getAllThemesStatus.isProgress) {
                              return UI.spinner();
                            }
                            if (state.getAllThemesStatus.isComplated) {
                              if (state.listThemes!.isEmpty ||
                                  state.listThemes == null) {
                                return const SizedBox.shrink();
                              } else {
                                return DropdownMenu(
                                  initialSelection:
                                      state.listCategories?[0].name,
                                  inputDecorationTheme: InputDecorationTheme(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      borderSide: const BorderSide(
                                        width: 3,
                                        color: ColorName.blue,
                                      ),
                                    ),
                                    contentPadding:
                                        const EdgeInsets.only(left: 20),
                                    isDense: true,
                                  ),
                                  onSelected: (value) {
                                    setState(() {
                                      idTheme = value!;
                                    });
                                  },
                                  textStyle: AppTextStyles.body16w4,
                                  dropdownMenuEntries: state.listThemes!
                                      .map<DropdownMenuEntry>((e) {
                                    return DropdownMenuEntry(
                                        value: e.id ?? '', label: e.name ?? '');
                                  }).toList(),
                                  menuHeight: 300,
                                );
                              }
                            }
                            return const SizedBox.shrink();
                          }),
                    ),
            ],
          ),
          20.h,
          if (idTheme == '')
            Expanded(
              child: SingleChildScrollView(
                child: AboutThemesWidget(
                  idCategory: idCategory,
                ),
              ),
            )
          else
            Expanded(
              child: SingleChildScrollView(
                child: QuizsWidget(
                  idTheme: idTheme,
                  idCategory: idCategory,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
