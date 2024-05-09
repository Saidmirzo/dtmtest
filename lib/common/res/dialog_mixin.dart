import 'dart:typed_data';
import 'package:auto_route/auto_route.dart';
import 'package:dtmtest/common/custom_textfield.dart';
import 'package:dtmtest/common/enums/bloc_status.dart';
import 'package:dtmtest/common/enums/edit_add.dart';
import 'package:dtmtest/common/extentions.dart';
import 'package:dtmtest/common/gradient_button.dart';
import 'package:dtmtest/common/res/dropdown.dart';
import 'package:dtmtest/common/ui.dart';
import 'package:dtmtest/features/admin_panel/web_advertising/data/models/advertising_model.dart';
import 'package:dtmtest/features/admin_panel/web_advertising/presentation/widgets/add_advertising_dialog.dart';
import 'package:dtmtest/features/admin_panel/web_categories/presentation/bloc/web_categories_bloc.dart';
import 'package:dtmtest/features/admin_panel/web_categories/data/models/category_model.dart';
import 'package:dtmtest/features/admin_panel/web_tarifs/models/plan_model.dart';
import 'package:dtmtest/features/admin_panel/web_users/presentation/blocs/bloc/web_bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

mixin DialogMixin {
  void showAccessDialog(
    BuildContext context, {
    String? text,
    Function()? onNo,
    required Function() onYes,
  }) {
    showAdaptiveDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(
            text ?? '',
            style: AppTextStyles.body16w5,
          ),
          actions: [
            TextButton(
              onPressed: onNo ?? () => context.maybePop(),
              style: AppDecorations.buttonStyle(),
              child: Text(
                'NO',
                style: AppTextStyles.body16w5,
              ),
            ),
            TextButton(
              onPressed: onYes,
              style: AppDecorations.buttonStyle(),
              child: Text(
                'YES',
                style: AppTextStyles.body16w5,
              ),
            ),
          ],
        );
      },
    );
  }

  Future<dynamic> addCategoryDialog(
      BuildContext context, EditAdd editAdd, CategoryModel? model, int index) {
    TextEditingController nameController = TextEditingController();
    if (model != null) {
      nameController.text = model.name ?? '';
    }
    return showAdaptiveDialog(
      context: context,
      builder: (_) {
        var size = MediaQuery.of(context).size;
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(editAdd == EditAdd.add ? "Add category" : "Edit category"),
              IconButton(
                  onPressed: () {
                    context.maybePop();
                  },
                  icon: const Icon(Icons.close)),
            ],
          ),
          backgroundColor: ColorName.backgroundColor,
          content: SizedBox(
            width: size.width * .25,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // const Text("Image"),
                // 10.h,
                // Container(
                //   width: 100,
                //   height: 100,
                //   margin: const EdgeInsets.symmetric(vertical: 10),
                //   decoration: BoxDecoration(
                //       color: ColorName.grey,
                //       borderRadius: BorderRadius.circular(20)),
                // ),
                const Text("Name"),
                CustomTextField(
                  backgroundColor: ColorName.backgroundColor,
                  hintText: "Name",
                  borderColor: Colors.transparent,
                  controller: nameController,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 17),
                ),
                20.h,

                BlocBuilder<WebCategoriesBloc, WebCategoriesState>(
                  builder: (context, state) {
                    return GradientButton(
                        radius: 20,
                        onPressed: () {
                          if (editAdd == EditAdd.add) {
                            context.read<WebCategoriesBloc>().add(
                                  AddCategoryEvent(
                                    model: CategoryModel(
                                      image: "",
                                      name: nameController.text,
                                      quizCount: 0,
                                      themeCount: 0,
                                    ),
                                  ),
                                );
                          } else {
                            context.read<WebCategoriesBloc>().add(
                                  EditCategoryEvent(
                                    model: CategoryModel(
                                        id: model?.id,
                                        quizCount: model?.quizCount,
                                        themeCount: model?.themeCount,
                                        name: nameController.text),
                                    index: index,
                                  ),
                                );
                          }

                          context.maybePop();
                        },
                        text: editAdd == EditAdd.add ? "Add" : 'Edit');
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> addThemeDialog(BuildContext context, EditAdd editAdd) {
    final nameControlle = TextEditingController();
    final categoryControlle =
        TextEditingController(text: 'ezywxeyEuGNRwc9dKFGF');
    Uint8List? filePath;

    // final category
    return showAdaptiveDialog(
      context: context,
      builder: (_) {
        var size = MediaQuery.of(context).size;
        return BlocConsumer<WebBloc, WebState>(
          listener: (context, state) {
            if (state.addNewThemeStatus.isComplated) {
              context.maybePop();
            } else if (state.addNewThemeStatus == BlocStatus.failed) {
              showSnackBar(context, text: 'Error');
            }
          },
          builder: (context, state) {
            return AlertDialog(
              title: Text(editAdd == EditAdd.add ? "Add admin" : "Edit admin"),
              backgroundColor: ColorName.backgroundColor,
              content: SizedBox(
                width: size.width * .25,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("Name"),
                    CustomTextField(
                      controller: nameControlle,
                      backgroundColor: ColorName.backgroundColor,
                      hintText: "Name",
                      leading: const Padding(
                        padding: EdgeInsets.only(left: 25, right: 10),
                        child: Icon(Icons.search),
                      ),
                      borderColor: Colors.transparent,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 17),
                    ),
                    CustomTextField(
                      controller: categoryControlle,
                      backgroundColor: ColorName.backgroundColor,
                      hintText: "Category",
                      leading: const Padding(
                        padding: EdgeInsets.only(left: 25, right: 10),
                        child: Icon(Icons.search),
                      ),
                      borderColor: Colors.transparent,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 17),
                    ),
                    IconButton(
                      onPressed: () {
                        FilePicker.platform.pickFiles().then(
                          (value) {
                            if (value != null) {
                              filePath = value.files.first.bytes;
                            }
                          },
                        );
                      },
                      icon: const Icon(Icons.adf_scanner_outlined),
                    ),
                    20.h,
                    state.addNewThemeStatus.isProgress
                        ? UI.spinner()
                        : GradientButton(
                            radius: 20,
                            onPressed: () {
                              if (nameControlle.text.isNotEmpty &&
                                  categoryControlle.text.isNotEmpty) {
                                context.read<WebBloc>().add(
                                      AddNewThemeEvent(
                                        filePath: filePath!,
                                        name: nameControlle.text,
                                        categoryId: categoryControlle.text,
                                      ),
                                    );
                              }
                            },
                            text: "Add",
                          )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Future<dynamic> addAdminsDialog(BuildContext context, EditAdd editAdd) {
    return showAdaptiveDialog(
      context: context,
      builder: (_) {
        var size = MediaQuery.of(context).size;
        return AlertDialog(
          title: Text(editAdd == EditAdd.add ? "Add admin" : "Edit admin"),
          backgroundColor: ColorName.backgroundColor,
          content: SizedBox(
            width: size.width * .25,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("Name"),
                const CustomTextField(
                  backgroundColor: ColorName.backgroundColor,
                  hintText: "Name",
                  leading: Padding(
                    padding: EdgeInsets.only(left: 25, right: 10),
                    child: Icon(Icons.search),
                  ),
                  borderColor: Colors.transparent,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 25, vertical: 17),
                ),
                const Text("Login"),
                const CustomTextField(
                  backgroundColor: ColorName.backgroundColor,
                  hintText: "Login",
                  leading: Padding(
                    padding: EdgeInsets.only(left: 25, right: 10),
                    child: Icon(Icons.search),
                  ),
                  borderColor: Colors.transparent,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 25, vertical: 17),
                ),
                const Text("Password"),
                const CustomTextField(
                  backgroundColor: ColorName.backgroundColor,
                  hintText: "Password",
                  leading: Padding(
                    padding: EdgeInsets.only(left: 25, right: 10),
                    child: Icon(Icons.search),
                  ),
                  borderColor: Colors.transparent,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 25, vertical: 17),
                ),
                20.h,
                GradientButton(
                  radius: 20,
                  onPressed: () {
                    context.maybePop();
                  },
                  text: "Add",
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> addTarifDialog(
      BuildContext context, EditAdd editAdd, PlanModel? model) {
    TextEditingController tarifName = TextEditingController();
    TextEditingController tarifDescription = TextEditingController();
    TextEditingController tarifPrice = TextEditingController();
    String? value1;
    return showAdaptiveDialog(
      context: context,
      builder: (_) {
        var size = MediaQuery.of(context).size;
        if (model != null) {
          tarifPrice.text = model.price ?? '';
          tarifName.text = model.name ?? '';
          tarifDescription.text = model.desciption ?? '';
          value1 = model.days.toString();
        }
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(editAdd == EditAdd.add ? "Add tarif" : "Edit tarif"),
              IconButton(
                  onPressed: () {
                    context.maybePop();
                  },
                  icon: const Icon(Icons.close)),
            ],
          ),
          backgroundColor: ColorName.backgroundColor,
          content: SizedBox(
            width: size.width * .25,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("Tarif Name"),
                CustomTextField(
                  backgroundColor: ColorName.backgroundColor,
                  controller: tarifName,
                  hintText: "Tarif Name",
                  borderColor: Colors.transparent,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 17),
                ),
                10.h,
                const Text("Tarif price"),
                CustomTextField(
                  backgroundColor: ColorName.backgroundColor,
                  controller: tarifPrice,
                  hintText: "Tarif price",
                  borderColor: Colors.transparent,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 17),
                ),
                10.h,
                const Text("Choose month"),
                CustomDropdownMenu(
                  selectedItem: model?.days,
                  onSelected: (value) {
                    value1 = value ?? '';
                  },
                ),
                10.h,
                const Text("Description"),
                CustomTextField(
                  backgroundColor: ColorName.backgroundColor,
                  hintText: "Description",
                  maxLines: null,
                  controller: tarifDescription,
                  borderColor: Colors.transparent,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 17),
                ),
                20.h,
                GradientButton(
                  radius: 20,
                  onPressed: () {
                    if (editAdd == EditAdd.add) {
                      context.read<WebBloc>().add(AddPlanEvent(
                          model: PlanModel(
                              days: int.parse(value1 ?? "0"),
                              desciption: tarifDescription.text,
                              price: tarifPrice.text,
                              name: tarifName.text)));
                    } else {
                      context.read<WebBloc>().add(EditPlanEvent(
                          model: PlanModel(
                              days: int.parse(value1 ?? "0"),
                              desciption: tarifDescription.text,
                              price: tarifPrice.text,
                              name: tarifName.text)));
                    }
                    context.maybePop();
                  },
                  text: "Add",
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> addAdvertisingDialog(BuildContext context, EditAdd editAdd,
      {AdvertisingModel? advertisingModel}) {
    return showAdaptiveDialog(
      barrierDismissible: true,
      context: context,
      builder: (_) {
        return AddAdvertisingDialog(
          editAdd: editAdd,
          advertisingModel: advertisingModel,
        );
      },
    );
  }

  showSnackBar(BuildContext context, {required String text}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
  }
}
