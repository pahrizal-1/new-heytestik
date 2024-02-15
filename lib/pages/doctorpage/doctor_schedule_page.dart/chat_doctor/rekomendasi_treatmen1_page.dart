import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/pages/doctorpage/doctor_schedule_page.dart/chat_doctor/rekomendasi_treatmen_page.dart';
import 'package:heystetik_mobileapps/pages/doctorpage/doctor_schedule_page.dart/chat_doctor/rekomendasi_treatment3_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:provider/provider.dart';

import '../../../../controller/doctor/consultation/consultation_controller.dart';
import '../../../../controller/doctor/treatment_recommendation/treatment_recommendation_controller.dart';
import '../../../../widget/loading_widget.dart';

class RekomendasiTreatmen1Page extends StatefulWidget {
  const RekomendasiTreatmen1Page({super.key});

  @override
  State<RekomendasiTreatmen1Page> createState() => _RekomendasiTreatmen1PageState();
}

class _RekomendasiTreatmen1PageState extends State<RekomendasiTreatmen1Page> {
  final TreatmentRecommendationController state = Get.put(TreatmentRecommendationController());
  final DoctorConsultationController stateDoctor = Get.put(DoctorConsultationController());
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context.read<TreatmentRecommendationController>().refresh(
            context,
          );
    });
    scrollController.addListener(() async {
      context.read<TreatmentRecommendationController>().loadMore(
            context,
            scrollController,
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Container(
            height: 60,
            width: 60,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) => const RekomendasiTreatmen2Page()),
                ).then((value) => setState(() {
                      state.getRecipeTreatement(context, 1);
                    }));
              },
              backgroundColor: greenColor,
              child: const Icon(
                Icons.add,
                size: 40,
              ),
            ),
          ),
        ),
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: greenColor,
          title: Padding(
            padding: const EdgeInsets.only(left: 6),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    stateDoctor.listTreatmentNote = [];
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
                Text(
                  'Rekomendasi Treatment',
                  style: whiteTextStyle.copyWith(fontSize: 20),
                )
              ],
            ),
          ),
        ),
        body: Obx(() => LoadingWidget(
              isLoading: state.isLoading.value,
              child: SingleChildScrollView(
                controller: scrollController,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 50),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(children: [
                          Padding(
                              padding: const EdgeInsets.only(left: 10, right: 10),
                              child: Container(
                                height: 12,
                                width: 12,
                                decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/icons/search1.png'))),
                              )),
                          Container(
                            constraints: const BoxConstraints(maxWidth: 280),
                            child: TextFormField(
                              style: const TextStyle(fontSize: 15, fontFamily: 'ProximaNova'),
                              decoration: InputDecoration(
                                hintText: 'Cari Resep',
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                  fontFamily: 'ProximaNova',
                                  color: fromCssColor(
                                    '#9B9B9B',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ]),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Consumer<TreatmentRecommendationController>(
                        builder: (_, state, __) {
                          return Container(
                            // height: MediaQuery.of(context).size.height / 2,
                            child: ListView.builder(
                              shrinkWrap: true,
                              // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                              physics: const ClampingScrollPhysics(),
                              itemCount: state.hasMore.value ? state.treatmentDatas.length + 1 : state.treatmentDatas.length,
                              itemBuilder: (BuildContext context, int index) {
                                if (index < state.treatmentDatas.length) {
                                  return InkWell(
                                    onTap: () {
                                      for (var i in state.treatmentDatas[index].recipeRecomendationTreatmentItems!) {
                                        // i.toJson()
                                        stateDoctor.listTreatmentNote.add({'name': i.name, 'cost': i.cost, 'recovery_time': i.recoveryTime, 'type': i.type});
                                        print(i.toJson().toString());
                                      }
                                      Navigator.pop(context, 'refresh');
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 5),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              height: 60,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: fromCssColor('#D9D9D9'),
                                                  width: 1,
                                                ),
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(left: 15, top: 10, bottom: 10),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(
                                                      state.treatmentDatas[index].title ?? '',
                                                      style: TextStyle(fontWeight: bold, fontFamily: 'ProximaNova', fontSize: 15, letterSpacing: 0.5),
                                                    ),
                                                    Text(
                                                      state.treatmentDatas[index].subtitle ?? '',
                                                      style: TextStyle(fontFamily: 'ProximaNova', fontSize: 12, color: fromCssColor('#A3A3A3'), letterSpacing: 0.5),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              // setState(() {
                                              //   state.treatmentDatas.removeAt(index);
                                              // });
                                              state.deleteTreatment(context, state.treatmentDatas[index].id!);
                                              setState(() {
                                                // state.getRecipeTreatement(context);
                                                state.treatmentDatas;
                                              });
                                            },
                                            icon: Icon(
                                              Icons.delete,
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: ((context) => RekomendasiTreatmen3Page(
                                                          id: state.treatmentDatas[index].id!,
                                                        )),
                                                  )).then((value) => setState(() {
                                                    state.getRecipeTreatement(context, 1);
                                                  }));
                                            },
                                            icon: Icon(Icons.visibility),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                } else {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  );
                                }
                              },
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
            )));
  }
}
