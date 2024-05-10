
import 'package:dtmtest/common/components/admin_row_widget.dart';
import 'package:dtmtest/common/extentions.dart';
import 'package:dtmtest/common/ui.dart';
import 'package:dtmtest/features/admin_panel/web_categories/data/models/theme_model.dart';
import 'package:dtmtest/features/admin_panel/web_categories/presentation/bloc/quizs_bloc/web_quizs_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AboutThemesWidget extends StatelessWidget {
  const AboutThemesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
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
        BlocConsumer<WebQuizsBloc, WebQuizsState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state.getAllThemesStatus.isProgress) {
              return UI.spinner();
            }
            final List<ThemeModel> listTheme = state.listThemes ?? [];
            return ListView.separated(
              itemCount: listTheme.length,
              shrinkWrap: true,
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
                  ],
                ),
              ),
              separatorBuilder: (_, index) => 10.h,
            );
          },
        ),
      ],
    );
  }
}