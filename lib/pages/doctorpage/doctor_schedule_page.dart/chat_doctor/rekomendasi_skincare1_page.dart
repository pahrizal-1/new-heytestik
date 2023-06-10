import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:heystetik_mobileapps/pages/doctorpage/doctor_schedule_page.dart/chat_doctor/rekomendasi_skincare2_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

class RekomendasiSkincare1Page extends StatelessWidget {
  const RekomendasiSkincare1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Container(
          height: 60,
          width: 60,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        RekomendasiSkincare2Page()),
              );
            },
            backgroundColor: greenColor,
            child: Icon(
              Icons.add,
              size: 40,
            ),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: greenColor,
        title: Text(
          "Rekomendasi Skincare",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'ProximaNova',
            fontWeight: bold,
            fontSize: 20,
            letterSpacing: 0.5,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 50),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(children: [
                  Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Container(
                        height: 12,
                        width: 12,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/icons/search1.png"))),
                      )),
                  Container(
                    constraints: BoxConstraints(maxWidth: 280),
                    child: TextFormField(
                      style: const TextStyle(
                          fontSize: 15, fontFamily: "ProximaNova"),
                      decoration: InputDecoration(
                        hintText: "Cari Resep",
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          fontFamily: "ProximaNova",
                          color: fromCssColor(
                            '#9B9B9B',
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
              SizedBox(
                height: 15,
              ),
              ListView.builder(
                shrinkWrap: true,
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 15,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Container(
                      height: 57,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: fromCssColor("#D9D9D9"),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 15, top: 10, bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Jerawat Ringan Teenderm",
                              style: TextStyle(
                                  fontWeight: bold,
                                  fontFamily: "ProximaNova",
                                  fontSize: 15,
                                  letterSpacing: 0.5),
                            ),
                            Text(
                              "Teenderm hydra",
                              style: TextStyle(
                                  fontFamily: "ProximaNova",
                                  fontSize: 12,
                                  color: fromCssColor('#A3A3A3'),
                                  letterSpacing: 0.5),
                            ),
                          ],
                        ),
                      ),
                    ),
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
