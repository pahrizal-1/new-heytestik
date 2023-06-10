import 'package:flutter/material.dart';

import '../theme/theme.dart';

class CardTitle extends StatefulWidget {
  const CardTitle({
    Key? key,
  }) : super(key: key);

  @override
  State<CardTitle> createState() => _CardTitleState();
}

class _CardTitleState extends State<CardTitle> {
  int isSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  setState(
                    () {
                      isSelected = 0;
                    },
                  );
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  height: 30,
                  decoration: BoxDecoration(
                    color: isSelected == 0
                        ? const Color.fromRGBO(36, 167, 160, 0.2)
                        : whiteColor,
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(
                      color: isSelected == 0
                          ? greenColor
                          : const Color(0xffCCCCCC),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Rekomendasi',
                      style: subGreyTextStyle.copyWith(
                          fontSize: 14,
                          color: isSelected == 0
                              ? greenColor
                              : const Color(0xff323232)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {
                  setState(
                    () {
                      isSelected = 1;
                    },
                  );
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  height: 30,
                  decoration: BoxDecoration(
                    color: isSelected == 1
                        ? const Color.fromRGBO(36, 167, 160, 0.2)
                        : whiteColor,
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(
                      color: isSelected == 1
                          ? greenColor
                          : const Color(0xffCCCCCC),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Harga Terendah',
                      style: subGreyTextStyle.copyWith(
                          fontSize: 14,
                          color: isSelected == 1
                              ? greenColor
                              : const Color(0xff323232)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  setState(
                    () {
                      isSelected = 3;
                    },
                  );
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  height: 30,
                  decoration: BoxDecoration(
                    color: isSelected == 3
                        ? const Color.fromRGBO(36, 167, 160, 0.2)
                        : whiteColor,
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(
                      color: isSelected == 3
                          ? greenColor
                          : const Color(0xffCCCCCC),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Rating Tertinggi',
                      style: subGreyTextStyle.copyWith(
                          fontSize: 14,
                          color: isSelected == 3
                              ? greenColor
                              : const Color(0xff323232)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {
                  setState(
                    () {
                      isSelected = 4;
                    },
                  );
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  height: 30,
                  decoration: BoxDecoration(
                    color: isSelected == 4
                        ? const Color.fromRGBO(36, 167, 160, 0.2)
                        : whiteColor,
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(
                      color: isSelected == 4
                          ? greenColor
                          : const Color(0xffCCCCCC),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Ulasan Terbanyak',
                      style: subGreyTextStyle.copyWith(
                          fontSize: 14,
                          color: isSelected == 4
                              ? greenColor
                              : const Color(0xff323232)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  setState(
                    () {
                      isSelected = 5;
                    },
                  );
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  height: 30,
                  decoration: BoxDecoration(
                    color: isSelected == 5
                        ? const Color.fromRGBO(36, 167, 160, 0.2)
                        : whiteColor,
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(
                      color: isSelected == 5
                          ? greenColor
                          : const Color.fromRGBO(36, 167, 160, 0.2),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Terlaris',
                      style: subGreyTextStyle.copyWith(
                          fontSize: 14,
                          color: isSelected == 5
                              ? greenColor
                              : const Color(0xff323232)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {
                  setState(
                    () {
                      isSelected = 6;
                    },
                  );
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  height: 30,
                  decoration: BoxDecoration(
                    color: isSelected == 6
                        ? const Color.fromRGBO(36, 167, 160, 0.2)
                        : whiteColor,
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(
                      color: isSelected == 6
                          ? greenColor
                          : const Color(0xffCCCCCC),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Terbaru',
                      style: subGreyTextStyle.copyWith(
                          fontSize: 14,
                          color: isSelected == 6
                              ? greenColor
                              : const Color(0xff323232)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {
                  setState(
                    () {
                      isSelected = 7;
                    },
                  );
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  height: 30,
                  decoration: BoxDecoration(
                    color: isSelected == 7
                        ? const Color.fromRGBO(36, 167, 160, 0.2)
                        : whiteColor,
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(
                      color: isSelected == 7
                          ? greenColor
                          : const Color(0xffCCCCCC),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Jarak Terdekat',
                      style: subGreyTextStyle.copyWith(
                          fontSize: 14,
                          color: isSelected == 7
                              ? greenColor
                              : const Color(0xff323232)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
