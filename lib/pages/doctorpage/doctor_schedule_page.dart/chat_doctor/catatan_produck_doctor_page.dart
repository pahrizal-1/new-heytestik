import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/pages/doctorpage/doctor_schedule_page.dart/chat_doctor/rekomendasi_medicine_page.dart';
import 'package:heystetik_mobileapps/pages/doctorpage/doctor_schedule_page.dart/chat_doctor/rekomendasi_skincare1_page.dart';
import 'package:heystetik_mobileapps/pages/doctorpage/doctor_schedule_page.dart/chat_doctor/rekomendasi_treatmen1_page.dart';
import 'package:heystetik_mobileapps/pages/doctorpage/doctor_schedule_page.dart/chat_doctor/rekomendasi_treatmen_page.dart';
import 'package:heystetik_mobileapps/pages/doctorpage/doctor_schedule_page.dart/chat_doctor/tambahan_skin_care_page.dart';
import 'package:socket_io_client/socket_io_client.dart';

import '../../../../controller/doctor/consultation/consultation_controller.dart';
import '../../../../controller/doctor/treatment_recommendation/treatment_recommendation_controller.dart';
import '../../../../core/global.dart';
import '../../../../theme/theme.dart';

class CatatanDocter extends StatefulWidget {
  final String? name;
  final int? idConstul;
  final Socket? socket;
  final String? roomCode;
  const CatatanDocter({
    super.key,
    this.name,
    this.idConstul,
    this.socket,
    this.roomCode,
  });

  @override
  State<CatatanDocter> createState() => _CatatanDocterState();
}

