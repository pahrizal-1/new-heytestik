import 'package:flutter/cupertino.dart';

import '../theme/theme.dart';

class PotoJourney extends StatelessWidget {
  const PotoJourney({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/wajah.png',
          width: 169,
          height: 338,
        ),
        Positioned(
          top: 292.2,
          child: Container(
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(86),
                bottomRight: Radius.circular(86),
              ),
            ),
            padding: const EdgeInsets.only(left: 6, top: 7),
            height: 36,
            width: 110,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'My Journey - Jerawat',
                  style: blackTextStyle.copyWith(fontSize: 8.67),
                ),
                Text(
                  '12 Feb 2023; 17:30 WIB',
                  style: blackRegulerTextStyle.copyWith(fontSize: 8.67),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
