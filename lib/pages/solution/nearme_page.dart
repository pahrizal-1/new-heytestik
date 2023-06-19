import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/fikter_card_solusions_widget.dart';

import '../../widget/produk_widget.dart';

class NearMePage extends StatefulWidget {
  const NearMePage({super.key});

  @override
  State<NearMePage> createState() => _NearMePageState();
}

class _NearMePageState extends State<NearMePage> {
  bool isSelecteSearch = true;
  bool isSelecteTampilan = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: isSelecteSearch
              ? Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        size: 24,
                        color: blackColor,
                      ),
                    ),
                    const SizedBox(
                      width: 11,
                    ),
                    Text(
                      'Near Me',
                      style: blackTextStyle.copyWith(fontSize: 20),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isSelecteSearch = !isSelecteSearch;
                        });
                      },
                      child: Image.asset(
                        'assets/icons/search1.png',
                        width: 18,
                        color: blackColor,
                      ),
                    )
                  ],
                )
              : Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        size: 24,
                        color: blackColor,
                      ),
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 13, vertical: 13),
                        height: 40,
                        decoration: BoxDecoration(
                          color: Color(0xffF1F1F1),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Row(
                          children: [
                            Image.asset('assets/icons/search1.png',
                                width: 20, color: Color(0xff9B9B9B)),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Cari Treatment',
                              style: subGreyTextStyle.copyWith(
                                  color: Color(0xff9B9B9B)),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: FilterTreatmen(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12, left: 25, right: 25),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        isSelecteTampilan = !isSelecteTampilan;
                      });
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Tampilan',
                          style: subTitleTextStyle.copyWith(
                              color: const Color(0xff6B6B6B)),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        isSelecteTampilan
                            ? Image.asset(
                                'assets/images/tampilan1.png',
                              )
                            : SvgPicture.asset('assets/icons/tampilan1.svg'),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                ],
              ),
            ),
            isSelecteTampilan
                ? Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Wrap(
                      children: const [
                        ProdukTreatment(
                          namaKlinik: 'Klinik Utama Lithea',
                          namaTreatmen: 'Radiant Glow Peeling',
                          diskonProduk: '20',
                          hargaDiskon: 'Rp250.000',
                          harga: 'Rp200.000',
                          urlImg: 'assets/images/lheatea.png',
                          rating: '4.9 (120k)',
                          km: '80',
                          lokasiKlinik: 'Bogor Timur',
                        ),
                        ProdukTreatment(
                          namaKlinik: 'Klinik Utama Lithea',
                          namaTreatmen: 'Radiant Glow Peeling',
                          diskonProduk: '20',
                          hargaDiskon: 'Rp250.000',
                          harga: 'Rp200.000',
                          urlImg: 'assets/images/lheatea.png',
                          rating: '4.9 (120k)',
                          km: '80',
                          lokasiKlinik: 'Bogor Timur',
                        ),
                        ProdukTreatment(
                          namaKlinik: 'Klinik Utama Lithea',
                          namaTreatmen: 'Radiant Glow Peeling',
                          diskonProduk: '20',
                          hargaDiskon: 'Rp250.000',
                          harga: 'Rp200.000',
                          urlImg: 'assets/images/lheatea.png',
                          rating: '4.9 (120k)',
                          km: '80',
                          lokasiKlinik: 'Bogor Timur',
                        ),
                        ProdukTreatment(
                          namaKlinik: 'Klinik Utama Lithea',
                          namaTreatmen: 'Radiant Glow Peeling',
                          diskonProduk: '20',
                          hargaDiskon: 'Rp250.000',
                          harga: 'Rp200.000',
                          urlImg: 'assets/images/lheatea.png',
                          rating: '4.9 (120k)',
                          km: '80',
                          lokasiKlinik: 'Bogor Timur',
                        ),
                        ProdukTreatment(
                          namaKlinik: 'Klinik Utama Lithea',
                          namaTreatmen: 'Radiant Glow Peeling',
                          diskonProduk: '20',
                          hargaDiskon: 'Rp250.000',
                          harga: 'Rp200.000',
                          urlImg: 'assets/images/lheatea.png',
                          rating: '4.9 (120k)',
                          km: '80',
                          lokasiKlinik: 'Bogor Timur',
                        ),
                      ],
                    ),
                  )
                : Column(
                    children: const [
                      TampilanRight(),
                      TampilanRight(),
                      TampilanRight(),
                      TampilanRight(),
                      TampilanRight(),
                      TampilanRight(),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}

class TampilanRight extends StatelessWidget {
  const TampilanRight({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 19),
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
          Column(
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
              SizedBox(
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
              SizedBox(
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
                      '+ Keranjang',
                      style: whiteTextStyle.copyWith(fontSize: 12),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
