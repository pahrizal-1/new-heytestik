// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/account/my_journey_controller.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';

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

  @override
  void initState() {
    super.initState();
    state.getHistoryConsultationDoctorNote(context, widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Padding(
            padding: const EdgeInsets.only(
              right: 23,
            ),
            child: Image.asset(
              'assets/icons/download-icons.png',
              width: 24,
              height: 24,
            ),
          ),
        ],
      ),
      body: Obx(
        () => LoadingWidget(
          isLoading: state.isLoading.value,
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
                            style: blackTextStyle.copyWith(fontSize: 15),
                            children: [
                              TextSpan(
                                // text: '- 22 tahun',
                                text: '-',
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
                      '${state.historyConsultationDoctorNote.value.indication}',
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
                      '${state.historyConsultationDoctorNote.value.diagnosisPossibilty}\n${state.historyConsultationDoctorNote.value.diagnosisSecondary}',
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
                      '${state.historyConsultationDoctorNote.value.suggestion}',
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
                  padding: EdgeInsets.symmetric(horizontal: 38, vertical: 6),
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
              InkWell(
                onTap: () {},
                child: HasilKonsultasiWidgets(
                  // namaObat: 'Cefila® 200 Cefixime',
                  // berapaBayak: '1 Strip (10 tablet)',
                  namaObat: '-',
                  berapaBayak: '-',
                ),
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
                  padding: EdgeInsets.symmetric(horizontal: 38, vertical: 6),
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
              HasilKonsultasiWidgets(
                // namaObat: 'Cefila® 200 Cefixime',
                // berapaBayak: '1 botol',
                namaObat: '-',
                berapaBayak: '-',
              ),
              HasilKonsultasiWidgets(
                // namaObat: 'Teenderm Aqua 200ml',
                // berapaBayak: '1 botol',
                namaObat: '-',
                berapaBayak: '-',
              ),
              HasilKonsultasiWidgets(
                // namaObat: 'Teenderm Aqua 200ml',
                // berapaBayak: '1 botol',
                namaObat: '-',
                berapaBayak: '-',
              ),
              HasilKonsultasiWidgets(
                // namaObat: 'Teenderm Alpha Pure 30ml',
                // berapaBayak: '1 botol',
                namaObat: '-',
                berapaBayak: '-',
              ),
              const SizedBox(
                height: 13,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 280),
                child: Container(
                  width: 105,
                  height: 28,
                  padding: EdgeInsets.symmetric(horizontal: 38, vertical: 6),
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
              Padding(
                padding: const EdgeInsets.only(
                    left: 24, right: 24, bottom: 10, top: 10),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'R/',
                          style: blackRegulerTextStyle.copyWith(fontSize: 15),
                        ),
                        const SizedBox(
                          width: 11,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                // 'Acne Peeling',

                                '-',
                                style: grenTextStyle.copyWith(fontSize: 15),
                              ),
                              Text(
                                // 'Sudah direservasi di Klinik Utama Lithea Min, 12 Jun 2023',
                                '-',
                                style: blackRegulerTextStyle.copyWith(
                                  fontSize: 13,
                                ),
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
              ),
              HasilKonsultasiWidgets(
                // namaObat: 'Acne Facial',
                namaObat: '-',
              ),
              HasilKonsultasiWidgets(
                // namaObat: 'Acne Facial',
                namaObat: '-',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
