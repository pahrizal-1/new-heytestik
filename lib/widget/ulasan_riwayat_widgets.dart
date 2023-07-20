import 'package:flutter/material.dart';

import '../theme/theme.dart';
import 'appbar_widget.dart';

class TextUlasanRiwayat extends StatelessWidget {
  final String nameBrand;
  final String nameProduk;
  final String waktu;
  final String coment;
  final String balasan;
  final VoidCallback? onPressed;

  const TextUlasanRiwayat({
    super.key,
    required this.nameBrand,
    required this.nameProduk,
    required this.waktu,
    required this.coment,
    required this.balasan,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onPressed,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 25, right: 25, top: 18, bottom: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nameBrand,
                  style: blackTextStyle.copyWith(fontSize: 13),
                ),
                Text(
                  nameProduk,
                  style: blackRegulerTextStyle.copyWith(
                      fontSize: 13, color: blackColor),
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/icons/stars-new.png',
                      width: 12,
                      height: 12,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Image.asset(
                      'assets/icons/stars-new.png',
                      width: 12,
                      height: 12,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Image.asset(
                      'assets/icons/stars-new.png',
                      width: 12,
                      height: 12,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Image.asset(
                      'assets/icons/stars-new.png',
                      width: 12,
                      height: 12,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Image.asset(
                      'assets/icons/stars-new.png',
                      width: 12,
                      height: 12,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      waktu,
                      style: blackRegulerTextStyle.copyWith(fontSize: 13),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 9,
                ),
                Text(
                  coment,
                  style: blackRegulerTextStyle.copyWith(fontSize: 13),
                ),
                const SizedBox(
                  height: 18,
                ),
                Text(
                  balasan,
                  style: blackRegulerTextStyle.copyWith(fontSize: 13),
                ),
              ],
            ),
          ),
        ),
        const dividergreen(),
      ],
    );
  }
}
