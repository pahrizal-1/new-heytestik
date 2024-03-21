import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/doctor/consultation/consultation_controller.dart';
import 'package:heystetik_mobileapps/controller/doctor/treatment/treatment_doctor_controller.dart';
import 'package:heystetik_mobileapps/controller/doctor/treatment_recommendation/treatment_recommendation_controller.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/alert_dialog.dart';
import 'package:heystetik_mobileapps/models/customer/treatmet_model.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';
import 'package:heystetik_mobileapps/widget/produk_widget.dart';
import 'package:provider/provider.dart';

import '../../widget/filter_treatment_widgets.dart';
import 'doctor_schedule_page.dart/chat_doctor/filter_page.dart';

class TambahTreatmentCatatanDoktor extends StatefulWidget {
  const TambahTreatmentCatatanDoktor({super.key});

  @override
  State<TambahTreatmentCatatanDoktor> createState() => _TambahTreatmentCatatanDoktorState();
}

class _TambahTreatmentCatatanDoktorState extends State<TambahTreatmentCatatanDoktor> {
  final TreatmentDoctorController state = Get.put(TreatmentDoctorController());
  final TreatmentRecommendationController stateTreatment = Get.put(TreatmentRecommendationController());
  final DoctorConsultationController stateDoctor = Get.put(DoctorConsultationController());
  TextEditingController searchController = TextEditingController();
  ScrollController scrollController = ScrollController();
  String type = '';
  int rating = 0;
  int page = 1;
  List<Data2> treatments = [];
  String? search;
  Map<String, dynamic> filter = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      context.read<TreatmentDoctorController>().refresh(
            context,
          );
    });
    scrollController.addListener(() async {
      context.read<TreatmentDoctorController>().loadMore(
            context,
            scrollController,
          );
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
                // stateDoctor.listTreatmentNote = [];
                state.toogle = [];
                setState(() {
                  stateTreatment.methodsTreatment = [];
                  stateTreatment.listOfTreatment.value = [];
                });
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
                if (stateDoctor.listTreatmentMethods.isNotEmpty || stateTreatment.methodsTreatment.isNotEmpty) {
                  Navigator.pop(
                    context,
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (context) => AlertWidget(subtitle: 'Silahkan Pilih Terlebih Dahulu)'),
                  );
                }
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
                                  context.read<TreatmentDoctorController>().refresh(context, search: '');
                                });
                              } else {
                                setState(() {
                                  context.read<TreatmentDoctorController>().refresh(context, search: searchController.text);
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const FilterPageTreatment(),
                              ),
                            ).then((value) => setState(() {
                                  print('state.total ${state.totalPage.value} ${state.currentPage.value}');
                                  context.read<TreatmentDoctorController>().refresh(
                                        context,
                                        // 1,
                                        // search: '',
                                        minPrice: state.minPriceController.text.isEmpty ? null : int.parse(state.minPriceController.text),
                                        maxPrice: state.maxPriceController.text.isEmpty ? null : int.parse(state.maxPriceController.text),
                                        methods: state.filterMethods,
                                      );
                                }));
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
                    searchController.text == ''
                        ? SizedBox()
                        : Container(
                            height: 35,
                            // width: 130,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color: greenColor.withOpacity(0.2),
                              border: Border.all(
                                color: greenColor,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(searchController.text),
                                  // SizedBox(
                                  //   width: 10,
                                  // ),
                                  IconButton(
                                    iconSize: 14,
                                    onPressed: () {
                                      if (searchController.text == '') {
                                        setState(() {
                                          context.read<TreatmentDoctorController>().refresh(
                                                context,
                                                search: '',
                                              );
                                        });
                                      } else {
                                        setState(() {
                                          context.read<TreatmentDoctorController>().refresh(
                                                context,
                                                search: '',
                                              );
                                          searchController.clear();
                                        });
                                      }
                                    },
                                    icon: Icon(
                                      Icons.close,
                                    ),
                                  ),
                                  // Spacer(),
                                  // Container(),
                                ],
                              ),
                            ),
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
                  controller: scrollController,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 22, right: 22),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        state.isLoading.value
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : Consumer<TreatmentDoctorController>(builder: (_, state, __) {
                                return Container(
                                  child: ListView.builder(
                                      // controller: scrollController,
                                      shrinkWrap: true,
                                      itemCount: state.hasMore.value ? state.listOfTreatment.length + 1 : state.listOfTreatment.length + 0,
                                      physics: ClampingScrollPhysics(),
                                      itemBuilder: (context, i) {
                                        if (i < state.listOfTreatment.length) {
                                          return ProductTreatmentDoctor(
                                            treatmentData: state.listOfTreatment[i],
                                            namaKlinik: state.listOfTreatment[i].clinics?.map((e) => e.name).toList().toString() ?? '-',
                                            // namaKlinik: state.listOfTreatment[i].clinic?.name ?? '-',
                                            recovTime: state.listOfTreatment[i].recoveryTime ?? '-',
                                            typeTreatment: state.listOfTreatment[i].method ?? '-',
                                            namaTreatmen: state.listOfTreatment[i].treatmentType ?? '-',
                                            // diskonProduk: '0',
                                            // hargaDiskon: '0',
                                            harga: "${state.listOfTreatment[i].cost}",
                                            // urlImg: state.listOfTreatment[i].mediaTreatments!.isEmpty ? "" : "${Global.FILE}/${state.listOfTreatment[i].mediaTreatments![0].media!.path!}",
                                            // rating: '${state.listOfTreatment[i].rating} (0k)',
                                            // km: '${state.listOfTreatment[i].distance ?? '0'} km',
                                            // lokasiKlinik: state.listOfTreatment[i].clinic?.city?.name ?? '-',
                                            iconPlus: InkWell(
                                              onTap: () {
                                                if (state.toogle.contains(i)) {
                                                  setState(() {
                                                    state.toogle.remove(i);
                                                    // stateDoctor.listTreatmentNote.remove(stateDoctor.listTreatmentNote[i]);
                                                    stateDoctor.listTreatmentMethods.remove(stateDoctor.listTreatmentMethods[i]);
                                                    stateTreatment.methodsTreatment.remove(stateTreatment.methodsTreatment[i]);
                                                    print('delete ${stateDoctor.listTreatmentNote}');
                                                  });
                                                } else {
                                                  setState(() {
                                                    state.toogle.add(i);
                                                    stateDoctor.listTreatmentMethods.add(state.listOfTreatment[i].treatmentType.toString());
                                                    stateTreatment.methodsTreatment.add(state.listOfTreatment[i].treatmentType.toString());

                                                    print('list ${stateTreatment.methodsTreatment}');
                                                    // stateDoctor.listTreatmentNote.add();
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
                                                child: state.toogle.contains(i)
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
                                          );
                                        } else {
                                          return Padding(
                                            padding: EdgeInsets.symmetric(vertical: 10),
                                            child: Center(
                                              child: SizedBox(),
                                            ),
                                          );
                                        }
                                      }),
                                );
                              })
                      ],
                    ),
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
