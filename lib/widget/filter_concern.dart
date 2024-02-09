// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/etalase_controller.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/models/customer/concern_model.dart'
    as Concern;

class FilterConcern extends StatefulWidget {
  const FilterConcern({super.key});

  @override
  State<FilterConcern> createState() => _FilterConcernState();
}

class _FilterConcernState extends State<FilterConcern> {
  final EtalaseController state = Get.put(EtalaseController());
  List<Concern.Data2> concern = [];
  List concernIds = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      concern.addAll(await state.getConcern(context));
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    "concern_ids": concernIds,
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
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 25,
            right: 25,
            top: 36,
          ),
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
                'Pilih Concern',
                style: blackRegulerTextStyle.copyWith(fontSize: 17),
              ),
              const SizedBox(
                height: 10,
              ),
              ...concern.map((e) {
                return FilterTapConcern(
                  title: e.name.toString(),
                  function: () {
                    concernIds.add(e.id.toString());
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

class FilterTapConcern extends StatefulWidget {
  final String title;
  Function()? function;

  FilterTapConcern({
    Key? key,
    required this.title,
    this.function,
  }) : super(key: key);

  @override
  State<FilterTapConcern> createState() => _FilterTapConcernState();
}

class _FilterTapConcernState extends State<FilterTapConcern> {
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
