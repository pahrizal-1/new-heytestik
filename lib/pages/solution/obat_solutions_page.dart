import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';

import '../../theme/theme.dart';
import '../../widget/produk_widget.dart';

class ObatSolutionsPage extends StatelessWidget {
  const ObatSolutionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
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
                'Obat Resep',
                style: blackTextStyle.copyWith(fontSize: 20),
              )
            ],
          ),
        ),
        actions: [
          Image.asset(
            'assets/icons/icon-home.png',
            width: 18,
            color: blackColor,
          ),
          const SizedBox(
            width: 14,
          ),
          Image.asset(
            'assets/icons/trello1.png',
            width: 21,
            color: blackColor,
          ),
          const SizedBox(
            width: 14,
          ),
          Image.asset(
            'assets/icons/humberger.png',
            width: 19,
            color: blackColor,
          ),
          const SizedBox(
            width: 26,
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(56.0),
          child: Container(
            padding:
                const EdgeInsets.only(left: 25, right: 25, bottom: 10, top: 10),
            height: 56.0,
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(
                  color: fromCssColor("#CCCCCC"),
                ),
                borderRadius: BorderRadius.circular(35),
              ),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 10,
                  ),
                  child: Image.asset(
                    'assets/icons/search1.png',
                    width: 10,
                  ),
                ),
                Container(
                  transform: Matrix4.translationValues(0, -3, 0),
                  constraints: const BoxConstraints(maxWidth: 250),
                  child: TextFormField(
                    style: const TextStyle(
                        fontSize: 15, fontFamily: "ProximaNova"),
                    decoration: InputDecoration(
                      hintText: "Cari Treatment",
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        fontFamily: "ProximaNova",
                        color: fromCssColor(
                          '#9B9B9B',
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 21,
                  ),
                  Text(
                    'Obat Resep buat kamu 💊',
                    style: blackHigtTextStyle.copyWith(fontSize: 18),
                  ),
                  Text(
                    'Obat yang sudah diresepkan oleh Dokter',
                    style: subGreyTextStyle.copyWith(
                      fontSize: 14,
                      color: const Color(0xFF9B9B9B),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.only(right: 20, left: 25),
                child: Row(
                  children: [
                    ProdukObat(
                        namaBrand: 'Noroid Soothing Cream 200ml',
                        harga: 'Rp152.500',
                        urlImg: 'assets/images/noroid1.png'),
                    SizedBox(
                      width: 12,
                    ),
                    ProdukObat(
                        namaBrand: 'Digenta Cream 10g\n ',
                        harga: 'Rp152.500',
                        urlImg: 'assets/images/digentasalep.png')
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              height: 34,
              width: 258,
              padding: const EdgeInsets.only(
                top: 8,
                left: 25,
                bottom: 7,
              ),
              decoration: BoxDecoration(
                  color: greenColor,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Text(
                'Obat berdasarkan Concern',
                style: whiteTextStyle.copyWith(fontSize: 16),
              ),
            ),
            const SizedBox(
              height: 22,
            ),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    CirkelCategory(
                      title: 'Lihat\nSemua',
                      img: 'assets/images/lainnya.png',
                    ),
                    CirkelCategory(
                      title: 'Jerawat',
                      img: 'assets/images/jerawat.png',
                    ),
                    CirkelCategory(
                      title: 'Rambut\nRontok',
                      img: 'assets/images/rambutrontok.png',
                    ),
                    CirkelCategory(
                      title: 'Kerutan',
                      img: 'assets/images/kerutan.png',
                    ),
                    CirkelCategory(
                      title: 'Bekas\nJerawat',
                      img: 'assets/images/bekasjerawat.png',
                    ),
                    CirkelCategory(
                      title: 'ketombe',
                      img: 'assets/images/ketombe.png',
                    ),
                    CirkelCategory(
                      title: 'Kebotakan',
                      img: 'assets/images/kebotakan.png',
                    ),
                    CirkelCategory(
                      title: 'Bekas\nJerawat',
                      img: 'assets/images/dagu.png',
                    ),
                    CirkelCategory(
                      title: 'Kulit\nKusam',
                      img: 'assets/images/kulitkusam.png',
                    ),
                    CirkelCategory(
                      title: 'Skin\nGoals',
                      img: 'assets/images/skingoals.png',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            const Divider(
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, top: 26),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Jerawat',
                    style: blackHigtTextStyle.copyWith(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  Image.asset(
                    'assets/icons/filters.png',
                    width: 78,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: [
                      KonsultasProduk(
                        harga: 'Rp200.500',
                        title: 'Digenta Cream 10g\n',
                        imgUrl: 'assets/images/digenta.png',
                      ),
                      KonsultasProduk(
                        harga: 'Rp152.500',
                        title: 'Noroid Soothing Cream 80ml',
                        imgUrl: 'assets/images/noroid.png',
                      ),
                      KonsultasProduk(
                        harga: 'Rp152.500',
                        title: 'Digenta Cream 10g\n',
                        imgUrl: 'assets/images/digenta.png',
                      ),
                      KonsultasProduk(
                        harga: 'Rp1,522.500',
                        title: 'Noroid Soothing Cream 80ml',
                        imgUrl: 'assets/images/noroid.png',
                      ),
                      KonsultasProduk(
                        harga: 'Rp1,522.500',
                        title: 'Noroid Soothing Cream 80ml',
                        imgUrl: 'assets/images/noroid.png',
                      ),
                      KonsultasProduk(
                        harga: 'Rp152.500',
                        title: 'Digenta Cream 10g\n',
                        imgUrl: 'assets/images/digenta.png',
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class KonsultasProduk extends StatelessWidget {
  final String title;
  final String harga;
  final String imgUrl;
  const KonsultasProduk({
    Key? key,
    required this.title,
    required this.harga,
    required this.imgUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 0.2),
        borderRadius: BorderRadius.circular(7),
      ),
      width: 164,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 164,
            decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage(imgUrl), fit: BoxFit.cover),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            padding: const EdgeInsets.only(left: 11, bottom: 11, right: 11),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '$title        ',
                  style: subGreyTextStyle.copyWith(
                      fontSize: 13, color: const Color(0xFF323232)),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  harga,
                  style: blackHigtTextStyle.copyWith(fontSize: 15),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Per Tube',
                  style: subGreyTextStyle.copyWith(
                      fontSize: 12, color: const Color(0xFF9B9B9B)),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Bisa dibeli apabila telah melakukan konsultasi',
                  style: subGreyTextStyle.copyWith(
                    color: const Color(0XFF9B9B9B),
                    fontSize: 11,
                    fontWeight: medium,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  height: 30,
                  decoration: BoxDecoration(
                      border: Border.all(color: greenColor),
                      borderRadius: BorderRadius.circular(7)),
                  child: Center(
                    child: Text(
                      'Harus Dengan Resep Dokter',
                      style: grenTextStyle.copyWith(fontSize: 10),
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

class CirkelCategory extends StatelessWidget {
  final String img;
  final String title;
  const CirkelCategory({
    Key? key,
    required this.img,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(image: AssetImage(img))),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              fontFamily: 'ProximaNova',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
