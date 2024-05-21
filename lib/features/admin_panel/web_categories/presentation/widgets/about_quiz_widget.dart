// ignore: must_be_immutable
import 'package:dtmtest/common/ui.dart';
import 'package:dtmtest/features/admin_panel/web_categories/data/models/theme_model.dart';
import 'package:dtmtest/features/admin_panel/web_categories/presentation/bloc/quizs_bloc/web_quizs_bloc.dart';
import 'package:dtmtest/features/admin_panel/widgets/custom_table_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class QuizsWidget extends StatefulWidget {
  String idTheme;
  QuizsWidget({
    super.key,
    required this.idTheme,
  });

  @override
  State<QuizsWidget> createState() => _QuizsWidgetState();
}

class _QuizsWidgetState extends State<QuizsWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WebQuizsBloc, WebQuizsState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state.getAllThemesStatus.isProgress) {
          return UI.spinner();
        }
        ThemeModel? list;
        for (var element in state.listThemes!) {
          if (element.id == widget.idTheme) {
            list = element;
          }
        }
        return CustomTable(
          columnNames: const ['№', 'Question', ""],
          columnList: List.generate(
            list?.quiz?.length ?? 0,
            (index) => [
              Text(
                '${index + 1}',
              ),
              Text(
                list?.quiz?[index].question ?? 'Unk',
              ),
            ],
          ),
          onDelete: (index) {},
          onEdit: (index) {},
        );
      },
    );
  }
}
