import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

class FilterPublis extends StatefulWidget {
  const FilterPublis({
    super.key,
  });

  @override
  State<FilterPublis> createState() => _FilterPublisState();
}

class _FilterPublisState extends State<FilterPublis> {
  int isSelected = 0;
  Map value = {};

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              isSelected = 0;
              value = {'visibility': 'PUBLIC', 'title': 'Semua Orang'};
            });
            Navigator.pop(context, value);
          },
          child: Row(
            children: [
              Image.asset(
                'assets/icons/internet.png',
                width: 15,
                height: 15,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Semua Orang',
                style: blackRegulerTextStyle.copyWith(
                    fontSize: 15, color: blackColor),
              ),
              Spacer(),
              Icon(
                isSelected == 0 ? Icons.radio_button_on : Icons.circle_outlined,
                color: isSelected == 0 ? greenColor : blackColor,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 17,
        ),
        InkWell(
          onTap: () {
            setState(() {
              isSelected = 1;
              value = {
                'visibility': 'CIRCLE',
                'title': 'Hanya orang yang mengikuti'
              };
            });
            Navigator.pop(context, value);
          },
          child: Row(
            children: [
              Image.asset(
                'assets/icons/@.png',
                width: 15,
                height: 15,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Hanya orang yang mengikuti',
                style: blackRegulerTextStyle.copyWith(
                    fontSize: 15, color: blackColor),
              ),
              Spacer(),
              Icon(
                isSelected == 1 ? Icons.radio_button_on : Icons.circle_outlined,
                color: isSelected == 1 ? greenColor : blackColor,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 17,
        ),
        InkWell(
          onTap: () {
            setState(() {
              isSelected = 2;
              value = {
                'visibility': 'MENTION',
                'title': 'Hanya orang yang disebutkan'
              };
            });
            Navigator.pop(context, value);
          },
          child: Row(
            children: [
              Image.asset(
                'assets/icons/person-double.png',
                width: 15,
                height: 15,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Hanya orang yang disebutkan',
                style: blackRegulerTextStyle.copyWith(
                    fontSize: 15, color: blackColor),
              ),
              Spacer(),
              Icon(
                isSelected == 2 ? Icons.radio_button_on : Icons.circle_outlined,
                color: isSelected == 2 ? greenColor : blackColor,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 17,
        ),
        InkWell(
          onTap: () {
            setState(() {
              isSelected = 3;
              value = {'visibility': 'PRIVATE', 'title': 'Hanya saya'};
            });
            Navigator.pop(context, value);
          },
          child: Row(
            children: [
              Image.asset(
                'assets/icons/person.png',
                width: 15,
                height: 15,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Hanya saya',
                style: blackRegulerTextStyle.copyWith(
                    fontSize: 15, color: blackColor),
              ),
              Spacer(),
              Icon(
                isSelected == 3 ? Icons.radio_button_on : Icons.circle_outlined,
                color: isSelected == 3 ? greenColor : blackColor,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 17,
        ),
      ],
    );
  }
}

class FilterSpamStream extends StatefulWidget {
  const FilterSpamStream({
    super.key,
  });

  @override
  State<FilterSpamStream> createState() => _FilterSpamStreamState();
}

class _FilterSpamStreamState extends State<FilterSpamStream> {
  int isSelected = 0;
  Map value = {};

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              isSelected = 0;
              value = {'visibility': 'PUBLIC', 'title': 'Spam'};
            });
            Navigator.pop(context, value);
          },
          child: Row(
            children: [
              Text(
                'Spam',
                style: blackRegulerTextStyle.copyWith(
                    fontSize: 15, color: blackColor),
              ),
              Spacer(),
              Icon(
                isSelected == 0 ? Icons.radio_button_on : Icons.circle_outlined,
                color: isSelected == 0 ? greenColor : blackColor,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 17,
        ),
        InkWell(
          onTap: () {
            setState(() {
              isSelected = 1;
              value = {
                'visibility': 'CIRCLE',
                'title': 'Hanya orang yang mengikuti'
              };
            });
            Navigator.pop(context, value);
          },
          child: Row(
            children: [
              Text(
                'Junk Post',
                style: blackRegulerTextStyle.copyWith(
                    fontSize: 15, color: blackColor),
              ),
              Spacer(),
              Icon(
                isSelected == 1 ? Icons.radio_button_on : Icons.circle_outlined,
                color: isSelected == 1 ? greenColor : blackColor,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 17,
        ),
        InkWell(
          onTap: () {
            setState(() {
              isSelected = 2;
              value = {
                'visibility': 'MENTION',
                'title': 'Hanya orang yang disebutkan'
              };
            });
            Navigator.pop(context, value);
          },
          child: Row(
            children: [
              Text(
                'Vulgar',
                style: blackRegulerTextStyle.copyWith(
                    fontSize: 15, color: blackColor),
              ),
              Spacer(),
              Icon(
                isSelected == 2 ? Icons.radio_button_on : Icons.circle_outlined,
                color: isSelected == 2 ? greenColor : blackColor,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 17,
        ),
        InkWell(
          onTap: () {
            setState(() {
              isSelected = 3;
              value = {'visibility': 'PRIVATE', 'title': 'Hanya saya'};
            });
            Navigator.pop(context, value);
          },
          child: Row(
            children: [
              Text(
                'Out of topic',
                style: blackRegulerTextStyle.copyWith(
                    fontSize: 15, color: blackColor),
              ),
              Spacer(),
              Icon(
                isSelected == 3 ? Icons.radio_button_on : Icons.circle_outlined,
                color: isSelected == 3 ? greenColor : blackColor,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 17,
        ),
        InkWell(
          onTap: () {
            setState(() {
              isSelected = 3;
              value = {'visibility': 'PRIVATE', 'title': 'Hanya saya'};
            });
            Navigator.pop(context, value);
          },
          child: Row(
            children: [
              Text(
                'Vulgarity & Nudity',
                style: blackRegulerTextStyle.copyWith(
                    fontSize: 15, color: blackColor),
              ),
              Spacer(),
              Icon(
                isSelected == 4 ? Icons.radio_button_on : Icons.circle_outlined,
                color: isSelected == 4 ? greenColor : blackColor,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 17,
        ),
        InkWell(
          onTap: () {
            setState(() {
              isSelected = 3;
              value = {'visibility': 'PRIVATE', 'title': 'Hanya saya'};
            });
            Navigator.pop(context, value);
          },
          child: Row(
            children: [
              Text(
                'Pelecehan',
                style: blackRegulerTextStyle.copyWith(
                    fontSize: 15, color: blackColor),
              ),
              Spacer(),
              Icon(
                isSelected == 5 ? Icons.radio_button_on : Icons.circle_outlined,
                color: isSelected == 5 ? greenColor : blackColor,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 17,
        ),
        InkWell(
          onTap: () {
            setState(() {
              isSelected = 3;
              value = {'visibility': 'PRIVATE', 'title': 'Hanya saya'};
            });
            Navigator.pop(context, value);
          },
          child: Row(
            children: [
              Text(
                'Memprovokasi user lain',
                style: blackRegulerTextStyle.copyWith(
                    fontSize: 15, color: blackColor),
              ),
              Spacer(),
              Icon(
                isSelected == 6 ? Icons.radio_button_on : Icons.circle_outlined,
                color: isSelected == 6 ? greenColor : blackColor,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 17,
        ),
        InkWell(
          onTap: () {
            setState(() {
              isSelected = 3;
              value = {'visibility': 'PRIVATE', 'title': 'Hanya saya'};
            });
            Navigator.pop(context, value);
          },
          child: Row(
            children: [
              Text(
                'Nama user & foto yang tidak sesuai',
                style: blackRegulerTextStyle.copyWith(
                    fontSize: 15, color: blackColor),
              ),
              Spacer(),
              Icon(
                isSelected == 7 ? Icons.radio_button_on : Icons.circle_outlined,
                color: isSelected == 7 ? greenColor : blackColor,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 17,
        ),
      ],
    );
  }
}
