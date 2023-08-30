import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';

import '../controller/doctor/consultation/consultation_controller.dart';

class RekomendasiDokterWidget extends StatefulWidget {
  final int id;
  const RekomendasiDokterWidget({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<RekomendasiDokterWidget> createState() =>
      _RekomendasiDokterWidgetState();
}

class _RekomendasiDokterWidgetState extends State<RekomendasiDokterWidget> {
  final DoctorConsultationController state =
      Get.put(DoctorConsultationController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      state.detailConsultation(context, widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            height: 43,
            width: 270,
            decoration: BoxDecoration(
                color: greenColor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            child: Text(
              'Rekomendasi Dokter',
              style: whiteTextStyle.copyWith(fontSize: 15),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
            // height: 299,
            width: 270,
            color: whiteColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'Obat',
                  style: TextStyle(fontSize: 15),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.data.value.consultationRecipeDrug?.length,
                    itemBuilder: ((context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                state.data.value.consultationRecipeDrug?[index]
                                        .product?.name ??
                                    '-',
                                style: grenTextStyle.copyWith(fontSize: 12),
                              ),
                              Text(
                                state
                                        .data
                                        .value
                                        .consultationRecipeDrug?[index]
                                        .product
                                        ?.drugDetail
                                        ?.specificationDose ??
                                    '-',
                                style: greyTextStyle,
                              )
                            ],
                          ),
                        ],
                      );
                    }),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'Skin Care',
                  style: TextStyle(fontSize: 15),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.data.value
                            .consultationRecomendationSkincare?.length,
                        itemBuilder: ((context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    state
                                            .data
                                            .value
                                            .consultationRecomendationSkincare?[
                                                index]
                                            .product
                                            ?.name ??
                                        '',
                                    style: grenTextStyle.copyWith(fontSize: 12),
                                  ),
                                  Text(
                                    state
                                            .data
                                            .value
                                            .consultationRecomendationSkincare?[
                                                index]
                                            .product
                                            ?.drugDetail
                                            ?.specificationDose ??
                                        '',
                                    style: greyTextStyle,
                                  )
                                ],
                              ),
                              const Divider(
                                thickness: 2,
                              ),
                            ],
                          );
                        }))),
                const Text(
                  'Treatment',
                  style: TextStyle(fontSize: 15),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.data.value
                            .consultationRecomendationTreatment?.length,
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state
                                        .data
                                        .value
                                        .consultationRecomendationTreatment?[
                                            index]
                                        .name ??
                                    '',
                                style: grenTextStyle.copyWith(fontSize: 12),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                            ],
                          );
                        })),
                const SizedBox(
                  height: 10,
                ),
                const ButtonGreenWidget(title: 'Lihat Detail')
              ],
            ),
          ),
        ],
      ),
    );
  }
}
