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
  final int rating;

  const TextUlasanRiwayat({
    super.key,
    required this.nameBrand,
    required this.nameProduk,
    required this.waktu,
    required this.coment,
    this.balasan = '',
    this.onPressed,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    print(rating);
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(5, (index) {
                        return Image.asset(
                          'assets/icons/stars-new.png',
                          width: 12,
                          color: rating > index
                              ? const Color(0xffFFC36A)
                              : Color.fromRGBO(155, 155, 155, 0.61),
                        );
                      }),
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
                balasan == ''
                    ? Container()
                    : const SizedBox(
                        height: 18,
                      ),
                balasan == ''
                    ? Container()
                    : Text(
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
