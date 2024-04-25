import 'dart:ui';

import 'package:dtmtest/common/res/app_text_style.dart';
import 'package:dtmtest/common/res/colors.gen.dart';
import 'package:flutter/material.dart';

class UniverDialog extends StatelessWidget {
  const UniverDialog(
      {super.key,
      this.yes,
      this.no,
      this.yesString,
      this.noString,
      required this.title});
  final void Function()? yes;
  final void Function()? no;
  final String? yesString, noString;
  final String title;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: Colors.black, width: .5),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(25),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: AppTextStyles.body16w4,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: yes,
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(),
                          right: BorderSide(),
                        ),
                      ),
                      child: Text(
                        yesString ?? 'Yes',
                        style: AppTextStyles.body16w4
                            .copyWith(color: ColorName.backgroundColor),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: no,
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(),
                        ),
                      ),
                      child: Text(
                        noString ?? 'No',
                        style:
                            AppTextStyles.body16w4.copyWith(color: Colors.red),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
