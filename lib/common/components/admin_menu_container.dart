import 'package:dtmtest/common/constants.dart';
import 'package:dtmtest/common/costomaizable.dart';
import 'package:dtmtest/common/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AdminMenuContainer extends StatelessWidget {
  const AdminMenuContainer({
    super.key,
    required this.isSelected,
    this.onTap,
    required this.index,
    required this.isHide,
  });

  final bool isSelected, isHide;
  final int index;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        alignment: isHide ? Alignment.center : null,
        decoration: BoxDecoration(
            gradient: isSelected ? AppGradient.gradient : null,
            boxShadow: isSelected
                ? [
                    BoxShadow(
                        blurRadius: 15,
                        offset: const Offset(0, 10),
                        color: const Color(0xff082A45).withOpacity(.25))
                  ]
                : [],
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(adminIcons[index],
                color: isSelected ? ColorName.white : null),
            Visibility(
              visible: !isHide,
              child: const SizedBox(
                width: 18,
              ),
            ),
            Visibility(
              visible: !isHide,
              child: Text(
                adminMenu[index],
                style: AppTextStyles.body14w6.copyWith(
                    color: isSelected ? ColorName.white : ColorName.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}
