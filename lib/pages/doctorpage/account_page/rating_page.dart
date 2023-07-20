import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import 'package:heystetik_mobileapps/widget/linear_ulasan_widgets.dart';
import 'package:heystetik_mobileapps/widget/rating_dengan_ulasan_widgets.dart';
import 'package:heystetik_mobileapps/widget/show_modal_dialog.dart';

import '../../../widget/button_widget.dart';
import '../../../widget/filter_tap_widget.dart';

class RatingPage extends StatefulWidget {
  const RatingPage({super.key});

  @override
  State<RatingPage> createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: greenColor,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    size: 22,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Rating & Ulasan Pasien',
                  style: TextStyle(
                    fontFamily: 'ProximaNova',
                    fontWeight: bold,
                    fontSize: 20,
                    color: whiteColor,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
            bottom: 35,
          ),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  customeshomodal(
                    context,
                    Wrap(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 36,
                            left: 33,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Image.asset(
                                  'assets/icons/danger-icons.png',
                                  width: 20,
                                  height: 20,
                                ),
                              ),
                              const SizedBox(
                                height: 22,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '98%',
                                    style: blackHigtTextStyle.copyWith(
                                        fontSize: 38),
                                  ),
                                  const SizedBox(
                                    width: 9,
                                  ),
                                  Text(
                                    'pasien puas melakukan\nkonsultasi dengan Anda',
                                    style:
                                        blackTextStyle.copyWith(fontSize: 20),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              Text(
                                'Dihitung dari jumlah rating positif (bintang 4 dan 5)\ndibagi dengan total rating',
                                style: subTitleTextStyle.copyWith(
                                  fontSize: 13,
                                ),
                              ),
                              const SizedBox(
                                height: 19,
                              ),
                              const LinearUlasan(
                                bintang: '5',
                                jumlah: '122',
                                height: 0.9,
                              ),
                              const SizedBox(
                                height: 9,
                              ),
                              const LinearUlasan(
                                bintang: '4',
                                jumlah: '90',
                                height: 0.7,
                              ),
                              const SizedBox(
                                height: 9,
                              ),
                              const LinearUlasan(
                                bintang: '3',
                                jumlah: '10',
                                height: 0.1,
                              ),
                              const SizedBox(
                                height: 9,
                              ),
                              const LinearUlasan(
                                bintang: '2',
                                jumlah: '100',
                                height: 0.9,
                              ),
                              const SizedBox(
                                height: 9,
                              ),
                              const LinearUlasan(
                                bintang: '1',
                                jumlah: '20',
                                height: 0.1,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    border:
                        Border.all(width: 0.5, color: fromCssColor('#A3A3A3')),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '98% Pasien Merasa Puas',
                              style: TextStyle(
                                fontSize: 15,
                                letterSpacing: 0.2,
                                fontWeight: bold,
                                fontFamily: 'ProximaNova',
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              '122K rating . 120K Ulasan',
                              style: TextStyle(
                                fontSize: 13,
                                color: fromCssColor('#A3A3A3'),
                                letterSpacing: 0.2,
                                fontFamily: 'ProximaNova',
                              ),
                            ),
                          ],
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 11,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      customeshomodal(
                          context, const RatingDenganUlasanWidgets());
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 5),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: borderColor,
                          ),
                          borderRadius: BorderRadius.circular(7)),
                      child: Row(
                        children: [
                          Center(
                            child: Text(
                              'Rating',
                              style:
                                  blackRegulerTextStyle.copyWith(fontSize: 15),
                            ),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          const Icon(Icons.keyboard_arrow_down)
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.white,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.only(
                            topEnd: Radius.circular(25),
                            topStart: Radius.circular(25),
                          ),
                        ),
                        builder: (context) => Wrap(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 33, right: 33, top: 30, bottom: 40),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/icons/danger-icons.png',
                                        width: 12,
                                      ),
                                      const SizedBox(
                                        width: 22,
                                      ),
                                      Text(
                                        'Urutan',
                                        style: blackHigtTextStyle.copyWith(
                                            fontSize: 20),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 39,
                                  ),
                                  const FilterTapTreatment(
                                    title: 'Terbaru',
                                  ),
                                  const FilterTapTreatment(
                                    title: 'Rating Tertinggi',
                                  ),
                                  const FilterTapTreatment(
                                    title: 'Rating Terendah',
                                  ),
                                  const ButtonGreenWidget(
                                    title: 'Tampilkan',
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 5),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: borderColor,
                          ),
                          borderRadius: BorderRadius.circular(7)),
                      child: Row(
                        children: [
                          Center(
                            child: Text(
                              'Urutan',
                              style:
                                  blackRegulerTextStyle.copyWith(fontSize: 15),
                            ),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          const Icon(Icons.keyboard_arrow_down)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 17,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'dilla btw',
                        style: blackTextStyle.copyWith(fontSize: 15),
                      ),
                      const Spacer(),
                      Text(
                        '7 hari lalu',
                        style: subTitleTextStyle.copyWith(fontSize: 12),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/icons/stars-new.png',
                        width: 13,
                        height: 12,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Image.asset(
                        'assets/icons/stars-new.png',
                        width: 13,
                        height: 12,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Image.asset(
                        'assets/icons/stars-new.png',
                        width: 13,
                        height: 12,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Image.asset(
                        'assets/icons/stars-new.png',
                        width: 13,
                        height: 12,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Image.asset(
                        'assets/icons/stars-new.png',
                        width: 13,
                        height: 12,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Text(
                    'Dokternya helpful bangeeeetttt....Makasih ya dok! Semoga muka aku glowingg maksimal!',
                    style: blackRegulerTextStyle.copyWith(
                        fontSize: 13, color: blackColor),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  const dividergreen(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