class _CatatanDocterState extends State<CatatanDocter> {
  bool isSelected = false;
  bool isSufficButton = false;
  String? img;
  List<int>? itemCount;
  final DoctorConsultationController state =
      Get.put(DoctorConsultationController());
  final TreatmentRecommendationController stateTreatment =
      Get.put(TreatmentRecommendationController());
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
                      state.diagnosisPossibility.value = [];
                      state.listSkincare = [];
                      state.notesSkincare = [];
                      state.listTreatmentNote = [];
                      state.listItemCount = [];
                      state.listObat = [];
                      state.notesMedicine = [];
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
                  var data = {
                    "room": widget.roomCode,
                    "message": '####',
                  };
                  widget.socket?.emit('sendMessage', data);
                  Get.back();
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
                    hintText: '',
                    suffix: state.diagnosisPossibilityController.text.length > 0
                        ? InkWell(
                            onTap: () {
                              state.diagnosisPossibility.add(
                                  state.diagnosisPossibilityController.text);
                              state.diagnosisPossibilityController.clear();
                            },
                            child: Container(
                              height: 30,
                              width: 90,
                              decoration: BoxDecoration(
                                  color: greenColor,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Center(
                                  child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Tambahkan',
                                  style: whiteTextStyle,
                                ),
                              )),
                            ),
                          )
                        : Container()),
                onChanged: (text) {
                  print(text);
                  setState(() {});
                },
                // onEditingComplete: () {
                //   if (state.diagnosisPossibilityController.text == '') {
                //     state.diagnosisPossibility.clear();
                //     print('kosong');
                //   } else {
                //     state.diagnosisPossibility
                //         .add(state.diagnosisPossibilityController.text);
                //     state.diagnosisPossibilityController.clear();
                //     print(state.diagnosisPossibility);
                //   }
                // },
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
                  hintText: '',
                  suffix: state.diagnosisSecondaryController.text.length > 0
                      ? InkWell(
                          onTap: () {
                            state.diagnosisSecondary
                                .add(state.diagnosisSecondaryController.text);
                            state.diagnosisSecondaryController.clear();
                          },
                          child: Container(
                            height: 30,
                            width: 90,
                            decoration: BoxDecoration(
                                color: greenColor,
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Tambahkan',
                                style: whiteTextStyle,
                              ),
                            )),
                          ),
                        )
                      : Container(),
                ),
                onChanged: (text) {
                  print(text);
                  setState(() {});
                },
                // onEditingComplete: () {
                //   if (state.diagnosisSecondaryController.text == '') {
                //     state.diagnosisSecondary.clear();
                //     print('kosong');
                //   } else {
                //     state.diagnosisSecondary
                //         .add(state.diagnosisSecondaryController.text);
                //     state.diagnosisSecondaryController.clear();
                //     print(state.diagnosisSecondary);
                //   }
                // },
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
                onTap: () async {
                  String refresh = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RekomendasiSkincare1Page(),
                    ),
                  );
                  if (refresh == 'refresh') {
                    setState(() {
                      state.listSkincare;
                      state.notesSkincare;
                    });
                  }
                },
                child: Text(
                  '+ Tambah Dari Template',
                  style: grenTextStyle.copyWith(fontSize: 15),
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 45,
                decoration: BoxDecoration(
                    border: Border.all(color: greenColor),
                    borderRadius: BorderRadius.circular(7)),
                child: OutlinedButton(
                  onPressed: () async {
                    String refresh = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TambahanSkinCare(),
                      ),
                    );

                    if (refresh == 'refresh') {
                      setState(() {
                        state.listSkincare;
                        state.notesSkincare;
                        state.listItemCount;
                      });
                    }
                  },
                  child: Text(
                    '+ Tambah Skincare',
                    style: grenTextStyle.copyWith(fontSize: 13),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ListView.builder(
                shrinkWrap: true,
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.listSkincare.length,
                itemBuilder: (BuildContext context, int index) {
                  List image = [];
                  String title = '';
                  String imgList = '';
                  String howToUse = '';
                  String rupiah = '';

                  title = state.listSkincare[index]['name'];
                  howToUse = state.listSkincare[index]['skincare_detail']
                      ['specification_how_to_use'];
                  rupiah = 'Rp' + state.listSkincare[index]['price'].toString();
                  for (var i in state.listSkincare[index]['media_products'])
                    image.add(i);
                  for (var imege in image) {
                    imgList = imege['media']['path'];
                  }
                  // return Text(state.listSkincare[index].toString());
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              print(state.listSkincare[index]);
                              print(state.listItemCount);
                              // print('data' + image.toString());
                              // for (var i in image) {
                              //   print('img ' + i['media']['path'].toString());
                              // }
                            },
                            child: Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 0.5, color: fromCssColor('#E9E9E9')),
                                image: DecorationImage(
                                  image: state.listSkincare[index]
                                              ['media_products'] !=
                                          null
                                      ? NetworkImage(
                                              Global.FILE + '/' + imgList)
                                          as ImageProvider
                                      : AssetImage("assets/images/produk1.png"),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  constraints:
                                      const BoxConstraints(maxWidth: 200),
                                  child: RichText(
                                    text: TextSpan(
                                      text: title,
                                      style: TextStyle(
                                        fontFamily: 'ProximaNova',
                                        color: greenColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        height: 1.1,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Penggunaan",
                                      style: TextStyle(
                                        fontFamily: 'ProximaNova',
                                        fontSize: 12,
                                        height: 1.3,
                                        letterSpacing: 0.5,
                                        color: fromCssColor(
                                          '#9B9B9B',
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            // color: Colors.amberAccent,
                                            constraints: const BoxConstraints(
                                                maxWidth: 80),
                                            child: Text(
                                              "Pagi & Malam",
                                              style: TextStyle(
                                                fontFamily: 'ProximaNova',
                                                fontSize: 12,
                                                height: 1.3,
                                                letterSpacing: 0.5,
                                                color: fromCssColor(
                                                  '#9B9B9B',
                                                ),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            howToUse,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontFamily: 'ProximaNova',
                                              fontSize: 12,
                                              height: 1.3,
                                              letterSpacing: 0.5,
                                              color: fromCssColor(
                                                '#9B9B9B',
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      rupiah,
                                      style: TextStyle(
                                        fontFamily: 'ProximaNova',
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.5,
                                        color: fromCssColor(
                                          '#323232',
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 60,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 40,
                        child: TextFormField(
                          controller: state.notesSkincare[index],
                          decoration: InputDecoration(
                            labelText: "Catatan",
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: greenColor,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: greenColor,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelStyle: TextStyle(
                              color: fromCssColor("#A3A3A3"),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                state.listSkincare.removeAt(index);
                                state.listItemCount!.removeAt(index);
                              });
                              print('hey' + state.listSkincare.toString());
                            },
                            child: Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/icons/trash.png"),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 30,
                            width: 80,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: fromCssColor("#A3A3A3")),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        // if (state.listSkincare[index]['qty'] >= 1) {
                                        //   state.listSkincare[index]['qty']--;
                                        //   print('stat' +
                                        //       state.listSkincare[index]['qty']
                                        //           .toString());
                                        // }
                                        if (state.listItemCount![index] >= 1) {
                                          state.listItemCount![index]--;
                                          print('stat' +
                                              state.listItemCount![index]
                                                  .toString());
                                        }
                                        // if (state.itemCount >= 1) {
                                        //   state.itemCount--;
                                        // }
                                      });
                                    },
                                    child: Text(
                                      "-",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: bold,
                                        fontFamily: "ProximaNova",
                                        color: fromCssColor("#A3A3A3"),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    state.listItemCount![index].toString(),
                                    style: TextStyle(
                                      fontFamily: "ProximaNova",
                                      fontSize: 13,
                                      color: fromCssColor("#323232"),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        if (state.listItemCount![index] >= 0) {
                                          state.listItemCount![index]++;
                                          print('stat' +
                                              state.listItemCount![index]
                                                  .toString());
                                        }
                                      });
                                    },
                                    child: Text(
                                      "+",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: bold,
                                        fontFamily: "ProximaNova",
                                        color: greenColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                    ],
                  );
                },
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
                onTap: () async {
                  String refresh = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RekomendasiTreatmen1Page(),
                    ),
                  );

                  if (refresh == 'refresh') {
                    // do update here
                    setState(() {
                      state.listTreatmentNote;
                    });
                  }
                },
                child: Text(
                  '+ Tambah Dari Template',
                  style: grenTextStyle.copyWith(fontSize: 15),
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 45,
                decoration: BoxDecoration(
                    border: Border.all(color: greenColor),
                    borderRadius: BorderRadius.circular(7)),
                child: OutlinedButton(
                  onPressed: () async {
                    String refresh = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RekomendasiTreatmen2Page(),
                      ),
                    );

                    if (refresh == 'refresh') {
                      //  do update
                      setState(() {
                        state.listTreatmentNote;
                      });
                    }
                  },
                  child: Text(
                    '+ Tambah Treatment',
                    style: grenTextStyle.copyWith(fontSize: 13),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ListView.builder(
                shrinkWrap: true,
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                physics: NeverScrollableScrollPhysics(),
                itemCount: state.listTreatmentNote.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      print(state.listTreatmentNote);
                    },
                    child: Column(
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    constraints: BoxConstraints(maxWidth: 160),
                                    child: RichText(
                                      text: TextSpan(
                                        text: state.listTreatmentNote[index]
                                            ['name'],
                                        style: TextStyle(
                                          fontFamily: 'ProximaNova',
                                          color: greenColor,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          height: 1.1,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 75,
                                        child: Text(
                                          "Cost",
                                          style: TextStyle(
                                            fontFamily: 'ProximaNova',
                                            fontSize: 12,
                                            height: 1.3,
                                            letterSpacing: 0.5,
                                            color: fromCssColor(
                                              '#9B9B9B',
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        // color: Colors.amberAccent,

                                        child: Text(
                                          state.listTreatmentNote[index]
                                              ['cost'],
                                          style: TextStyle(
                                            fontFamily: 'ProximaNova',
                                            fontSize: 12,
                                            height: 1.3,
                                            letterSpacing: 0.5,
                                            color: fromCssColor(
                                              '#9B9B9B',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 75,
                                        child: Text(
                                          "Recov. Time",
                                          style: TextStyle(
                                            fontFamily: 'ProximaNova',
                                            fontSize: 12,
                                            height: 1.3,
                                            letterSpacing: 0.5,
                                            color: fromCssColor(
                                              '#9B9B9B',
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        // color: Colors.amberAccent,

                                        child: Text(
                                          state.listTreatmentNote[index]
                                              ['recovery_time'],
                                          style: TextStyle(
                                            fontFamily: 'ProximaNova',
                                            fontSize: 12,
                                            height: 1.3,
                                            letterSpacing: 0.5,
                                            color: fromCssColor(
                                              '#9B9B9B',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 75,
                                        child: Text(
                                          "Type",
                                          style: TextStyle(
                                            fontFamily: 'ProximaNova',
                                            fontSize: 12,
                                            height: 1.3,
                                            letterSpacing: 0.5,
                                            color: fromCssColor(
                                              '#9B9B9B',
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        // color: Colors.amberAccent,

                                        child: Text(
                                          state.listTreatmentNote[index]
                                              ['type'],
                                          style: TextStyle(
                                            fontFamily: 'ProximaNova',
                                            fontSize: 12,
                                            height: 1.3,
                                            letterSpacing: 0.5,
                                            color: fromCssColor(
                                              '#9B9B9B',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    state.listTreatmentNote.removeAt(index);
                                  });
                                },
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image:
                                          AssetImage("assets/icons/trash.png"),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 35,
                          child: Center(
                            child: Divider(
                              thickness: 1,
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 18,
              ),
              const Divider(
                thickness: 1,
              ),
              const SizedBox(
                height: 17,
              ),
              Text(
                'Rekomendasi Obat',
                style: blackHigtTextStyle.copyWith(fontSize: 20),
              ),
              const SizedBox(
                height: 13,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 45,
                decoration: BoxDecoration(
                    border: Border.all(color: greenColor),
                    borderRadius: BorderRadius.circular(7)),
                child: OutlinedButton(
                  onPressed: () async {
                    String refresh = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RecomendationDrug(),
                      ),
                    );

                    if (refresh == 'refresh') {
                      //  do update
                      setState(() {
                        state.listObat;
                        state.notesMedicine;
                        // do something
                        // state.listTreatmentNote;
                      });
                    }
                  },
                  child: Text(
                    '+ Tambah Obat',
                    style: grenTextStyle.copyWith(fontSize: 13),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ListView.builder(
                shrinkWrap: true,
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.listObat.length,
                itemBuilder: (BuildContext context, int index) {
                  // return Text(state.listSkincare[index].toString());
                  List image = [];
                  String imgList = '';

                  // for (var i in state.listObat[index]['image']) image.add(i);
                  // for (var imege in image) {
                  //   imgList = imege;
                  // }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 0.5, color: fromCssColor('#E9E9E9')),
                                image: DecorationImage(
                                  image: state.listObat[index]['image'] != null
                                      ? NetworkImage("${Global.FILE}/" +
                                              state.listObat[index]['image'])
                                          as ImageProvider
                                      : AssetImage("assets/images/produk1.png"),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  constraints:
                                      const BoxConstraints(maxWidth: 200),
                                  child: RichText(
                                    text: TextSpan(
                                      text: state.listObat[index]['name'],
                                      style: TextStyle(
                                        fontFamily: 'ProximaNova',
                                        color: greenColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        height: 1.1,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Penggunaan",
                                      style: TextStyle(
                                        fontFamily: 'ProximaNova',
                                        fontSize: 12,
                                        height: 1.3,
                                        letterSpacing: 0.5,
                                        color: fromCssColor(
                                          '#9B9B9B',
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            // color: Colors.amberAccent,
                                            constraints: const BoxConstraints(
                                                maxWidth: 80),
                                            child: Text(
                                              "Pagi & Malam",
                                              style: TextStyle(
                                                fontFamily: 'ProximaNova',
                                                fontSize: 12,
                                                height: 1.3,
                                                letterSpacing: 0.5,
                                                color: fromCssColor(
                                                  '#9B9B9B',
                                                ),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            state.listObat[index]['penggunaan'],
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontFamily: 'ProximaNova',
                                              fontSize: 12,
                                              height: 1.3,
                                              letterSpacing: 0.5,
                                              color: fromCssColor(
                                                '#9B9B9B',
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Rp. ' +
                                          state.listObat[index]['harga']
                                              .toString(),
                                      style: TextStyle(
                                        fontFamily: 'ProximaNova',
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.5,
                                        color: fromCssColor(
                                          '#323232',
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 60,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 40,
                        child: TextFormField(
                          controller: state.notesMedicine[index],
                          decoration: InputDecoration(
                            labelText: "Catatan",
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: greenColor,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: greenColor,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelStyle: TextStyle(
                              color: fromCssColor("#A3A3A3"),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                state.listObat.removeAt(index);
                              });
                            },
                            child: Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/icons/trash.png"),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
