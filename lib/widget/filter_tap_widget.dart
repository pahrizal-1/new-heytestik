import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

class FilterTap extends StatefulWidget {
  final String img;
  final String title;

  const FilterTap({
    Key? key,
    required this.img,
    required this.title,
  }) : super(key: key);

  @override
  State<FilterTap> createState() => _FilterTapState();
}

class _FilterTapState extends State<FilterTap> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              isSelected = !isSelected;
            });
          },
          child: Row(
            children: [
              Container(
                width: 17,
                height: 17,
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(widget.img))),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                widget.title,
                style: blackRegulerTextStyle.copyWith(color: blackColor),
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
    );
  }
}

class FilterTapTreatment extends StatefulWidget {
  final String title;

  const FilterTapTreatment({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<FilterTapTreatment> createState() => _FilterTapTreatmentState();
}

class _FilterTapTreatmentState extends State<FilterTapTreatment> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              isSelected = !isSelected;
            });
          },
          child: Row(
            children: [
              Text(
                widget.title,
                style: blackRegulerTextStyle.copyWith(color: blackColor),
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
    );
  }
}
