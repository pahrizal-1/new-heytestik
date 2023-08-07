import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';

import '../theme/theme.dart';

class TextSpaceBetween extends StatelessWidget {
  final String title;
  final String? title2;
  const TextSpaceBetween({
    Key? key,
    required this.title,
    this.title2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: subGreyTextStyle.copyWith(
              fontSize: 14,
              color: const Color(0XFF323232),
              fontWeight: regular),
        ),
        Text(
          title2.toString(),
          style: subGreyTextStyle.copyWith(fontSize: 14),
        ),
      ],
    );
  }
}

class TextBoldSpacebetwen extends StatelessWidget {
  final String title;
  final String? title1;
  final String title2;
  const TextBoldSpacebetwen(
      {super.key, required this.title, this.title1, required this.title2});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                title,
                style: subGreyTextStyle.copyWith(
                    fontSize: 15,
                    color: const Color(0XFF323232),
                    fontWeight: regular),
              ),
              Text(
                title1.toString(),
                style: blackHigtTextStyle.copyWith(fontSize: 15),
              ),
            ],
          ),
          Text(
            title2,
            style: blackHigtTextStyle.copyWith(fontSize: 14),
            textAlign: TextAlign.end,
          ),
        ],
      ),
    );
  }
}

class RedTextSpacebetwen extends StatelessWidget {
  final String title;

  final String titleRed;
  const RedTextSpacebetwen({
    Key? key,
    required this.title,
    required this.titleRed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: subGreyTextStyle.copyWith(
              fontSize: 15,
              color: const Color(0XFF323232),
              fontWeight: regular),
        ),
        Text(
          titleRed,
          style: blackHigtTextStyle.copyWith(fontSize: 15, color: redColor),
        ),
      ],
    );
  }
}

class TitleDetail extends StatelessWidget {
  final String title1;
  final String title2;
  final Color textColor;
  final FontWeight? fontWeight;
  final VoidCallback? ontap;
  const TitleDetail({
    Key? key,
    required this.title1,
    required this.title2,
    required this.textColor,
    this.fontWeight,
    this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 12),
      child: InkWell(
        onTap: ontap,
        child: Column(
          children: [
            Table(
              children: [
                TableRow(
                  children: [
                    Text(
                      title1,
                      style: blackRegulerTextStyle.copyWith(color: blackColor),
                    ),
                    Text(
                      title2,
                      style: grenTextStyle.copyWith(
                          fontSize: 15,
                          color: textColor,
                          fontWeight: fontWeight),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            const Divider(
              thickness: 2,
            )
          ],
        ),
      ),
    );
  }
}

class DescripsiText extends StatefulWidget {
  final String title1;
  final String subtitle2;
  final String? divider;
  final bool isLast;
  const DescripsiText({
    Key? key,
    required this.title1,
    required this.subtitle2,
    this.divider,
    this.isLast = false,
  }) : super(key: key);

  @override
  State<DescripsiText> createState() => _DescripsiTextState();
}

class _DescripsiTextState extends State<DescripsiText> {
  bool isVisibelity = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              isVisibelity = !isVisibelity;
            });
          },
          child: Row(
            children: [
              Text(
                widget.title1,
                style: blackHigtTextStyle.copyWith(
                  fontSize: 18,
                ),
              ),
              const Spacer(),
              Icon(
                isVisibelity
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
                color: greenColor,
              )
            ],
          ),
        ),
        const SizedBox(
          height: 7,
        ),
        Visibility(
          visible: isVisibelity,
          child: Text(
            widget.subtitle2,
            style: blackRegulerTextStyle.copyWith(fontSize: 15),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        if (!widget.isLast) ...[
          Divider(
            thickness: 1,
            color: borderColor,
          ),
          const SizedBox(
            height: 18,
          ),
        ]
      ],
    );
  }
}

class TetxtInfomasi extends StatelessWidget {
  final String title;
  final String title2;
  const TetxtInfomasi({
    Key? key,
    required this.title,
    required this.title2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: blackRegulerTextStyle.copyWith(
            fontSize: 13,
          ),
        ),
        Text(
          title2,
          // '10:00 - 22:00 WIB',
          style: blackRegulerTextStyle.copyWith(
            fontSize: 11,
          ),
        ),
      ],
    );
  }
}

class HasilKonsultasiWidgets extends StatelessWidget {
  final String namaObat;
  final String? berapaBayak;
  const HasilKonsultasiWidgets({
    super.key,
    required this.namaObat,
    this.berapaBayak = '',
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 10, top: 10),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'R/',
                style: blackRegulerTextStyle.copyWith(fontSize: 15),
              ),
              const SizedBox(
                width: 11,
              ),
              Text(
                namaObat,
                style: grenTextStyle.copyWith(fontSize: 15),
              ),
              const SizedBox(
                width: 11,
              ),
              const Spacer(),
              berapaBayak != ''
                  ? Text(
                      berapaBayak.toString(),
                      style: blackRegulerTextStyle.copyWith(
                        fontSize: 13,
                      ),
                    )
                  : Container(),
            ],
          ),
          const SizedBox(
            height: 13,
          ),
          dividergrey(),
        ],
      ),
    );
  }
}
