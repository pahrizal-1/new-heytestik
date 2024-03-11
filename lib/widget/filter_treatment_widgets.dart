// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/etalase_controller.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/snackbar_widget.dart';
import 'package:heystetik_mobileapps/models/customer/lookup_model.dart'
    as Lookup;

class FilterAllTreatmentWidget extends StatefulWidget {
  Map<String, dynamic>? param;
  FilterAllTreatmentWidget({super.key, this.param});

  @override
  State<FilterAllTreatmentWidget> createState() => _FilterAllWidgetState();
}

class _FilterAllWidgetState extends State<FilterAllTreatmentWidget> {
  TextEditingController minPriceController = TextEditingController();
  TextEditingController maxPriceController = TextEditingController();
  final EtalaseController state = Get.put(EtalaseController());
  List daraRating = [
    {
      'title': 'Rating',
      'value': 'RATING',
      'img': 'assets/icons/stars-icons.png',
    },
    {
      'title': 'Popularitas',
      'value': 'POPULARITY',
      'img': 'assets/icons/popularity.png',
    },
    {
      'title': 'Jarak',
      'value': 'DISTANCE',
      'img': 'assets/icons/mapgrey.png',
    }
  ];
  List<Lookup.Data2> treatments = [];
  Map<String, dynamic>? param = {};
  String? orderBy;
  bool promo = false;
  bool openNow = false;
  bool rating = false;
  int? minPrice;
  int? maxPrice;
  String? treatmentType;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      param = widget.param;

