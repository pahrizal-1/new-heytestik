import 'package:flutter/cupertino.dart';

import '../theme/theme.dart';

class PromoVocer extends StatelessWidget {
  final String title;
  final String subTitle;
  final Color bgColor;
  const PromoVocer({
    super.key,
    required this.title,
    required this.subTitle,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 87, top: 18, bottom: 18),
      margin: const EdgeInsets.only(top: 13, bottom: 10),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(7),
        border: Border.all(
          color: const Color(0xffcccccc),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: blackTextStyle.copyWith(fontSize: 15),
          ),
          const SizedBox(
            height: 6,
          ),
          Row(
            children: [
              Image.asset(
                'assets/icons/logojam.png',
                width: 10,
                color: greyColor,
              ),
              const SizedBox(
                width: 2,
              ),
              Text.rich(
                TextSpan(
                  text: subTitle,
                  style: greyTextStyle.copyWith(
                      fontSize: 13, color: const Color(0xff9B9B9B)),
                  children: [
                    TextSpan(
                        text: 'Lihat detail',
                        style: grenTextStyle.copyWith(fontSize: 13))
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
