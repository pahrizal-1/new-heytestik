// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:heystetik_mobileapps/core/currency_format.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import '../../models/clinic.dart';

class CardTreatment extends StatelessWidget {
  final String namaKlink;
  final String urlImg;
  final String rating;
  final String km;
  final String? buttonTitle;
  List<Treatments> treatments;
  CardTreatment({
    super.key,
    required this.namaKlink,
    required this.rating,
    required this.km,
    this.buttonTitle = '',
    required this.urlImg,
    required this.treatments,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 19, left: 25),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 93,
                      height: 93,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(urlImg),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 18,
                    ),
                    Expanded(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              namaKlink,
                              style: blackTextStyle.copyWith(fontSize: 16),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            SvgPicture.asset('assets/icons/dolar-icons.svg'),
                            const SizedBox(
                              height: 6,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: yellowColor,
                                  size: 18,
                                ),
                                Text(
                                  rating,
                                  style: subGreyTextStyle.copyWith(
                                      fontSize: 11,
                                      color: const Color(0xff9B9B9B)),
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                Image.asset(
                                  'assets/icons/mapgrey.png',
                                  width: 9,
                                ),
                                Text(
                                  ' $km',
                                  style: subGreyTextStyle.copyWith(
                                      fontSize: 11,
                                      color: const Color(0xff9B9B9B)),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 11,
                            ),
                            if (treatments.isNotEmpty)
                              Row(
                                children: [
                                  SvgPicture.asset('assets/icons/check.svg'),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  Text(
                                    'Ketemu ${treatments.length} Treatment',
                                    style: blackHigtTextStyle.copyWith(
                                        fontSize: 11),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          if (treatments.isNotEmpty)
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.only(left: 115, top: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...treatments.map((val) {
                      return ScrollTreatmentCard(treat: val);
                    })
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }
}

class ScrollTreatmentCard extends StatelessWidget {
  const ScrollTreatmentCard({
    super.key,
    required this.treat,
  });

  final Treatments treat;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 7, right: 10, top: 6, bottom: 6),
      height: 62,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(
                  "${Global.FILE}/${treat.mediaTreatments?[0].media?.path}",
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 6,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                treat.name ?? '-',
                style: blackRegulerTextStyle.copyWith(
                    color: blackColor, fontSize: 12),
              ),
              Row(
                children: [
                  Text(
                    CurrencyFormat.convertToIdr(treat.price, 0),
                    style: blackHigtTextStyle.copyWith(
                        color: const Color(0xff323232), fontSize: 12),
                  ),
                  // const SizedBox(
                  //   width: 4,
                  // ),
                  // Container(
                  //   width: 28,
                  //   height: 13,
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(3),
                  //       color: const Color.fromRGBO(201, 42, 42, 0.2)),
                  //   child: Center(
                  //     child: Text(
                  //       '20%',
                  //       style: blackHigtTextStyle.copyWith(
                  //           color: redColor, fontSize: 11),
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(
                  //   width: 4,
                  // ),
                  // Text(
                  //   'Rp250,000',
                  //   style: subGreyTextStyle.copyWith(
                  //     fontSize: 12,
                  //     decoration: TextDecoration.lineThrough,
                  //     decorationThickness: 2,
                  //     color: const Color(0xff9B9B9B),
                  //   ),
                  // ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: yellowColor,
                    size: 18,
                  ),
                  Text(
                    treat.rating.toString(),
                    style: subGreyTextStyle.copyWith(
                        fontSize: 11, color: const Color(0xff9B9B9B)),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
