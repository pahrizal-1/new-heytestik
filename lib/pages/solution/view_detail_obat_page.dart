import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:heystetik_mobileapps/widget/Text_widget.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import 'package:heystetik_mobileapps/widget/produk_widget.dart';

import '../../theme/theme.dart';
import '../../widget/pencarian_search_widget.dart';
import '../../widget/share_solusion_widget_page.dart';
import '../setings&akun/akun_home_page.dart';
import 'keranjang_page.dart';

class DetailObatPage extends StatelessWidget {
  const DetailObatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XffFFFFFF),
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
              Expanded(
                child: Text(
                  'Noroid Soothing Cream',
                  style: blackTextStyle.copyWith(
                      fontSize: 20, overflow: TextOverflow.ellipsis),
                ),
              )
            ],
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PencarianPageWidget(),
                ),
              );
            },
            child: SvgPicture.asset(
              'assets/icons/search.svg',
            ),
          ),
          const SizedBox(
            width: 14,
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
                builder: (context) => const ShareShowWidget(),
              );
            },
            child: SvgPicture.asset(
              'assets/icons/share-icons.svg',
            ),
          ),
          const SizedBox(
            width: 14,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const KeranjangPage()));
            },
            child: SvgPicture.asset(
              'assets/icons/trello-icons.svg',
            ),
          ),
          const SizedBox(
            width: 14,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AkunHomePage()));
            },
            child: SvgPicture.asset(
              'assets/icons/humberger-icons.svg',
            ),
          ),
          const SizedBox(
            width: 26,
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            height: 375,
            width: 390,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/images/salep_bg.png',
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 12, left: 24, right: 24, bottom: 17),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Rp136.000',
                      style: blackHigtTextStyle.copyWith(fontSize: 20),
                    ),
                    const Spacer(),
                    SvgPicture.asset(
                      'assets/icons/love-icons.svg',
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Noroid Soothing Cream 200ml',
                  style: blackRegulerTextStyle.copyWith(color: blackColor),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Text(
                      'Terjual 3.002',
                      style: blackRegulerTextStyle.copyWith(color: blackColor),
                    ),
                    const SizedBox(
                      width: 9,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                      decoration: BoxDecoration(
                        border: Border.all(color: borderColor),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/stars.svg',
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            '4.9',
                            style: blackHigtTextStyle.copyWith(fontSize: 13),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            '(1600)',
                            style: blackRegulerTextStyle.copyWith(fontSize: 13),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Stack(
                  children: [
                    Image.asset(
                      'assets/icons/coupon 2.png',
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                        left: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/dicon1.svg',
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Ada Promo Spesial',
                                style:
                                    blackHigtTextStyle.copyWith(fontSize: 15),
                              ),
                              Text(
                                'Masih ada 6 kupon promo buat kamu!',
                                style: subTitleTextStyle,
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          SvgPicture.asset(
                            'assets/icons/arrow-left.svg',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const dividergreen(),
          Padding(
            padding:
                const EdgeInsets.only(top: 12, left: 24, right: 24, bottom: 17),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Detail Produk',
                  style: blackHigtTextStyle.copyWith(fontSize: 18),
                ),
                const SizedBox(
                  height: 12,
                ),
                TitleDetail(
                  ontap: () {},
                  title1: 'Concern',
                  title2: 'Bekas Jerawat, Kulit Kering',
                  textColor: greenColor,
                ),
                TitleDetail(
                  title1: 'Bentuk Obat',
                  title2: 'Krim',
                  textColor: blackColor,
                  fontWeight: regular,
                ),
                TitleDetail(
                  title1: 'No. BPOM',
                  title2: 'DKL8817605529A1',
                  textColor: blackColor,
                  fontWeight: regular,
                ),
                TitleDetail(
                  title1: 'Manufaktur',
                  title2: 'Interbat',
                  textColor: blackColor,
                  fontWeight: regular,
                ),
                const SizedBox(
                  height: 16,
                ),
                DescripsiText(
                  title1: 'Deskripsi',
                  subtitle2:
                      'DIGENTA CREAM adalah obat oles yang mengandung Gentamycin 0.1% dan Betamethasone 0.05%. Obat ini digunakan untuk pengobatan penyakit kulit seperti inflamasi pada dermatosis yang peka terhadap kortikosteroid dan disertai oleh infeksi sekunder oleh bakteri tertentu. Dalam penggunaan obat ini HARUS SESUAI DENGAN PETUNJUK DOKTER.',
                ),
                DescripsiText(
                  title1: 'Indikasi',
                  subtitle2:
                      'INFORMASI OBAT INI HANYA UNTUK KALANGAN MEDIS. Dermatosis yang responsif terhadap Kortikosteroid dengan komplikasi infeksi sekunder.',
                ),
                DescripsiText(
                  title1: 'Komposisi',
                  subtitle2:
                      'Betamethasone Dipropionate 0.05%, Gentamicin Sulfate 0.1%',
                ),
                DescripsiText(
                  title1: 'Dosis & Aturan Pakai',
                  subtitle2:
                      'PENGGUNAAN OBAT INI HARUS SESUAI DENGAN PETUNJUK DOKTER. Oleskan krim 2x sehari pada area kulit yang radang/sakit.',
                ),
                DescripsiText(
                  title1: 'Perhatian',
                  subtitle2:
                      'HARUS DENGAN RESEP DOKTER. Jangan terkena mata, mulut dan membran mukosa lain. Hindari pemakaian yang luas atau lama pada kehamilan & menyusui. Pada penggunaan yang lama dari preparat yang mengandung antibiotika dapat menimbulkan pertumbuhan organisme yang tidak peka terutama jamur. Bila terjadi superinfeksi selama pengobatan, maka harus disertai dengan terapi yang tepat. Bila terjadi reaksi iritasi atau sensitisasi, hentikan pengobatannya.',
                ),
                DescripsiText(
                  title1: 'Kontra indikasi',
                  subtitle2:
                      'Infeksi virus dan TBC. Hipersensitivitas terhadap komponen dalam produk.',
                ),
                DescripsiText(
                  title1: 'Efek Samping',
                  subtitle2:
                      'Erupsi yang menyerupai jerawat, hipopigmentasi, atrofi kulit, striae. Iritasi atau sensitisasi (hentikan pemakaian).',
                ),
              ],
            ),
          ),
          const dividergreen(),
          const SizedBox(
            height: 18,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Obat Rekomendasi lainnya',
                  style: blackHigtTextStyle.copyWith(fontSize: 18),
                ),
                const SizedBox(
                  height: 18,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: const [
                      ProdukObat(
                        namaBrand: 'Noroid Soothing Cream 200ml',
                        harga: 'Rp152.500',
                        urlImg: 'assets/images/noroid1.png',
                      ),
                      ProdukObat(
                        namaBrand: 'Noroid Soothing Cream 200ml',
                        harga: 'Rp152.500',
                        urlImg: 'assets/images/noroid1.png',
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Wrap(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 10),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      width: 142,
                      decoration: BoxDecoration(
                          color: greenColor,
                          border: Border.all(color: greenColor),
                          borderRadius: BorderRadius.circular(7)),
                      height: 40,
                      child: Center(
                        child: Text(
                          'Konsultasi Dulu',
                          style: whiteTextStyle.copyWith(
                              fontSize: 15, fontWeight: bold),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: greenColor),
                          borderRadius: BorderRadius.circular(7)),
                      height: 40,
                      child: Center(
                        child: Text(
                          'Beli Langsung',
                          style: grenTextStyle.copyWith(
                              fontSize: 15, fontWeight: bold),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 6,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
