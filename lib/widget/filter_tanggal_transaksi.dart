import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme/theme.dart';
import 'button_widget.dart';
import 'filter_tap_widget.dart';

class FilterTanggalTransaksi extends StatefulWidget {
  const FilterTanggalTransaksi({
    super.key,
  });

  @override
  State<FilterTanggalTransaksi> createState() => _FilterTanggalTransaksiState();
}

class _FilterTanggalTransaksiState extends State<FilterTanggalTransaksi> {
  int tanggal = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 33,
          right: 33,
          top: 30,
          bottom: 40,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    'assets/icons/danger-icons.png',
                    width: 14,
                  ),
                ),
                const SizedBox(
                  width: 22,
                ),
                Text(
                  'Status Transaksi',
                  style: blackHigtTextStyle.copyWith(fontSize: 20),
                ),
              ],
            ),
            const SizedBox(
              height: 39,
            ),
            ...Iterable<int>.generate(60).toList().map((e) {
              return FilterTapTreatment(
                onTap: () {
                  tanggal = e;
                },
                title: e == 0 ? "Hari Ini" : "$e Hari yang lalu",
              );
            }).toList(),
            ButtonGreenWidget(
              title: 'Tampilkan',
              onPressed: () {
                Navigator.pop(context, tanggal);
              },
            ),
          ],
        ),
      ),
    );
  }
}
