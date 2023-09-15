import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

import '../../../../controller/doctor/skincare_recommendations/skincare_recommendations_controller.dart';
import '../../../../core/global.dart';
import '../../../../widget/button_widget.dart';
import '../../../../widget/loading_widget.dart';

class RekomendasiSkincare3Page extends StatefulWidget {
  final int id;
  const RekomendasiSkincare3Page({super.key, required this.id});

  @override
  State<RekomendasiSkincare3Page> createState() =>
      _RekomendasiSkincare3PageState();
}

class _RekomendasiSkincare3PageState extends State<RekomendasiSkincare3Page> {
  final SkincareRecommendationController state =
      Get.put(SkincareRecommendationController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      state.getSkincareRecomtById(context, widget.id);
      state.getSkincare(context);
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
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: 22,
                  ),
                ),
                SizedBox(
                  width: 9,
                ),
                Text(
                  "Edit Template Skincare",
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
                state.updateSkincare(context, widget.id);
                // log('akhir ' + state.dataSkincareById.toString());
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
      body: Obx(
        () => LoadingWidget(
          isLoading: state.isLoading.value,
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 40),
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
                    child: TextFormField(
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
                    child: TextFormField(
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
                    height: 30,
                  ),
                  Container(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.dataSkincareById.length,
                        itemBuilder: (context, index) {
                          List image = [];
                          String img = '';
                          for (var i in state.dataSkincareById[index]
                              ['skincare']['media_products']) image.add(i);
                          for (var imege in image) {
                            img = imege['media']['path'];
                          }
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      print('data' + image.toString());
                                      for (var i in image) {
                                        print('img ' +
                                            i['media']['path'].toString());
                                      }
                                    },
                                    child: Container(
                                      height: 80,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 0.5,
                                            color: fromCssColor('#E9E9E9')),
                                        image: DecorationImage(
                                          image: img != null
                                              ? NetworkImage(
                                                      Global.FILE + '/' + img)
                                                  as ImageProvider
                                              : AssetImage(
                                                  "assets/images/produk1.png"),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          constraints: const BoxConstraints(
                                              maxWidth: 200),
                                          child: RichText(
                                            text: TextSpan(
                                              text:
                                                  state.dataSkincareById[index]
                                                      ['skincare']['name'],
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
                                                    constraints:
                                                        const BoxConstraints(
                                                            maxWidth: 80),
                                                    child: Text(
                                                      "Pagi & Malam",
                                                      style: TextStyle(
                                                        fontFamily:
                                                            'ProximaNova',
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
                                                    state.dataSkincareById[
                                                                    index]
                                                                ['skincare']
                                                            ['skincare_detail'][
                                                        'specification_how_to_use'],
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
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
                                              'Rp' +
                                                  state.dataSkincareById[index]
                                                          ['skincare']['price']
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
                                  controller: state.notesController[index],
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
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
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
                                        state.dataSkincareById.removeAt(index);
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
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    height: 30,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: fromCssColor("#A3A3A3")),
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
                                                if (state.itemCount >= 1) {
                                                  state.itemCount--;
                                                }
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
                                            state.itemCount.toString(),
                                            style: TextStyle(
                                              fontFamily: "ProximaNova",
                                              fontSize: 13,
                                              color: fromCssColor("#323232"),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                if (state.itemCount >= 0) {
                                                  state.itemCount++;
                                                  print('stat' +
                                                      state.itemCount
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
                        }),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ButtonGreenWidget(
                    title: '+ Tambah Skincare',
                    onPressed: () {
                      // Navigator.push(context, MaterialPageRoute(builder: ((context) => TambahanSkinCare())));
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.white,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.only(
                            topEnd: Radius.circular(25),
                            topStart: Radius.circular(25),
                          ),
                        ),
                        builder: (context) => Wrap(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 25, right: 25, top: 36, bottom: 40),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/icons/danger-icons.png',
                                        width: 14,
                                      ),
                                      const SizedBox(
                                        width: 19,
                                      ),
                                      Text(
                                        'Daftar Skincare',
                                        style: blackTextStyle.copyWith(
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 38,
                                  ),
                                  Container(
                                    // height: 200,
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: state.solutionSkincare.length,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: ((context, index) {
                                        return InkWell(
                                          onTap: () {
                                            List string = [];

                                            setState(() {
                                              // string.add({
                                              //   'skincare': state
                                              //       .solutionSkincare[index]
                                              //       .toJson()
                                              // });
                                              // log('dskin ' + string.toString());
                                              state.dataSkincareById.add({
                                                'skincare': state
                                                    .solutionSkincare[index]
                                                    .toJson()
                                              });
                                              state.notesController
                                                  .add(TextEditingController());
                                            });
                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                            height: 40,
                                            width: double.infinity,
                                            margin: EdgeInsets.only(
                                              bottom: 10,
                                              left: 20,
                                              right: 20,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              border: Border.all(
                                                color: fromCssColor('#D9D9D9'),
                                                width: 1,
                                              ),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                state.solutionSkincare[index]
                                                    .name!,
                                                style:
                                                    blackHigtTextStyle.copyWith(
                                                  fontSize: 15,
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
