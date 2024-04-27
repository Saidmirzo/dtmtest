import 'package:auto_route/auto_route.dart';
import 'package:dtmtest/common/custom_textfield.dart';
import 'package:dtmtest/common/enums/bloc_status.dart';
import 'package:dtmtest/common/res/app_router.dart';
import 'package:dtmtest/common/res/dialog_mixin.dart';
import 'package:dtmtest/common/ui.dart';
import 'package:dtmtest/features/mobile/auth/data/model/user_register_model.dart';
import 'package:dtmtest/features/mobile/auth/presentation/bloc/bloc/auth_bloc.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorName.blueAccent,
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state.registerWithEmailState.isComplated) {
            context.replaceRoute(const MainRoute());
          } else if (state.registerWithEmailState == BlocStatus.failed) {
            showSnackBar(context, text: "Error");
          }
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 24).copyWith(bottom: 20),
            child: Column(
              children: [
                const SizedBox(height: 220),
                CustomTextField(
                  hintText: 'Full Name',
                  controller: fullName,
                  isPassword: false,
                  radius: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: CustomTextField(
                    hintText: 'Email',
                    controller: email,
                    isPassword: false,
                    radius: 10,

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
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 38),
                  child: Text.rich(
                    TextSpan(
                      text: 'Sign in',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          context.replaceRoute(const SignInRoute());
                          // Navigator.pushReplacementNamed(
                          //     context, Routes.signInPage);
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
                    if (fullName.text.isNotEmpty &&
                        email.text.isNotEmpty &&
                        password.text.isNotEmpty) {
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
          );
        },
      ),
    );
  }
}
