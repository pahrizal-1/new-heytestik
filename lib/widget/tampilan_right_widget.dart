import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

class TampilanRight extends StatelessWidget {
  const TampilanRight({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 131,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 93,
            height: 93,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              image: const DecorationImage(
                image: AssetImage('assets/images/lheatea1.png'),
              ),
            ),
          ),
          const SizedBox(
            width: 18,
          ),
          Expanded(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 240),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Klinik Utama Lithea',
                    style: blackHigtTextStyle.copyWith(fontSize: 13),
                  ),
                  Text(
                    'Radiant Glow Peeling',
                    style: blackRegulerTextStyle.copyWith(
                        color: blackColor, fontSize: 12),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Text(
                        'Rp200.000',
                        style: blackHigtTextStyle.copyWith(
                            color: const Color(0xff323232), fontSize: 12),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Container(
                        width: 28,
                        height: 13,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: const Color.fromRGBO(201, 42, 42, 0.2)),
                        child: Center(
                          child: Text(
                            '20%',
                            style: blackHigtTextStyle.copyWith(
                                color: redColor, fontSize: 11),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Rp250,000',
                        style: subGreyTextStyle.copyWith(
                          fontSize: 12,
                          decoration: TextDecoration.lineThrough,
                          decorationThickness: 2,
                          color: const Color(0xff9B9B9B),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: yellowColor,
                        size: 18,
                      ),
                      Text(
                        '4.9 (120k)',
                        style: subGreyTextStyle.copyWith(
                            fontSize: 11, color: const Color(0xff9B9B9B)),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Image.asset(
                        'assets/icons/mapgrey.png',
                        width: 10,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        '4,3 km',
                        style: subGreyTextStyle.copyWith(
                            fontSize: 11, color: const Color(0xff9B9B9B)),
                      ),
                      Text(
                        ' . ',
                        style: subGreyTextStyle.copyWith(
                            fontSize: 11, color: const Color(0xff9B9B9B)),
                      ),
                      Text(
                        'Jakarta Selatan',
                        style: subGreyTextStyle.copyWith(
                            fontSize: 11, color: const Color(0xff9B9B9B)),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 47),
                      height: 25,
                      decoration: BoxDecoration(
                          color: greenColor,
                          borderRadius: BorderRadius.circular(3)),
                      child: Center(
                        child: Text(
                          'Resevasi',
                          style: whiteTextStyle.copyWith(fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
