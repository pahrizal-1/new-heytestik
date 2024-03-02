// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/account/my_journey_controller.dart';
import 'package:heystetik_mobileapps/core/convert_date.dart';
import 'package:heystetik_mobileapps/core/download_file.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';
import 'package:screenshot/screenshot.dart';
import '../../theme/theme.dart';
import '../../widget/Text_widget.dart';

class HasilKosultasiPage extends StatefulWidget {
  int id;
  HasilKosultasiPage({required this.id, super.key});

  @override
  State<HasilKosultasiPage> createState() => _HasilKosultasiPageState();
}

class _HasilKosultasiPageState extends State<HasilKosultasiPage> {
  final MyJourneyController state = Get.put(MyJourneyController());

//Create an instance of ScreenshotController
  ScreenshotController screenshotController = ScreenshotController();
  @override
  void initState() {
    super.initState();
    state.getHistoryConsultationDoctorNote(context, widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        elevation: 3,
        automaticallyImplyLeading: false,
        backgroundColor: whiteColor,
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
                'Hasil Consutasi',
                style: blackTextStyle.copyWith(
                  fontSize: 20,
                ),
              )
            ],
          ),
        ),
        actions: [
          Obx(
            () => state.doctorNote.value
                ? Padding(
                    padding: const EdgeInsets.only(
                      right: 23,
                    ),
                    child: InkWell(
                      onTap: () async {
                        screenshotController
                            .capture(delay: Duration(milliseconds: 10))
                            .then((capturedImage) async {
                          await downloadFile(capturedImage!);
                        }).catchError((onError) {
                          print("onError $onError");
                        });
                      },
                      child: Image.asset(
                        'assets/icons/download-icons.png',
                        width: 24,
                        height: 24,
                      ),
                    ),
                  )
                : Container(),
          ),
        ],
      ),
      body: Obx(
        () => LoadingWidget(
          isLoading: state.isLoading.value,
          child: state.doctorNote.value
              ? Screenshot(
                  controller: screenshotController,
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 16,
                          left: 24,
                          right: 24,
                          bottom: 21,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Obx(
                              () => RichText(
                                text: TextSpan(
                                    text: state.fullName.value,
                                    style:
                                        blackTextStyle.copyWith(fontSize: 15),
                                    children: [
                                      TextSpan(
                                        text: state.age.value == 0
                                            ? ''
                                            : '${state.age.value} tahun',
                                        style: blackRegulerTextStyle.copyWith(
                                          fontSize: 15,
                                        ),
                                      )
                                    ]),
                              ),
                            ),
                            SizedBox(
                              height: 38,
                            ),
                            Text(
                              'Gejala',
                              style: blackTextStyle.copyWith(fontSize: 15),
                            ),
                            Text(
                              state.historyConsultationDoctorNote.value
                                      .consultationDoctorNote?.indication ??
                                  '-',
                              style: blackRegulerTextStyle.copyWith(
                                fontSize: 15,
                                color: blackColor,
                              ),
                            ),
                            dividergrey(),
                            const SizedBox(
                              height: 26,
                            ),
                            Text(
                              'Kemungkinan Diagnosis',
                              style: blackHigtTextStyle.copyWith(fontSize: 15),
                            ),
                            Text(
                              '${state.historyConsultationDoctorNote.value.consultationDoctorNote?.diagnosisPossibilty ?? '-'}\n${state.historyConsultationDoctorNote.value.consultationDoctorNote?.diagnosisSecondary ?? '-'}',
                              style: blackRegulerTextStyle.copyWith(
                                fontSize: 15,
                                color: blackColor,
                              ),
                            ),
                            dividergrey(),
                            const SizedBox(
                              height: 26,
                            ),
                            Text(
                              'Saran',
                              style: blackHigtTextStyle.copyWith(fontSize: 15),
                            ),
                            Text(
                              state.historyConsultationDoctorNote.value
                                      .consultationDoctorNote?.suggestion ??
                                  '-',
                              style: blackRegulerTextStyle.copyWith(
                                fontSize: 15,
                                color: blackColor,
                              ),
                            ),
                            dividergrey(),
                          ],
                        ),
                      ),
                      const dividergreen(),
                      const SizedBox(
                        height: 19,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 24,
                          right: 24,
                        ),
                        child: Text(
                          'Resep Dokter',
                          style: blackTextStyle.copyWith(fontSize: 15),
                        ),
                      ),
                      const SizedBox(
                        height: 13,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 280),
                        child: Container(
                          width: 105,
                          height: 28,
                          padding:
                              EdgeInsets.symmetric(horizontal: 38, vertical: 6),
                          decoration: BoxDecoration(
                            color: greenColor,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(27),
                              bottomRight: Radius.circular(27),
                            ),
                          ),
                          child: Text(
                            'Obat',
                            style: whiteTextStyle,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 21,
                      ),
                      Column(
                        children: state.historyConsultationDoctorNote.value
                            .consultationRecipeDrug!
                            .map((e) {
                          return HasilKonsultasiWidgets(
                            namaObat: e.product?.name ?? '-',
                            berapaBayak:
                                e.product?.drugDetail?.specificationPackaging ??
                                    '-',
                          );
                        }).toList(),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      const dividergreen(),
                      SizedBox(
                        height: 18,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 260),
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 38, vertical: 6),
                          decoration: BoxDecoration(
                            color: greenColor,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(27),
                              bottomRight: Radius.circular(27),
                            ),
                          ),
                          child: Text(
                            'Skincare',
                            style: whiteTextStyle.copyWith(fontSize: 13),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: state.historyConsultationDoctorNote.value
                            .consultationRecomendationSkincare!
                            .map((e) {
                          return HasilKonsultasiWidgets(
                            namaObat: e.product?.name ?? '-',
                            berapaBayak:
                                '${e.product?.skincareDetail?.specificationTexture} ${e.product?.skincareDetail?.specificationNetto} ${e.product?.skincareDetail?.specificationNettoType}',
                          );
                        }).toList(),
                      ),
                      const SizedBox(
                        height: 13,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 280),
                        child: Container(
                          width: 105,
                          height: 28,
                          padding:
                              EdgeInsets.symmetric(horizontal: 38, vertical: 6),
                          decoration: BoxDecoration(
                            color: greenColor,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(27),
                              bottomRight: Radius.circular(27),
                            ),
                          ),
                          child: Text(
                            'Treatment',
                            style: whiteTextStyle,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 21,
                      ),
                      Column(
                        children: state.historyConsultationDoctorNote.value
                            .consultationRecomendationTreatment!
                            .map((e) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 24, right: 24, bottom: 10, top: 10),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'R/',
                                      style: blackRegulerTextStyle.copyWith(
                                          fontSize: 15),
                                    ),
                                    const SizedBox(
                                      width: 11,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            e.name ?? '-',
                                            style: grenTextStyle.copyWith(
                                                fontSize: 15),
                                          ),
                                          Column(
                                            children: e
                                                .consultationRecomendationTreatmentClinics!
                                                .map((a) {
                                              return Text(
                                                'Sudah direservasi di ${a.clinic?.name} ${ConvertDate.normalDate(a.createdAt.toString())}',
                                                style: blackRegulerTextStyle
                                                    .copyWith(
                                                  fontSize: 13,
                                                ),
                                              );
                                            }).toList(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 13,
                                ),
                                dividergrey(),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                )
              : Center(
                  child: Text(
                    'Belum catatan dokter',
                    style: TextStyle(
                      fontWeight: bold,
                      fontFamily: 'ProximaNova',
                      fontSize: 20,
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
