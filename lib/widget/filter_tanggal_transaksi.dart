// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/widget/alert_dialog.dart';
import 'package:heystetik_mobileapps/widget/filter_radio_button_widget.dart';

import '../theme/theme.dart';
import 'button_widget.dart';

class FilterTanggalTransaksi extends StatefulWidget {
  int? val;
  FilterTanggalTransaksi({super.key, this.val});

  @override
  State<FilterTanggalTransaksi> createState() => _FilterTanggalTransaksiState();
}

class _FilterTanggalTransaksiState extends State<FilterTanggalTransaksi> {
  int? tanggal;
  @override
  void initState() {
    super.initState();
    tanggal = widget.val;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(left: 33, right: 33, bottom: 10),
        height: 50,
        child: ButtonGreenWidget(
          title: 'Tampilkan',
          onPressed: () {
            if (tanggal != null) {
              Navigator.pop(context, tanggal);
            } else {
              showDialog(
                context: context,
                builder: (context) => AlertWidget(
                  subtitle: "Harap pilih tanggal transaksi terlebih dahulu",
                ),
              );
            }
          },
        ),
      ),
      body: SingleChildScrollView(
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
                    'Tanggal Transaksi',
                    style: blackHigtTextStyle.copyWith(fontSize: 20),
                  ),
                ],
              ),
              const SizedBox(
                height: 39,
              ),
              ...Iterable<int>.generate(60).toList().map((val) {
                String text = val == 0 ? "Hari Ini" : "$val Hari yang lalu";
                return filterRadioButtonWidget(
                  onTap: () {
                    tanggal = val;
                    setState(() {});
                  },
                  title: text,
                  isSelected: tanggal == val,
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
