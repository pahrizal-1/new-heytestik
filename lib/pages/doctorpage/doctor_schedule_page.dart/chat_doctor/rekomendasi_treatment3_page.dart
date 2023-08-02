import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/pages/doctorpage/doctor_schedule_page.dart/chat_doctor/tambah_treatment.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';

import '../../../../controller/doctor/treatment_recommendation/treatment_recommendation_controller.dart';
import '../../../../widget/loading_widget.dart';
import '../../../setings&akun/add_treatment_page.dart';

class RekomendasiTreatmen3Page extends StatefulWidget {
  final int id;
  const RekomendasiTreatmen3Page({
    super.key,
    required this.id,
  });

  @override
  State<RekomendasiTreatmen3Page> createState() =>
      _RekomendasiTreatmen3PageState();
}

class _RekomendasiTreatmen3PageState extends State<RekomendasiTreatmen3Page> {
  final TreatmentRecommendationController state =
      Get.put(TreatmentRecommendationController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      state.getRecipeTreatementById(context, widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: greenColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      state.dataTreatmentItemsById = [];
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: 20,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Edit Template Treatmen",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'ProximaNova',
                      fontWeight: bold,
                      fontSize: 16,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  log('3' + state.dataTreatmentItemsById.toString());
                  state.updateTreatment(context, 1);
                },
                child: Text(
                  "SIMPAN",
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
        body: Obx(() => LoadingWidget(
              isLoading: state.isLoading.value,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 20, left: 20, right: 20, bottom: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Judul Resep",
                        style: TextStyle(
                          fontFamily: "ProximaNova",
                          fontSize: 14,
                          letterSpacing: 0.2,
                          fontWeight: FontWeight.w400,
                          color: fromCssColor("#A3A3A3"),
                        ),
                      ),
                      SizedBox(
                        child: TextField(
                          controller: state.titleController,
                          style: TextStyle(
                            fontFamily: "ProximaNova",
                            fontSize: 16,
                            fontWeight: bold,
                            letterSpacing: 0.2,
                            color: fromCssColor(
                                "#323232"), // Ubah dengan warna teks yang diinginkan
                          ),
                          decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: fromCssColor("#A3A3A3"),
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
                        "Subjudul Resep",
                        style: TextStyle(
                          fontFamily: "ProximaNova",
                          fontSize: 14,
                          letterSpacing: 0.2,
                          fontWeight: FontWeight.w400,
                          color: fromCssColor("#A3A3A3"),
                        ),
                      ),
                      SizedBox(
                        child: TextField(
                          controller: state.subtitleController,
                          style: TextStyle(
                            fontFamily: "ProximaNova",
                            fontSize: 16,
                            fontWeight: bold,
                            letterSpacing: 0.2,
                            color: fromCssColor(
                                "#323232"), // Ubah dengan warna teks yang diinginkan
                          ),
                          decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: fromCssColor("#A3A3A3"),
                                width: 1.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        "Resep Rekomendasi",
                        style: TextStyle(
                          fontFamily: "ProximaNova",
                          fontSize: 14,
                          letterSpacing: 0.2,
                          fontWeight: FontWeight.w400,
                          color: fromCssColor("#A3A3A3"),
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
                        itemCount: state.dataTreatmentItemsById.length,
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
                                              text:
                                                  state.dataTreatmentItemsById[
                                                      index]['name'],
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
                                                state.dataTreatmentItemsById[
                                                    index]['cost'],
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
                                                state.dataTreatmentItemsById[
                                                    index]['recovery_time'],
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
                                                state.dataTreatmentItemsById[
                                                    index]['type'],
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
                                        // RichText(
                                        //   text: TextSpan(
                                        //     text: 'Lihat daftar klinik',
                                        //     style: TextStyle(
                                        //       fontFamily: 'ProximaNova',
                                        //       color: greenColor,
                                        //       fontSize: 13,
                                        //       height: 1.1,
                                        //       decoration:
                                        //           TextDecoration.underline,
                                        //     ),
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                    Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/icons/trash.png"),
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
                      ),
                      ButtonGreenWidget(
                        title: "+ Tambah Treatment",
                        onPressed: () async {
                          String refresh = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  AddTreatmentPage(),
                            ),
                          );
                          if (refresh == 'refresh') {
                            setState(() {
                              state.dataTreatmentItemsById;
                            });
                          }
                        },
                      )
                    ],
                  ),
                ),
              ),
            )));
  }
}
