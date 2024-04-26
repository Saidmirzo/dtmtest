import 'package:dtmtest/common/costomaizable.dart';
import 'package:dtmtest/common/extentions.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dtmtest/common/res/app_router.dart';
import 'package:dtmtest/common/ui.dart';
import 'package:dtmtest/features/mobile/auth/presentation/bloc/bloc/auth_bloc.dart';
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
  static const List<String> _dropDownValues = [
    "Standart",
    "Pro",
    "Premium",
    "Business",
  ];

  String dropValue = _dropDownValues[0];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppGradient.backgroundGradient,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
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
                        const SizedBox(
                          width: 50,
                        ),
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
                              isEditInfo ? "SAVE" : "EDIT INFO",
                              style: AppTextStyles.body16w7.copyWith(
                                color: ColorName.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    32.h,
                    Container(
                      width: 70,
                      height: 70,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: ColorName.borderColor,
                          width: 1,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(35),
                        child: Assets.images.statisticsProfileImage.image(
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    20.h,
                    UserInfoWidget(
                      infoText: "Name",
                      userInfo: "Sharlotta",
                      isEditInfo: isEditInfo,
                    ),
                    UserInfoWidget(
                      infoText: "Sourname",
                      userInfo: "Shea",
                      isEditInfo: isEditInfo,
                    ),
                    UserPlanWidget(
                      isEditInfo: isEditInfo,
                      list: _dropDownValues,
                    ),
                    BlocConsumer<AuthBloc, AuthState>(
                      listenWhen: (previous, current) =>
                          previous.logOutStatus != current.logOutStatus,
                      listener: (context, state) {
                        if (state.logOutStatus.isComplated) {
                          context.replaceRoute(const MobileLoginRoute());
                        }
                      },
                      builder: (context, state) {
                        return IconButton(
                          onPressed: () {
                            context.read<AuthBloc>().add(LogOutEvent());
                          },
                          icon: const Icon(Icons.logout),
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

class UserPlanWidget extends StatefulWidget {
  List<String> list;
  bool isEditInfo;
  UserPlanWidget({super.key, required this.isEditInfo, required this.list});

  @override
  State<UserPlanWidget> createState() => _UserPlanWidgetState();
}

class _UserPlanWidgetState extends State<UserPlanWidget> {
  @override
  Widget build(BuildContext context) {
    String dropValue = widget.list[0];
    return Row(
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
        widget.isEditInfo
            ? Expanded(
                child: InputDecorator(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorName.white,
                        width: 1,
                      ),
                    ),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      isDense: true,
                      dropdownColor: ColorName.customColor,
                      style: AppTextStyles.body20w4
                          .copyWith(color: ColorName.white),
                      items: widget.list
                          .map((value) => DropdownMenuItem(
                                value: value,
                                child: Text(value),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          dropValue = value!;
                        });
                      },
                      value: dropValue,
                    ),
                  ),
                ),
              )
            : Text(
                dropValue,
                style: AppTextStyles.body20w4.copyWith(
                  color: ColorName.white,
                ),
              ),
      ],
    );
  }
}
