import 'package:auto_route/auto_route.dart';
import 'package:dtmtest/common/components/custom_appbar.dart';
import 'package:dtmtest/common/costomaizable.dart';
import 'package:dtmtest/common/res/res.dart';
import 'package:dtmtest/features/mobile/tests/presentation/widget/container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

@RoutePage()
class PrivacyPolicyPage extends StatefulWidget {
  const PrivacyPolicyPage({super.key});

  @override
  State<PrivacyPolicyPage> createState() => _PrivacyPolicyPageState();
}

class _PrivacyPolicyPageState extends State<PrivacyPolicyPage> {
  String _privacyText = '';

  @override
  void initState() {
    super.initState();
    loadPrivacyPolicy();
  }

  Future<void> loadPrivacyPolicy() async {
    String text = await rootBundle.loadString(Assets.text.privacyPolice);
    setState(() {
      _privacyText = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppGradient.backgroundGradient,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const CustomAppBar(
          text: "Privacy police",
        ),
        body: ThemesBackgroundContainer(
          color: ColorName.white,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20)
                .copyWith(top: 50, bottom: 30),
            child: Text(
              _privacyText,
              style: AppTextStyles.body14w5.copyWith(
                color: ColorName.black,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
