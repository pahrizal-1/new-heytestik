import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/pages/doctorpage/doctor_schedule_page.dart/chat_doctor/catatan_produk_docter1_page.dart';

import '../../../../controller/doctor/consultation/consultation_controller.dart';
import '../../../../controller/doctor/skincare_recommendations/skincare_recommendations_controller.dart';
import '../../../../core/global.dart';
import '../../../../theme/theme.dart';
import '../../../../widget/alert_dialog.dart';
import '../../../../widget/card_skincare.dart';
import '../../../../widget/card_widget.dart';
import '../../../../widget/loading_widget.dart';
import 'filter_page.dart';

class TambahanSkinCare extends StatefulWidget {
  const TambahanSkinCare({super.key});

  @override
  State<TambahanSkinCare> createState() => _TambahanSkinCareState();
}

class _TambahanSkinCareState extends State<TambahanSkinCare> {
  final SkincareRecommendationController state =
      Get.put(SkincareRecommendationController());
  final DoctorConsultationController stateDoctor =
      Get.put(DoctorConsultationController());

  List img = [
    'assets/images/penting1.png',
    'assets/images/penting2.png',
    'assets/images/produk.png',
    'assets/images/produk2.png'
  ];
  List name = [
    'Teenderm gel sensitive 150 ml',
    'Teenderm Aqua 200 ml',
    'Teenderm Hydra 40 ml',
    'Teenderm Hydra 40 ml'
  ];
  List harga = ['Rp250.000', 'Rp150.000', 'Rp175.000', 'Rp175.000'];
  bool isSelcted = false;
  int? selectedIndex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      state.getSkincare(context);
    });
  }

  bool isSelected = false;
  List toogle = [];
  List skincare = [];
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
                toogle = [];
                skincare = [];
                stateDoctor.listSkincare = [];
                stateDoctor.notesSkincare = [];
                stateDoctor.listItemCount = [];

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
              'TAMBAH SKINCARE',
              style: blackHigtTextStyle.copyWith(fontSize: 20),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                if (stateDoctor.listSkincare.isNotEmpty &&
                    stateDoctor.notesSkincare.isNotEmpty &&
                    stateDoctor.listItemCount!.isNotEmpty) {
                  Navigator.pop(context, 'refresh');
                } else {
                  showDialog(
                    context: context,
                    builder: (context) => AlertWidget(
                        subtitle:
                            'Silahkan Pilih Terlebih Dahulu)'),
                  );
                }
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const CatatanDocter1(),
                //   ),
                // );
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
                            decoration: InputDecoration(
                              isDense: true,
                              fillColor: Color(0xffF1F1F1),
                              filled: true,
                              contentPadding: EdgeInsets.only(right: 18),
                              hintText: 'Indikasi',
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
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const FilterPage(),
                              ),
                            );
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
                    Row(
                      children: [
                        CardSearch(
                          title: 'Jerawat',
                        ),
                        SizedBox(
                          width: 11,
                        ),
                        CardSearch(
                          title: 'Kulit Kusam',
                        ),
                      ],
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
                            setState(
                              () {
                                isSelcted = !isSelcted;
                              },
                            );
                          },
                          child: Text(
                            'Brand',
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // height: 200,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: state.solutionSkincare.length,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: ((context, index) {
                              String? img;
                              for (var i in state
                                  .solutionSkincare[index].mediaProducts!) {
                                img = i.media!.path;
                              }
                              return InkWell(
                                onTap: () {
                                  print(state.solutionSkincare[index].id
                                      .toString());
                                },
                                child: CardSkincarePrice(
                                  nameTitle:
                                      "${state.solutionSkincare[index].name ?? ''}",
                                  urlImg: "${Global.FILE}/${img}",
                                  subTitle:
                                      "${state.solutionSkincare[index].category}",
                                  harga:
                                      "${state.solutionSkincare[index].price}",
                                  pengguna: "Pagi&Malam",
                                  plus: InkWell(
                                    onTap: () {
                                      print(index);
                                      setState(() {
                                        if (toogle.contains(index)) {
                                          toogle.remove(index);
                                          stateDoctor.listSkincare.remove(state
                                              .solutionSkincare[index]
                                              .toJson());
                                          stateDoctor.notesSkincare.removeAt(
                                              stateDoctor.notesSkincare.length -
                                                  1);
                                          stateDoctor.listItemCount!.removeAt(
                                              stateDoctor
                                                      .listItemCount!.length -
                                                  1);
                                          print(stateDoctor.listItemCount!
                                              .toString());
                                        } else {
                                          toogle.add(index);
                                          stateDoctor.listSkincare.add(state
                                              .solutionSkincare[index]
                                              .toJson());
                                          stateDoctor.notesSkincare
                                              .add(TextEditingController());
                                          stateDoctor.listItemCount =
                                              List.generate(
                                                  state.solutionSkincare.length,
                                                  (_) => 1);
                                          print(stateDoctor.listItemCount!
                                              .toString());
                                        }
                                      });
                                    },
                                    child: Container(
                                        height: 29,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            color: toogle.contains(index)
                                                ? whiteColor
                                                : greenColor,
                                            borderRadius:
                                                BorderRadius.circular(9),
                                            border:
                                                Border.all(color: greenColor)),
                                        child: toogle.contains(index)
                                            ? Center(
                                                child: Text(
                                                  '-',
                                                  style: grenTextStyle.copyWith(
                                                      fontSize: 20),
                                                ),
                                              )
                                            : Icon(
                                                Icons.add,
                                                color: whiteColor,
                                              )),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                        // Text(
                        //   'Teenderm',
                        //   style: blackTextStyle.copyWith(fontSize: 15),
                        // ),
                        // const SizedBox(
                        //   height: 12,
                        // ),
                        // ListView.builder(
                        //   shrinkWrap: true,
                        //   keyboardDismissBehavior:
                        //       ScrollViewKeyboardDismissBehavior.onDrag,
                        //   physics: const NeverScrollableScrollPhysics(),
                        //   itemCount: 4,
                        //   itemBuilder: (BuildContext context, int index) {
                        //     return CardSkincarePrice(
                        //         nameTitle: name[index],
                        //         urlImg: img[index],
                        //         subTitle: 'Cleanser',
                        //         harga: harga[index],
                        //         pengguna: 'Pagi&Malam');
                        //   },
                        // ),
                        // Text(
                        //   'Biretix',
                        //   style: blackTextStyle.copyWith(fontSize: 15),
                        // ),
                        // const SizedBox(
                        //   height: 12,
                        // ),
                        // ListView.builder(
                        //   shrinkWrap: true,
                        //   keyboardDismissBehavior:
                        //       ScrollViewKeyboardDismissBehavior.onDrag,
                        //   physics: const NeverScrollableScrollPhysics(),
                        //   itemCount: 4,
                        //   itemBuilder: (BuildContext context, int index) {
                        //     return CardSkincarePrice(
                        //         nameTitle: name[index],
                        //         urlImg: img[index],
                        //         subTitle: 'Cleanser',
                        //         harga: '',
                        //         pengguna: 'Pagi&Malam');
                        //   },
                        // ),
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
