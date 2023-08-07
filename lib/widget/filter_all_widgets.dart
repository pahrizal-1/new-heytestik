import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/card_widget.dart';

import '../controller/customer/treatment/treatment_controller.dart';
import '../models/lookup_treatment.dart';
import '../pages/solution/solutions_treatment1_Page.dart';

class FilterAllWidget extends StatefulWidget {
  FilterAllWidget({super.key});

  @override
  State<FilterAllWidget> createState() => _FilterAllWidgetState();
}

class _FilterAllWidgetState extends State<FilterAllWidget> {
  final TreatmentController stateTreatment = Get.put(TreatmentController());
  final TextEditingController minPriceController = TextEditingController();
  final TextEditingController maxPriceController = TextEditingController();

  List<String> filter = [];
  List<LookupTreatmentModel> treatments = [];
  String orderBy = "";
  bool promo = false;
  bool openNow = false;
  int? minPrice;
  int? maxPrice;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      treatments.addAll(await stateTreatment.getLookupTreatment(context));
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, top: 70),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Filter',
                style: blackHigtTextStyle.copyWith(fontSize: 20),
              ),
              const SizedBox(
                height: 31,
              ),
              Text(
                'Urutkan',
                style: blackTextStyle.copyWith(fontSize: 15),
              ),
              const SizedBox(
                height: 15,
              ),
              FilterTap(
                title: 'Rating',
                img: 'assets/icons/stars-icons.png',
                onTap: () {
                  if (orderBy == "RATING") {
                    orderBy = "";
                  } else {
                    orderBy = "RATING";
                  }
                  setState(() {});
                },
                isActive: orderBy == "RATING",
              ),
              FilterTap(
                title: 'Popularitas',
                img: 'assets/icons/popularity.png',
                onTap: () {
                  if (orderBy == "POPULARITY") {
                    orderBy = "";
                  } else {
                    orderBy = "POPULARITY";
                  }
                  setState(() {});
                },
                isActive: orderBy == "POPULARITY",
              ),
              FilterTap(
                title: 'Jarak',
                img: 'assets/icons/mapgrey.png',
                onTap: () {
                  if (orderBy == "DISTANCE") {
                    orderBy = "";
                  } else {
                    orderBy = "DISTANCE";
                  }
                  print(orderBy);
                  setState(() {});
                },
                isActive: orderBy == "DISTANCE",
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                'Pilihan Klinik',
                style: blackTextStyle.copyWith(fontSize: 15),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  CardSearch(
                    title: 'Promo',
                    onTap: () {
                      promo = !promo;
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  CardSearch(
                    title: 'Buka Sekarang',
                    onTap: () {
                      openNow = !openNow;
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 28,
              ),
              Text(
                'Pilihan Klinik',
                style: blackTextStyle.copyWith(fontSize: 15),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: minPriceController,
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
                          borderRadius: BorderRadius.circular(7),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                        contentPadding: const EdgeInsets.all(12),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 13,
                  ),
                  Text(
                    'hingga',
                    style: subGreyTextStyle,
                  ),
                  const SizedBox(
                    width: 13,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: maxPriceController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        fillColor: greenColor,
                        hoverColor: greenColor,
                        hintText: 'Max',
                        hintStyle: TextStyle(
                          color: subgreyColor,
                          fontSize: 12,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: greenColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                        contentPadding: const EdgeInsets.all(12),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 29,
              ),
              Text(
                'Treatment',
                style: blackHigtTextStyle.copyWith(fontSize: 15),
              ),
              const SizedBox(
                height: 20,
              ),
              ...treatments.map((treatment) {
                return FilterTapTreatment(
                  title: treatment.name,
                  function: () {
                    filter.add(treatment.name);
                  },
                );
              }).toList(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 90,
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 165,
                    decoration: BoxDecoration(
                      border: Border.all(color: greenColor),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    height: 50,
                    child: Center(
                      child: Text(
                        'Batal',
                        style: grenTextStyle.copyWith(
                          fontSize: 15,
                          fontWeight: bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    minPrice = minPriceController.text == "" ? null : int.parse(minPriceController.text);
                    minPrice = maxPriceController.text == "" ? null : int.parse(maxPriceController.text);

                    Navigator.pop(context, {
                      "treatment": filter,
                      "orderBy": orderBy,
                      "openNow": openNow,
                      "promo": promo,
                      "minPrice": minPrice,
                      "maxPrice": maxPrice,
                    });
                  },
                  child: Container(
                    width: 165,
                    decoration: BoxDecoration(
                      color: greenColor,
                      border: Border.all(color: greenColor),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    height: 50,
                    child: Center(
                      child: Text(
                        'Simpan',
                        style: whiteTextStyle.copyWith(
                          fontSize: 15,
                          fontWeight: bold,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
