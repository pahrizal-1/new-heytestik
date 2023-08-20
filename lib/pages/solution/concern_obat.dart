// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/medicine_controller.dart';
import 'package:heystetik_mobileapps/models/medicine.dart' as Medicine;
import 'package:heystetik_mobileapps/core/currency_format.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/pages/solution/view_detail_obat_page.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';
import 'package:heystetik_mobileapps/widget/pencarian_search_widget.dart';
import 'package:heystetik_mobileapps/widget/snackbar_widget.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

import '../../theme/theme.dart';
import '../../widget/card_widget.dart';
import '../../widget/filter_tap_widget.dart';

class ConcernObatPage extends StatefulWidget {
  int idConcern;
  ConcernObatPage({required this.idConcern, super.key});

  @override
  State<ConcernObatPage> createState() => _ConcernObatPageState();
}

class _ConcernObatPageState extends State<ConcernObatPage> {
  final MedicineController solutionController = Get.put(MedicineController());
  bool isSelecteTampilan = true;
  final ScrollController scrollController = ScrollController();
  int page = 1;
  List<Medicine.Data2> medicines = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      medicines.addAll(await solutionController
          .getMedicineByConcern(context, page, [widget.idConcern]));

      setState(() {});
    });
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool isTop = scrollController.position.pixels == 0;
        if (!isTop) {
          page += 1;
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
            medicines.addAll(await solutionController
                .getMedicineByConcern(context, page, [widget.idConcern]));
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
        backgroundColor: whiteColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
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
            Expanded(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PencarianPageWidget(),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.only(left: 13, right: 14),
                  height: 35,
                  decoration: BoxDecoration(
                    color: subwhiteColor,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Center(
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/icons/search1.png',
                          width: 10,
                          color: blackColor,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Cari Obat',
                          style: blackRegulerTextStyle,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Obx(
        () => LoadingWidget(
          isLoading: solutionController.isLoading.value,
          child: medicines.isEmpty
              ? Center(
                  child: Text(
                    'Data produk tidak ada',
                    style: TextStyle(
                      fontWeight: bold,
                      fontFamily: 'ProximaNova',
                      fontSize: 20,
                    ),
                  ),
                )
              : ListView(
                  children: [
                    StickyHeader(
                      header: Container(
                        padding: const EdgeInsets.only(top: 10, bottom: 9),
                        color: whiteColor,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 17,
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Padding(
                                padding: lsymetric,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        showModalBottomSheet(
                                          isDismissible: false,
                                          context: context,
                                          backgroundColor: Colors.white,
                                          shape: const RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadiusDirectional.only(
                                              topEnd: Radius.circular(25),
                                              topStart: Radius.circular(25),
                                            ),
                                          ),
                                          builder: (context) => Wrap(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 25,
                                                    right: 25,
                                                    top: 36,
                                                    bottom: 40),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Filter',
                                                      style: blackHigtTextStyle
                                                          .copyWith(
                                                              fontSize: 20),
                                                    ),
                                                    const SizedBox(
                                                      height: 31,
                                                    ),
                                                    Text(
                                                      'Pilihan Klinik',
                                                      style: blackTextStyle
                                                          .copyWith(
                                                              fontSize: 15),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      children: [
                                                        CardSearch(
                                                          title: 'Promo',
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        CardSearch(
                                                          title:
                                                              'Buka Sekarang',
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 28,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: TextFormField(
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                            decoration:
                                                                InputDecoration(
                                                              fillColor:
                                                                  greenColor,
                                                              hoverColor:
                                                                  greenColor,
                                                              hintText: 'Min.',
                                                              hintStyle: TextStyle(
                                                                  color:
                                                                      subgreyColor,
                                                                  fontSize: 12),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color:
                                                                            greenColor,
                                                                        width:
                                                                            2,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              7)),
                                                              border:
                                                                  OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            7),
                                                              ),
                                                              contentPadding:
                                                                  const EdgeInsets
                                                                      .all(12),
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 13,
                                                        ),
                                                        Text(
                                                          'hingga',
                                                          style:
                                                              subGreyTextStyle,
                                                        ),
                                                        const SizedBox(
                                                          width: 13,
                                                        ),
                                                        Expanded(
                                                          child: TextFormField(
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                            decoration:
                                                                InputDecoration(
                                                              fillColor:
                                                                  greenColor,
                                                              hoverColor:
                                                                  greenColor,
                                                              hintText: 'Max',
                                                              hintStyle: TextStyle(
                                                                  color:
                                                                      subgreyColor,
                                                                  fontSize: 12),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color:
                                                                            greenColor,
                                                                        width:
                                                                            2,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              7)),
                                                              border:
                                                                  OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            7),
                                                              ),
                                                              contentPadding:
                                                                  const EdgeInsets
                                                                      .all(12),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 29,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Expanded(
                                                          child: InkWell(
                                                            onTap: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: Container(
                                                              width: 165,
                                                              decoration: BoxDecoration(
                                                                  border: Border
                                                                      .all(
                                                                          color:
                                                                              greenColor),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              7)),
                                                              height: 50,
                                                              child: Center(
                                                                child: Text(
                                                                  'Batal',
                                                                  style: grenTextStyle.copyWith(
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          bold),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        Expanded(
                                                          child: InkWell(
                                                            onTap: () {},
                                                            child: Container(
                                                              width: 165,
                                                              decoration: BoxDecoration(
                                                                  color:
                                                                      greenColor,
                                                                  border: Border
                                                                      .all(
                                                                          color:
                                                                              greenColor),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              7)),
                                                              height: 50,
                                                              child: Center(
                                                                child: Text(
                                                                  'Simpan',
                                                                  style: whiteTextStyle.copyWith(
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          bold),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                      child: Image.asset(
                                        'assets/icons/filters.png',
                                        width: 78,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        showModalBottomSheet(
                                          isDismissible: false,
                                          context: context,
                                          backgroundColor: Colors.white,
                                          shape: const RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadiusDirectional.only(
                                              topEnd: Radius.circular(25),
                                              topStart: Radius.circular(25),
                                            ),
                                          ),
                                          builder: (context) => Wrap(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 25,
                                                    right: 25,
                                                    top: 36,
                                                    bottom: 20),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        InkWell(
                                                          onTap: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Image.asset(
                                                            'assets/icons/danger-icons.png',
                                                            width: 14,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 22,
                                                        ),
                                                        Text(
                                                          'Filter',
                                                          style:
                                                              blackHigtTextStyle
                                                                  .copyWith(
                                                                      fontSize:
                                                                          20),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 31,
                                                    ),
                                                    const FilterTapTreatment(
                                                      title: 'Rating Tertinggi',
                                                    ),
                                                    const SizedBox(
                                                      height: 18,
                                                    ),
                                                    const FilterTapTreatment(
                                                      title:
                                                          'Ulasan Terbanyaki',
                                                    ),
                                                    const SizedBox(
                                                      height: 18,
                                                    ),
                                                    const FilterTapTreatment(
                                                      title:
                                                          'Treatment Terlaris',
                                                    ),
                                                    const SizedBox(
                                                      height: 29,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.only(left: 9),
                                        padding: const EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                            top: 6,
                                            bottom: 6),
                                        height: 30,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          border:
                                              Border.all(color: borderColor),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text('Urutkan'),
                                            SizedBox(
                                              width: 9,
                                            ),
                                            Icon(
                                              Icons.keyboard_arrow_down,
                                              size: 15,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        // Navigator.push(
                                        //   context,
                                        //   MaterialPageRoute(
                                        //     builder: (context) =>
                                        //         const EtalaseTreatMentPage(),
                                        //   ),
                                        // );
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.only(left: 9),
                                        padding: const EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                            top: 6,
                                            bottom: 6),
                                        height: 30,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          border:
                                              Border.all(color: borderColor),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text('Retalase Treatment'),
                                            SizedBox(
                                              width: 9,
                                            ),
                                            Icon(
                                              Icons.keyboard_arrow_down,
                                              size: 15,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      content: Wrap(
                        spacing: 15,
                        runSpacing: 12,
                        children: medicines.map((medicine) {
                          return KonsultasiProduk(
                            medicine: medicine,
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

class KonsultasiProduk extends StatelessWidget {
  KonsultasiProduk({
    Key? key,
    required this.medicine,
  }) : super(key: key);

  final Medicine.Data2 medicine;
  MedicineController medicineController = Get.put(MedicineController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          DetailObatPage(
            medicine: medicine,
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: whiteColor,
          border: Border.all(color: borderColor, width: 0.2),
          borderRadius: BorderRadius.circular(7),
        ),
        width: 164,
        height: 315,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                image: DecorationImage(
                  image: NetworkImage(
                      "${Global.FILE}/${medicine.mediaProducts?[0].media?.path}"),
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
                    medicine.name ?? '-',
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
                    medicine.drugDetail?.specificationPackaging ?? '-',
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
                  medicine.consultationRecipeDrugs != null
                      ? Container(
                          height: 30,
                          child: TextButton(
                            onPressed: () {
                              medicineController.addMedicineToCart(
                                context,
                                medicine.id!,
                              );
                              SnackbarWidget.getSuccessSnackbar(
                                context,
                                'Info',
                                'Produk ditambahkan ke keranjang',
                              );
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: greenColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                '+ Keranjang',
                                style: whiteTextStyle.copyWith(fontSize: 12),
                              ),
                            ),
                          ),
                        )
                      : Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 6),
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
