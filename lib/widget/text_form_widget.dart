// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
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
