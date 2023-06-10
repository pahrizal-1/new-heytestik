import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

class CustomInputButton extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const CustomInputButton({
    Key? key,
    required this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: 10, bottom: 10),
        width: 70,
        height: 70,
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: Color(0xFF158880)),
        child: Center(
          child: Text(
            title,
            style: whiteTextStyle.copyWith(
              fontSize: 22,
              fontWeight: semiBold,
            ),
          ),
        ),
      ),
    );
  }
}
