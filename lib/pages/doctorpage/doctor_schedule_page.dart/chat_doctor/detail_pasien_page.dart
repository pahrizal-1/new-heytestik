import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/showimage_fullscreen.dart';
import 'package:intl/intl.dart';

import '../../../../controller/doctor/consultation/consultation_controller.dart';
import '../../../../core/global.dart';
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
  final DoctorConsultationController state = Get.put(DoctorConsultationController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
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
                state.listPreAssesment.value = [];
                state.listPreAssesmentImage.value = [];
                Navigator.pop(context, 'refresh');
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
                              color: state.status.value == 'AKTIF' ? greenColor : orangeColor,
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
                    TextBoldSpacebetwen(
                      title: 'Nama Pasien',
                      title2: state.pasienName.value,
                      title1: '',
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
              Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        // height: Get.height,
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: state.listPreAssesment.length,
                            itemBuilder: (context, index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  PeryataanUmumTextFrom(
                                    pernyattan: state.listPreAssesment[index]['interest_conditions_question'] != null ? state.listPreAssesment[index]['interest_conditions_question']['name'] : '-',
                                    jawaban: state.listPreAssesment[index]['interest_conditions_answer'] != null ? state.listPreAssesment[index]['interest_conditions_answer']['name'] : '-',
                                    //  jawaban: state.listPreAssesment[index]
                                    // ['interest_conditions_answer']['name'],
                                  ),
                                ],
                              );
                            })),
                  ],
                ),
              ),
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
                    Obx(
                      () => Container(
                        height: 110,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: state.listPreAssesmentImage.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Get.to(()=>ShowImageFullScreen(listImagesModel: state.listPreAssesmentImage, current: index));
                                },
                                child: Container(
                                  height: 80,
                                  margin: EdgeInsets.only(
                                    right: 8,
                                  ),
                                  child: Image.network(
                                    '${Global.FILE}/' + state.listPreAssesmentImage[index]['media']['path'],
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),
                    Text(
                      '*Klik foto untuk memperbesar',
                      style: greyTextStyle.copyWith(fontStyle: FontStyle.italic),
                    ),
                    const SizedBox(
                      height: 37,
                    ),
                    state.status.value == 'SELESAI'
                        ? Container()
                        : SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 45,
                            child: TextButton(
                              onPressed: () {
                                state.status.value == 'AKTIF' ? null : state.postFinish(context, widget.id);

                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //             const TambahanSkinCare()));
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: state.status.value == 'AKTIF' ? greyColor : greenColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text('Pre-Assessment Review Selesai', style: whiteTextStyle.copyWith(fontStyle: FontStyle.italic)),
                            ),
                          ),
                    SizedBox(height: 10),
                    state.status.value == 'AKTIF'
                        ? SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 45,
                            child: TextButton(
                              onPressed: () {
                                state.postFinishConsultation(context, widget.id);
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //             const CatatanDocter()));
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: greenColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text('SELESAI KONSULTASI', style: whiteTextStyle.copyWith(fontStyle: FontStyle.italic)),
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