      if (param!.containsKey('order_by')) {
        orderBy = param?['order_by'];
      }
      if (param!.containsKey('treatment_type[]')) {
        treatmentType = param?['treatment_type[]'];
      }
      if (param!.containsKey('min_price')) {
        minPriceController.text = param?['min_price'].toString() ?? '';
      }
      if (param!.containsKey('max_price')) {
        maxPriceController.text = param?['max_price'].toString() ?? '';
      }
      if (param!.containsKey('open_now')) {
        openNow = param?['open_now'];
      }
      if (param!.containsKey('promo')) {
        promo = param?['promo'];
      }
      if (param!.containsKey('rating[]')) {
        rating = true;
      }
      setState(() {});
      treatments.addAll(await state.getLookup(context, "TREATMENT_TYPE"));
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
              ...daraRating.map((el) {
                return filterOrder(
                  title: el['title'],
                  img: el['img'],
                  onTap: () {
                    orderBy = el['value'];
                    setState(() {});
                  },
                  isSelected: orderBy == el['value'],
                );
              }).toList(),
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    filterOnTap(
                      title: 'Promo',
                      isSelected: promo,
                      onTap: () {
                        promo = !promo;
                        setState(() {});
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    filterOnTap(
                      title: 'Buka Sekarang',
                      isSelected: openNow,
                      onTap: () {
                        openNow = !openNow;
                        setState(() {});
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    filterOnTap(
                      title: 'Bintang 4.5+',
                      isSelected: rating,
                      onTap: () {
                        rating = !rating;
                        setState(() {});
                      },
                    )
                  ],
                ),
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
              ...treatments.map((el) {
                return filterTapTreatment(
                  title: el.value.toString(),
                  isSelected: treatmentType == el.value.toString(),
                  onTap: () {
                    treatmentType = el.value.toString();
                    setState(() {});
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
                    if (treatmentType is String) {
                      param?.addAll({"treatment_type[]": treatmentType});
                    } else {
                      param?.remove('treatment_type[]');
                    }
                    if (orderBy is String) {
                      param?.addAll({"order_by": orderBy});
                    } else {
                      param?.remove('order_by');
                    }
                    if (minPrice != null) {
                      param?.addAll({"min_price": minPrice});
                    } else {
                      param?.remove('min_price');
                    }
                    if (maxPrice != null) {
                      param?.addAll({"max_price": maxPrice});
                    } else {
                      param?.remove('max_price');
                    }
                    if (openNow) {
                      param?.addAll({"open_now": openNow});
                    } else {
                      param?.remove('open_now');
                    }
                    if (promo) {
                      param?.addAll({"promo": promo});
                    } else {
                      param?.remove('promo');
                    }
                    if (rating) {
                      param?.addAll({"rating[]": rating});
                    } else {
                      param?.remove('rating[]');
                    }
                    if (param!.isNotEmpty) {
                      Navigator.pop(context, param);
                    } else {
                      SnackbarWidget.getSuccessSnackbar(
                        context,
                        'Info',
                        "Harap pilih filter terlebih dahulu",
                      );
                    }
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

  Widget filterOnTap({
    required Function() onTap,
    required bool isSelected,
    required String title,
  }) {
    return Row(
      children: [
        InkWell(
          onTap: () => onTap(),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            height: 30,
            decoration: BoxDecoration(
              color: isSelected
                  ? const Color.fromRGBO(36, 167, 160, 0.2)
                  : whiteColor,
              borderRadius: BorderRadius.circular(7),
              border: Border.all(
                color: isSelected ? greenColor : const Color(0xffCCCCCC),
              ),
            ),
            child: Text(
              title,
              style: subGreyTextStyle.copyWith(
                  fontSize: 15,
                  color: isSelected ? greenColor : const Color(0Xff9B9B9B)),
            ),
          ),
        ),
      ],
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

class FilterUrutkanRating extends StatefulWidget {
  String? val;

  FilterUrutkanRating({Key? key, this.val}) : super(key: key);

  @override
  State<FilterUrutkanRating> createState() => _FilterUrutkanRatingState();
}

class _FilterUrutkanRatingState extends State<FilterUrutkanRating> {
  List daraRating = [
    {
      'title': 'Rating',
      'value': 'RATING',
      'img': 'assets/icons/stars-icons.png',
    },
    {
      'title': 'Popularitas',
      'value': 'POPULARITY',
      'img': 'assets/icons/popularity.png',
    },
    {
      'title': 'Jarak',
      'value': 'DISTANCE',
      'img': 'assets/icons/mapgrey.png',
    }
  ];
  String? orderBy;

  @override
  void initState() {
    super.initState();
    if (widget.val == "Rating") {
      orderBy = "RATING";
    } else if (widget.val == "Popularitas") {
      orderBy = "POPULARITY";
    } else if (widget.val == "Jarak") {
      orderBy = "DISTANCE";
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, top: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Urutkan',
              style: blackTextStyle.copyWith(fontSize: 20),
            ),
            const SizedBox(
              height: 15,
            ),
            ...daraRating.map((el) {
              return filterOrder(
                title: el['title'],
                img: el['img'],
                onTap: () {
                  orderBy = el['value'].toString();
                  setState(() {});
                },
                isSelected: orderBy == el['value'].toString(),
              );
            }).toList(),
          ],
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
                    if (orderBy is String) {
                      Navigator.pop(context, orderBy);
                    } else {
                      SnackbarWidget.getSuccessSnackbar(
                        context,
                        'Info',
                        "Harap pilih filter terlebih dahulu",
                      );
                    }
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

class FilterTreatmentType extends StatefulWidget {
  String? val;
  FilterTreatmentType({super.key, this.val});

  @override
  State<FilterTreatmentType> createState() => _FilterTreatmentTypeState();
}

class _FilterTreatmentTypeState extends State<FilterTreatmentType> {
  final EtalaseController state = Get.put(EtalaseController());
  List<String> filter = [];
  List<Lookup.Data2> treatments = [];
  String? treatmentType;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      treatmentType = widget.val;
      treatments.addAll(await state.getLookup(context, "TREATMENT_TYPE"));
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
                'Jenis Treatment',
                style: blackHigtTextStyle.copyWith(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ...treatments.map((el) {
                return filterTapTreatment(
                  title: el.value.toString(),
                  isSelected: treatmentType == el.value.toString(),
                  onTap: () {
                    treatmentType = el.value.toString();
                    setState(() {});
                  },
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
                      if (treatmentType is String) {
                        Navigator.pop(context, treatmentType);
                      } else {
                        SnackbarWidget.getSuccessSnackbar(
                          context,
                          'Info',
                          "Harap pilih jenis treatment terlebih dahulu",
                        );
                      }
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

Widget filterTapTreatment({
  required Function() onTap,
  required String title,
  required bool isSelected,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 14),
    child: Column(
      children: [
        InkWell(
          onTap: () => onTap(),
          child: Row(
            children: [
              Text(
                title,
                style: blackTextStyle.copyWith(color: blackColor, fontSize: 15),
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

class FilterTreatment extends StatelessWidget {
  final String title;
  bool isSelected;
  FilterTreatment({
    super.key,
    required this.title,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 9),
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
        top: 4,
        bottom: 4,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        border: Border.all(color: isSelected ? greenColor : borderColor),
      ),
      child: Row(
        children: [
          Text(
            title,
            style: blackTextStyle.copyWith(
              fontSize: 14,
              fontWeight: regular,
              color: isSelected ? greenColor : const Color(0xff6B6B6B),
            ),
          ),
        ],
      ),
    );
  }
}
