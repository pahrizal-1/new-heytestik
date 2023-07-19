import 'package:flutter/material.dart';

import '../theme/theme.dart';
import 'appbar_widget.dart';

class CorcernCardWidgets extends StatelessWidget {
  final String img;
  final String category;
  final String tanggal;
  final String minute;
  final String pembuat;
  final String judul;
  const CorcernCardWidgets({
    super.key,
    required this.img,
    required this.category,
    required this.tanggal,
    required this.minute,
    required this.pembuat,
    required this.judul,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 11),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 77,
                width: 110,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(img),
                  ),
                ),
              ),
              const SizedBox(
                width: 14,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category,
                      style: grenTextStyle.copyWith(fontSize: 10),
                    ),
                    Text(
                      judul,
                      style: blackTextStyle.copyWith(fontSize: 14),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '$tanggal  |  $pembuat',
                      style: subTitleTextStyle.copyWith(fontSize: 8),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/icons/book-menu.png',
                          color: const Color(0xffFA3A3A3),
                          width: 8.445,
                        ),
                        Text(
                          ' $minute',
                          style: subTitleTextStyle.copyWith(fontSize: 9),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 11,
        ),
        dividergrey()
      ],
    );
  }
}
