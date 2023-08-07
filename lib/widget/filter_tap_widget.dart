import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
  final Function()? onTap;

  const FilterTapTreatment({
    Key? key,
    required this.title,
    this.onTap,
  }) : super(key: key);

  @override
  State<FilterTapTreatment> createState() => _FilterTapTreatmentState();
}

class _FilterTapTreatmentState extends State<FilterTapTreatment> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              widget.onTap == null ? () {} : widget.onTap!();
              setState(() {
                isSelected = !isSelected;
              });
            },
            child: Row(
              children: [
                Text(
                  widget.title,
                  style:
                      blackTextStyle.copyWith(color: blackColor, fontSize: 15),
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
      ),
    );
  }
}

class FilterTapRating extends StatefulWidget {
  final String title;
  final Function()? onTap;

  const FilterTapRating({
    Key? key,
    required this.title,
    this.onTap,
  }) : super(key: key);

  @override
  State<FilterTapRating> createState() => _FilterTapRatingState();
}

class _FilterTapRatingState extends State<FilterTapRating> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              widget.onTap == null ? () {} : widget.onTap!();
              setState(() {
                isSelected = !isSelected;
              });
            },
            child: Row(
              children: [
                SvgPicture.asset('assets/icons/stars.svg'),
                const SizedBox(
                  width: 12,
                ),
                Text(
                  widget.title,
                  style: blackHigtTextStyle.copyWith(
                      color: blackColor, fontSize: 15),
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
      ),
    );
  }
}
