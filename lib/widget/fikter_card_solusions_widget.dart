import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/filter_tap_widget.dart';

import 'card_widget.dart';

class FilterTreatment extends StatefulWidget {
  const FilterTreatment({
    super.key,
  });

  @override
  State<FilterTreatment> createState() => _FilterTreatmentState();
}

class _FilterTreatmentState extends State<FilterTreatment> {
  List name = [
    'Teenderm gel sensitive 150 ml',
    'Teenderm Aqua 200 ml',
    'Teenderm Hydra 40 ml',
    'Teenderm Hydra 40 ml'
  ];
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.0,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 9),
                padding: const EdgeInsets.only(left: 9, right: 9),
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  border: Border.all(color: borderColor),
                ),
                child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      backgroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadiusDirectional.only(
                          topEnd: Radius.circular(25),
                          topStart: Radius.circular(25),
                        ),
                      ),
                      builder: (context) => Scaffold(
                        body: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 25, right: 25, top: 70),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Filter',
                                  style:
                                      blackHigtTextStyle.copyWith(fontSize: 20),
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
                                const FilterTap(
                                  title: 'Rating',
                                  img: 'assets/icons/stars-icons.png',
                                ),
                                const FilterTap(
                                  title: 'Popularitas',
                                  img: 'assets/icons/popularity.png',
                                ),
                                const FilterTap(
                                  title: 'Jarak',
                                  img: 'assets/icons/mapgrey.png',
                                ),
                                const SizedBox(
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
                                  children: const [
                                    CardSearch(
                                      title: 'Promo',
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    CardSearch(
                                      title: 'Buka Sekarang',
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
                                      child: Container(
                                        child: TextFormField(
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            fillColor: greenColor,
                                            hoverColor: greenColor,
                                            hintText: 'Min.',
                                            hintStyle: TextStyle(
                                                color: subgreyColor,
                                                fontSize: 12),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: greenColor,
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(7)),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(7),
                                            ),
                                            contentPadding:
                                                const EdgeInsets.all(12),
                                          ),
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
                                      child: Container(
                                        child: TextFormField(
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            fillColor: greenColor,
                                            hoverColor: greenColor,
                                            hintText: 'Max',
                                            hintStyle: TextStyle(
                                                color: subgreyColor,
                                                fontSize: 12),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: greenColor,
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(7)),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(7),
                                            ),
                                            contentPadding:
                                                const EdgeInsets.all(12),
                                          ),
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
                                  style:
                                      blackHigtTextStyle.copyWith(fontSize: 15),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const FilterTapTreatment(
                                  title: 'Cryolipolysis',
                                ),
                                const FilterTapTreatment(
                                  title: 'Electrocauter',
                                ),
                                const FilterTapTreatment(
                                  title: 'Facial',
                                ),
                                const FilterTapTreatment(
                                  title: 'Filler',
                                ),
                                const FilterTapTreatment(
                                  title: 'Hifu',
                                ),
                                const FilterTapTreatment(
                                  title: 'Laser Co2',
                                ),
                                const FilterTapTreatment(
                                  title: 'Laser Erbium',
                                ),
                                const FilterTapTreatment(
                                  title: 'Laser Nd:Yag ',
                                ),
                                const FilterTapTreatment(
                                  title: 'Laser Pico Lase',
                                ),
                                const FilterTapTreatment(
                                  title: 'Laser Pico Laser',
                                ),
                                const FilterTapTreatment(
                                  title: 'Pulsed Dye',
                                ),
                                const FilterTapTreatment(
                                  title: ' Led Light Therapy',
                                ),
                              ],
                            ),
                          ),
                        ),
                        bottomNavigationBar: Container(
                          height: 90,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 22, right: 22),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    width: 165,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: greenColor),
                                        borderRadius: BorderRadius.circular(7)),
                                    height: 50,
                                    child: Center(
                                      child: Text(
                                        'Batal',
                                        style: grenTextStyle.copyWith(
                                            fontSize: 15, fontWeight: bold),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    width: 165,
                                    decoration: BoxDecoration(
                                        color: greenColor,
                                        border: Border.all(color: greenColor),
                                        borderRadius: BorderRadius.circular(7)),
                                    height: 50,
                                    child: Center(
                                      child: Text(
                                        'Simpan',
                                        style: whiteTextStyle.copyWith(
                                            fontSize: 15, fontWeight: bold),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  child: Image.asset(
                    'assets/icons/filter-icon.png',
                    width: 13,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 9),
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 6, bottom: 6),
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  border: Border.all(color: borderColor),
                ),
                child: const Text('Bintang 4.5+'),
              ),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      backgroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadiusDirectional.only(
                          topEnd: Radius.circular(25),
                          topStart: Radius.circular(25),
                        ),
                      ),
                      builder: (context) => Scaffold(
                            body: Padding(
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
                                        fontSize: 20),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const FilterTapTreatment(
                                    title: 'Cryolipolysis',
                                  ),
                                  const FilterTapTreatment(
                                    title: 'Electrocauter',
                                  ),
                                  const FilterTapTreatment(
                                    title: 'Facial',
                                  ),
                                  const FilterTapTreatment(
                                    title: 'Filler',
                                  ),
                                  const FilterTapTreatment(
                                    title: 'Hifu',
                                  ),
                                  const FilterTapTreatment(
                                    title: 'Laser Co2',
                                  ),
                                  const FilterTapTreatment(
                                    title: 'Laser Erbium',
                                  ),
                                  const FilterTapTreatment(
                                    title: 'Laser Nd:Yag ',
                                  ),
                                  const FilterTapTreatment(
                                    title: 'Laser Pico Lase',
                                  ),
                                  const FilterTapTreatment(
                                    title: 'Laser Pico Laser',
                                  ),
                                  const FilterTapTreatment(
                                    title: 'Pulsed Dye',
                                  ),
                                  const FilterTapTreatment(
                                    title: ' Led Light Therapy',
                                  ),
                                ],
                              ),
                            ),
                            bottomNavigationBar: Container(
                              height: 90,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 22, right: 22),
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        width: 165,
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: greenColor),
                                            borderRadius:
                                                BorderRadius.circular(7)),
                                        height: 50,
                                        child: Center(
                                          child: Text(
                                            'Batal',
                                            style: grenTextStyle.copyWith(
                                                fontSize: 15, fontWeight: bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        width: 165,
                                        decoration: BoxDecoration(
                                            color: greenColor,
                                            border:
                                                Border.all(color: greenColor),
                                            borderRadius:
                                                BorderRadius.circular(7)),
                                        height: 50,
                                        child: Center(
                                          child: Text(
                                            'Simpan',
                                            style: whiteTextStyle.copyWith(
                                                fontSize: 15, fontWeight: bold),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ));
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 9),
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 6, bottom: 6),
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(color: borderColor),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text('Treatment'),
                      SizedBox(
                        width: 9,
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        size: 15,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 9),
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 6, bottom: 6),
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  border: Border.all(color: borderColor),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text('Rentang harga'),
                    SizedBox(
                      width: 9,
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      size: 15,
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 9),
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 6, bottom: 6),
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  border: Border.all(color: borderColor),
                ),
                child: const Text('Promo'),
              ),
              Container(
                margin: const EdgeInsets.only(left: 9),
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 6, bottom: 6),
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  border: Border.all(color: borderColor),
                ),
                child: const Text('Bukas Sekarang'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
