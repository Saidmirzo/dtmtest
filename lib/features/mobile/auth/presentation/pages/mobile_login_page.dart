import 'package:dtmtest/common/res/app_router.dart';
import 'package:dtmtest/common/ui.dart';
import 'package:dtmtest/features/mobile/auth/presentation/bloc/bloc/auth_bloc.dart';
import 'package:dtmtest/features/mobile/auth/presentation/widgets/custom_text_button.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class MobileLoginPage extends StatelessWidget {
  const MobileLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.blueAccent,
      body: BlocConsumer<AuthBloc, AuthState>(
        listenWhen: (previous, current) =>
            previous.loginWithGoogleStaus != current.loginWithGoogleStaus,
        listener: (context, state) {
          if (state.loginWithGoogleStaus.isComplated) {
            context.replaceRoute(const MainRoute());
          }
        },
        builder: (context, state) {
          if (state.loginWithGoogleStaus.isProgress) {
            return UI.spinner();
          }
          return Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  Color(0xff3745F8),
                  Color(0xff0ABAF0),
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: double.maxFinite,
                    height: 10,
                  ),
                  CustomTextButton(
                    onTap: () {
                      AutoRouter.of(context).push(const MainRoute());
                    },
                    suffixWidget: Assets.icons.arrowRight.svg(),
                    preficWidget: Text(
                      'Get started',
                      style: AppTextStyles.body14w6.copyWith(
                        color: ColorName.blue,
                      ),
                    ),
                    color: ColorName.white,
                  ),
                  CustomTextButton(
                    onTap: () {
                      context.read<AuthBloc>().add(LoginWithGoogleEvent());
                    },
                    preficWidget: Assets.icons.google.svg(),
                    suffixWidget: Text(
                      'Sign up with Google',
                      style: AppTextStyles.body14w6.copyWith(
                        color: ColorName.white,
                      ),
                    ),
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
