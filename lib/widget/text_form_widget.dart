// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

class TextFormWidget extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController controller;

  const TextFormWidget({
    Key? key,
    required this.title,
    required this.hintText,
    required this.controller,
    required,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: blackTextStyle),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            fillColor: greenColor,
            hoverColor: greenColor,
            hintText: hintText,
            hintStyle:
                blackRegulerTextStyle.copyWith(fontSize: 12, color: blackColor),
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
      ],
    );
  }
}

class BorderFormText extends StatelessWidget {
  final String hintText;
  const BorderFormText({
    Key? key,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          labelText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: greenColor,
            ),
          ),
          focusColor: greenColor,
          labelStyle: blackTextStyle),
    );
  }
}

class SkinGoalsFrom extends StatefulWidget {
  const SkinGoalsFrom({
    Key? key,
  }) : super(key: key);

  @override
  State<SkinGoalsFrom> createState() => _SkinGoalsFromState();
}

class _SkinGoalsFromState extends State<SkinGoalsFrom> {
  bool isIconSelected1 = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              isIconSelected1 = !isIconSelected1;
            });
          },
          child: Container(
            decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: isIconSelected1 ? greenColor : whiteColor)),
            height: 50,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      isIconSelected1
                          ? Icons.check_circle_rounded
                          : Icons.add_circle,
                      size: 18,
                      color: isIconSelected1 ? greenColor : greyColor,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Acne',
                      style: TextStyle(
                          letterSpacing: 0.5,
                          fontSize: 12,
                          fontFamily: 'ProximaNova',
                          color: isIconSelected1 ? greenColor : greyColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SearchTextField extends StatelessWidget {
  final String title;
  final TextEditingController? controller;
  Function(String)? onChange;
  SearchTextField({
    super.key,
    required this.title,
    this.controller,
    this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChange,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xffff1f1f1),
        hintText: title,
        hintStyle: blackRegulerTextStyle.copyWith(fontSize: 15),
        contentPadding: EdgeInsets.zero,
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

class TextFromPerawat extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  const TextFromPerawat({
    super.key,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            border: Border.all(color: const Color(0xFFCCCCCC))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: blackHigtTextStyle.copyWith(fontSize: 15),
            ),
            Icon(
              Icons.keyboard_arrow_right,
              size: 12,
              color: greenColor,
            ),
          ],
        ),
      ),
    );
  }
}

class InfomasiTextFrom extends StatelessWidget {
  final String title;
  const InfomasiTextFrom({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      height: 60,
      child: TextFormField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide(color: borderColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide(color: borderColor),
          ),
          labelText: title,
          labelStyle: subTitleTextStyle,
        ),
      ),
    );
  }
}

class PeryataanUmumTextFrom extends StatelessWidget {
  final String pernyattan;
  final String jawaban;
  const PeryataanUmumTextFrom({
    super.key,
    required this.pernyattan,
    required this.jawaban,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 13, right: 13, top: 11),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            pernyattan,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                border: Border.all(
                  color: borderColor,
                ),
                borderRadius: BorderRadius.circular(7)),
            padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 8),
            margin:
                const EdgeInsets.only(left: 7, right: 7, top: 8, bottom: 15),
            child: Text(
              jawaban,
              style: blackTextStyle.copyWith(fontSize: 13),
            ),
          )
        ],
      ),
    );
  }
}

//////////////////////////////////////////////////////
class TetxFromProfilEdit extends StatefulWidget {
  final String title1;
  final TextEditingController? controller;
  final IconData icon;
  final VoidCallback? ontap;
  const TetxFromProfilEdit(
      {super.key,
      required this.title1,
      required this.controller,
      required this.icon,
      this.ontap});

  @override
  State<TetxFromProfilEdit> createState() => _TetxFromProfilEditState();
}

class _TetxFromProfilEditState extends State<TetxFromProfilEdit> {
  bool _isEnable = false;
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _isEnable = !_isEnable;
          isSelected = !isSelected;
        });
      },
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 130,
                child: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    widget.title1,
                    style: TextStyle(
                      fontFamily: 'ProximaNova',
                      fontSize: 13,
                      letterSpacing: 0.5,
                      color: fromCssColor('#999999'),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 2, vertical: 2),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: greyColor),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: greenColor),
                              ),
                              border: InputBorder.none),
                          controller: widget.controller,
                          enabled: _isEnable,
                          style: blackTextStyle.copyWith(fontSize: 13),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 35,
            child: Center(
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TextFormPollPosition extends StatelessWidget {
  final String title;
  final bool isLastElement;
  final TextEditingController controller;

  const TextFormPollPosition({
    super.key,
    required this.title,
    required this.isLastElement,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.only(bottom: 11),
            width: 296,
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: borderColor,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: borderColor,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: title,
                hintStyle: subTitleTextStyle.copyWith(
                  fontSize: 14,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 1, horizontal: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelStyle: TextStyle(
                  color: fromCssColor('#A3A3A3'),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
