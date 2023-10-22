// ignore_for_file: prefer_null_aware_operators, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/service/customer/geography/geography_service.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:provider/provider.dart';
import '../controller/customer/register/register_controller.dart';
import '../controller/customer/interest/interest_controller.dart';
import 'package:heystetik_mobileapps/models/customer/lookup_skin_goals_model.dart';

class DropDownWiget extends StatefulWidget {
  DropDownWiget({super.key, required this.type});

  final int type;

  @override
  State<DropDownWiget> createState() => _DropDownWigetState();
}

class _DropDownWigetState extends State<DropDownWiget> {
  final InterestController state = Get.put(InterestController());
  List<Data2>? data = [];
  String? selectedvalue;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      data?.addAll(
        await state.lookupSkinGoals(context, "SKIN_GOALS_BUDGET"),
      );

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0XFFCCCCCC),
        ),
        borderRadius: BorderRadius.circular(7),
      ),
      child: DropdownButton(
        underline: Container(),
        hint: Text(
          'Pilih anggaran per bulan',
          style: subGreyTextStyle.copyWith(color: const Color(0XFFCCCCCC)),
        ),
        value: selectedvalue,
        elevation: 0,
        isExpanded: true,
        items: data?.map((items) {
          return DropdownMenuItem(
            value: items.value.toString(),
            child: Text(items.value.toString()),
          );
        }).toList(),
        onChanged: ((value) {
          setState(
            () {
              if (widget.type == 1) {
                state.skincare = value;
              }
              if (widget.type == 2) {
                state.treatment = value;
              }
              selectedvalue = value;
            },
          );
        }),
      ),
    );
  }
}

class DropDownProvinsiWiget extends StatefulWidget {
  const DropDownProvinsiWiget({super.key});

  @override
  State<DropDownProvinsiWiget> createState() => _DropDownProvinsiWigetState();
}

class _DropDownProvinsiWigetState extends State<DropDownProvinsiWiget> {
  String? selectedvalue;
  @override
  Widget build(BuildContext context) {
    var state = Provider.of<RegisterController>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Provinsi*',
          style: blackTextStyle,
        ),
        FutureBuilder(
          future: GeographyService().getProvince(),
          builder: (context, AsyncSnapshot snapshot) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                  border: Border.all(color: const Color(0XFFCCCCCC)),
                  borderRadius: BorderRadius.circular(7)),
              child: DropdownButton<String?>(
                underline: Container(),
                value: selectedvalue,
                hint: Text(
                  'Provinsi',
                  style: blackTextStyle.copyWith(
                      color: const Color(0xff323232), fontWeight: medium),
                ),
                elevation: 0,
                isExpanded: true,
                items: !snapshot.hasData
                    ? null
                    : snapshot.data
                        .map<DropdownMenuItem<String>>(
                          (e) => DropdownMenuItem<String>(
                            value: e['id'].toString(),
                            child: Text(
                              e['name'],
                              style: blackTextStyle,
                            ),
                          ),
                        )
                        .toList(),
                onChanged: ((value) {
                  if (value != null) {
                    state.setProvince(int.parse(value));
                    state.setCity(null);
                    setState(
                      () {
                        selectedvalue = value;
                      },
                    );
                  }
                }),
              ),
            );
          },
        ),
      ],
    );
  }
}

class DropDownkotaWiget extends StatefulWidget {
  const DropDownkotaWiget({super.key});

  @override
  State<DropDownkotaWiget> createState() => _DropDownkotaWigetState();
}

class _DropDownkotaWigetState extends State<DropDownkotaWiget> {
  String? selectedvalue;
  @override
  Widget build(BuildContext context) {
    var state = Provider.of<RegisterController>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Kota*',
          style: blackTextStyle,
        ),
        FutureBuilder(
          future: GeographyService().getCity(state.province),
          builder: (context, AsyncSnapshot snapshot) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                  border: Border.all(color: const Color(0XFFCCCCCC)),
                  borderRadius: BorderRadius.circular(7)),
              child: DropdownButton<String?>(
                underline: Container(),
                hint: Text(
                  'Pilih Kota Tempat Tinggal mu',
                  style: greyTextStyle,
                ),
                value: state.city == null ? null : state.city.toString(),
                elevation: 0,
                isExpanded: true,
                items: !snapshot.hasData
                    ? null
                    : snapshot.data
                        .map<DropdownMenuItem<String>>(
                          (e) => DropdownMenuItem<String>(
                            value: e['id'].toString(),
                            child: Text(
                              e['name'],
                              style: blackTextStyle,
                            ),
                          ),
                        )
                        .toList(),
                onChanged: ((value) {
                  setState(
                    () {
                      if (value != null) {
                        state.setCity(int.parse(value));
                        setState(
                          () {
                            selectedvalue = value;
                          },
                        );
                      }
                    },
                  );
                }),
              ),
            );
          },
        ),
      ],
    );
  }
}

class CircleImgWidget extends StatefulWidget {
  final String img;
  final String? title;
  final int type;
  const CircleImgWidget({
    Key? key,
    required this.img,
    required this.title,
    required this.type,
  }) : super(key: key);

  @override
  State<CircleImgWidget> createState() => _CircleImgWidgetState();
}

class _CircleImgWidgetState extends State<CircleImgWidget> {
  final InterestController state = Get.put(InterestController());
  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              _isSelected = !_isSelected;
              if (widget.type == 1) {
                state.skinType.value = widget.title.toString();
              }
              if (widget.type == 2) {
                state.skinToneColor.value = widget.title.toString();
              }
              if (widget.type == 3) {
                state.skinUnderToneColor.value = widget.title.toString();
              }
              if (widget.type == 4) {
                state.hairType.value = widget.title.toString();
              }
              if (widget.type == 5) {
                state.hairColor.value = widget.title.toString();
              }
              if (widget.type == 6) {
                state.hijabers = widget.title == 'Hijab';
              }
            });
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 14),
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(
                  _isSelected ? 'assets/icons/chek_icons.png' : widget.img,
                ),
              ),
            ),
          ),
        ),
        Text(
          widget.title.toString(),
          style: greyTextStyle,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
