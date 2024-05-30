import 'package:dtmtest/common/enums/edit_add.dart';
import 'package:dtmtest/common/res/dialog_mixin.dart';
import 'package:dtmtest/common/ui.dart';
import 'package:dtmtest/features/admin_panel/web_categories/data/models/theme_model.dart';
import 'package:dtmtest/features/admin_panel/web_categories/presentation/bloc/quizs_bloc/web_quizs_bloc.dart';
import 'package:dtmtest/features/admin_panel/widgets/custom_table_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class AboutThemesWidget extends StatelessWidget with DialogMixin {
  AboutThemesWidget({super.key, required this.idCategory});

  final String idCategory;
  List<ThemeModel> listTheme = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WebQuizsBloc, WebQuizsState>(
      listener: (context, state) {
        if (state.getAllThemesStatus.isProgress) {}
      },
      builder: (context, state) {
        if (state.getAllThemesStatus.isProgress) {
          return UI.spinner();
        }
        listTheme = state.listThemes ?? [];
        return CustomTable(
          columnNames: const ['№', 'Name', 'Question count', ""],
          columnList: List.generate(
            listTheme.length,
            (index) => [
              Text(
                '${index + 1}',
              ),
              Text(
                listTheme[index].name ?? 'Unk',
              ),
              Text(
                listTheme[index].quizCount.toString(),
              ),
            ],
          ),
          onDelete: (index) {
            context.read<WebQuizsBloc>().add(DeleteQuizThemeEvent(
                idCategory: idCategory, idTheme: listTheme[index].id ?? ''));
          },
          onEdit: (index) {
            editThemeAndQuizDialog(context, listTheme[index], idCategory);
          },
        );
      },
    );
  }
}
