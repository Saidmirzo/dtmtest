// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:dtmtest/common/components/custom_appbar.dart';
import 'package:dtmtest/common/costomaizable.dart';
import 'package:dtmtest/common/extentions.dart';
import 'package:dtmtest/common/material_button.dart';
import 'package:dtmtest/common/res/app_router.dart';
import 'package:dtmtest/common/ui.dart';
import 'package:dtmtest/features/admin_panel/web_quizes/data/model/theme_model.dart';
import 'package:dtmtest/features/mobile/quizs/presentation/widgets/background_container.dart';
import 'package:flutter/material.dart';

@RoutePage()
class QuizsPage extends StatefulWidget {
  const QuizsPage({super.key});

  @override
  State<QuizsPage> createState() => _QuizsPageState();
}

class _QuizsPageState extends State<QuizsPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        gradient: AppGradient.backgroundGradient,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const CustomAppBar(
          text: "Mavzuga oid test",
        ),
        body: ThemesBackgroundContainer(
          color: ColorName.white,
          child: GridView.builder(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 15)
                .copyWith(top: 30, bottom: 30),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1.3,
            ),
            itemCount: 20,
            itemBuilder: (context, index) {
              return MaterialInkWellButton(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: ColorName.customColor, width: 1),
                function: () {
                  AutoRouter.of(context).push(
                    TestsRoute(themeModel: ThemeModel()),
                  );
                },
                color: ColorName.scienceWidgetColor,
                child: TestsWidget(
                  size: size,
                  trueAnswers: index,
                  subtitle: "eski",
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class TestsWidget extends StatelessWidget {
  String? subtitle;
  int trueAnswers;
  TestsWidget({
    super.key,
    this.subtitle,
    required this.trueAnswers,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Imtihon",
          style:
              AppTextStyles.body16w4.copyWith(color: ColorName.blackTextColor),
        ),
        Text(
          "Savoller soni: 30",
          style: AppTextStyles.body16w4.copyWith(
            color: ColorName.greyTextColor,
          ),
        ),
        11.h,
        Text(
          "$trueAnswers tasi  20 dan",
          style: AppTextStyles.body16w7.copyWith(
            color: ColorName.red,
          ),
        ),
        Container(
          height: 3,
          width: size.width * 0.4,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: ColorName.red,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            width: ((size.width * 0.35) / 20) * trueAnswers,
            height: 3,
            color: ColorName.blueLine,
          ),
        ),
        5.h,
        Text(
          subtitle ?? '',
          style: AppTextStyles.body12w7.copyWith(
            color: ColorName.red,
          ),
        ),
      ],
    );
  }
}
