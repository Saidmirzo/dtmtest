import 'package:auto_route/auto_route.dart';
import 'package:dtmtest/common/custom_textfield.dart';
import 'package:dtmtest/common/enums/bloc_status.dart';
import 'package:dtmtest/common/gradient_button.dart';
import 'package:dtmtest/common/res/app_router.dart';
import 'package:dtmtest/common/res/app_text_style.dart';
import 'package:dtmtest/common/res/assets.gen.dart';
import 'package:dtmtest/common/res/colors.gen.dart';
import 'package:dtmtest/common/res/dialog_mixin.dart';
import 'package:dtmtest/common/res/locale_keys.g.dart';
import 'package:dtmtest/features/admin_panel/web_auth/presentation/bloc/bloc/web_auth_bloc.dart';
import 'package:dtmtest/features/admin_panel/web_users/data/models/admin_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class WebAuthPage extends StatelessWidget with DialogMixin {
  WebAuthPage({super.key});

  final TextEditingController login = TextEditingController();
  final TextEditingController password = TextEditingController();
  final FocusNode loginFocuseNode = FocusNode();
  final FocusNode passwordFocuseNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.customColor,
      body: Center(
        child: Container(
          height: 350,
          width: 400,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          decoration: BoxDecoration(
            color: ColorName.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 6,
                offset: const Offset(6, 6),
                color: ColorName.black.withOpacity(.25),
              ),
            ],
            borderRadius: BorderRadius.circular(15),
          ),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextField(
                  leading: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Assets.icons.person.svg(
                          color: ColorName.customColor,
                        ),
                        const SizedBox(
                          height: 20,
                          child: VerticalDivider(
                            color: ColorName.customColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  focusNode: loginFocuseNode,
                  borderColor: ColorName.customColor,
                  style: AppTextStyles.body16w4
                      .copyWith(color: ColorName.customColor),
                  hintText: 'Login',
                  controller: login,
                  isPassword: false,
                  radius: 10,
                  validator: (p0) {
                    if (p0 != null && p0.isEmpty) {
                      loginFocuseNode.requestFocus();
                      return "Fill login";
                    } else {
                      return null;
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 25),
                  child: CustomTextField(
                    leading: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Assets.icons.password.svg(
                            color: ColorName.customColor,
                          ),
                          const SizedBox(
                            height: 20,
                            child: VerticalDivider(
                              color: ColorName.customColor,
                            ),
                          )
                        ],
                      ),
                    ),
                    focusNode: passwordFocuseNode,
                    hintText: LocaleKeys.login_password.tr(),
                    controller: password,
                    borderColor: ColorName.customColor,
                    style: AppTextStyles.body16w4
                        .copyWith(color: ColorName.customColor),
                    isPassword: true,
                    radius: 10,
                    validator: (p0) {
                      if (p0 != null && p0.length < 3) {
                        passwordFocuseNode.requestFocus();
                        return LocaleKeys.login_passwordistooshort.tr();
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                BlocConsumer<WebAuthBloc, WebAuthState>(
                  listener: (context, state) {
                    if (state.loginStatus.isComplated) {
                      context.replaceRoute(const WebMainRoute());
                    } else if (state.loginStatus == BlocStatus.incorrect) {
                      password.clear();
                      passwordFocuseNode.requestFocus();
                      showSnackBar(context, text: "Password incorrect");
                    } else if (state.loginStatus == BlocStatus.unAutorized) {
                      showSnackBar(context, text: "User not found");
                    } else if (state.loginStatus == BlocStatus.failed) {
                      showSnackBar(context, text: "Error");
                    }
                  },
                  builder: (context, state) {
                    return GradientButton(
                      radius: 10,
                      isLoading: state.loginStatus.isProgress,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context.read<WebAuthBloc>().add(
                                LoginEvent(
                                  adminModel: AdminModel(
                                    login: login.text,
                                    password: password.text,
                                  ),
                                ),
                              );
                        }
                      },
                      text: LocaleKeys.login_signin.tr(),
                      color: ColorName.orange,
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
