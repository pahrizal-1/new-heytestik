// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/etalase_controller.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/models/customer/lookup_model.dart'
    as Lookup;

class FilterPublis extends StatefulWidget {
  Map? val;
  FilterPublis({super.key, this.val});

  @override
  State<FilterPublis> createState() => _FilterPublisState();
}

class _FilterPublisState extends State<FilterPublis> {
  int isSelected = 0;
  Map? value;

  @override
  void initState() {
    super.initState();
    value = widget.val;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              isSelected = 0;
              value = {'visibility': 'PUBLIC', 'title': 'Semua Orang'};
            });
            Navigator.pop(context, value);
          },
          child: Row(
            children: [
              Image.asset(
                'assets/icons/internet.png',
                width: 15,
                height: 15,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Semua Orang',
                style: blackRegulerTextStyle.copyWith(
                    fontSize: 15, color: blackColor),
              ),
              Spacer(),
              Icon(
                value?['title'] == 'Semua Orang'
                    ? Icons.radio_button_on
                    : Icons.circle_outlined,
                color:
                    value?['title'] == 'Semua Orang' ? greenColor : blackColor,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 17,
        ),
        InkWell(
          onTap: () {
            setState(() {
              isSelected = 1;
              value = {
                'visibility': 'CIRCLE',
                'title': 'Hanya orang yang mengikuti'
              };
            });
            Navigator.pop(context, value);
          },
          child: Row(
            children: [
              Image.asset(
                'assets/icons/@.png',
                width: 15,
                height: 15,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Hanya orang yang mengikuti',
                style: blackRegulerTextStyle.copyWith(
                    fontSize: 15, color: blackColor),
              ),
              Spacer(),
              Icon(
                value?['title'] == 'Hanya orang yang mengikuti'
                    ? Icons.radio_button_on
                    : Icons.circle_outlined,
                color: value?['title'] == 'Hanya orang yang mengikuti'
                    ? greenColor
                    : blackColor,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 17,
        ),
        InkWell(
          onTap: () {
            setState(() {
              isSelected = 2;
              value = {
                'visibility': 'MENTION',
                'title': 'Hanya orang yang disebutkan'
              };
            });
            Navigator.pop(context, value);
          },
          child: Row(
            children: [
              Image.asset(
                'assets/icons/person-double.png',
                width: 15,
                height: 15,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Hanya orang yang disebutkan',
                style: blackRegulerTextStyle.copyWith(
                    fontSize: 15, color: blackColor),
              ),
              Spacer(),
              Icon(
                value?['title'] == 'Hanya orang yang disebutkan'
                    ? Icons.radio_button_on
                    : Icons.circle_outlined,
                color: value?['title'] == 'Hanya orang yang disebutkan'
                    ? greenColor
                    : blackColor,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 17,
        ),
        InkWell(
          onTap: () {
            setState(() {
              isSelected = 3;
              value = {'visibility': 'PRIVATE', 'title': 'Hanya saya'};
            });
            Navigator.pop(context, value);
          },
          child: Row(
            children: [
              Image.asset(
                'assets/icons/person.png',
                width: 15,
                height: 15,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Hanya saya',
                style: blackRegulerTextStyle.copyWith(
                    fontSize: 15, color: blackColor),
              ),
              Spacer(),
              Icon(
                value?['title'] == 'Hanya saya'
                    ? Icons.radio_button_on
                    : Icons.circle_outlined,
                color:
                    value?['title'] == 'Hanya saya' ? greenColor : blackColor,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 17,
        ),
      ],
    );
  }
}

class FilterSpamStream extends StatefulWidget {
  String? val;
  FilterSpamStream({super.key, this.val = ''});

  @override
  State<FilterSpamStream> createState() => _FilterSpamStreamState();
}

class _FilterSpamStreamState extends State<FilterSpamStream> {
  final EtalaseController state = Get.put(EtalaseController());
  List<Lookup.Data2> streamReport = [];
  String? reason;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      reason = widget.val;
      streamReport
          .addAll(await state.getLookup(context, 'STREAM_REPORT_REASON'));
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...streamReport.map((e) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                reason = e.value.toString();
                setState(() {});
                Get.back(result: reason);
              },
              child: Row(
                children: [
                  Text(
                    e.value.toString(),
                    style: blackRegulerTextStyle.copyWith(
                        fontSize: 15, color: blackColor),
                  ),
                  Spacer(),
                  Icon(
                    reason == e.value.toString()
                        ? Icons.radio_button_on
                        : Icons.circle_outlined,
                    color:
                        reason == e.value.toString() ? greenColor : blackColor,
                  ),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }
}
