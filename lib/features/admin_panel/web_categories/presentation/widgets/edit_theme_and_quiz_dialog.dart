import 'package:dtmtest/common/custom_textfield.dart';
import 'package:dtmtest/common/enums/bloc_status.dart';
import 'package:dtmtest/common/res/dialog_mixin.dart';
import 'package:dtmtest/common/res/res.dart';
import 'package:dtmtest/features/admin_panel/web_categories/data/models/theme_model.dart';
import 'package:dtmtest/features/admin_panel/web_categories/presentation/bloc/quizs_bloc/web_quizs_bloc.dart';
import 'package:dtmtest/features/mobile/auth/presentation/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditThemeAndQuizDialogWidget extends StatefulWidget {
  EditThemeAndQuizDialogWidget({
    super.key,
    required this.themeModel,
    required this.idCategory,
  });
  ThemeModel themeModel;
  final String idCategory;

  @override
  State<EditThemeAndQuizDialogWidget> createState() =>
      _EditThemeAndQuizDialogWidgetState();
}

class _EditThemeAndQuizDialogWidgetState
    extends State<EditThemeAndQuizDialogWidget> with DialogMixin {
  int maxColumn = 5;

  bool readOnly = false;

  @override
  Widget build(BuildContext context) {
    int max = 4;
    widget.themeModel.quiz?.forEach((element) {
      if ((element.options?.length ?? 0) > 4) {
        max = element.options?.length ?? 0;
      }
    });
    maxColumn = max + 1;
    return Dialog(
      backgroundColor: Colors.transparent,
      child: BlocConsumer<WebQuizsBloc, WebQuizsState>(
        listener: (context, state) {
          if (state.editThemeStatus.isProgress) {
            readOnly = true;
          } else {
            readOnly = false;
          }
          if (state.editThemeStatus.isComplated) {
            showSnackBar(context, text: 'Succes edited');
            Navigator.pop(context);
          } else if (state.editThemeStatus == BlocStatus.failed) {
            showSnackBar(context, text: "Error");
          }
        },
        builder: (context, state) {
          return Container(
            height: MediaQuery.of(context).size.height - 20,
            width: MediaQuery.of(context).size.width - 20,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: ColorName.white,
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 300,
                      height: 80,
                      child: CustomTextField(
                        contentPadding: const EdgeInsets.all(10),
                        readOnly: readOnly,
                        onChanged: (value) {
                          widget.themeModel.name = value;
                        },
                        controller:
                            TextEditingController(text: widget.themeModel.name),
                      ),
                    ),
                    const Spacer(),
                    CustomTextButton(
                      onTap: () => Navigator.pop(context),
                      suffixWidget: const Icon(Icons.cancel),
                      preficWidget: const Text('Cancel'),
                    ),
                    CustomTextButton(
                      isLoading: state.editThemeStatus.isProgress,
                      onTap: () {
                        context.read<WebQuizsBloc>().add(
                              EditQuizThemeEvent(
                                model: widget.themeModel,
                                categoryId: widget.idCategory,
                              ),
                            );
                      },
                      color: ColorName.green,
                      suffixWidget: const Icon(Icons.save),
                      preficWidget: Text(
                        'Save',
                        style: AppTextStyles.body15w5.copyWith(
                          color: ColorName.white,
                        ),
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: ListView(
                    children: [
                      DataTable(
                        dataRowMaxHeight: 200,
                        columns: List.generate(
                          maxColumn + 1,
                          (index) => DataColumn(
                            label: Text(index == 0
                                ? "Question"
                                : maxColumn == index
                                    ? ''
                                    : "Option$index"),
                          ),
                        ),
                        rows: List<DataRow>.generate(
                          widget.themeModel.quiz?.length ?? 0,
                          (index) => DataRow(
                            cells: [
                              DataCell(
                                SizedBox(
                                  width: 200,
                                  child: QuizEditTextField(
                                    readOnly: readOnly,
                                    text:
                                        widget.themeModel.quiz?[index].question,
                                    onChange: (value) {
                                      widget.themeModel.quiz?[index].question =
                                          value;
                                    },
                                  ),
                                ),
                              ),
                              ...List.generate(
                                maxColumn - 1,
                                (i) {
                                  if (i <
                                      (widget.themeModel.quiz![index].options
                                              ?.length ??
                                          0)) {
                                    Quiz quiz = widget.themeModel.quiz![index];
                                    return DataCell(
                                      QuizEditTextField(
                                        readOnly: readOnly,
                                        text: quiz.options?[i],
                                        onChange: (value) {
                                          quiz.options?[i] = value ?? '';
                                        },
                                      ),
                                    );
                                  } else {
                                    return const DataCell(
                                      Text(''),
                                    );
                                  }
                                },
                              ),
                              DataCell(
                                SizedBox(
                                  width: 200,
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        widget.themeModel.quiz?.removeAt(index);
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.delete,
                                      color: ColorName.red,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class QuizEditTextField extends StatelessWidget {
  const QuizEditTextField({
    super.key,
    required this.text,
    required this.onChange,
    this.readOnly = false,
  });

  final String? text;
  final bool readOnly;
  final Function(String? value) onChange;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: null,
      expands: true,
      readOnly: readOnly,
      onChanged: onChange,
      controller: TextEditingController(
        text: text,
      ),
    );
  }
}
