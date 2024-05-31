import 'package:auto_route/auto_route.dart';
import 'package:dtmtest/common/gradient_button.dart';
import 'package:dtmtest/common/res/res.dart';
import 'package:dtmtest/features/mobile/auth/presentation/bloc/connectivity/connectivity_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
@RoutePage()
class ConnectivityScreen extends StatefulWidget {
  const ConnectivityScreen({super.key});

  @override
  State<ConnectivityScreen> createState() => _ConnectivityScreenState();
}

class _ConnectivityScreenState extends State<ConnectivityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 110),
            Assets.images.noConnection.image(width: 283, height: 283),
            const SizedBox(height: 28),
            Text("УПС!", style: AppTextStyles.body22w7),
            const SizedBox(height: 8),
            Text("Проверьте подключение к сети или Wi-Fi и попоробуйте ещё раз",
                style: AppTextStyles.body16w5, textAlign: TextAlign.center),
            const Spacer(),
            GradientButton(
              text: "Попробовать ещё раз",
              onPressed: () {
                context.read<ConnectivityCubit>().back();
              },
            ),
            const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}
