// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/widget/alert_dialog.dart';
import 'package:heystetik_mobileapps/widget/filter_radio_button_widget.dart';

import '../theme/theme.dart';
import 'button_widget.dart';

class FilterJenisTransaksi extends StatefulWidget {
  String? val;
  FilterJenisTransaksi({super.key, this.val});

  @override
  State<FilterJenisTransaksi> createState() => _FilterJenisTransaksiState();
}

class _FilterJenisTransaksiState extends State<FilterJenisTransaksi> {
  List data = ['Consultation', 'Product', 'Treatment'];
  String? jenis;

  @override
  void initState() {
    super.initState();
    jenis = widget.val;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Padding(
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
                    'Jenis Transaksi',
                    style: blackHigtTextStyle.copyWith(fontSize: 20),
                  ),
                ],
              ),
              const SizedBox(
                height: 39,
              ),
              ...data.map((e) {
                return filterRadioButtonWidget(
                  onTap: () {
                    jenis = e.toString();
                    setState(() {});
                  },
                  title: e.toString(),
                  isSelected: jenis == e.toString(),
                );
              }),
              ButtonGreenWidget(
                title: 'Tampilkan',
                onPressed: () {
                  if (jenis is String) {
                    Navigator.pop(context, jenis);
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => AlertWidget(
                        subtitle: "Harap pilih jenis transaksi terlebih dahulu",
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
