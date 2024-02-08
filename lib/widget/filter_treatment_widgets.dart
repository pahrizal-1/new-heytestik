// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/card_widget.dart';
import '../controller/customer/treatment/treatment_controller.dart';
import '../models/lookup_treatment.dart';

class FilterAllTreatmentWidget extends StatefulWidget {
  const FilterAllTreatmentWidget({super.key});

  @override
  State<FilterAllTreatmentWidget> createState() => _FilterAllWidgetState();
}

class _FilterAllWidgetState extends State<FilterAllTreatmentWidget> {
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
              filterOrder(
                title: 'Rating',
                img: 'assets/icons/stars-icons.png',
                onTap: () {
                  if (orderBy == "RATING") {
                    orderBy = "";
                  } else {
                    orderBy = "RATING";
                  }
                  print("RATING " + orderBy);
                  setState(() {});
                },
                isSelected: orderBy == "RATING",
              ),
              filterOrder(
                title: 'Popularitas',
                img: 'assets/icons/popularity.png',
                onTap: () {
                  if (orderBy == "POPULARITY") {
                    orderBy = "";
                  } else {
                    orderBy = "POPULARITY";
                  }
                  print("POPULARITY " + orderBy);
                  setState(() {});
                },
                isSelected: orderBy == "POPULARITY",
              ),
              filterOrder(
                title: 'Jarak',
                img: 'assets/icons/mapgrey.png',
                onTap: () {
                  if (orderBy == "DISTANCE") {
                    orderBy = "";
                  } else {
                    orderBy = "DISTANCE";
                  }
                  print("DISTANCE " + orderBy);
                  setState(() {});
                },
                isSelected: orderBy == "DISTANCE",
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
                return TreatmentType(
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
                    minPrice = minPriceController.text == ""
                        ? null
                        : int.parse(minPriceController.text);
                    maxPrice = maxPriceController.text == ""
                        ? null
                        : int.parse(maxPriceController.text);
                    var param = {
                      "treatment": filter,
                      "orderBy": orderBy,
                      "openNow": openNow,
                      "promo": promo,
                      "minPrice": minPrice,
                      "maxPrice": maxPrice,
                    };

                    Navigator.pop(context, param);
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

  Widget filterOrder({
    required String title,
    required String img,
    required bool isSelected,
    required Function() onTap,
  }) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            onTap();
            setState(() {
              isSelected = !isSelected;
            });
          },
          child: Row(
            children: [
              Container(
                width: 17,
                height: 17,
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(img))),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                title,
                style: blackRegulerTextStyle.copyWith(color: blackColor),
              ),
              const Spacer(),
              Icon(
                isSelected ? Icons.radio_button_on : Icons.circle_outlined,
                color: isSelected ? greenColor : blackColor,
              ),
            ],
          ),
        ),
        Divider(
          thickness: 1,
          color: borderColor,
        )
      ],
    );
  }
}

class TreatmentType extends StatefulWidget {
  final String title;
  Function()? function;

  TreatmentType({
    Key? key,
    required this.title,
    this.function,
  }) : super(key: key);

  @override
  State<TreatmentType> createState() => _TreatmentTypeState();
}

class _TreatmentTypeState extends State<TreatmentType> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              widget.function == null ? () {} : widget.function!();
              setState(() {
                isSelected = !isSelected;
              });
            },
            child: Row(
              children: [
                Text(
                  widget.title,
                  style:
                      blackTextStyle.copyWith(color: blackColor, fontSize: 15),
                ),
                const Spacer(),
                Icon(
                  isSelected ? Icons.radio_button_on : Icons.circle_outlined,
                  color: isSelected ? greenColor : blackColor,
                ),
              ],
            ),
          ),
          Divider(
            thickness: 1,
            color: borderColor,
          )
        ],
      ),
    );
  }
}

class FilterTreatmentType extends StatefulWidget {
  const FilterTreatmentType({
    super.key,
  });

  @override
  State<FilterTreatmentType> createState() => _FilterTreatmentTypeState();
}

class _FilterTreatmentTypeState extends State<FilterTreatmentType> {
  final TreatmentController treatmentController =
      Get.put(TreatmentController());
  List<String> filter = [];
  List<LookupTreatmentModel> treatments = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      treatments.addAll(await treatmentController.getLookupTreatment(context));
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 25,
            right: 25,
            top: 70,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Treatment',
                style: blackHigtTextStyle.copyWith(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ...treatments.map((treatment) {
                return FilterTapTreatment(
                  onTap: () {
                    filter.add(treatment.name);
                  },
                  title: treatment.name,
                );
              }).toList(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 22,
              top: 10,
              bottom: 10,
              right: 22,
            ),
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
                      Navigator.pop(context, filter);
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
        ],
      ),
    );
  }
}

class FilterTapTreatment extends StatefulWidget {
  final String title;
  final Function()? onTap;

  const FilterTapTreatment({
    Key? key,
    required this.title,
    this.onTap,
  }) : super(key: key);

  @override
  State<FilterTapTreatment> createState() => _FilterTapTreatmentState();
}

class _FilterTapTreatmentState extends State<FilterTapTreatment> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              widget.onTap == null ? () {} : widget.onTap!();
              setState(() {
                isSelected = !isSelected;
              });
            },
            child: Row(
              children: [
                Text(
                  widget.title,
                  style:
                      blackTextStyle.copyWith(color: blackColor, fontSize: 15),
                ),
                const Spacer(),
                Icon(
                  isSelected ? Icons.radio_button_on : Icons.circle_outlined,
                  color: isSelected ? greenColor : blackColor,
                ),
              ],
            ),
          ),
          Divider(
            thickness: 1,
            color: borderColor,
          )
        ],
      ),
    );
  }
}
