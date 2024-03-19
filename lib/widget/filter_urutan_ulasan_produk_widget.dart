// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/alert_dialog.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';
import 'package:heystetik_mobileapps/widget/filter_radio_button_widget.dart';

class FilterUrutanUlasanProdukWidget extends StatefulWidget {
  String? val;
  FilterUrutanUlasanProdukWidget({super.key, this.val});

  @override
  State<FilterUrutanUlasanProdukWidget> createState() =>
      _FilterUrutanUlasanProdukWidgetState();
}

class _FilterUrutanUlasanProdukWidgetState
    extends State<FilterUrutanUlasanProdukWidget> {
  List data = [
    {"text": "Paling Membantu", "value": "PALING_MEMBANTU"},
    {"text": "Terbaru", "value": "TERBARU"},
    {"text": "Rating Tertinggi", "value": "RATING_TERTINGGI"},
    {"text": "Rating Terendah", "value": "RATING_TERENDAH"}
  ];
  String? urutan;

  @override
  void initState() {
    super.initState();
    urutan = widget.val;
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
                      width: 12,
                    ),
                  ),
                  const SizedBox(
                    width: 22,
                  ),
                  Text(
                    'Topik Ulasan',
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
                    urutan = e['text'];
                    setState(() {});
                  },
                  title: e['text'],
                  isSelected: urutan == e['text'],
                );
              }),
              ButtonGreenWidget(
                title: 'Tampilkan',
                onPressed: () {
                  if (urutan is String) {
                    Navigator.pop(context, urutan);
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => AlertWidget(
                        subtitle: "Harap pilih urutan ulasan terlebih dahulu",
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
