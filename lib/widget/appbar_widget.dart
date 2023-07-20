// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:heystetik_mobileapps/pages/tabbar/tabbar_customer.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

import '../pages/home/home_page.dart';

AppBar AppBarChat(BuildContext context) {
  return AppBar(
    backgroundColor: fromCssColor('#24A7A0'),
    title: Text(
      'Pertanyaan Awal',
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
                builder: (context) => const TabBarCustomer(),
              ),
            );
          },
          child: Container(
            height: 20,
            width: 20,
            decoration: const BoxDecoration(
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

AppBar AppBarProfile(BuildContext context) {
  return AppBar(
    backgroundColor: fromCssColor('#24A7A0'),
    title: Text(
      'Pertanyaan Awal',
      style: TextStyle(
          fontFamily: 'ProximaNova',
          fontWeight: bold,
          fontSize: 20,
          letterSpacing: 1),
    ),
  );
}

AppBar AppBarProfileRiwayat(BuildContext context) {
  return AppBar(
    backgroundColor: fromCssColor('#24A7A0'),
    title: Text(
      'Riwayat Medis',
      style: TextStyle(
          fontFamily: 'ProximaNova',
          fontWeight: bold,
          fontSize: 20,
          letterSpacing: 1),
    ),
  );
}

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: greenColor,
    title: Row(
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back),
        ),
        const SizedBox(
          width: 11,
        ),
        const Text('Pertanyaan Awal'),
        const Spacer(),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomepageCutomer(),
              ),
            );
          },
          child: Image.asset(
            'assets/icons/icon-home-chat.png',
            width: 18,
          ),
        )
      ],
    ),
  );
}

AppBar appBarRiwayat(BuildContext context) {
  return AppBar(
    elevation: 0,
    automaticallyImplyLeading: false,
    backgroundColor: greenColor,
    title: Row(
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back),
        ),
        const SizedBox(
          width: 11,
        ),
        Text(
          'Riwayat Medis',
          style: whiteTextStyle.copyWith(fontSize: 20, fontWeight: bold),
        ),
        const Spacer(),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomepageCutomer(),
              ),
            );
          },
          child: Image.asset(
            'assets/icons/icon-home-chat.png',
            width: 18,
          ),
        )
      ],
    ),
  );
}

Divider dividergrey() {
  return const Divider(
    thickness: 0.6,
    color: Color(0xFFCCCCCC),
  );
}

class dividergreen extends StatelessWidget {
  const dividergreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      thickness: 5,
      color: Color(0xFFECECEC),
    );
  }
}
