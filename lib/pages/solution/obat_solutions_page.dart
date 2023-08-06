import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:from_css_color/from_css_color.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/etalase_controller.dart';
import 'package:heystetik_mobileapps/core/currency_format.dart';
import 'package:heystetik_mobileapps/models/medicine.dart';
import 'package:heystetik_mobileapps/pages/solution/view_detail_obat_page.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

import '../../controller/customer/solution/medicine_controller.dart';
import '../../core/global.dart';
import '../../theme/theme.dart';
import '../../widget/pencarian_search_widget.dart';
import '../../widget/produk_widget.dart';
import '../home/notifikasion_page.dart';
import '../setings&akun/akun_home_page.dart';
import 'keranjang_page.dart';

class ObatSolutionsPage extends StatefulWidget {
  const ObatSolutionsPage({super.key});

  @override
  State<ObatSolutionsPage> createState() => _ObatSolutionsPageState();
}

class _ObatSolutionsPageState extends State<ObatSolutionsPage> {
  final ScrollController scrollController = ScrollController();
  final MedicineController solutionController = Get.put(MedicineController());
  final EtalaseController etalaseController = Get.put(EtalaseController());
  int page = 1;
  List<MedicineModel> medicines = [];

  @override
  void initState() {
    etalaseController.getConcern(context);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      medicines.addAll(await solutionController.getMedicine(context, page));
      setState(() {});
    });
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool isTop = scrollController.position.pixels == 0;
        if (!isTop) {
          page += 1;
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
            medicines
                .addAll(await solutionController.getMedicine(context, page));
            setState(() {});
          });
        }
      }
    });
    super.initState();
  }

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
                style: blackHigtTextStyle.copyWith(fontSize: 20),
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
                  builder: (context) => const NotifikasionPage(),
                ),
              );
            },
            child: Image.asset(
              'assets/icons/icon-home.png',
              width: 18,
              color: blackColor,
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
                  builder: (context) => const KeranjangPage(),
                ),
              );
            },
            child: Image.asset(
              'assets/icons/trello1.png',
              width: 21,
              color: blackColor,
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
                  builder: (context) => AkunHomePage(),
                ),
              );
            },
            child: Image.asset(
              'assets/icons/humberger.png',
              width: 19,
              color: blackColor,
            ),
          ),
          const SizedBox(
            width: 26,
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(56.0),
          child: Container(
            padding:
                const EdgeInsets.only(left: 25, right: 25, bottom: 10, top: 10),
            height: 56.0,
            child: InkWell(
              onTap: () {
                Get.to(PencarianPageWidget());
              },
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: fromCssColor('#CCCCCC'),
                  ),
                  borderRadius: BorderRadius.circular(35),
                ),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
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
                      Text(
                        'Cari Obat',
                        style: subTitleTextStyle,
                      )
                    ]),
              ),
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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.only(right: 20, left: 25),
                child: Row(
                  children: [
                    ProdukObat(
                      namaBrand: 'Noroid Soothing Cream 200ml',
                      harga: 'Rp152.500',
                      urlImg: 'assets/images/noroid1.png',
                    ),
                    ProdukObat(
                      namaBrand: 'Digenta Cream 10g\n',
                      harga: 'Rp152.500',
                      urlImg: 'assets/images/digentasalep.png',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            StickyHeader(
              header: Container(
                color: const Color(0xFFFFFFFF),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      child: Text(
                        'Obat berdasarkan Concern',
                        style: whiteTextStyle.copyWith(fontSize: 16),
                      ),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: etalaseController.filterData.map((element) {
                            return CirkelCategory(
                              title: element.name ?? "-",
                              img:
                                  "${Global.FILE}/${element.mediaConcern!.media!.path!}",
                            );
                          }).toList(),
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
                      padding: const EdgeInsets.only(left: 25, top: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Semua',
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              content: Center(
                child: Wrap(
                  spacing: 15,
                  runSpacing: 12,
                  children: medicines.map((medicine) {
                    return KonsultasProduk(
                      medicine: medicine,
                    );
                  }).toList(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class KonsultasProduk extends StatelessWidget {
  const KonsultasProduk({
    Key? key,
    required this.medicine,
  }) : super(key: key);

  final MedicineModel medicine;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailObatPage(
              medicine: medicine,
            ),
          ),
        );
      },
      child: Container(
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
                borderRadius: BorderRadius.circular(7),
                image: DecorationImage(
                  image: NetworkImage("${Global.FILE}/${medicine.media[0]}"),
                  fit: BoxFit.fill,
                ),
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
                    medicine.name,
                    style: subGreyTextStyle.copyWith(
                        fontSize: 13, color: const Color(0xFF323232)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    CurrencyFormat.convertToIdr(medicine.price, 2),
                    style: blackHigtTextStyle.copyWith(fontSize: 15),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    medicine.packaging,
                    style: subGreyTextStyle.copyWith(
                        fontSize: 12, color: const Color(0xFF9B9B9B)),
                  ),
                  const SizedBox(
                    height: 5,
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                    decoration: BoxDecoration(
                        border: Border.all(color: greenColor),
                        borderRadius: BorderRadius.circular(7)),
                    child: Text(
                      'Harus Dengan Resep Dokter',
                      style: grenTextStyle.copyWith(fontSize: 10),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
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
      padding: const EdgeInsets.only(right: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 49,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image:
                  DecorationImage(image: NetworkImage(img), fit: BoxFit.cover),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 70,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                fontFamily: 'ProximaNova',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
