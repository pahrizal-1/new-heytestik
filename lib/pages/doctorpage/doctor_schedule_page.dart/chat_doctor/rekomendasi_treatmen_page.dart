import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:heystetik_mobileapps/pages/doctorpage/doctor_schedule_page.dart/chat_doctor/tambah_treatment.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';

import '../../../../controller/doctor/treatment_recommendation/treatment_recommendation_controller.dart';
import '../../settings_doctor/add_treatment_page.dart';
import 'package:get/get.dart';

class RekomendasiTreatmen2Page extends StatefulWidget {
  const RekomendasiTreatmen2Page({super.key});

  @override
  State<RekomendasiTreatmen2Page> createState() =>
      _RekomendasiTreatmen2PageState();
}

class _RekomendasiTreatmen2PageState extends State<RekomendasiTreatmen2Page> {
  final TreatmentRecommendationController state =
      Get.put(TreatmentRecommendationController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: greenColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      state.dataTreatmentItems = [];
                      state.titleController.clear();
                      state.subtitleController.clear();
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      size: 23,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Tambah Template Treatmen',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'ProximaNova',
                      fontWeight: bold,
                      fontSize: 18,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  state.postTreatment(context);
                  for (var i in state.dataTreatmentItems)
                    print('sss' + i.toString());
                },
                child: Text(
                  'SIMPAN',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'ProximaNova',
                    fontWeight: bold,
                    fontSize: 14,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Judul Resep',
                  style: TextStyle(
                    fontFamily: 'ProximaNova',
                    fontSize: 14,
                    letterSpacing: 0.2,
                    fontWeight: FontWeight.w400,
                    color: fromCssColor('#A3A3A3'),
                  ),
                ),
                SizedBox(
                  child: TextField(
                    controller: state.titleController,
                    style: TextStyle(
                      fontFamily: 'ProximaNova',
                      fontSize: 16,
                      fontWeight: bold,
                      letterSpacing: 0.2,
                      color: fromCssColor(
                          '#323232'), // Ubah dengan warna teks yang diinginkan
                    ),
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: fromCssColor('#A3A3A3'),
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Sub Judul Resep',
                  style: TextStyle(
                    fontFamily: 'ProximaNova',
                    fontSize: 14,
                    letterSpacing: 0.2,
                    fontWeight: FontWeight.w400,
                    color: fromCssColor('#A3A3A3'),
                  ),
                ),
                SizedBox(
                  child: TextField(
                    controller: state.subtitleController,
                    style: TextStyle(
                      fontFamily: 'ProximaNova',
                      fontSize: 16,
                      fontWeight: bold,
                      letterSpacing: 0.2,
                      color: fromCssColor(
                          '#323232'), // Ubah dengan warna teks yang diinginkan
                    ),
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: fromCssColor('#A3A3A3'),
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                state.dataTreatmentItems.isNotEmpty
                    ? ListView.builder(
                        shrinkWrap: true,
                        keyboardDismissBehavior:
                            ScrollViewKeyboardDismissBehavior.onDrag,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: state.dataTreatmentItems.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          constraints:
                                              BoxConstraints(maxWidth: 160),
                                          child: RichText(
                                            text: TextSpan(
                                              text: state
                                                      .dataTreatmentItems[index]
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
                                                state.dataTreatmentItems[index]
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
                                                state.dataTreatmentItems[index]
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
                                                state.dataTreatmentItems[index]
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
                                      ],
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          state.dataTreatment.removeAt(index);
                                        });
                                      },
                                      child: Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                "assets/icons/trash.png"),
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
                          );
                        },
                      )
                    : Container(),
                Text(
                  'Resep Rekomendasi',
                  style: TextStyle(
                    fontFamily: 'ProximaNova',
                    fontSize: 14,
                    letterSpacing: 0.2,
                    fontWeight: FontWeight.w400,
                    color: fromCssColor('#A3A3A3'),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ButtonGreenWidget(
                  title: '+ Tambah Treatment',
                  onPressed: () async {
                    String refresh = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const AddTreatmentPage(),
                      ),
                    );

                    if (refresh == 'refresh') {
                      setState(() {
                        state.dataTreatmentItems;
                      });
                    }
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => TambahTreatment(),
                    //     ));
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
