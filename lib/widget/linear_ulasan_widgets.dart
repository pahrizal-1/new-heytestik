import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:percent_indicator/percent_indicator.dart';

class LinearUlasan extends StatelessWidget {
  const LinearUlasan({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            'assets/icons/stars-new.png',
            width: 16,
            height: 15,
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        Text(
          '5',
          style: blackHigtTextStyle.copyWith(
            fontSize: 15,
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        LinearPercentIndicator(
          lineHeight: 5,
          width: 250,
          animation: true,
          animationDuration: 2500,
          percent: 0.5,
          progressColor: const Color(0xffFFC36A),
        ),
        const SizedBox(
          width: 12,
        ),
        Text(
          '122',
          style: subTitleTextStyle.copyWith(
            fontSize: 12,
          ),
        )
      ],
    );
  }
}
