// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/etalase_controller.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/models/customer/lookup_model.dart'
    as Lookup;

class FilterAllDrug extends StatefulWidget {
  const FilterAllDrug({super.key});

  @override
  State<FilterAllDrug> createState() => _FilterAllDrugState();
}

class _FilterAllDrugState extends State<FilterAllDrug> {
  final EtalaseController state = Get.put(EtalaseController());
  List<Lookup.Data2> lookupDisplay = [];
  List<Lookup.Data2> lookupCategory = [];
  List display = [];
  List category = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      lookupDisplay.addAll(await state.getLookup(context, 'SKINCARE_DISPLAY'));
      lookupCategory
          .addAll(await state.getLookup(context, 'SKINCARE_CATEGORY'));
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(top: 10, bottom: 10, left: 25, right: 25),
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    style:
                        grenTextStyle.copyWith(fontSize: 15, fontWeight: bold),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: InkWell(
                onTap: () async {
                  Navigator.pop(context, {
                    "display": display,
                    "category": category,
                  });
                },
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
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 25, right: 25, top: 36, bottom: 40),
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
                'Pilih Display',
                style: blackRegulerTextStyle.copyWith(fontSize: 17),
              ),
              const SizedBox(
                height: 10,
              ),
              ...lookupDisplay.map((e) {
                return FilterTapDrug(
                  title: e.value.toString(),
                  function: () {
                    display.add(e.value.toString());
                  },
                );
              }),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Pilih Category',
                style: blackRegulerTextStyle.copyWith(fontSize: 17),
              ),
              const SizedBox(
                height: 10,
              ),
              ...lookupCategory.map((e) {
                return FilterTapDrug(
                  title: e.value.toString(),
                  function: () {
                    category.add(e.value.toString());
                  },
                );
              }),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FilterTapDrug extends StatefulWidget {
  final String title;
  Function()? function;

  FilterTapDrug({
    Key? key,
    required this.title,
    this.function,
  }) : super(key: key);

  @override
  State<FilterTapDrug> createState() => _FilterTapDrugState();
}

class _FilterTapDrugState extends State<FilterTapDrug> {
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
