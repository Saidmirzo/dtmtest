import 'package:auto_route/auto_route.dart';
import 'package:dtmtest/common/costomaizable.dart';
import 'package:dtmtest/common/enums/bloc_status.dart';
import 'package:dtmtest/common/extentions.dart';
import 'package:dtmtest/common/res/app_router.dart';
import 'package:dtmtest/common/ui.dart';
import 'package:dtmtest/core/widgets/custom_network_image.dart';
import 'package:dtmtest/features/mobile/auth/presentation/bloc/bloc/auth_bloc.dart';
import 'package:dtmtest/features/mobile/profile/presentation/bloc/profile_bloc.dart';
import 'package:dtmtest/features/mobile/profile/presentation/widgets/help_about_us_widget.dart';
import 'package:dtmtest/features/mobile/tests/presentation/widget/inner_shadow_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

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
  // TextEditingController firstnameController = TextEditingController();
  String telegramUrl = "https://t.me/akramjon_usmonov2";

  Future<void> openExternalApplication(String url) async {
    if (!await launchUrl(
        Uri.parse(
          url,
        ),
        mode: LaunchMode.externalApplication)) {
      throw Exception("Can not lanch $url");
    }
  }

  @override
  void initState() {
    context.read<ProfileBloc>().add(GetProfileDataEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppGradient.backgroundGradient,
      ),
      child: SingleChildScrollView(
        child: BlocConsumer<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state.getProfileDataStatus == BlocStatus.inProgress) {
              return Center(
                child: UI.spinner(),
              );
            } else if (state.getProfileDataStatus == BlocStatus.completed) {
              nameController.text = state.profileData?.fullName ?? 'Noname';
              // firstnameController.text = state.profileData?.fullName ?? '';
            }

            return SafeArea(
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
                                if (nameController.text.trim() !=
                                        state.profileData?.fullName?.trim() &&
                                    isEditInfo == false) {
                                  context.read<ProfileBloc>().add(
                                      UpdateProfileDataEvent(
                                          model: state.profileData!.copyWith(
                                              fullName: nameController.text)));
                                }
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
                        CustomNetworkImage(
                          width: 70,
                          height: 70,
                          color: ColorName.white,
                          border: Border.all(
                            color: const Color.fromARGB(255, 212, 192, 192),
                            width: 1,
                          ),
                          shape: BoxShape.circle,
                          networkImage: state.profileData?.userImage,
                          defWidget: Stack(
                            children: [
                              Assets.icons.profileBold.svg(
                                width: 70,
                                height: 70,
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Visibility(
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: ColorName.white,
                                        border: Border.all(
                                            color: ColorName.customColor,
                                            width: 2)),
                                    child: const Icon(
                                      CupertinoIcons.plus,
                                      color: ColorName.customColor,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        20.h,
                        UserInfoWidget(
                          infoText: "Name",
                          userInfo: nameController.text,
                          isEditInfo: isEditInfo,
                          controller: nameController,
                        ),
                        // UserInfoWidget(
                        //   infoText: "Sourname",
                        //   userInfo: firstnameController.text.isEmpty
                        //       ? "Shea"
                        //       : firstnameController.text,
                        //   isEditInfo: isEditInfo,
                        //   controller: firstnameController,
                        // ),
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
                              state.profileData?.plan ?? '',
                              style: AppTextStyles.body20w4.copyWith(
                                color: ColorName.white,
                              ),
                            ),
                          ],
                        ),
                        50.h,
                        // HelpAboutUsWIdget(
                        //   nameSectionText: "Traffics",
                        //   function: () {
                        //     AutoRouter.of(context).push(
                        //       const PlansRoute(),
                        //     );
                        //   },
                        // ),
                        // 15.h,
                        HelpAboutUsWIdget(
                          nameSectionText: "About Us",
                          function: () {},
                        ),
                        15.h,
                        HelpAboutUsWIdget(
                          nameSectionText: "Help(Telegram)",
                          function: () {
                            openExternalApplication(telegramUrl);
                          },
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
            );
          },
          listener: (BuildContext context, ProfileState state) {
            if (state.updateProfileDataStatus == BlocStatus.completed) {
              context.read<ProfileBloc>().add(GetProfileDataEvent());
            }
          },
          listenWhen: (previous, current) =>
              previous.updateProfileDataStatus !=
              current.updateProfileDataStatus,
        ),
      ),
    );
  }
}
