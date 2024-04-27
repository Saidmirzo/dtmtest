import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:dtmtest/common/res/app_router.dart';
import 'package:dtmtest/common/res/colors.gen.dart';
import 'package:dtmtest/features/mobile/auth/presentation/bloc/bloc/auth_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    init();
  }

  Future init() async {
    Timer(const Duration(seconds: 2), () {
      context.read<AuthBloc>().add(GetLocaleUserEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state.getLocaleUserStatus.isComplated) {
          if (kIsWeb) {
            context.replaceRoute(const WebMainRoute());
          } else if (state.userModel != null) {
            context.replaceRoute(const MainRoute());
          } else {
            context.replaceRoute(const SignInRoute());
          }
        }
        return const Scaffold(
          backgroundColor: ColorName.blue,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Splash page'),
              ],
            ),
          ),
        );
      },
    );
  }
}
