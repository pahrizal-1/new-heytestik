import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

class PilihTranskasiMinheyPage extends StatelessWidget {
  const PilihTranskasiMinheyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 50),
      child: Column(children: [
        Row(children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(
              'assets/icons/danger-icons.png',
              width: 15,
            ),
          ),
          const SizedBox(
            width: 18,
          ),
          Text(
            'Pilih transaksi',
            style: blackHigtTextStyle.copyWith(fontSize: 20),
          )
        ])
      ]),
    );
  }
}
