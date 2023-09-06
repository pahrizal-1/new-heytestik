import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

class FilterPublis extends StatefulWidget {
  final String title;
  const FilterPublis({super.key, required this.title});

  @override
  State<FilterPublis> createState() => _FilterPublisState();
}

class _FilterPublisState extends State<FilterPublis> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Row(
        children: [
          Image.asset(
            'assets/icons/network-icons.png',
            width: 15,
            height: 15,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            widget.title,
            style:
                blackRegulerTextStyle.copyWith(fontSize: 15, color: blackColor),
          ),
          Spacer(),
          Icon(
            isSelected ? Icons.radio_button_on : Icons.circle_outlined,
            color: isSelected ? greenColor : blackColor,
          ),
        ],
      ),
    );
  }
}
