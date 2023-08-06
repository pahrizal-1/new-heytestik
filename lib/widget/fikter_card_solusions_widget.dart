import 'package:flutter/material.dart';

import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/treatment_widgets.dart';

import 'filter_all_widgets.dart';

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
        widget.onTap == null ? (){} : widget.onTap!();
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(left: 9),
        padding: const EdgeInsets.only(left: 10, right: 10, top: 6, bottom: 6),
        height: 30,
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
                color: isSelected ? greenColor : const Color(0xff6B6B6B),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
