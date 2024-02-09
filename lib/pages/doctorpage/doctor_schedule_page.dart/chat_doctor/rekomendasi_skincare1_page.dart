import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/doctor/skincare_recommendations/skincare_recommendations_controller.dart';
import 'package:heystetik_mobileapps/pages/doctorpage/doctor_schedule_page.dart/chat_doctor/rekomendasi_skin3_page.dart';
import 'package:heystetik_mobileapps/pages/doctorpage/doctor_schedule_page.dart/chat_doctor/rekomendasi_skincare2_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';
import 'package:provider/provider.dart';

import '../../../../controller/doctor/consultation/consultation_controller.dart';

class RekomendasiSkincare1Page extends StatefulWidget {
  const RekomendasiSkincare1Page({super.key});

  @override
  State<RekomendasiSkincare1Page> createState() => _RekomendasiSkincare1PageState();
}

class _RekomendasiSkincare1PageState extends State<RekomendasiSkincare1Page> {
  final SkincareRecommendationController state = Get.put(SkincareRecommendationController());
  final DoctorConsultationController stateDoctor = Get.put(DoctorConsultationController());
  final ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    context.read<SkincareRecommendationController>().refresh(context);
    context.read<SkincareRecommendationController>().refreshRecommendation(context);
    scrollController.addListener(() async {
      context.read<SkincareRecommendationController>().loadMore(
            context,
            scrollController,
          );
      context.read<SkincareRecommendationController>().loadMoreRecommendation(
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
                MaterialPageRoute(
                  builder: (BuildContext context) => const RekomendasiSkincare2Page(),
                ),
              );
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
        automaticallyImplyLeading: false,
        backgroundColor: greenColor,
        title: Padding(
          padding: const EdgeInsets.only(left: 6),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  stateDoctor.listItemCount = [];
                  state.filterData.value = [];
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: whiteColor,
                  size: 22,
                ),
              ),
              const SizedBox(
                width: 11,
              ),
              Text(
                'Rekomendasi Skincare',
                style: whiteTextStyle.copyWith(fontSize: 20),
              )
            ],
          ),
        ),
      ),
      body: Obx(
        () => LoadingWidget(
          isLoading: state.isLoading.value,
          child: RefreshIndicator(
            onRefresh: () async {
              context.read<SkincareRecommendationController>().refresh(context);
            },
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
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/icons/search1.png'),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          constraints: const BoxConstraints(maxWidth: 280),
                          child: TextFormField(
                            onChanged: (value) {
                              state.onChangeFilterText(value);
                            },
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
                    Consumer<SkincareRecommendationController>(builder: (_, state, __) {
                      return Container(
                        height: MediaQuery.of(context).size.height / 1.35,
                        child: ListView.builder(
                          shrinkWrap: true,
                          controller: scrollController,
                          itemCount: state.isLoading.value ? state.filterData.length + 1 : state.filterData.length,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            print('datalengs ${state.filterData.length}');
                            if (index < state.filterData.length) {
                              return InkWell(
                                onTap: () {
                                  for (var i in state.filterData[index].recipeRecomendationSkincareItems!) {
                                    stateDoctor.listSkincare.add(i.skincare!.toJson());
                                    stateDoctor.notesSkincare.add(TextEditingController(text: i.notes));
                                    // stateDoctor.listItemCount!.add(i.qty!.toInt());
                                  }
                                  // Navigator.pop(context, 'refresh');
                                },
                                child: tileWidget(index),
                              );
                            } else {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                        ),
                      );
                    })
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget tileWidget(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Expanded(
            child: Container(
              // height: 57,
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
                      state.filterData[index].title ?? '-',
                      style: TextStyle(fontWeight: bold, fontFamily: 'ProximaNova', fontSize: 15, letterSpacing: 0.5),
                    ),
                    Text(
                      state.filterData[index].subtitle ?? '-',
                      style: TextStyle(fontFamily: 'ProximaNova', fontSize: 12, color: fromCssColor('#A3A3A3'), letterSpacing: 0.5),
                    ),
                  ],
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              state.deleteTreatment(context, state.filterData[index].id!);
              setState(() {
                state.filterData;
              });
            },
            icon: Icon(Icons.delete),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => RekomendasiSkincare3Page(
                        id: state.filterData[index].id!.toInt(),
                      )),
                ),
              ).then(
                (value) => setState(() {
                  state.getSkincareRecommendation(context);
                  state.filterData;
                }),
              );
            },
            icon: Icon(Icons.visibility),
          ),
        ],
      ),
    );
  }
}
