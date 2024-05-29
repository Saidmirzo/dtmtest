import 'dart:developer';
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
import 'package:dtmtest/features/admin_panel/web_categories/data/models/category_model.dart';
import 'package:dtmtest/features/admin_panel/web_categories/data/models/theme_model.dart';
import 'package:dtmtest/features/admin_panel/web_categories/presentation/bloc/quizs_bloc/web_quizs_bloc.dart';
import 'package:dtmtest/features/admin_panel/web_categories/presentation/widgets/edit_theme_and_quiz_dialog.dart';
import 'package:dtmtest/features/admin_panel/web_tarifs/domain/models/plan_model.dart';
import 'package:dtmtest/features/admin_panel/web_tarifs/presentation/bloc/tarifs_bloc.dart';
import 'package:dtmtest/features/admin_panel/web_users/data/models/admin_model.dart';
import 'package:dtmtest/features/admin_panel/web_users/presentation/blocs/users_bloc/web_users_bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/admin_panel/web_categories/presentation/bloc/category_bloc/web_categories_bloc.dart';

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
    BuildContext context,
    EditAdd editAdd,
    CategoryModel? model,
  ) {
    Widget? image;
    Uint8List? byte;
    String? fileName;
    bool isActive = false;

    TextEditingController nameController = TextEditingController();
    if (model != null) {
      nameController.text = model.name ?? '';
      isActive = model.isActive ?? false;
    }

    return showAdaptiveDialog(
      context: context,
      builder: (_) {
        var size = MediaQuery.of(context).size;
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(editAdd == EditAdd.add ? "Add category" : "Edit category"),
                IconButton(
                  onPressed: () {
                    context.maybePop();
                  },
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            backgroundColor: ColorName.white,
            content: SizedBox(
              width: size.width * .25,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("Image"),
                  10.h,
                  GestureDetector(
                    onTap: () async {
                      FilePickerResult? result =
                          await FilePicker.platform.pickFiles();

                      if (result?.files.single.bytes != null) {
                        byte = result!.files.single.bytes;
                        image = Image.memory(byte!);
                        fileName = result.files.single.name;
                        setState(() {});
                      }
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: ColorName.grey,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: image ?? Image.network(model?.image ?? ''),
                    ),
                  ),
                  20.h,
                  const Text("Name"),
                  CustomTextField(
                    backgroundColor: ColorName.backgroundColor,
                    hintText: "Name",
                    borderColor: Colors.transparent,
                    controller: nameController,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 17),
                  ),
                  20.h,
                  const Text("Is Active"),
                  5.h,
                  Switch.adaptive(
                      value: isActive,
                      onChanged: (value) {
                        isActive = value;
                        setState(() {});
                      }),
                  20.h,
                  BlocConsumer<WebCategoriesBloc, WebCategoriesState>(
                    listenWhen: (previous, current) =>
                        previous.addCategoryStatus !=
                            current.addCategoryStatus ||
                        previous.editCategoryStatus !=
                            current.editCategoryStatus,
                    listener: (context, state) {
                      if (state.addCategoryStatus.isComplated) {
                        context.maybePop();
                        showSnackBar(context, text: "Success added");
                      } else if (state.addCategoryStatus == BlocStatus.failed) {
                        showSnackBar(context, text: "Error");
                      }
                      if (state.editCategoryStatus.isComplated) {
                        context.maybePop();
                        showSnackBar(context, text: "Success edited");
                      } else if (state.editCategoryStatus ==
                          BlocStatus.failed) {
                        showSnackBar(context, text: "Error");
                      }
                    },
                    builder: (context, state) {
                      return GradientButton(
                          isLoading: state.editCategoryStatus.isProgress ||
                              state.addCategoryStatus.isProgress,
                          radius: 20,
                          onPressed: () {
                            if (editAdd == EditAdd.add) {
                              context.read<WebCategoriesBloc>().add(
                                    AddCategoryEvent(
                                      model: CategoryModel(
                                        isActive: isActive,
                                        image: fileName,
                                        name: nameController.text,
                                        quizCount: 0,
                                        themeCount: 0,
                                      ),
                                      byte: byte!,
                                      fileName: fileName ?? "",
                                    ),
                                  );
                            } else {
                              context.read<WebCategoriesBloc>().add(
                                    EditCategoryEvent(
                                      filePath: byte,
                                      name: fileName,
                                      model: CategoryModel(
                                        isActive: isActive,
                                        id: model?.id,
                                        quizCount: model?.quizCount,
                                        themeCount: model?.themeCount,
                                        name: nameController.text,
                                        image: model?.image,
                                      ),
                                    ),
                                  );
                            }
                          },
                          text: editAdd == EditAdd.add ? "Add" : 'Edit');
                    },
                  )
                ],
              ),
            ),
          );
        });
      },
    );
  }

  Future editThemeAndQuizDialog(
    BuildContext context,
    ThemeModel themeModel,
    String idCategory,
  ) {
    return showDialog(
      context: context,
      builder: (context) => EditThemeAndQuizDialogWidget(
        themeModel: themeModel,
        idCategory: idCategory,
      ),
    );
  }

  Future<dynamic> addThemeDialog(
    BuildContext context,
    ThemeModel? thememodel,
  ) {
    final nameControlle = TextEditingController();
    final categoryController =
        TextEditingController(text: 'ezywxeyEuGNRwc9dKFGF');
    Uint8List? filePath;

    String func() {
      for (var element in context.read<WebQuizsBloc>().state.listCategories!) {
        if (element.name == categoryController.text) {
          // log(element.id.toString());
          // log(element.name.toString());
          return element.id ?? '';
        }
      }
      return '';
    }

    // final category
    return showAdaptiveDialog(
      context: context,
      builder: (_) {
        var size = MediaQuery.of(context).size;
        return BlocConsumer<WebQuizsBloc, WebQuizsState>(
          listener: (context, state) {
            if (state.addNewThemeStatus.isComplated) {
              context.maybePop();
            } else if (state.addNewThemeStatus == BlocStatus.failed) {
              showSnackBar(context, text: 'Error');
            }
          },
          builder: (context, state) {
            if (state.getAllCategoriesStatus == BlocStatus.inProgress) {
              return UI.spinner();
            }
            return AlertDialog(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Add theme"),
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
                    (state.listCategories!.isEmpty ||
                            state.listCategories == null)
                        ? Text(
                            "Your Category List is Empty!!",
                            style: AppTextStyles.body16w5,
                          )
                        : DropdownMenu(
                            controller: categoryController,
                            initialSelection: state.listCategories?[0].name,
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
                              // dropValue = value;
                              categoryController.text = value;

                              log(categoryController.text);
                            },
                            textStyle: AppTextStyles.body16w4,
                            dropdownMenuEntries: state.listCategories!
                                .map<DropdownMenuEntry>((e) {
                              return DropdownMenuEntry(
                                  value: e.name ?? '', label: e.name ?? '');
                            }).toList(),
                            menuHeight: 300,
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
                              // func();
                              if (nameControlle.text.isNotEmpty &&
                                  categoryController.text.isNotEmpty) {
                                // if (editAdd == EditAdd.add) {
                                context.read<WebQuizsBloc>().add(
                                      AddNewQuizThemeEvent(
                                        filePath: filePath!,
                                        name: nameControlle.text,
                                        categoryId: func(),
                                      ),
                                    );
                                // }
                                // else {
                                //   var quizs = thememodel?.quiz;

                                //   final ThemeModel themeModel = ThemeModel(
                                //     createdTime: DateTime.now()
                                //         .millisecondsSinceEpoch
                                //         .toString(),
                                //     name: nameControlle.text,
                                //     quiz: quizs,
                                //     quizCount: thememodel?.quizCount,
                                //   );
                                //   context.read<WebQuizsBloc>().add(
                                //         EditQuizThemeEvent(
                                //           model: themeModel,
                                //           categoryId: func(),
                                //         ),
                                //       );
                                // }
                              }
                            },
                            text: "Add",
                          ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Future<dynamic> addAdminsDialog(
      BuildContext context, EditAdd editAdd, AdminModel? model) {
    var name = TextEditingController();
    var login = TextEditingController();
    var password = TextEditingController();
    if (model != null) {
      name.text = model.name ?? '';
      login.text = model.login ?? '';
      password.text = model.password ?? '';
    }
    return showAdaptiveDialog(
      context: context,
      builder: (_) {
        var size = MediaQuery.of(context).size;
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(editAdd == EditAdd.add ? "Add admin" : "Edit admin"),
              IconButton(
                onPressed: () {
                  context.maybePop();
                },
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          backgroundColor: ColorName.white,
          content: SizedBox(
            width: size.width * .25,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("Name"),
                5.h,
                CustomTextField(
                  backgroundColor: ColorName.backgroundColor,
                  hintText: "Name",
                  controller: name,
                  borderColor: Colors.transparent,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 17),
                ),
                10.h,
                const Text("Login"),
                5.h,
                CustomTextField(
                  backgroundColor: ColorName.backgroundColor,
                  hintText: "Login",
                  controller: login,
                  borderColor: Colors.transparent,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 17),
                ),
                10.h,
                const Text("Password"),
                5.h,
                CustomTextField(
                  backgroundColor: ColorName.backgroundColor,
                  hintText: "Password",
                  controller: password,
                  borderColor: Colors.transparent,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 17),
                ),
                20.h,
                GradientButton(
                  radius: 20,
                  onPressed: () {
                    if (editAdd == EditAdd.add) {
                      context.read<WebUsersBloc>().add(
                            AddAdminEvent(
                              model: AdminModel(
                                name: name.text,
                                login: login.text,
                                password: password.text,
                              ),
                            ),
                          );
                    } else {
                      context.read<WebUsersBloc>().add(
                            EditAdminEvent(
                              model: AdminModel(
                                id: model?.id,
                                name: name.text,
                                login: login.text,
                                password: password.text,
                              ),
                            ),
                          );
                    }
                    context.maybePop();
                  },
                  text: editAdd == EditAdd.add ? "Add" : "Edit",
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
          backgroundColor: ColorName.white,
          content: SizedBox(
            width: size.width * .25,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("Tarif Name"),
                5.h,
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
                5.h,
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
                5.h,
                CustomDropdownMenu(
                  selectedItem: model?.days,
                  onSelected: (value) {
                    value1 = value ?? '';
                  },
                ),
                10.h,
                const Text("Description"),
                5.h,
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
                      context.read<TarifsBloc>().add(AddPlanEvent(
                          model: PlanModel(
                              days: int.parse(value1 ?? "0"),
                              desciption: tarifDescription.text,
                              price: tarifPrice.text,
                              name: tarifName.text)));
                    } else {
                      context.read<TarifsBloc>().add(EditPlanEvent(
                          model: PlanModel(
                              id: model?.id,
                              days: int.parse(value1 ?? "0"),
                              desciption: tarifDescription.text,
                              price: tarifPrice.text,
                              name: tarifName.text)));
                    }
                    context.maybePop();
                  },
                  text: editAdd == EditAdd.add ? "Add" : "Edit",
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
