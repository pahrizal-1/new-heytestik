import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

Widget filterOnTapWidget({
  required Function() onTap,
  required String title,
  required bool isSelected,
}) {
  return InkWell(
    onTap: () => onTap(),
    child: Container(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
        top: 4,
        bottom: 4,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        border: Border.all(color: isSelected ? greenColor : borderColor),
      ),
      child: Row(
        children: [
          Text(
            title,
            style: blackTextStyle.copyWith(
              fontSize: 14,
              fontWeight: regular,
              color: isSelected ? greenColor : const Color(0xff6B6B6B),
            ),
          ),
        ],
      ),
    ),
  );
}
