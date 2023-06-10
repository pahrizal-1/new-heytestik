import 'package:flutter/material.dart';
import '../pages/chat_customer/boking_trertment_page.dart';
import '../theme/theme.dart';

class ProdukSearcWidget extends StatelessWidget {
  final String grenTitle;
  final String blackTitle;
  final String diskonsTitle;
  final String persenDiskonTitle;
  final String hargaTitle;
  final String img;
  const ProdukSearcWidget({
    Key? key,
    required this.grenTitle,
    required this.blackTitle,
    required this.diskonsTitle,
    required this.persenDiskonTitle,
    required this.hargaTitle,
    required this.img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const BokingTreatment(),
          ),
        );
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 105,
                height: 110,
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(img))),
              ),
              const SizedBox(
                height: 8,
              ),
              Image.asset(
                'assets/images/promo.png',
                width: 105,
              )
            ],
          ),
          const SizedBox(
            width: 13,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                constraints: const BoxConstraints(maxWidth: 200),
                child: RichText(
                  text: TextSpan(
                    text: grenTitle,
                    style: grenTextStyle.copyWith(fontSize: 13),
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                constraints: const BoxConstraints(maxWidth: 193),
                child: RichText(
                  text: TextSpan(
                    text: blackTitle,
                    style: blackTextStyle.copyWith(
                        fontSize: 13, fontWeight: medium),
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Text(
                    '15 Mins',
                    style: subGreyTextStyle.copyWith(fontSize: 12),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: 3,
                    height: 3,
                    decoration:
                        BoxDecoration(color: greyColor, shape: BoxShape.circle),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    '7.3 Km',
                    style: subGreyTextStyle.copyWith(fontSize: 12),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Container(
                    width: 3,
                    height: 3,
                    decoration:
                        BoxDecoration(color: greyColor, shape: BoxShape.circle),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Icon(
                    Icons.star,
                    color: yellowColor,
                    size: 15,
                  ),
                  Text(
                    '5.0 (12)',
                    style: subGreyTextStyle.copyWith(fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                diskonsTitle,
                style: subGreyTextStyle.copyWith(
                  fontSize: 12,
                  decoration: TextDecoration.lineThrough,
                  decorationThickness: 2,
                  color: const Color(0xff9B9B9B),
                ),
              ),
              Text.rich(
                TextSpan(
                  text: persenDiskonTitle,
                  style: grenTextStyle.copyWith(fontSize: 15),
                  children: [
                    TextSpan(
                      text: hargaTitle,
                      style: blackHigtTextStyle.copyWith(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 9,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 100,
                    decoration: BoxDecoration(
                        color: const Color(0xFFF1F1F1),
                        borderRadius: BorderRadius.circular(7)),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    height: 25,
                    child: Text(
                      'Dapat Refund',
                      style: blackTextStyle.copyWith(fontSize: 11),
                    ),
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  Container(
                    width: 100,
                    decoration: BoxDecoration(
                        color: const Color(0xFFF1F1F1),
                        borderRadius: BorderRadius.circular(7)),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    height: 25,
                    child: Text(
                      'Terima Pajak',
                      style: blackTextStyle.copyWith(fontSize: 11),
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
