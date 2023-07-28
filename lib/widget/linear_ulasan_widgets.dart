import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:percent_indicator/percent_indicator.dart';

class LinearUlasan extends StatelessWidget {
  final String bintang;
  final double height;
  final String jumlah;
  const LinearUlasan({
    super.key,
    required this.bintang,
    required this.height,
    required this.jumlah,
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
          bintang,
          style: blackHigtTextStyle.copyWith(
            fontSize: 15,
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        LinearPercentIndicator(
          lineHeight: 4,
          width: 250,
          animation: true,
          animationDuration: 2600,
          percent: height,
          progressColor: const Color(0xffFFC36A),
        ),
        const SizedBox(
          width: 12,
        ),
        Text(
          jumlah,
          style: subTitleTextStyle.copyWith(
            fontSize: 12,
          ),
        )
      ],
    );
  }
}
