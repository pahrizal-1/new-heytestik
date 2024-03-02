import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

Widget filterRadioButtonWidget(
    {required Function()? onTap,
    required String title,
    required bool isSelected}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 14),
    child: Column(
      children: [
        InkWell(
          onTap: () {
            onTap == null ? () {} : onTap();
          },
          child: Row(
            children: [
              Text(
                title,
                style: blackTextStyle.copyWith(color: blackColor, fontSize: 15),
              ),
              const Spacer(),
              Icon(
                isSelected ? Icons.radio_button_on : Icons.circle_outlined,
                color: isSelected ? greenColor : blackColor,
              ),
            ],
          ),
        ),
        Divider(
          thickness: 1,
          color: borderColor,
        )
      ],
    ),
  );
}
