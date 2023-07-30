import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/pages/doctorpage/doctor_schedule_page.dart/chat_doctor/catatan_produck_doctor_page.dart';
import 'package:heystetik_mobileapps/pages/doctorpage/doctor_schedule_page.dart/chat_doctor/tambahan_skin_care_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

import '../../../../controller/doctor/consultation/consultation_controller.dart';
import '../../../../core/convert_date.dart';
import '../../../../widget/Text_widget.dart';
import '../../../../widget/loading_widget.dart';
import '../../../../widget/text_form_widget.dart';

class DetailPasienPage extends StatefulWidget {
  final int id;
  const DetailPasienPage({
    super.key,
    required this.id,
  });

  @override
  State<DetailPasienPage> createState() => _DetailPasienPageState();
}

class _DetailPasienPageState extends State<DetailPasienPage> {
  final DoctorConsultationController state =
      Get.put(DoctorConsultationController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      state.getDetailConsltation(context, widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            InkWell(
              onTap: () {
                state.idConsultation.value = '';
                state.status.value = '';
                state.dateConsultation.value = '';
                state.endDate.value = '';
                state.pasienName.value = '';
                state.topic.value = '';
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
              ),
            ),
            const SizedBox(
              width: 11,
            ),
            Text(
              'Detail Pasien',
              style: whiteTextStyle.copyWith(fontSize: 20),
            )
          ],
        ),
        backgroundColor: greenColor,
      ),
      body: Obx(
        () => LoadingWidget(
          isLoading: state.isLoading.value,
          child: ListView(
            children: [
              Padding(
                padding: lsymetric.copyWith(top: 25, bottom: 46),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Info Konsultasi',
                      style: blackHigtTextStyle.copyWith(fontSize: 18),
                    ),
                    const SizedBox(
                      height: 9,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Status Konsultasi',
                          style: subGreyTextStyle,
                        ),
                        Obx(
                          () => Container(
                            height: 30,
                            width: 80,
                            decoration: BoxDecoration(
                              color: state.status.value == 'AKTIF'
                                  ? greenColor
                                  : orangeColor,
                              borderRadius: BorderRadius.circular(42),
                            ),
                            child: Center(
                              child: Text(
                                state.status.value,
                                style: whiteTextStyle,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Obx(
                      () => TextBoldSpacebetwen(
                        title: 'ID Konsultasi',
                        title2: state.idConsultation.value,
                        title1: '',
                      ),
                    ),
                    Obx(() => TextBoldSpacebetwen(
                          title: 'Tanggal',
                          title2: state.dateConsultation.value,
                          title1: '',
                        )),
                    Obx(() => TextBoldSpacebetwen(
                          title: 'Masa Aktif',
                          title2: state.endDate.value,
                          title1: '',
                        )),
                    const SizedBox(
                      height: 46,
                    ),
                    Text(
                      'Info Pasien',
                      style: blackHigtTextStyle.copyWith(fontSize: 15),
                    ),
                    Obx(
                      () => TextBoldSpacebetwen(
                        title: 'Nama Pasien',
                        title2: state.pasienName.value,
                        title1: '',
                      ),
                    ),
                    Obx(
                      () => TextBoldSpacebetwen(
                        title: 'Topik Keluhan',
                        title2: state.topic.value,
                        title1: '',
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 19),
                child: Text(
                  'Pre-Assessment',
                  style: blackHigtTextStyle.copyWith(fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 9,
              ),
              // Padding(
              //   padding: const EdgeInsets.only(right: 200),
              //   child: Container(
              //     height: 34,
              //     width: 1,
              //     padding: const EdgeInsets.only(
              //         top: 8, left: 25, bottom: 11, right: 19),
              //     decoration: BoxDecoration(
              //         color: greenColor,
              //         borderRadius: const BorderRadius.only(
              //             topRight: Radius.circular(20),
              //             bottomRight: Radius.circular(20))),
              //     child: Text(
              //       'Pertanyaan Umum',
              //       style: whiteTextStyle.copyWith(fontSize: 16),
              //     ),
              //   ),
              // ),

              // Obx(
              //   () => Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Container(
              //           // height: Get.height,
              //           child: ListView.builder(
              //               shrinkWrap: true,
              //               physics: NeverScrollableScrollPhysics(),
              //               itemCount: state.listConstulDetail.length,
              //               itemBuilder: (context, index) {
              //                 return Column(
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   children: [
              //                     PeryataanUmumTextFrom(
              //                       pernyattan:
              //                           '${state.listDetailConsultation.value.data!.medicalHistory!.medicalHistoryItems![index].interestConditionsQuestion!.id}' +
              //                               '. ' +
              //                               '${state.listDetailConsultation.value.data!.medicalHistory!.medicalHistoryItems![index].interestConditionsQuestion!.name!}',
              //                       jawaban:
              //                           '${state.listDetailConsultation.value.data!.medicalHistory!.medicalHistoryItems![index].interestConditionsAnswer!.name!}',
              //                     ),
              //                   ],
              //                 );
              //               })),
              //     ],
              //   ),
              // ),

              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Foto Kondisi Pasien',
                      style: blackHigtTextStyle.copyWith(fontSize: 18),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    // Obx(
                    //   () => Container(
                    //     height: 110,
                    //     width: MediaQuery.of(context).size.width,
                    //     child: ListView.builder(
                    //         shrinkWrap: true,
                    //         scrollDirection: Axis.horizontal,
                    //         itemCount: state.listDetailConsultation.value.data!
                    //             .medicalHistory!.mediaMedicalHistories!.length,
                    //         itemBuilder: (context, index) {
                    //           return Container(
                    //             height: 80,
                    //             margin: EdgeInsets.only(
                    //               right: 8,
                    //             ),
                    //             child: Image.network(
                    //               'http://192.168.0.118:8193/files/' +
                    //                   '${state.listDetailConsultation.value.data!.medicalHistory!.mediaMedicalHistories![index].media!.path!}',
                    //             ),
                    //           );
                    //         }),
                    //   ),
                    // ),
                    Text(
                      '*Klik foto untuk memperbesar',
                      style:
                          greyTextStyle.copyWith(fontStyle: FontStyle.italic),
                    ),
                    const SizedBox(
                      height: 37,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 45,
                      child: TextButton(
                        onPressed: () {
                          state.status.value == 'AKTIF'
                              ? null
                              : state.postFinish(context, widget.id);

                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) =>
                          //             const TambahanSkinCare()));
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: state.status.value == 'AKTIF'
                              ? greyColor
                              : greenColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text('Pre-Assessment Review Selesai',
                            style: whiteTextStyle.copyWith(
                                fontStyle: FontStyle.italic)),
                      ),
                    ),
                    SizedBox(height: 10),
                    state.status.value == 'AKTIF'
                        ? SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 45,
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const CatatanDocter()));
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: greenColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text('Catatan Doktor',
                                  style: whiteTextStyle.copyWith(
                                      fontStyle: FontStyle.italic)),
                            ),
                          )
                        : Container(),
                    SizedBox(height: 10),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
