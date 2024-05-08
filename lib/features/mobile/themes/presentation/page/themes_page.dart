// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:dtmtest/common/components/custom_appbar.dart';
import 'package:dtmtest/common/costomaizable.dart';
import 'package:dtmtest/common/enums/bloc_status.dart';
import 'package:dtmtest/common/extentions.dart';
import 'package:dtmtest/common/material_button.dart';
import 'package:dtmtest/common/res/app_router.dart';
import 'package:dtmtest/common/ui.dart';
import 'package:dtmtest/features/admin_panel/web_categories/data/models/category_model.dart';
import 'package:dtmtest/features/mobile/themes/presentation/bloc/themes_bloc.dart';
import 'package:dtmtest/features/mobile/themes/presentation/widgets/themes_container_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ThemesPage extends StatefulWidget {
  final CategoryModel? categoryModel;
  const ThemesPage({
    super.key,
    required this.categoryModel,
  });

  @override
  State<ThemesPage> createState() => _ThemesPageState();
}

class _ThemesPageState extends State<ThemesPage> {
  TextEditingController themesController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context
        .read<ThemesBloc>()
        .add(GetThemesEvent(id: widget.categoryModel?.id ?? ''));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppGradient.backgroundGradient,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: CustomAppBar(
          text: widget.categoryModel?.name,
        ),
        body: BlocConsumer<ThemesBloc, ThemesState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state.getAllThemesStatus == BlocStatus.inProgress) {
              return UI.spinner();
            }
            if (state.listThemes?.isEmpty ?? false) {
              return Center(
                child: Text(LocaleKeys.category_listisempty.tr()),
              );
            }
            return Column(
              children: [
                30.h,
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: ColorName.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: ListView.separated(
                      itemCount: state.listThemes?.length ?? 0,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                      ).copyWith(top: 30, bottom: 30),
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return MaterialInkWellButton(
                          width: double.infinity,
                          function: () {
                            if (state.listThemes![index].quizCount != 0) {
                              AutoRouter.of(context).push(
                                TestsRoute(
                                  themeModel: state.listThemes![index],
                                ),
                              );
                            }
                          },
                          borderRadius: BorderRadius.circular(16),
                          color: ColorName.scienceWidgetColor,
                          border: Border.all(
                            width: 1,
                            color: ColorName.customColor,
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: ThemesContainerWidget(
                            index: index + 1,
                            mavzunomi: state.listThemes?[index].name ?? '',
                            savollarSoni:
                                state.listThemes?[index].quizCount ?? 0,
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return 11.h;
                      },
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
