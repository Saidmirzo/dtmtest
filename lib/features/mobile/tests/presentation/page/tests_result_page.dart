import 'package:auto_route/auto_route.dart';
import 'package:dtmtest/features/mobile/auth/presentation/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';

@RoutePage()
class TestsResultPage extends StatelessWidget {
  const TestsResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 100,
            width: 100,
            child: CircularProgressIndicator(
              value: .5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextButton(
                  onTap: () {},
                  preficWidget: const Text('Natijalar'),
                ),
                CustomTextButton(
                  onTap: () {},
                  preficWidget: const Text('Davom ettirish'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
