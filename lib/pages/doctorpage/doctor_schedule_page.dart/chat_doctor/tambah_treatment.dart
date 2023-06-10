import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:heystetik_mobileapps/pages/doctorpage/doctor_schedule_page.dart/chat_doctor/catatan_produk_docter1_page.dart';
import 'package:heystetik_mobileapps/pages/doctorpage/doctor_schedule_page.dart/chat_doctor/filter_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/card_widget.dart';

class TambahTreatment extends StatefulWidget {
  const TambahTreatment({super.key});

  @override
  State<TambahTreatment> createState() => _TambahTreatmentState();
}

class _TambahTreatmentState extends State<TambahTreatment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Tambah Treatmen",
                  style: TextStyle(
                    fontFamily: 'ProximaNova',
                    fontWeight: bold,
                    fontSize: 20,
                    color: blackColor,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CatatanDocter1(),
                  ),
                );
              },
              child: Text(
                "SIMPAN",
                style: TextStyle(
                  color: greenColor,
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
              const EdgeInsets.only(top: 14, right: 22, left: 22, bottom: 40),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Container(
                            height: 12,
                            width: 12,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/icons/search1.png"),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          constraints: const BoxConstraints(maxWidth: 250),
                          child: TextFormField(
                            style: const TextStyle(
                                fontSize: 15, fontFamily: "ProximaNova"),
                            decoration: InputDecoration(
                              hintText: "Indikasi",
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
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FilterPage(),
                        ),
                      );
                    },
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            "assets/icons/filter.png",
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  CardFilter(title: "Jerawat"),
                  SizedBox(
                    width: 5,
                  ),
                  CardFilter(title: "Kulit Kusam"),
                ],
              ),
              SizedBox(
                height: 35,
                child: Center(
                  child: Divider(
                    color: fromCssColor("#D9D9D9"),
                    thickness: 1,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Sort by",
                    style: TextStyle(
                      fontWeight: bold,
                      fontSize: 12,
                      fontFamily: "ProximaNova",
                      letterSpacing: 0.2,
                      color: fromCssColor('#9B9B9B'),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 25,
                    width: 70,
                    decoration: BoxDecoration(
                      border: Border.all(color: fromCssColor("#F1F1F1")),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 5, top: 5),
                      child: Text(
                        "Method",
                        style: TextStyle(
                            fontWeight: bold,
                            fontFamily: "ProximaNova",
                            fontSize: 12),
                      ),
                    ),
                  ),
                  // DropdownButton(
                  //   items: [
                  //     DropdownMenuItem(
                  //       child: Text(
                  //         "Harga",
                  //         style: TextStyle(
                  //             fontWeight: bold,
                  //             fontFamily: "ProximaNova",
                  //             fontSize: 12),
                  //       ),
                  //       value: "Harga",
                  //     ),
                  //     DropdownMenuItem(
                  // child: Text(
                  //   "Method",
                  //   style: TextStyle(
                  //       fontWeight: bold,
                  //       fontFamily: "ProximaNova",
                  //       fontSize: 12),
                  // ),
                  //       value: "Method",
                  //     ),
                  //   ],
                  //   onChanged: (String? value) {},
                  // ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              ListView.builder(
                shrinkWrap: true,
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 11, bottom: 15, left: 12, right: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    constraints: BoxConstraints(maxWidth: 160),
                                    child: RichText(
                                      text: TextSpan(
                                        text: 'Peeling',
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
                                          'Rp100K-Rp600K',
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
                                          '2-4 hari',
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
                                          'Non-Surgical',
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
                              Container(
                                height: 30,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: greenColor,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.add,
                                    color: whiteColor,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10)
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
