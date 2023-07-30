import 'package:flutter/material.dart';

import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/filter_tap_widget.dart';
import 'package:heystetik_mobileapps/widget/treatment_widgets.dart';

import 'card_widget.dart';
import 'filter_all_widgets.dart';

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
                      builder: (context) => FilterAll(),
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
                    builder: (context) => TreatmentFilter(),
                  );
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
                    children: [
                      Text(
                        'Treatment',
                        style: blackRegulerTextStyle,
                      ),
                      const SizedBox(
                        width: 9,
                      ),
                      const Icon(
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
                  children: [
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
