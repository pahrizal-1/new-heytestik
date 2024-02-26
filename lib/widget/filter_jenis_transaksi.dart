import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/widget/alert_dialog.dart';

import '../theme/theme.dart';
import 'button_widget.dart';
import 'filter_tap_widget.dart';

class FilterJenisTransaksi extends StatefulWidget {
  const FilterJenisTransaksi({
    super.key,
  });

  @override
  State<FilterJenisTransaksi> createState() => _FilterJenisTransaksiState();
}

class _FilterJenisTransaksiState extends State<FilterJenisTransaksi> {
  List<String> jenis = [];
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
              FilterTapTreatment(
                onTap: () {
                  jenis.add("CONSULTATION");
                },
                title: 'Consultation',
              ),
              FilterTapTreatment(
                onTap: () {
                  jenis.add("PRODUCT");
                },
                title: 'Product',
              ),
              FilterTapTreatment(
                onTap: () {
                  jenis.add("TREATMENT");
                },
                title: 'Treatment',
              ),
              ButtonGreenWidget(
                title: 'Tampilkan',
                onPressed: () {
                  if (jenis.isNotEmpty) {
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
