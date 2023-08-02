import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/pages/doctorpage/doctor_schedule_page.dart/chat_doctor/rekomendasi_skincare1_page.dart';
import 'package:heystetik_mobileapps/pages/doctorpage/doctor_schedule_page.dart/chat_doctor/tambah_treatment.dart';
import 'package:heystetik_mobileapps/pages/doctorpage/doctor_schedule_page.dart/chat_doctor/tambahan_skin_care_page.dart';

import '../../../../controller/doctor/consultation/consultation_controller.dart';
import '../../../../theme/theme.dart';

class CatatanDocter extends StatefulWidget {
  final String? name;
  final int? idConstul;
  const CatatanDocter({super.key, this.name, this.idConstul});

  @override
  State<CatatanDocter> createState() => _CatatanDocterState();
}

class _CatatanDocterState extends State<CatatanDocter> {
  bool isSelected = false;
  final DoctorConsultationController state =
      Get.put(DoctorConsultationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: greenColor,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                InkWell(
                    onTap: () {
                      state.indicationController.clear();
                      state.diagnosisPossibilityController.clear();
                      state.diagnosisSecondaryController.clear();
                      state.diagnosisSecondary.value = [];
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back)),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Catatan Doctor',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'ProximaNova',
                    fontWeight: bold,
                    fontSize: 20,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Center(
              child: InkWell(
                onTap: () {
                  state.postDoctorNote(context, widget.idConstul!.toInt());
                },
                child: Text(
                  'SIMPAN',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'ProximaNova',
                    fontWeight: bold,
                    fontSize: 15,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    '${widget.name}',
                    style: blackHigtTextStyle.copyWith(fontSize: 15),
                  ),
                  // const Text('22 tahun')
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                thickness: 1,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Apakah Profilmu Sudah Benar',
                style: blackTextStyle.copyWith(fontSize: 15),
              ),
              Text(
                'Verifikasi berdasarkan nama, jenis kelamin, dan usia.',
                style: subTitleTextStyle.copyWith(fontSize: 15),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        isSelected = true;
                      });
                    },
                    child: Container(
                      // padding: EdgeInsets.only(top: 10),
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        color: isSelected ? greenColor : whiteColor,
                        border: Border.all(
                          color: subTitleColor,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.check,
                          color: whiteColor,
                          size: 17,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 13,
                  ),
                  const Text('Iya'),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        isSelected = false;
                      });
                    },
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          color: isSelected ? whiteColor : greenColor,
                          border: Border.all(
                            color: subTitleColor,
                          ),
                          shape: BoxShape.circle),
                      child: Center(
                        child: Icon(
                          Icons.check,
                          color: whiteColor,
                          size: 17,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 13,
                  ),
                  const Text('Tidak'),
                ],
              ),
              const SizedBox(
                height: 31,
              ),
              Text(
                'Gejala*',
                style: blackTextStyle,
              ),
              const SizedBox(
                height: 11,
              ),
              TextFormField(
                controller: state.indicationController,
                minLines: 3,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(),
                    hintText: ''),
              ),
              const SizedBox(
                height: 11,
              ),
              Text(
                'Kemungkinan Diagnosis*',
                style: blackTextStyle,
              ),
              const SizedBox(
                height: 11,
              ),
              TextFormField(
                controller: state.diagnosisPossibilityController,
                // minLines: 1,
                // maxLines: 6,
                // keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    // alignLabelWithHint: true,
                    border: OutlineInputBorder(),
                    hintText: ''),
                onEditingComplete: () {
                  if (state.diagnosisPossibilityController.text == '') {
                    state.diagnosisPossibility.clear();
                    print('kosong');
                  } else {
                    state.diagnosisPossibility
                        .add(state.diagnosisPossibilityController.text);
                    state.diagnosisPossibilityController.clear();
                    print(state.diagnosisPossibility);
                  }
                },
              ),
              const SizedBox(
                height: 11,
              ),
              Obx(() => Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.diagnosisPossibility.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 23,
                            width: 107,
                            margin: EdgeInsets.only(
                              bottom: 10,
                              right: 10,
                            ),
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(36, 167, 160, 0.1),
                                border: Border.all(
                                  color: greenColor,
                                ),
                                borderRadius: BorderRadius.circular(7)),
                            child: Center(
                              child: Text(state.diagnosisPossibility[index]),
                            ),
                          );
                        }),
                  )),
              // Container(
              //   height: 168,
              //   width: MediaQuery.of(context).size.width,
              //   padding:
              //       const EdgeInsets.symmetric(horizontal: 14, vertical: 17),
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(7),
              //     color: whiteColor,
              //     border: Border.all(color: const Color(0xffCCCCCC), width: 1),
              //   ),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Container(
              //         padding: const EdgeInsets.only(left: 2, right: 2),
              //         width: 72,
              //         height: 23,
              //         decoration: BoxDecoration(
              //             color: const Color.fromRGBO(36, 167, 160, 0.1),
              //             border: Border.all(
              //               color: greenColor,
              //             ),
              //             borderRadius: BorderRadius.circular(7)),
              //         child: Row(
              //           children: [
              //             Text(
              //               'Acne',
              //               style: blackTextStyle.copyWith(
              //                   fontSize: 15, fontWeight: regular),
              //             ),
              //             const Spacer(),
              //             Image.asset(
              //               'assets/icons/danger-icons.png',
              //               width: 10,
              //             )
              //           ],
              //         ),
              //       ),
              //       const Spacer(),
              //       Row(
              //         crossAxisAlignment: CrossAxisAlignment.center,
              //         children: [
              //           const Text('Keywords:'),
              //           const SizedBox(
              //             width: 5,
              //           ),
              //           Container(
              //             height: 23,
              //             width: 107,
              //             decoration: BoxDecoration(
              //                 color: const Color.fromRGBO(36, 167, 160, 0.1),
              //                 border: Border.all(
              //                   color: greenColor,
              //                 ),
              //                 borderRadius: BorderRadius.circular(7)),
              //             child: const Center(child: Text('Acne Vulgaris')),
              //           ),
              //           const SizedBox(
              //             width: 5,
              //           ),
              //           Container(
              //             height: 23,
              //             width: 107,
              //             decoration: BoxDecoration(
              //                 color: const Color.fromRGBO(36, 167, 160, 0.1),
              //                 border: Border.all(
              //                   color: greenColor,
              //                 ),
              //                 borderRadius: BorderRadius.circular(7)),
              //             child: const Center(child: Text('Oily Skins')),
              //           ),
              //         ],
              //       )
              //     ],
              //   ),
              // ),
              const SizedBox(
                height: 11,
              ),
              Text(
                'Diagnosis Sekunder (Opsional)',
                style: blackTextStyle,
              ),
              const SizedBox(
                height: 11,
              ),
              TextFormField(
                controller: state.diagnosisSecondaryController,
                // minLines: 6,
                // maxLines: null,
                // keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    // alignLabelWithHint: true,
                    border: OutlineInputBorder(),
                    hintText: ''),
                onEditingComplete: () {
                  if (state.diagnosisSecondaryController.text == '') {
                    state.diagnosisSecondary.clear();
                    print('kosong');
                  } else {
                    state.diagnosisSecondary
                        .add(state.diagnosisSecondaryController.text);
                    state.diagnosisSecondaryController.clear();
                    print(state.diagnosisSecondary);
                  }
                },
              ),
              const SizedBox(
                height: 11,
              ),
              Obx(() => Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.diagnosisSecondary.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 23,
                            width: 107,
                            margin: EdgeInsets.only(
                              bottom: 10,
                              right: 10,
                            ),
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(36, 167, 160, 0.1),
                                border: Border.all(
                                  color: greenColor,
                                ),
                                borderRadius: BorderRadius.circular(7)),
                            child: Center(
                              child: Text(state.diagnosisSecondary[index]),
                            ),
                          );
                        }),
                  )),
              const SizedBox(
                height: 11,
              ),
              Text(
                'Saran',
                style: blackTextStyle,
              ),
              const SizedBox(
                height: 11,
              ),
              TextFormField(
                controller: state.suggestionController,
                minLines: 6,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(),
                    hintText: ''),
              ),
              const SizedBox(
                height: 27,
              ),
              const Divider(
                thickness: 1,
              ),
              const SizedBox(
                height: 17,
              ),
              Text(
                'Rekomendasi Skincare',
                style: blackHigtTextStyle.copyWith(fontSize: 20),
              ),
              const SizedBox(
                height: 13,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RekomendasiSkincare1Page(),
                    ),
                  );
                },
                child: Text(
                  '+ Tambah Dari Template',
                  style: grenTextStyle.copyWith(fontSize: 15),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return Container();
                },
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 45,
                decoration: BoxDecoration(
                    border: Border.all(color: greenColor),
                    borderRadius: BorderRadius.circular(7)),
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TambahanSkinCare(),
                      ),
                    );
                  },
                  child: Text(
                    '+ Tambah Skincare',
                    style: grenTextStyle.copyWith(fontSize: 13),
                  ),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                thickness: 1,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Rekomendasi Treatment',
                style: blackHigtTextStyle.copyWith(fontSize: 20),
              ),
              const SizedBox(
                height: 13,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RekomendasiSkincare1Page(),
                    ),
                  );
                },
                child: Text(
                  '+ Tambah Dari Template',
                  style: grenTextStyle.copyWith(fontSize: 15),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [],
                  );
                },
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 45,
                decoration: BoxDecoration(
                    border: Border.all(color: greenColor),
                    borderRadius: BorderRadius.circular(7)),
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TambahTreatment(),
                      ),
                    );
                  },
                  child: Text(
                    '+ Tambah Treatment',
                    style: grenTextStyle.copyWith(fontSize: 13),
                  ),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
