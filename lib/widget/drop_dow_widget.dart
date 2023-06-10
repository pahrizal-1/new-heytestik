import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:heystetik_mobileapps/service/geography/geography_service.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:provider/provider.dart';

import '../controller/auth/register_controller.dart';
import '../controller/interest/interest_controller.dart';

class DropDownWiget extends StatefulWidget {
  const DropDownWiget({
    super.key,
    required this.type,
  });

  final int type;

  @override
  State<DropDownWiget> createState() => _DropDownWigetState();
}

class _DropDownWigetState extends State<DropDownWiget> {
  String? selectedvalue;
  @override
  Widget build(BuildContext context) {
    var state = Provider.of<InterestController>(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0XFFCCCCCC),
        ),
        borderRadius: BorderRadius.circular(7),
      ),
      child: DropdownButton<String?>(
        underline: Container(),
        hint: Text(
          'Pilih anggaran per bulan',
          style: subGreyTextStyle.copyWith(color: Color(0XFFCCCCCC)),
        ),
        value: selectedvalue,
        elevation: 0,
        isExpanded: true,
        items: [
          'Dibawah Rp500.000',
          "Rp500.000 - Rp1.000.000",
          "Rp1.100.000 - Rp5.000.000",
          "Rp5.100.000 - Rp10.000.000",
          "Diatas Rp10.000.000",
        ]
            .map<DropdownMenuItem<String?>>((e) => DropdownMenuItem(
          child: Text(e.toString()),
          value: e,
        ))
            .toList(),
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
              decoration: BoxDecoration(border: Border.all(color: Color(0XFFCCCCCC)), borderRadius: BorderRadius.circular(7)),
              child: DropdownButton<String?>(
                underline: Container(),
                value: selectedvalue,
                hint: Text(
                  "Provinsi",
                  style: blackTextStyle.copyWith(color: Color(0xff323232), fontWeight: medium),
                ),
                elevation: 0,
                isExpanded: true,
                items: !snapshot.hasData ? null : snapshot.data
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
              decoration: BoxDecoration(border: Border.all(color: Color(0XFFCCCCCC)), borderRadius: BorderRadius.circular(7)),
              child: DropdownButton<String?>(
                underline: Container(),
                hint: Text(
                  "Pilih Kota Tempat Tinggal mu",
                  style: greyTextStyle,
                ),
                value: state.city == null ? null : state.city.toString(),
                elevation: 0,
                isExpanded: true,
                items: !snapshot.hasData ? null : snapshot.data
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
  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    var state = Provider.of<InterestController>(context);

    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              _isSelected = !_isSelected;
              if (widget.type == 1) {
                state.skinType = widget.title;
              }
              if (widget.type == 2) {
                state.skinToneColor = widget.title;
              }
              if (widget.type == 3) {
                state.skinUnderToneColor = widget.title;
              }
              if (widget.type == 4) {
                state.hairType = widget.title;
              }
              if (widget.type == 5) {
                state.hairColor = widget.title;
              }
              if (widget.type == 6) {
                state.hijabers = widget.title == "Hijab";
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