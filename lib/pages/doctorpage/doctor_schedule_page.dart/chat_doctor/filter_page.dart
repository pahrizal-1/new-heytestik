import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/pages/doctorpage/doctor_schedule_page.dart/chat_doctor/filter2_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/card_widget.dart';
import 'package:heystetik_mobileapps/models/customer/lookup_skin_goals_model.dart';

import '../../../../controller/customer/interest/interest_controller.dart';
import '../../../../controller/doctor/skincare_recommendations/skincare_recommendations_controller.dart';
import '../../../../controller/doctor/treatment/treatment_doctor_controller.dart';

class FilterPage extends StatelessWidget {
  const FilterPage({super.key});

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
                "Brand",
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
              Row(
                children: [
                  CardFilter(title: "Non-Surgical"),
                  SizedBox(
                    width: 5,
                  ),
                  CardFilter(title: "Surgical")
                ],
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
                          hintStyle:
                              TextStyle(color: subgreyColor, fontSize: 12),
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
                          hintStyle:
                              TextStyle(color: subgreyColor, fontSize: 12),
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

class FilterPageTreatment extends StatefulWidget {
  const FilterPageTreatment({super.key});

  @override
  State<FilterPageTreatment> createState() => _FilterPageTreatmentState();
}

class _FilterPageTreatmentState extends State<FilterPageTreatment> {
  final TreatmentDoctorController state = Get.put(TreatmentDoctorController());
  List fu = ['Non-Surgical', 'Surgical'];

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
                "Brand",
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
                    for (var item in fu)
                      InkWell(
                        onTap: () {
                          if (state.toggleMethods.contains(item)) {
                            setState(() {
                              state.toggleMethods.remove(item);
                              state.filterMethods.remove("$item");
                              print(
                                  'data ${state.toggleMethods} dan selected ${state.filterMethods}');
                            });
                          } else {
                            setState(() {
                              state.toggleMethods.add(item);
                              state.filterMethods.add("$item");
                            });
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: state.toggleMethods.contains(item)
                                ? Color(0xff24A7A0)
                                : Colors.white10,
                            border: Border.all(color: Colors.green),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                          ),
                          // you can change margin to increase spacing between containers
                          margin: const EdgeInsets.all(3),
                          padding: const EdgeInsets.all(5),
                          child: Text("$item"),
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
                          hintStyle:
                              TextStyle(color: subgreyColor, fontSize: 12),
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
                          hintStyle:
                              TextStyle(color: subgreyColor, fontSize: 12),
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
                        Navigator.pop(context);
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

class FilterPageSkincare extends StatefulWidget {
  const FilterPageSkincare({super.key});

  @override
  State<FilterPageSkincare> createState() => _FilterPageSkincareState();
}

class _FilterPageSkincareState extends State<FilterPageSkincare> {
  final InterestController state = Get.put(InterestController());
  final SkincareRecommendationController stateBrand =
      Get.put(SkincareRecommendationController());
  List<Data2>? data = [];
  List fu = [
    'Packing & Unpacking',
    'Cleaning',
    'Painting',
    'Heavy Lifting',
    'Shopping',
    'Watching Netflix',
    'sadfdsfe eaf',
    'ewfsfeagga,' 'gegea',
    'gaegaewgv ewaggaa aweegaage',
    'safa asdfesadfv esfsdf',
    'sadfdsfe eaf',
    'ewfsfeagga,' 'gegea',
    'awfgraga wsg sfage aegea',
    'gaegaewgv ewaggaa aweegaage',
    'asdfehtrbfawefa garevaa aewf a'
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      stateBrand.getSkincareBrand(context);
      data?.addAll(
        await state.lookupSkinGoalsFilter(context, "SKINCARE_CATEGORY"),
      );
      stateBrand.filterBrand;
      stateBrand.filterProduct;
      setState(() {});
    });
    print('state berapa data ${stateBrand.filterBrand}');
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
                  "Filter Skincare",
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
                "Brand",
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
                    for (var item in stateBrand.brandSkincare)
                      InkWell(
                        onTap: () {
                          if (stateBrand.toggleBrand.contains(item.brand)) {
                            setState(() {
                              stateBrand.toggleBrand.remove(item.brand);
                              stateBrand.filterBrand.remove("${item.brand}");
                              print(
                                  'data ${stateBrand.toggleBrand} dan selected ${stateBrand.filterBrand}');
                            });
                          } else {
                            setState(() {
                              stateBrand.toggleBrand.add(item.brand);
                              stateBrand.filterBrand.add("${item.brand}");
                            });
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: stateBrand.toggleBrand.contains(item.brand)
                                ? Color(0xff24A7A0)
                                : Colors.white10,
                            border: Border.all(color: Colors.green),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                          ),
                          // you can change margin to increase spacing between containers
                          margin: const EdgeInsets.all(3),
                          padding: const EdgeInsets.all(5),
                          child: Text("${item.brand}"),
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Jenis Produk",
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
              Container(
                // height: 180.0,
                child: Wrap(
                  children: [
                    for (var item in state.lookupSkinFilter)
                      InkWell(
                        onTap: () {
                          if (stateBrand.toggleProduct.contains(item.id)) {
                            setState(() {
                              stateBrand.toggleProduct.remove(item.id);
                              stateBrand.filterProduct.remove("${item.value}");
                              print(
                                  'data ${stateBrand.toggleProduct} dan selected ${stateBrand.filterProduct}');
                            });
                          } else {
                            setState(() {
                              stateBrand.toggleProduct.add(item.id);
                              stateBrand.filterProduct.add("${item.value}");
                              print(
                                  'data ${stateBrand.toggleProduct} dan selected ${stateBrand.filterProduct}');
                            });
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: stateBrand.toggleProduct.contains(item.id)
                                ? Color(0xff24A7A0)
                                : Colors.white10,
                            border: Border.all(color: Colors.green),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
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
                        Navigator.pop(context);
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
