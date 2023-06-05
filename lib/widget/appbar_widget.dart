import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:heystetik_mobileapps/pages/home/home_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';

AppBar AppBarChat(BuildContext context) {
  return AppBar(
    backgroundColor: fromCssColor('#24A7A0'),
    title: Text(
      "Pertanyaan Awal",
      style: TextStyle(
          fontFamily: 'ProximaNova',
          fontWeight: bold,
          fontSize: 20,
          letterSpacing: 1),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 13),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            );
          },
          child: Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/icons/icon-home-chat.png'),
              ),
            ),
          ),
        ),
      )
    ],
  );
}

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: fromCssColor('#24A7A0'),
    title: Text(
      "Riwayat Medis",
      style: TextStyle(
          fontFamily: 'ProximaNova',
          fontWeight: bold,
          fontSize: 20,
          letterSpacing: 1),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 13),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            );
          },
          child: Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/icons/icon-home-chat.png'),
              ),
            ),
          ),
        ),
      )
    ],
  );
}
