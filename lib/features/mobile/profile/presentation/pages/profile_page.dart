import 'package:dtmtest/common/costomaizable.dart';
import 'package:dtmtest/common/extentions.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dtmtest/common/res/app_router.dart';
import 'package:dtmtest/common/ui.dart';
import 'package:dtmtest/features/mobile/auth/presentation/bloc/bloc/auth_bloc.dart';
import 'package:dtmtest/features/mobile/profile/presentation/widgets/help_about_us_widget.dart';
import 'package:dtmtest/features/mobile/profile/presentation/widgets/user_image_info.dart';
import 'package:dtmtest/features/mobile/tests/presentation/widget/inner_shadow_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/about_user_widget.dart';

@RoutePage()
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isEditInfo = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController firstnameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppGradient.backgroundGradient,
      ),
      child: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Assets.images.profileAppbarSvg.svg(
                  fit: BoxFit.fitWidth,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        isEditInfo
                            ? IconButton(
                                onPressed: () {
                                  setState(() {
                                    isEditInfo = !isEditInfo;
                                  });
                                },
                                icon: const Icon(
                                  Icons.cancel,
                                  size: 30,
                                ),
                                color: ColorName.white,
                                alignment: Alignment.center,
                              )
                            : 50.w,
                        Text(
                          "Profile",
                          style: AppTextStyles.body24w7.copyWith(
                            color: ColorName.white,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              isEditInfo = !isEditInfo;
                            });
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            color: Colors.transparent,
                            alignment: Alignment.center,
                            child: Text(
                              isEditInfo ? "SAVE" : "EDIT",
                              style: AppTextStyles.body16w7.copyWith(
                                color: ColorName.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    32.h,
                    UserImageInfoWidget(
                      isEditInfo: isEditInfo,
                    ),
                    20.h,
                    UserInfoWidget(
                      infoText: "Name",
                      userInfo: nameController.text.isEmpty
                          ? "Sharlotta"
                          : nameController.text,
                      isEditInfo: isEditInfo,
                      controller: nameController,
                    ),
                    UserInfoWidget(
                      infoText: "Sourname",
                      userInfo: firstnameController.text.isEmpty
                          ? "Shea"
                          : firstnameController.text,
                      isEditInfo: isEditInfo,
                      controller: firstnameController,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          width: 200,
                          child: Text(
                            "Current plan",
                            style: AppTextStyles.body24w7.copyWith(
                              color: ColorName.white,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Text(
                          "Standart",
                          style: AppTextStyles.body20w4.copyWith(
                            color: ColorName.white,
                          ),
                        ),
                      ],
                    ),
                    50.h,
                    HelpAboutUsWIdget(
                      nameSectionText: "Traffics",
                      function: () {
                        AutoRouter.of(context).push(
                          const PlansRoute(),
                        );
                      },
                    ),
                    15.h,
                    HelpAboutUsWIdget(
                      nameSectionText: "About Us",
                      function: () {},
                    ),
                    15.h,
                    HelpAboutUsWIdget(
                      nameSectionText: "Help(Telegram)",
                      function: () {},
                    ),
                    70.h,
                    BlocConsumer<AuthBloc, AuthState>(
                      listenWhen: (previous, current) =>
                          previous.logOutStatus != current.logOutStatus,
                      listener: (context, state) {
                        if (state.logOutStatus.isComplated) {
                          context.replaceRoute(const SignInRoute());
                        }
                      },
                      builder: (context, state) {
                        return InkWell(
                          onTap: () {
                            context.read<AuthBloc>().add(LogOutEvent());
                          },
                          child: InnerShadowWidget(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 25,
                              vertical: 5,
                            ),
                            child: Text(
                              "Quit",
                              style: AppTextStyles.body20w6.copyWith(
                                color: ColorName.white,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
