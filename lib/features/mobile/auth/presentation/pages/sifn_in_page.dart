import 'package:auto_route/auto_route.dart';
import 'package:dtmtest/common/custom_textfield.dart';
import 'package:dtmtest/common/enums/bloc_status.dart';
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
      backgroundColor: ColorName.blueAccent,
      body: BlocConsumer<AuthBloc, AuthState>(
        listenWhen: (previous, current) =>
            previous.loginWithEmailState != current.loginWithEmailState ||
            previous.loginWithGoogleStaus != current.loginWithGoogleStaus,
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
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const SizedBox(height: 300),
                  CustomTextField(
                    focusNode: emailFocusNode,
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
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: CustomTextField(
                      focusNode: passwordFocusNode,
                      hintText: 'Password',
                      controller: password,
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
                  ElevatedButton(
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
                    style: AppDecorations.buttonStyle(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      borderRadius: 10,
                      size: const Size.fromWidth(double.maxFinite),
                    ),
                    child: state.loginWithEmailState.isProgress
                        ? UI.spinner()
                        : Text(
                            'Sign in',
                            style: AppTextStyles.body20w4,
                          ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40),
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
                    padding: const EdgeInsets.only(top: 11, bottom: 38),
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
                        ),
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
