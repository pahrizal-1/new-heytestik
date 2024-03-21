import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/drug_controller.dart';
import 'package:heystetik_mobileapps/pages/doctorpage/doctor_schedule_page.dart/chat_doctor/filter2_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/card_widget.dart';
import 'package:heystetik_mobileapps/models/customer/lookup_skin_goals_model.dart';

import '../controller/customer/interest/interest_controller.dart';

class FilterTambahObat extends StatefulWidget {
  const FilterTambahObat({super.key});

  @override
  State<FilterTambahObat> createState() => _FilterTambahObatState();
}

class _FilterTambahObatState extends State<FilterTambahObat> {
  final InterestController state = Get.put(InterestController());
  final DrugController stateDrug = Get.put(DrugController());
  List<Data2>? data = [];
  List<Data2>? golonganObat = [];
  List<Data2>? kemasanObat = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      data?.addAll(
        await state.lookupSkinGoalsFilter(context, "MEDICINE_CLASSIFICATIONS"),
      );
      golonganObat?.addAll(
        await state.lookupGolonganObat(context, "MEDICINE_FORM"),
      );
      kemasanObat?.addAll(
        await state.lookupKemasanObat(context, "MEDICINE_PACKAGING"),
      );
      setState(() {});
    });
  }

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
                    stateDrug.toggleGolonganObat = [];
                    stateDrug.toggleBentukObat = [];
                    stateDrug.toggleKemasanObat = [];
                    stateDrug.filterGolonganObat = [];
                    stateDrug.filterBentukObat = [];
                    stateDrug.filterKemasanObat = [];
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    size: 22,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Filter",
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
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                transform: Matrix4.translationValues(0, -5, 0),
                child: Divider(
                  thickness: 1,
                ),
              ),
              Text(
                "Golongan Obat",
                style: TextStyle(
                  fontFamily: "Proximanova",
                  fontSize: 20,
                  letterSpacing: 1,
                  fontWeight: bold,
                  color: blackColor,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                // height: 180.0,
                child: Wrap(
                  children: [
                    for (var item in state.lookupSkinFilter)
                      InkWell(
                        onTap: () {
                          if (stateDrug.toggleGolonganObat.contains(item.value)) {
                            print('state ${item.value}');
                            setState(() {
                              stateDrug.toggleGolonganObat.remove(item.value);
                              stateDrug.filterGolonganObat.remove("${item.value}");
                              print('data ${stateDrug.toggleGolonganObat} dan selected ${stateDrug.filterGolonganObat}');
                            });
                          } else {
                            print('state ${item.value}');

                            setState(() {
                              stateDrug.toggleGolonganObat.add(item.value);
                              stateDrug.filterGolonganObat.add("${item.value}");
                            });
                          }
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            // color: Colors.white10,
                            color: stateDrug.toggleGolonganObat.contains(item.value) ? Color(0xff24A7A0) : Colors.white10,
                            border: Border.all(color: Colors.green),
                            borderRadius: const BorderRadius.all(Radius.circular(5)),
                          ),
                          // you can change margin to increase spacing between containers
                          margin: const EdgeInsets.all(3),
                          padding: const EdgeInsets.all(5),
                          child: Text("${item.value}"),
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Bentuk Obat",
                style: TextStyle(
                  fontFamily: "Proximanova",
                  fontSize: 20,
                  letterSpacing: 1,
                  fontWeight: bold,
                  color: blackColor,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                // height: 180.0,
                child: Wrap(
                  children: [
                    for (var item in state.lookupGolonganObatFilter)
                      InkWell(
                        onTap: () {
                          // if (stateBrand.toggleBrand.contains(item.brand)) {
                          //   setState(() {
                          //     stateBrand.toggleBrand.remove(item.brand);
                          //     stateBrand.filterBrand.remove("${item.brand}");
                          //     print('data ${stateBrand.toggleBrand} dan selected ${stateBrand.filterBrand}');
                          //   });
                          // } else {
                          //   setState(() {
                          //     stateBrand.toggleBrand.add(item.brand);
                          //     stateBrand.filterBrand.add("${item.brand}");
                          //   });
                          // }
                        },
                        child: Container(
                          // height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white10,
                            // color: stateBrand.toggleBrand.contains(item.brand) ? Color(0xff24A7A0) : Colors.white10,
                            border: Border.all(color: Colors.green),
                            borderRadius: const BorderRadius.all(Radius.circular(5)),
                          ),
                          // you can change margin to increase spacing between containers
                          margin: const EdgeInsets.all(3),
                          padding: const EdgeInsets.all(5),
                          child: Text("${item.value}"),
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(
                height: 39,
              ),
              Text(
                "Kemasan",
                style: TextStyle(
                  fontFamily: "Proximanova",
                  fontSize: 20,
                  letterSpacing: 1,
                  fontWeight: bold,
                  color: blackColor,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                // height: 180.0,
                child: Wrap(
                  children: [
                    for (var item in state.lookupKemasanObatFilter)
                      InkWell(
                        onTap: () {
                          // if (stateBrand.toggleBrand.contains(item.brand)) {
                          //   setState(() {
                          //     stateBrand.toggleBrand.remove(item.brand);
                          //     stateBrand.filterBrand.remove("${item.brand}");
                          //     print('data ${stateBrand.toggleBrand} dan selected ${stateBrand.filterBrand}');
                          //   });
                          // } else {
                          //   setState(() {
                          //     stateBrand.toggleBrand.add(item.brand);
                          //     stateBrand.filterBrand.add("${item.brand}");
                          //   });
                          // }
                        },
                        child: Container(
                          // height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white10,
                            // color: stateBrand.toggleBrand.contains(item.brand) ? Color(0xff24A7A0) : Colors.white10,
                            border: Border.all(color: Colors.green),
                            borderRadius: const BorderRadius.all(Radius.circular(5)),
                          ),
                          // you can change margin to increase spacing between containers
                          margin: const EdgeInsets.all(3),
                          padding: const EdgeInsets.all(5),
                          child: Text("${item.value}"),
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Range Harga",
                style: TextStyle(
                  fontFamily: "Proximanova",
                  fontSize: 20,
                  letterSpacing: 0.5,
                  fontWeight: bold,
                  color: blackColor,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 30,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          fillColor: greenColor,
                          hoverColor: greenColor,
                          hintText: 'Min.',
                          hintStyle: TextStyle(color: subgreyColor, fontSize: 12),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: greenColor,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(7)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                          ),
                          contentPadding: const EdgeInsets.all(12),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 13,
                  ),
                  Text(
                    'hingga',
                    style: subGreyTextStyle,
                  ),
                  SizedBox(
                    width: 13,
                  ),
                  Expanded(
                    child: Container(
                      height: 30,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          fillColor: greenColor,
                          hoverColor: greenColor,
                          hintText: 'Max',
                          hintStyle: TextStyle(color: subgreyColor, fontSize: 12),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: greenColor,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(7)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                          ),
                          contentPadding: const EdgeInsets.all(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 115,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 150,
                    height: 35,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: TextButton.styleFrom(
                        side: BorderSide(color: greenColor, width: 2),
                        backgroundColor: whiteColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        "Batal",
                        style: TextStyle(
                          fontSize: 13,
                          color: greenColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    height: 35,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Filter2Page(),
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: greenColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        "Tampilkan",
                        style: TextStyle(
                          fontSize: 13,
                          color: whiteColor,
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
