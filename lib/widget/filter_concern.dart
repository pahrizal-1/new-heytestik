// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/etalase_controller.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/models/customer/concern_model.dart'
    as Concern;
import 'package:heystetik_mobileapps/widget/snackbar_widget.dart';

class FilterConcern extends StatefulWidget {
  Map? val;
  FilterConcern({super.key, this.val});

  @override
  State<FilterConcern> createState() => _FilterConcernState();
}

class _FilterConcernState extends State<FilterConcern> {
  final EtalaseController state = Get.put(EtalaseController());
  List<Concern.Data2> data = [];
  Map? concern;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      concern = widget.val;
      data.addAll(await state.getConcern(context));
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
                  if (concern is Map) {
                    Navigator.pop(context, concern);
                  } else {
                    SnackbarWidget.getSuccessSnackbar(
                      context,
                      'Info',
                      "Harap pilih concern terlebih dahulu",
                    );
                  }
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
              ...data.map((e) {
                return filterTapConcern(
                  onTap: () {
                    concern = {
                      "id": e.id,
                      "text": e.name.toString(),
                    };
                    setState(() {});
                  },
                  title: e.name.toString(),
                  isSelected: concern?['text'] == e.name.toString(),
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

Widget filterTapConcern({
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
