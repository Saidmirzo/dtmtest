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
import '../widgets/custom_text_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> with DialogMixin {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController fullName = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode fullNameFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorName.blueAccent,
      body: BlocConsumer<AuthBloc, AuthState>(
        listenWhen: (previous, current) =>
            previous.registerWithEmailState != current.registerWithEmailState ||
            previous.loginWithGoogleStaus != current.loginWithGoogleStaus,
        listener: (context, state) {
          if (state.registerWithEmailState.isComplated ||
              state.loginWithGoogleStaus.isComplated) {
            context.replaceRoute(const MainRoute());
          } else if (state.registerWithEmailState == BlocStatus.failed) {
            showSnackBar(context, text: "Error");
          } else if (state.registerWithEmailState == BlocStatus.unAutorized) {
            showSnackBar(
              context,
              text: "This user registered with google accaunt",
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 24).copyWith(bottom: 20),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const SizedBox(height: 220),
                  CustomTextField(
                    hintText: 'Full Name',
                    controller: fullName,
                    isPassword: false,
                    radius: 10,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        fullNameFocusNode.requestFocus();
                        return "Full name is too short";
                      }
                      if (value.length < 5) {
                        return "Full name is too short";
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: CustomTextField(
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
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 28),
                    child: CustomTextField(
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
                  const Spacer(),
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
                  Padding(
                    padding: const EdgeInsets.only(bottom: 38),
                    child: Text.rich(
                      TextSpan(
                        text: 'Sign in',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.replaceRoute(const SignInRoute());
                          },
                        style: AppTextStyles.body18w7.copyWith(
                          color: ColorName.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                  CustomTextButton(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        context.read<AuthBloc>().add(
                              RegisterUserEvent(
                                userRegisterModel: UserRegisterModel(
                                  fullName: fullName.text,
                                  email: email.text,
                                  password: password.text,
                                  userImage: '',
                                ),
                              ),
                            );
                      }
                    },
                    borderRadius: 10,
                    preficWidget: state.registerWithEmailState.isProgress
                        ? UI.spinner()
                        : const Text('Next'),
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
