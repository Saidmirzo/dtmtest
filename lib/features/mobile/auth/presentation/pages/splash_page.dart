import 'dart:async';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:dtmtest/common/res/app_router.dart';
import 'package:dtmtest/common/ui.dart';
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

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future init() async {
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _opacityAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _scaleAnimation =
        Tween<double>(begin: 0.5, end: 1.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut, // Добавляет эффект "пружинки" при анимации
    ));

    _controller.forward();

    Timer(const Duration(seconds: 2), () {
      context.read<AuthBloc>().add(GetLocaleUserEvent());
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state.getLocaleUserStatus.isComplated) {
          if (kIsWeb || Platform.isMacOS) {
            context.replaceRoute(const WebMainRoute());
          } else if (state.userModel != null) {
            context.replaceRoute(const MainRoute());
          } else {
            context.replaceRoute(const SignInRoute());
          }
        }
        return Scaffold(
            backgroundColor: ColorName.customColor,
            body: Center(
                child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Opacity(
                  opacity: _opacityAnimation.value,
                  child: Transform.scale(
                    scale: _scaleAnimation.value,
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(Assets.icons.icon.path),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                );
              },
            )));
      },
    );
  }
}
