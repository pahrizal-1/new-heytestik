import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/treatment/treatment_controller.dart';
import 'package:heystetik_mobileapps/core/currency_format.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/alert_dialog.dart';
import 'package:heystetik_mobileapps/models/customer/treatmet_model.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';
import 'package:heystetik_mobileapps/widget/produk_widget.dart';

import '../solution/solutions_treatment1_Page.dart';

class TambahTreatmentCatatanDoktor extends StatefulWidget {
  const TambahTreatmentCatatanDoktor({super.key});

  @override
  State<TambahTreatmentCatatanDoktor> createState() => _TambahTreatmentCatatanDoktorState();
}

class _TambahTreatmentCatatanDoktorState extends State<TambahTreatmentCatatanDoktor> {
  final TreatmentController state = Get.put(TreatmentController());
  TextEditingController searchController = TextEditingController();
  String type = '';
  int rating = 0;
  int page = 1;
  List<Data2> treatments = [];
  List toogle = [];
  String? search;
  Map<String, dynamic> filter = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      treatments.addAll(await state.getAllTreatment(
        context,
        page,
        search: search,
        filter: filter,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(
                  context,
                );
              },
              child: Icon(
                Icons.arrow_back,
                color: blackColor,
                size: 24,
              ),
            ),
            const SizedBox(
              width: 9,
            ),
            Text(
              'TAMBAH TREATMENT',
              style: blackHigtTextStyle.copyWith(fontSize: 20),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                // if (stateDoctor.listSkincare.isNotEmpty && stateDoctor.notesSkincare.isNotEmpty && stateDoctor.listItemCount!.isNotEmpty) {
                //   Navigator.pop(context, 'refresh');
                // } else {
                //   showDialog(
                //     context: context,
                //     builder: (context) => AlertWidget(subtitle: 'Silahkan Pilih Terlebih Dahulu)'),
                //   );
                // }
              },
              child: Text(
                'Simpan',
                style: grenTextStyle.copyWith(fontSize: 15),
              ),
            )
          ],
        ),
        elevation: 0,
        backgroundColor: whiteColor,
      ),
      body: Obx(
        () => LoadingWidget(
          isLoading: state.isLoading.value,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 22, right: 22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: searchController,
                            onFieldSubmitted: (v) {
                              if (searchController.text == '') {
                                setState(() {
                                  state.getAllTreatment(context, 1);
                                });
                              } else {
                                setState(() {
                                  state.getAllTreatment(context, 1, search: searchController.text);
                                });
                              }
                            },
                            decoration: InputDecoration(
                              isDense: true,
                              fillColor: Color(0xffF1F1F1),
                              filled: true,
                              contentPadding: EdgeInsets.only(right: 18),
                              hintText: 'search',
                              prefixIcon: Icon(
                                Icons.search,
                                color: greyColor,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        InkWell(
                          onTap: () async {
                            return showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              backgroundColor: Colors.white,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadiusDirectional.only(
                                  topEnd: Radius.circular(25),
                                  topStart: Radius.circular(25),
                                ),
                              ),
                              builder: (context) => FilterAll(),
                            ).then((value) async {
                              if (value['promo'] == true) {
                                treatments.clear();
                                page = 1;
                                setState(() {});
                              } else {
                                filter['treatment_type[]'] = value['treatment'];
                                filter['order_by'] = value['orderBy'];
                                filter['open_now'] = value['openNow'];
                                filter['min_price'] = value['minPrice'];
                                filter['max_price'] = value['maxPrice'];

                                treatments.clear();
                                page = 1;
                                // treatments.addAll(
                                //   await stateTreatment.getAllTreatment(
                                //     context,
                                //     page,
                                //     search: search,
                                //     filter: filter,
                                //   ),
                                // );
                              }
                              setState(() {});
                            });
                          },
                          child: Image.asset(
                            'assets/icons/corong.png',
                            width: 20,
                            height: 18,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Sort by',
                          style: greyTextStyle.copyWith(fontWeight: bold),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () {
                            // setState(
                            //   () {
                            //     isSelcted = !isSelcted;
                            //   },
                            // );
                          },
                          child: Text(
                            '${searchController.text}',
                            style: blackTextStyle.copyWith(fontWeight: bold),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 17,
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 150,
                left: 0,
                right: 0,
                bottom: 0,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 22, right: 22),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      for (var i = 0; i < treatments.length; i++)
                        ProductTreatmentDoctor(
                          treatmentData: treatments[i],
                          namaKlinik: treatments[i].clinic?.name ?? '-',
                          namaTreatmen: treatments[i].name ?? '-',
                          diskonProduk: '0',
                          hargaDiskon: '0',
                          harga: treatments[i].price!.toString(),
                          urlImg: treatments[i].mediaTreatments!.isEmpty ? "" : "${Global.FILE}/${treatments[i].mediaTreatments![0].media!.path!}",
                          rating: '${treatments[i].rating} (0k)',
                          km: '${treatments[i].distance ?? '0'} km',
                          lokasiKlinik: treatments[i].clinic?.city?.name ?? '-',
                          iconPlus: InkWell(
                            onTap: () {
                              if (toogle.contains(i)) {
                                setState(() => toogle.remove(i));
                              } else {
                                setState(() {
                                  toogle.add(i);
                                });
                              }
                              print('e ${i}');
                            },
                            child: Container(
                              height: 29,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9),
                                border: Border.all(color: greenColor),
                              ),
                              child: toogle.contains(i)
                                  ? Center(
                                      child: Text(
                                        '-',
                                        style: grenTextStyle.copyWith(fontSize: 20),
                                      ),
                                    )
                                  : Icon(
                                      Icons.add,
                                      color: greenColor,
                                    ),
                            ),
                          ),
                        )
                      //     treatments.map((element) {
                      //   return ProductTreatmentDoctor(
                      //     treatmentData: element,
                      //     namaKlinik: element.clinic?.name ?? '-',
                      //     namaTreatmen: element.name ?? '-',
                      //     diskonProduk: '0',
                      //     hargaDiskon: '0',
                      //     harga: element.price!.toString(),
                      //     urlImg: element.mediaTreatments!.isEmpty ? "" : "${Global.FILE}/${element.mediaTreatments![0].media!.path!}",
                      //     rating: '${element.rating} (0k)',
                      //     km: '${element.distance ?? '0'} km',
                      //     lokasiKlinik: element.clinic?.city?.name ?? '-',
                      //     iconPlus: InkWell(
                      //       onTap: () {
                      //         print('e ${element}');
                      //       },
                      //       child: Container(
                      //         decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(9),
                      //           border: Border.all(color: greenColor),
                      //         ),
                      //         child: Icon(
                      //           Icons.add,
                      //           color: greenColor,
                      //         ),
                      //       ),
                      //     ),
                      //   );
                      // }).toList(),
                    ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
