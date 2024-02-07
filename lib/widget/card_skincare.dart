// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/core/currency_format.dart';

import '../theme/theme.dart';

class CardSkincarePrice extends StatefulWidget {
  final String nameTitle;
  final String urlImg;
  final String subTitle;
  final String harga;
  final String pengguna;
  final Widget plus;
  const CardSkincarePrice({
    Key? key,
    required this.nameTitle,
    required this.urlImg,
    required this.subTitle,
    required this.harga,
    required this.pengguna,
    required this.plus,
  }) : super(key: key);

  @override
  State<CardSkincarePrice> createState() => _CardSkincarePriceState();
}

class _CardSkincarePriceState extends State<CardSkincarePrice> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 29),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
            border: Border.all(
              color: borderColor,
              width: 0.3,
            ),
            borderRadius: BorderRadius.circular(7)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.5, color: borderColor),
                    image: DecorationImage(
                      image: widget.urlImg != null ? NetworkImage(widget.urlImg) as ImageProvider : AssetImage(widget.urlImg),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      constraints: const BoxConstraints(maxWidth: 150),
                      child: RichText(
                        text: TextSpan(text: widget.nameTitle, style: grenTextStyle.copyWith(fontSize: 15)),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(widget.subTitle, style: subTitleTextStyle),
                    Text(
                      'Penggunaan: ${widget.pengguna} ',
                      style: subTitleTextStyle,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      CurrencyFormat.convertToIdr(
                        int.parse(widget.harga),
                        0,
                      ),
                      style: blackTextStyle.copyWith(fontSize: 13),
                    ),
                  ],
                ),
                const Spacer(),
                widget.plus
              ],
            ),
          ],
        ),
      ),
    );
  }
}
