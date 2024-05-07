import 'package:auto_route/auto_route.dart';
import 'package:dtmtest/common/custom_textfield.dart';
import 'package:dtmtest/common/enums/bloc_status.dart';
import 'package:dtmtest/common/gradient_button.dart';
import 'package:dtmtest/common/res/app_router.dart';
import 'package:dtmtest/common/res/dialog_mixin.dart';
import 'package:dtmtest/common/ui.dart';
import 'package:dtmtest/features/mobile/auth/data/model/user_register_model.dart';
import 'package:dtmtest/features/mobile/auth/presentation/bloc/bloc/auth_bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> with DialogMixin {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.customColor,
      body: BlocConsumer<AuthBloc, AuthState>(
        listenWhen: (previous, current) =>
            previous.loginWithEmailState != current.loginWithEmailState,
        listener: (context, state) {
          if (state.loginWithEmailState.isComplated ||
              state.loginWithGoogleStaus.isComplated) {
            context.replaceRoute(const MainRoute());
          } else if (state.loginWithEmailState == BlocStatus.failed) {
            showSnackBar(context, text: "Error");
          } else if (state.loginWithEmailState == BlocStatus.unAutorized) {
            showSnackBar(context, text: state.message ?? 'User not found');
            context.replaceRoute(const SignUpRoute());
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Assets.images.logo.image(),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    decoration: BoxDecoration(
                        color: ColorName.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 6,
                            offset: const Offset(6, 6),
                            color: ColorName.black.withOpacity(.25),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      children: [
                        CustomTextField(
                          leading: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Assets.icons.email.svg(
                                  color: ColorName.customColor,
                                ),
                                const SizedBox(
                                    height: 20,
                                    child: VerticalDivider(
                                      color: ColorName.customColor,
                                    ))
                              ],
                            ),
                          ),
                          focusNode: emailFocusNode,
                          borderColor: ColorName.customColor,
                          style: AppTextStyles.body16w4
                              .copyWith(color: ColorName.customColor),
                          hintText: 'Email',
                          controller: email,
                          isPassword: false,
                          radius: 10,
                          validator: (p0) {
                            if (!EmailValidator.validate(p0 ?? '')) {
                              emailFocusNode.requestFocus();
                              return "Invalide email";
                            } else {
                              return null;
                            }
                          },
                          // isValidate: true,
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
                                      ))
                                ],
                              ),
                            ),
                            focusNode: passwordFocusNode,
                            hintText: 'Password',
                            controller: password,
                            borderColor: ColorName.customColor,
                            style: AppTextStyles.body16w4
                                .copyWith(color: ColorName.customColor),
                            isPassword: true,
                            radius: 10,
                            validator: (p0) {
                              if (p0 != null) {
                                if (p0.length < 6) {
                                  passwordFocusNode.requestFocus();

                                  return "Password is too short";
                                } else {
                                  return null;
                                }
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                        GradientButton(
                          radius: 10,
                          isLoading: state.loginWithEmailState.isProgress,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              context.read<AuthBloc>().add(
                                    LoginWithEmailEvent(
                                      userRegisterModel: UserRegisterModel(
                                        email: email.text,
                                        password: password.text,
                                        fullName: '',
                                        userImage: '',
                                      ),
                                    ),
                                  );
                            }
                          },
                          text: "Sign In",
                          color: ColorName.orange,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25),
                    child: IconButton(
                      style: AppDecorations.buttonStyle(
                          padding: const EdgeInsets.all(15)),
                      onPressed: () {
                        context.read<AuthBloc>().add(LoginWithGoogleEvent());
                      },
                      icon: state.loginWithGoogleStaus.isProgress
                          ? UI.spinner()
                          : Assets.icons.google.svg(color: ColorName.blue),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Divider(
                          height: 1,
                          thickness: 1,
                          indent: 24,
                          endIndent: 20,
                          color: ColorName.black.withOpacity(.2),
                        ),
                      ),
                      Text(
                        'Don’t have an account?',
                        style: AppTextStyles.body16w5.copyWith(
                          color: ColorName.grey,
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          height: 1,
                          thickness: 1,
                          indent: 20,
                          endIndent: 24,
                          color: ColorName.black.withOpacity(.2),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 38),
                    child: Text.rich(
                      TextSpan(
                        text: 'Sign up',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.replaceRoute(const SignUpRoute());
                          },
                        style: AppTextStyles.body18w7.copyWith(
                            color: ColorName.blue,
                            decoration: TextDecoration.underline,
                            decorationColor: ColorName.blue),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Terms of use',
                        style: AppTextStyles.body16w5
                            .copyWith(color: ColorName.blue),
                      ),
                      Text(
                        'Privacy Policy',
                        style: AppTextStyles.body16w5
                            .copyWith(color: ColorName.blue),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
