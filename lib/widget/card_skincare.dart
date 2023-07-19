import 'package:flutter/material.dart';

import '../theme/theme.dart';

class CardSkincarePrice extends StatefulWidget {
  final String nameTitle;
  final String urlImg;
  final String subTitle;
  final String harga;
  final String pengguna;
  const CardSkincarePrice({
    Key? key,
    required this.nameTitle,
    required this.urlImg,
    required this.subTitle,
    required this.harga,
    required this.pengguna,
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
                  border:
                      Border.all(width: 0.5, color: const Color(0XFFFFFFFF)),
                  image: DecorationImage(
                    image: AssetImage(widget.urlImg),
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
                      text: TextSpan(
                          text: widget.nameTitle,
                          style: grenTextStyle.copyWith(fontSize: 15)),
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
                    widget.harga,
                    style: blackTextStyle.copyWith(fontSize: 13),
                  ),
                ],
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  setState(() {
                    isSelected = !isSelected;
                  });
                },
                child: Container(
                    height: 29,
                    width: 40,
                    decoration: BoxDecoration(
                        color: isSelected ? whiteColor : greenColor,
                        borderRadius: BorderRadius.circular(9),
                        border: Border.all(color: greenColor)),
                    child: isSelected
                        ? Center(
                            child: Text(
                              '-',
                              style: grenTextStyle.copyWith(fontSize: 20),
                            ),
                          )
                        : Icon(
                            Icons.add,
                            color: whiteColor,
                          )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
