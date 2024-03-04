// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/alert_dialog.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';
import 'package:heystetik_mobileapps/widget/filter_radio_button_widget.dart';

class FilterTopikUlasanTreatmentWidget extends StatefulWidget {
  String? val;
  FilterTopikUlasanTreatmentWidget({super.key, this.val});

  @override
  State<FilterTopikUlasanTreatmentWidget> createState() =>
      _FilterTopikUlasanTreatmentWidgetState();
}

class _FilterTopikUlasanTreatmentWidgetState
    extends State<FilterTopikUlasanTreatmentWidget> {
  List<String> data = ['Care', 'Service', 'Management'];
  String? topik;

  @override
  void initState() {
    super.initState();
    topik = widget.val;
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
                  title: e.toString(),
                  isSelected: topik == e,
                  onTap: () {
                    if (topik == e) {
                      topik = null;
                    } else {
                      topik = e;
                    }
                    setState(() {});
                  },
                );
              }),
              ButtonGreenWidget(
                title: 'Tampilkan',
                onPressed: () {
                  if (topik is String) {
                    Navigator.pop(context, topik);
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => AlertWidget(
                        subtitle: "Harap pilih topik ulasan terlebih dahulu",
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
