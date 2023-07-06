import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/widget/alert_dialog_ulasan.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';

import '../../theme/theme.dart';

class TulisUlasan2Page extends StatefulWidget {
  const TulisUlasan2Page({super.key});

  @override
  State<TulisUlasan2Page> createState() => _TulisUlasan2PageState();
}

class _TulisUlasan2PageState extends State<TulisUlasan2Page> {
  List<String> titleCirkel = [
    'Kurang dari 1 Minggu',
    '1 Minggu - 1 Bulan',
    '1 - 3 Bulan',
    '3 - 6 Bulan',
    '6 Bulan - 1 Tahun',
    'Lebih dari 1 Tahun',
  ];
  List<String> titleRekomendasi = [
    'Yoi, Pasti dong!',
    'Nggak deh',
  ];
  List<String> iconRekomendasi = [
    'assets/icons/icons-ya.png',
    'assets/icons/icons-tidak.png',
  ];
  List<String> titleProduk = [
    'Yoi, Pasti dong!',
    'Nggak deh',
    'Mungkin',
  ];
  List<String> iconProduk = [
    'assets/icons/icons-ya.png',
    'assets/icons/icons-tidak.png',
    'assets/icons/icons-mungkin.png'
  ];
  int isRekomendasi = 0;
  int isProduk = 0;
  int isSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        automaticallyImplyLeading: false,
        backgroundColor: whiteColor,
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
                  color: blackColor,
                ),
              ),
              const SizedBox(
                width: 11,
              ),
              Text(
                'Tulis Ulasan',
                style: blackTextStyle.copyWith(
                  fontSize: 20,
                ),
              )
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 14),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 5,
                    decoration: BoxDecoration(
                        color: greenColor,
                        borderRadius: BorderRadius.circular(7)),
                  ),
                ),
                const SizedBox(
                  width: 14,
                ),
                Text(
                  '3/3',
                  style: subTitleTextStyle.copyWith(
                      fontSize: 15, fontWeight: bold),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 13),
            width: 390,
            height: 68,
            decoration: BoxDecoration(
              color: subgreenColor,
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Penilaianmu',
                      style: blackRegulerTextStyle.copyWith(
                          fontSize: 15, color: blackColor),
                    ),
                    Text(
                      'Excellent Product!',
                      style: grenTextStyle.copyWith(fontSize: 18),
                    ),
                  ],
                ),
                const Spacer(),
                SvgPicture.asset(
                  'assets/icons/stars.svg',
                  width: 23,
                  color: const Color(0xffFFC36A),
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  '4.7',
                  style: blackHigtTextStyle.copyWith(fontSize: 25),
                ),
              ],
            ),
          ),
          Padding(
            padding: lsymetric.copyWith(top: 22, bottom: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Tulis Ulasan',
                      style: blackTextStyle.copyWith(fontSize: 15),
                    ),
                    const Spacer(),
                    Text(
                      '0/150',
                      style: subTitleTextStyle.copyWith(),
                    )
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 0.5, color: Colors.grey),
                    ),
                  ),
                  child: TextField(
                      decoration: InputDecoration(
                          isDense: true,
                          contentPadding: const EdgeInsets.only(
                            top: 0,
                            bottom: 2,
                          ),
                          hintText:
                              'Ceritakan pengalaman kamu memakai produk ini',
                          hintStyle: subTitleTextStyle,
                          border: InputBorder.none)),
                ),
                Text(
                  'Ulasan minimal 150 karakter',
                  style: blackRegulerTextStyle.copyWith(
                      color: redColor,
                      fontSize: 10,
                      fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ),
          const dividergreen(),
          Padding(
            padding: lsymetric.copyWith(top: 22, bottom: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Berapa lama kamu menggunakan produk ini?',
                  style: blackTextStyle.copyWith(fontSize: 15),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 25,
                bottom: 22,
              ),
              child: Row(
                children: List.generate(titleCirkel.length, (index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        isSelected = index;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 9, vertical: 12),
                      decoration: BoxDecoration(
                          color: isSelected == index ? greenColor : whiteColor,
                          border: Border.all(
                            color:
                                isSelected == index ? greenColor : borderColor,
                          ),
                          borderRadius: BorderRadius.circular(23)),
                      child: Text(
                        titleCirkel[index],
                        style: blackRegulerTextStyle.copyWith(
                          fontSize: 12,
                          color: isSelected == index ? whiteColor : blackColor,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          const dividergreen(),
          Padding(
            padding: lsymetric.copyWith(top: 22, bottom: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tambahkan foto ‘My Journey’?',
                  style: blackTextStyle.copyWith(fontSize: 15),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  'Upload foto before-after setelah menggunakan produk ini untuk melihat perubahan yang terjadi pada kulitmu. ',
                  style: subTitleTextStyle.copyWith(fontSize: 13),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Before',
                  style: blackTextStyle.copyWith(fontSize: 15),
                ),
                SizedBox(
                  height: 10,
                ),
                Wrap(
                  spacing: 4,
                  runSpacing: 4,
                  children: [
                    Container(
                      height: 72,
                      width: 82,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          image: DecorationImage(
                              image: AssetImage('assets/images/before1.png'),
                              fit: BoxFit.cover)),
                    ),
                    Container(
                      height: 72,
                      width: 82,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          image: DecorationImage(
                              image: AssetImage('assets/images/before1.png'),
                              fit: BoxFit.cover)),
                    ),
                    Container(
                      height: 72,
                      width: 82,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          image: DecorationImage(
                              image: AssetImage('assets/images/before1.png'),
                              fit: BoxFit.cover)),
                    ),
                    Container(
                      height: 72,
                      width: 82,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          image: DecorationImage(
                              image: AssetImage('assets/images/before1.png'),
                              fit: BoxFit.cover)),
                    ),
                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => const AlertDialogUlasan(),
                        );
                      },
                      child: Image.asset(
                        'assets/icons/add-poto-icons.png',
                        width: 82,
                        height: 78,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                dividergrey(),
                SizedBox(
                  height: 25,
                ),
                Text(
                  'After',
                  style: blackTextStyle.copyWith(fontSize: 15),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => const AlertDialogUlasan(),
                    );
                  },
                  child: Image.asset(
                    'assets/icons/add-poto-icons.png',
                    width: 82,
                    height: 78,
                  ),
                ),
              ],
            ),
          ),
          dividergreen(),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 25,
                right: 25,
                top: 22,
                bottom: 22,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Apakah kamu akan merekomendasikan\nproduk ini?',
                    style: blackTextStyle.copyWith(fontSize: 15),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: List.generate(
                      2,
                      (index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              isRekomendasi = index;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 8),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 9, vertical: 12),
                            decoration: BoxDecoration(
                                color: isRekomendasi == index
                                    ? greenColor
                                    : whiteColor,
                                border: Border.all(
                                  color: isRekomendasi == index
                                      ? greenColor
                                      : borderColor,
                                ),
                                borderRadius: BorderRadius.circular(23)),
                            child: Row(
                              children: [
                                Image.asset(
                                  iconRekomendasi[index],
                                  width: 13,
                                  color: isRekomendasi == index
                                      ? whiteColor
                                      : blackColor,
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  titleRekomendasi[index],
                                  style: blackRegulerTextStyle.copyWith(
                                    fontSize: 12,
                                    color: isRekomendasi == index
                                        ? whiteColor
                                        : blackColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 23,
                  ),
                  Text(
                    'Apakah kamu akan membeli lagi produk ini?',
                    style: blackTextStyle.copyWith(fontSize: 15),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: List.generate(
                      3,
                      (index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              isProduk = index;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 8),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 9, vertical: 12),
                            decoration: BoxDecoration(
                                color:
                                    isProduk == index ? greenColor : whiteColor,
                                border: Border.all(
                                  color: isProduk == index
                                      ? greenColor
                                      : borderColor,
                                ),
                                borderRadius: BorderRadius.circular(23)),
                            child: Row(
                              children: [
                                Image.asset(
                                  iconProduk[index],
                                  width: 13,
                                  color: isProduk == index
                                      ? whiteColor
                                      : blackColor,
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  titleProduk[index],
                                  style: blackRegulerTextStyle.copyWith(
                                    fontSize: 12,
                                    color: isProduk == index
                                        ? whiteColor
                                        : blackColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: lsymetric.copyWith(bottom: 30),
            child: ButtonGreenWidget(title: 'Kirim'),
          )
        ],
      ),
    );
  }
}
