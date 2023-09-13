import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:heystetik_mobileapps/pages/home/notifikasion_page.dart';
import 'package:heystetik_mobileapps/pages/solution/keranjang_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

Widget notificasion(
  BuildContext context,
  String jumlah,
  Color iconsColor,
) {
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const NotifikasionPage(),
        ),
      );
    },
    child: Stack(
      children: [
        SvgPicture.asset(
          'assets/icons/notif-icons.svg',
          color: iconsColor,
        ),
        Container(
          height: 15,
          width: 15,
          transform: Matrix4.translationValues(
            9,
            -4,
            10,
          ),
          decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red),
          child: Center(
            child: Text(
              jumlah,
              style: whiteTextStyle.copyWith(
                  fontSize: 9, fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    ),
  );
}

Widget keranjang(
  BuildContext context,
  String jumlah,
  Color iconcolor,
) {
  return Container(
    width: 24,
    child: InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const KeranjangPage(),
          ),
        );
      },
      child: Stack(
        children: [
          SvgPicture.asset(
            'assets/icons/trello-icons.svg',
            color: iconcolor,
          ),
          Container(
            height: 15,
            width: 15,
            transform: Matrix4.translationValues(
              13,
              -4,
              10,
            ),
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.red),
            child: Center(
              child: Text(
                jumlah,
                style: whiteTextStyle.copyWith(
                    fontSize: 9, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    ),
  );
}
