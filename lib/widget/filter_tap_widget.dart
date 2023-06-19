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
              Image.asset(
                widget.img,
                width: 17,
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
