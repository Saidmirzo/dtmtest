import 'package:dtmtest/common/res/res.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UserPlanWidget extends StatefulWidget {
  bool isEditInfo;
  Function()? function;
  UserPlanWidget({
    super.key,
    required this.isEditInfo,
    this.function,
  });

  @override
  State<UserPlanWidget> createState() => _UserPlanWidgetState();
}

class _UserPlanWidgetState extends State<UserPlanWidget> {
  static const List<String> _dropDownValues = [
    "Standart",
    "Pro",
    "Premium",
    "Business",
  ];

  String dropValue = _dropDownValues[0];
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          width: 200,
          child: Text(
            "Current plan",
            style: AppTextStyles.body24w7.copyWith(
              color: ColorName.white,
            ),
            textAlign: TextAlign.start,
          ),
        ),
        widget.isEditInfo
            ? Expanded(
                child: InputDecorator(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorName.white,
                        width: 1,
                      ),
                    ),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      isDense: true,
                      dropdownColor: ColorName.customColor,
                      style: AppTextStyles.body20w4
                          .copyWith(color: ColorName.white),
                      items: _dropDownValues
                          .map((value) => DropdownMenuItem(
                                value: value,
                                child: Text(value),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          dropValue = value!;
                        });
                      },
                      value: dropValue,
                    ),
                  ),
                ),
              )
            : Text(
                dropValue,
                style: AppTextStyles.body20w4.copyWith(
                  color: ColorName.white,
                ),
              ),
      ],
    );
  }
}
