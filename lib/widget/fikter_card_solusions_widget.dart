// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:heystetik_mobileapps/theme/theme.dart';

class FilterOnTap extends StatelessWidget {
  final String title;
  bool isSelected;
  FilterOnTap({
    super.key,
    required this.title,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 9),
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
        top: 4,
        bottom: 4,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        border: Border.all(color: isSelected ? greenColor : borderColor),
      ),
      child: Row(
        children: [
          Text(
            title,
            style: blackTextStyle.copyWith(
              fontSize: 14,
              fontWeight: regular,
              color: isSelected ? greenColor : const Color(0xff6B6B6B),
            ),
          ),
        ],
      ),
    );
  }
}

class FiklterTreatment extends StatefulWidget {
  final String title;
  final Function()? onTap;

  const FiklterTreatment({
    super.key,
    required this.title,
    this.onTap,
  });

  @override
  State<FiklterTreatment> createState() => _FiklterTreatmentState();
}

class _FiklterTreatmentState extends State<FiklterTreatment> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onTap == null ? () {} : widget.onTap!();
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(left: 9),
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
          top: 4,
          bottom: 4,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          border: Border.all(color: isSelected ? greenColor : borderColor),
        ),
        child: Row(
          children: [
            Text(
              widget.title,
              style: blackTextStyle.copyWith(
                fontSize: 14,
                fontWeight: regular,
                color: isSelected ? greenColor : const Color(0xff6B6B6B),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
