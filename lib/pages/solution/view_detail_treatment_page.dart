import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:heystetik_mobileapps/pages/solution/reservasi_page.dart';
import 'package:heystetik_mobileapps/pages/solution/ulasan_solution_page.dart';

import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';

import 'package:heystetik_mobileapps/widget/more_dialog_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../widget/produk_widget.dart';
import '../../widget/share_solusion_widget_page.dart';
import '../../widget/text_form_widget.dart';

class BokingTreatment extends StatefulWidget {
  const BokingTreatment({super.key});

  @override
  State<BokingTreatment> createState() => _BokingTreatmentState();
}

class _BokingTreatmentState extends State<BokingTreatment> {
  int activeIndex = 0;
  final images = [
    'assets/images/boking_image.png',
    'assets/images/boking-image1.png',
  ];
  int currentIndex = 0;
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
              const SizedBox(
                width: 11,
              ),
            ],
          ),
        ),
        backgroundColor: greenColor,
        actions: [
          SvgPicture.asset(
            'assets/icons/love-grey.svg',
            color: whiteColor,
          ),
          const SizedBox(
            width: 21,
          ),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                isDismissible: false,
                context: context,
                backgroundColor: Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.only(
                    topEnd: Radius.circular(25),
                    topStart: Radius.circular(25),
                  ),
                ),
                builder: (context) => ShareShowWidget(),
              );
            },
            child: SvgPicture.asset(
              'assets/icons/share-icons.svg',
              color: whiteColor,
            ),
          ),
          const SizedBox(
            width: 21,
          ),
        ],
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              CarouselSlider.builder(
                itemCount: images.length,
                itemBuilder: (context, index, realIndex) {
                  final imge = images[index];

                  return buildImage(imge, index);
                },
                options: CarouselOptions(
                  height: 390,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) =>
                      setState(() => activeIndex = index),
                ),
              ),
              Positioned(
                left: 180,
                bottom: 5,
                child: AnimatedSmoothIndicator(
                  activeIndex: activeIndex,
                  count: images.length,
                  effect: JumpingDotEffect(
                      activeDotColor: greenColor,
                      dotColor: whiteColor,
                      dotWidth: 10,
                      dotHeight: 10),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 36,
              left: 20,
              right: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/icons/logo-icon-treatment.png',
                      width: 32,
                    ),
                    const SizedBox(
                      width: 17,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Klinik Utama Lithea',
                          style: blackHigtTextStyle.copyWith(fontSize: 20),
                        ),
                        Text(
                          'DKI Jakarta, Jakarta Selatan',
                          style: subTitleTextStyle.copyWith(fontSize: 12),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 27,
                ),
                Text(
                  'Peeling TCA Ringan',
                  style: blackTextStyle.copyWith(fontWeight: medium),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  'Tindakan menggunakan cairan peeling yang oleskan ke area tertentu. Pemilihan cairan peeling disesuaikan dengan jenis kulit (Berjerawat, flek hitam, bekas jerawat). Berfungsi untuk mengangkat sel-sel kulit mati, mengatasi jerawat, mencerahkan dan meremajakan kulit.',
                  style: TextStyle(color: subTitleColor, fontSize: 12),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  'Rp363.000',
                  style: subGreyTextStyle.copyWith(
                    fontSize: 12,
                    decoration: TextDecoration.lineThrough,
                    decorationThickness: 2,
                    color: const Color(0xff9B9B9B),
                  ),
                ),
                Text.rich(
                  TextSpan(
                    text: '20%',
                    style: grenTextStyle.copyWith(fontSize: 18),
                    children: [
                      TextSpan(
                        text: ' Rp.290.400',
                        style: blackHigtTextStyle.copyWith(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  children: [
                    Container(
                      height: 24,
                      width: 87,
                      decoration: BoxDecoration(
                        color: const Color(0xffF1F1F1),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Center(
                        child: Text(
                          'Dapat Refund',
                          style: blackTextStyle.copyWith(
                              fontWeight: regular, fontSize: 10),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    Container(
                      height: 24,
                      width: 87,
                      decoration: BoxDecoration(
                        color: const Color(0xffF1F1F1),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Center(
                        child: Text(
                          'Dapat Refund',
                          style: blackTextStyle.copyWith(
                              fontWeight: regular, fontSize: 10),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 23,
                ),
                Container(
                  height: 37,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(36, 167, 160, 0.2),
                      borderRadius: BorderRadius.circular(7)),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/icons/persen_icons.png',
                        width: 25,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Periode Promo',
                        style: grenTextStyle.copyWith(fontSize: 13),
                      ),
                      const Spacer(),
                      Text(
                        '01 Mei 2023 - 30 Juni 2023',
                        style: subTitleTextStyle.copyWith(
                            fontSize: 13, color: const Color(0xff323232)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 29,
                ),
                TextFromPerawat(
                  title: 'Detail Perawatan',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => const DetailMoreDialogFilter(),
                    );
                  },
                ),
                const SizedBox(
                  height: 6,
                ),
                const TextFromPerawat(
                  title: 'Jadwal Ulang Perawatan',
                ),
                const SizedBox(
                  height: 6,
                ),
                const TextFromPerawat(
                  title: 'Pengembalian Dana',
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 21,
          ),
          const dividergreen(),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
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
                  height: 20,
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Ulasan',
                          style: blackHigtTextStyle.copyWith(fontSize: 18),
                        ),
                        Text(
                          ' Sobat Hey',
                          style: blackHigtTextStyle.copyWith(
                              fontSize: 18, fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UlasanPage()));
                      },
                      child: Text(
                        'Lihat Semua',
                        style: grenTextStyle.copyWith(fontSize: 12),
                      ),
                    ),
                  ],
                ),
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
                  height: 22,
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 6,
            color: Color(0xffF1F1F1),
          ),
          const SizedBox(
            height: 26,
          ),
          Padding(
            padding: lsymetric,
            child: Text(
              'Perawatan lain di Klinik Utama Lithea',
              style: blackTextStyle.copyWith(fontSize: 15),
            ),
          ),
          const SizedBox(
            height: 17,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: lsymetric,
              child: Row(
                children: const [
                  ProdukTreatment(
                    namaKlinik: 'Klinik Utama Lithea',
                    namaTreatmen: 'Radiant Glow Peeling',
                    diskonProduk: '20',
                    hargaDiskon: 'Rp250.000',
                    harga: '200.000',
                    urlImg: 'assets/images/lheatea.png',
                    rating: '4.9 (120k)',
                    km: '80',
                    lokasiKlinik: 'Bogor Timur',
                  ),
                  ProdukTreatment(
                    namaKlinik: 'ZAP Plaza Senayan',
                    namaTreatmen: 'Toning Laser',
                    diskonProduk: '20',
                    hargaDiskon: '1,250.000',
                    harga: '1,200.000',
                    urlImg: 'assets/images/zap-senayan.png',
                    rating: '4.9 (120k)',
                    km: '80',
                    lokasiKlinik: 'Bogor Timur',
                  ),
                  ProdukTreatment(
                    namaKlinik: 'ZAP Plaza Senayan',
                    namaTreatmen: 'IPL Rejuvenation',
                    diskonProduk: '20',
                    hargaDiskon: '100,000.000',
                    harga: '10,200.000',
                    urlImg: 'assets/images/Ipl1.png',
                    rating: '4.9 (120k)',
                    km: '80',
                    lokasiKlinik: 'Bogor Timur',
                  ),
                  ProdukTreatment(
                    namaKlinik: 'Klinik Utama Lithea',
                    namaTreatmen: 'Radiant Glow Peeling',
                    diskonProduk: '20',
                    hargaDiskon: '250.000',
                    harga: '200.000',
                    urlImg: 'assets/images/laser1.png',
                    rating: '4.9 (120k)',
                    km: '80',
                    lokasiKlinik: 'Bogor Timur',
                  ),
                  ProdukTreatment(
                    namaKlinik: 'Klinik Utama Lithea',
                    namaTreatmen: 'Radiant Glow Peeling',
                    diskonProduk: '20',
                    hargaDiskon: '250.000',
                    harga: '200.000',
                    urlImg: 'assets/images/laser2.png',
                    rating: '4.9 (120k)',
                    km: '80',
                    lokasiKlinik: 'Bogor Timur',
                  ),
                  ProdukTreatment(
                    namaKlinik: 'Klinik Utama Lithea',
                    namaTreatmen: 'Radiant Glow Peeling',
                    diskonProduk: '20',
                    hargaDiskon: '250.000',
                    harga: '200.000',
                    urlImg: 'assets/images/lheatea.png',
                    rating: '4.9 (120k)',
                    km: '80',
                    lokasiKlinik: 'Bogor Timur',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Wrap(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 25, right: 25, bottom: 15, top: 15),
            child: Row(
              children: [
              
               
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ReservasiPage()));
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      width: 142,
                      decoration: BoxDecoration(
                          color: greenColor,
                          border: Border.all(color: greenColor),
                          borderRadius: BorderRadius.circular(7)),
                      height: 50,
                      child: Center(
                        child: Text(
                          'Reservasi',
                          style: whiteTextStyle.copyWith(
                              fontSize: 15, fontWeight: bold),
                        ),
                      ),
                    ),
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

Widget buildImage(String images, int index) => Image.asset(
      images,
      fit: BoxFit.cover,
    );
