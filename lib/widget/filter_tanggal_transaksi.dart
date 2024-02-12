import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/widget/alert_dialog.dart';

import '../theme/theme.dart';
import 'button_widget.dart';

class FilterTanggalTransaksi extends StatefulWidget {
  const FilterTanggalTransaksi({
    super.key,
  });

  @override
  State<FilterTanggalTransaksi> createState() => _FilterTanggalTransaksiState();
}

class _FilterTanggalTransaksiState extends State<FilterTanggalTransaksi> {
  int? tanggal;

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
                return popup(
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

  Widget popup(
      {required Function()? onTap,
      required String title,
      required bool isSelected}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              onTap == null ? () {} : onTap();
            },
            child: Row(
              children: [
                Text(
                  title,
                  style:
                      blackTextStyle.copyWith(color: blackColor, fontSize: 15),
                ),
                const Spacer(),
                Icon(
                  isSelected ? Icons.radio_button_on : Icons.circle_outlined,
                  color: isSelected ? greenColor : blackColor,
                ),
              ],
            ),
          ),
          Divider(
            thickness: 1,
            color: borderColor,
          )
        ],
      ),
    );
  }
}
