import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';

import '../../widget/filter_tap_widget.dart';

class UlasanPage extends StatefulWidget {
  const UlasanPage({super.key});

  @override
  State<UlasanPage> createState() => _UlasanPageState();
}

class _UlasanPageState extends State<UlasanPage> {
  bool isVisibelity = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 6),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: whiteColor,
                ),
              ),
              Row(
                children: [
                  Text(
                    ' Ulasan',
                    style:
                        whiteTextStyle.copyWith(fontSize: 20, fontWeight: bold),
                  ),
                  Text(
                    ' Sobat Hey',
                    style: whiteTextStyle.copyWith(
                        fontSize: 20,
                        fontWeight: bold,
                        fontStyle: FontStyle.italic),
                  ),
                ],
              ),
              const SizedBox(
                width: 11,
              ),
            ],
          ),
        ),
        backgroundColor: greenColor,
        actions: [
          SvgPicture.asset('assets/icons/love-grey.svg'),
          const SizedBox(
            width: 21,
          ),
          SvgPicture.asset(
            'assets/icons/share-icons.svg',
            color: whiteColor,
          ),
          const SizedBox(
            width: 21,
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 27, left: 26, right: 26),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      size: 24,
                      color: Color(0xffFFC36A),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      '5.0',
                      style: blackHigtTextStyle.copyWith(fontSize: 30),
                    ),
                    Text(
                      '/5.0',
                      style: subGreyTextStyle.copyWith(
                          fontSize: 12, color: const Color(0XffCCCCCC)),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              '99% Sobat Hey',
                              style: blackHigtTextStyle.copyWith(
                                  fontSize: 12, fontStyle: FontStyle.italic),
                            ),
                            Text(
                              ' merasa puas',
                              style: blackHigtTextStyle.copyWith(fontSize: 12),
                            ),
                            const Icon(Icons.keyboard_arrow_right)
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              '110 rating',
                              style: blackTextStyle.copyWith(
                                  fontSize: 12, fontWeight: regular),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Icon(
                              Icons.circle,
                              size: 6,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              '100 ulasan',
                              style: blackTextStyle.copyWith(
                                  fontSize: 12, fontWeight: regular),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 10),
                        margin: const EdgeInsets.only(right: 3),
                        height: 50,
                        decoration: BoxDecoration(
                          color: whiteColor,
                          border: Border.all(color: const Color(0xffCCCCCC)),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Row(
                          children: [
                            Text(
                              '5.0',
                              style: blackHigtTextStyle.copyWith(fontSize: 18),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Perawatan',
                                  style: blackTextStyle.copyWith(
                                      fontSize: 10, fontWeight: regular),
                                ),
                                Text(
                                  '54 ulasan',
                                  style: subTitleTextStyle.copyWith(
                                      fontSize: 12, fontWeight: regular),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 10),
                        margin: const EdgeInsets.only(right: 3),
                        height: 50,
                        decoration: BoxDecoration(
                          color: whiteColor,
                          border: Border.all(color: const Color(0xffCCCCCC)),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Row(
                          children: [
                            Text(
                              '5.0',
                              style: blackHigtTextStyle.copyWith(fontSize: 18),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Pelayanan',
                                  style: blackTextStyle.copyWith(
                                      fontSize: 10, fontWeight: regular),
                                ),
                                Text(
                                  '16 ulasan',
                                  style: subTitleTextStyle.copyWith(
                                      fontSize: 12, fontWeight: regular),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 10),
                        margin: const EdgeInsets.only(right: 3),
                        height: 50,
                        decoration: BoxDecoration(
                          color: whiteColor,
                          border: Border.all(color: const Color(0xffCCCCCC)),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Row(
                          children: [
                            Text(
                              '5.0',
                              style: blackHigtTextStyle.copyWith(fontSize: 18),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Manajemen',
                                  style: blackTextStyle.copyWith(
                                      fontSize: 10, fontWeight: regular),
                                ),
                                Text(
                                  '54 ulasan',
                                  style: subTitleTextStyle.copyWith(
                                      fontSize: 12, fontWeight: regular),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 14,
                ),
              ],
            ),
          ),
          dividergrey(),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 26, top: 9, right: 26),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 5),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: borderColor,
                        ),
                        borderRadius: BorderRadius.circular(7)),
                    child: Center(
                      child: Text(
                        'Dengan Foto',
                        style: blackRegulerTextStyle.copyWith(fontSize: 15),
                      ),
                    ),
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
                                        'Rating dengan ulasan',
                                        style: blackHigtTextStyle.copyWith(
                                            fontSize: 20),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 39,
                                  ),
                                  const FilterTapRating(
                                    title: '1',
                                  ),
                                  const FilterTapRating(
                                    title: '2',
                                  ),
                                  const FilterTapRating(
                                    title: '3',
                                  ),
                                  const FilterTapRating(
                                    title: '4',
                                  ),
                                  const FilterTapRating(
                                    title: '5',
                                  ),
                                  const ButtonGreenWidget(title: 'Tampilkan')
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
                                        'Topik Ulasan',
                                        style: blackHigtTextStyle.copyWith(
                                            fontSize: 20),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 39,
                                  ),
                                  const FilterTapTreatment(
                                    title: 'Pelayanan',
                                  ),
                                  const FilterTapTreatment(
                                    title: 'Perawatan',
                                  ),
                                  const FilterTapTreatment(
                                    title: 'Manajemen',
                                  ),
                                  const FilterTapTreatment(
                                    title: 'Rating Terendah',
                                  ),
                                  const ButtonGreenWidget(
                                      title: 'Terapkan Filter')
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
                        horizontal: 10,
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
                              'Topik Ulasan',
                              style:
                                  blackRegulerTextStyle.copyWith(fontSize: 15),
                            ),
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          const Icon(Icons.keyboard_arrow_down)
                        ],
                      ),
                    ),
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
                                        'Topik Ulasan',
                                        style: blackHigtTextStyle.copyWith(
                                            fontSize: 20),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 39,
                                  ),
                                  const FilterTapTreatment(
                                    title: 'Paling Membantu',
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
            ),
          ),
          Padding(
            padding: lsymetric.copyWith(top: 19),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 11,
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/images/doctor1.png',
                      width: 40,
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Jessy',
                          style: blackHigtTextStyle.copyWith(fontSize: 15),
                        ),
                        Text(
                          'Perawatan Peeling TCA Ringan',
                          style: blackHigtTextStyle.copyWith(
                              fontSize: 13, fontWeight: regular),
                        ),
                      ],
                    ),
                    const Spacer(),
                    const Icon(Icons.more_vert)
                  ],
                ),
                const SizedBox(
                  height: 13,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      size: 12,
                      color: Color(0xffFFC36A),
                    ),
                    const Icon(
                      Icons.star,
                      size: 12,
                      color: Color(0xffFFC36A),
                    ),
                    const Icon(
                      Icons.star,
                      size: 12,
                      color: Color(0xffFFC36A),
                    ),
                    const Icon(
                      Icons.star,
                      size: 12,
                      color: Color(0xffFFC36A),
                    ),
                    const Icon(
                      Icons.star,
                      size: 12,
                      color: Color(0xffFFC36A),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Text(
                      '1 Bulan Yang lalu',
                      style: blackHigtTextStyle.copyWith(
                          fontSize: 12, fontWeight: regular),
                    )
                  ],
                ),
                const SizedBox(
                  height: 13,
                ),
                Text(
                  'Makasih buat dokter dan beautician nya yang ramah. Puas banget perawatan disini, jerawatku makin sirnaaaa.',
                  style: greyTextStyle.copyWith(
                      fontSize: 13, color: const Color(0xff6B6B6B)),
                ),
                const SizedBox(
                  height: 13,
                ),
                Image.asset(
                  'assets/images/review-wajah.png',
                  width: 72,
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/icons/like.png',
                      width: 15,
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    Text(
                      'Membantu',
                      style: blackRegulerTextStyle.copyWith(fontSize: 13),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isVisibelity = !isVisibelity;
                        });
                      },
                      child: Row(
                        children: [
                          Text(
                            'Liat Balesan',
                            style: blackRegulerTextStyle.copyWith(fontSize: 13),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          const Icon(
                            Icons.keyboard_arrow_down,
                            color: Color(0xff6B6B6B),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
          const dividergreen(),
          Padding(
            padding: lsymetric,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 11,
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/images/doctor1.png',
                      width: 40,
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Jessy',
                          style: blackHigtTextStyle.copyWith(fontSize: 15),
                        ),
                        Text(
                          'Perawatan Peeling TCA Ringan',
                          style: blackHigtTextStyle.copyWith(
                              fontSize: 13, fontWeight: regular),
                        ),
                      ],
                    ),
                    const Spacer(),
                    const Icon(Icons.more_vert)
                  ],
                ),
                const SizedBox(
                  height: 13,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      size: 12,
                      color: Color(0xffFFC36A),
                    ),
                    const Icon(
                      Icons.star,
                      size: 12,
                      color: Color(0xffFFC36A),
                    ),
                    const Icon(
                      Icons.star,
                      size: 12,
                      color: Color(0xffFFC36A),
                    ),
                    const Icon(
                      Icons.star,
                      size: 12,
                      color: Color(0xffFFC36A),
                    ),
                    const Icon(
                      Icons.star,
                      size: 12,
                      color: Color(0xffFFC36A),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Text(
                      '1 Bulan Yang lalu',
                      style: blackHigtTextStyle.copyWith(
                          fontSize: 12, fontWeight: regular),
                    )
                  ],
                ),
                const SizedBox(
                  height: 13,
                ),
                Text(
                  'Makasih buat dokter dan beautician nya yang ramah. Puas banget perawatan disini, jerawatku makin sirnaaaa.',
                  style: greyTextStyle.copyWith(
                      fontSize: 13, color: const Color(0xff6B6B6B)),
                ),
                const SizedBox(
                  height: 13,
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/icons/like.png',
                      width: 15,
                      color: greenColor,
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    Text(
                      '6 orang terbantu',
                      style: grenTextStyle.copyWith(
                          fontSize: 13, fontWeight: regular),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isVisibelity = !isVisibelity;
                        });
                      },
                      child: Row(
                        children: [
                          isVisibelity
                              ? Text(
                                  'Liat Balesan',
                                  style: blackRegulerTextStyle.copyWith(
                                      fontSize: 13),
                                )
                              : Text(
                                  'Tutup Balasan',
                                  style: blackRegulerTextStyle.copyWith(
                                      fontSize: 13),
                                ),
                          const SizedBox(
                            width: 4,
                          ),
                          const Icon(
                            Icons.keyboard_arrow_down,
                            color: Color(0xff6B6B6B),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Visibility(
                  visible: isVisibelity,
                  child: Row(
                    children: [
                      Container(
                        height: 60,
                        width: 2,
                        decoration: BoxDecoration(color: greenColor),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Klinik Utama Lithea',
                                  style: blackHigtTextStyle.copyWith(
                                      fontSize: 13, color: subTitleColor),
                                ),
                                Text(
                                  ' 1 bulan lalu',
                                  style: blackRegulerTextStyle.copyWith(
                                      color: subTitleColor, fontSize: 13),
                                )
                              ],
                            ),
                            Text(
                              'Terima kasih telah melakukan perawatan di Klinik Utama Lithea. Ditunggu kedatangan selanjutnya yaa kak :) ',
                              style: subTitleTextStyle,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
