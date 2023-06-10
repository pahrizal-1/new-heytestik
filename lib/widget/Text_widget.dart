import 'package:flutter/material.dart';

import '../theme/theme.dart';

class TextSpaceBetween extends StatelessWidget {
  final String title;
  final String? title2;
  const TextSpaceBetween({
    Key? key,
    required this.title,
    this.title2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: subGreyTextStyle.copyWith(
              fontSize: 14, color: Color(0XFF323232), fontWeight: regular),
        ),
        Text(
          title2.toString(),
          style: subGreyTextStyle.copyWith(fontSize: 14),
        ),
      ],
    );
  }
}

class TextBoldSpacebetwen extends StatelessWidget {
  final String title;
  final String? title1;
  final String title2;
  const TextBoldSpacebetwen(
      {super.key, required this.title, this.title1, required this.title2});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                title,
                style: subGreyTextStyle.copyWith(
                    fontSize: 15,
                    color: Color(0XFF323232),
                    fontWeight: regular),
              ),
              Text(
                title1.toString(),
                style: blackHigtTextStyle.copyWith(fontSize: 15),
              ),
            ],
          ),
          Text(
            title2,
            style: blackHigtTextStyle.copyWith(fontSize: 14),
            textAlign: TextAlign.end,
          ),
        ],
      ),
    );
  }
}
