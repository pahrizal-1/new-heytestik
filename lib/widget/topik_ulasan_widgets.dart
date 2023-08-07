import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';
import 'package:heystetik_mobileapps/widget/filter_tap_widget.dart';

import '../theme/theme.dart';

class TopikUlasanWidgets extends StatelessWidget {
  const TopikUlasanWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> topic = [];
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
                  GestureDetector(
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
              FilterTapTreatment(
                onTap: () {
                  topic.add("CARE");
                },
                title: 'Pelayanan',
              ),
              FilterTapTreatment(
                onTap: () {
                  topic.add("SERVICE");
                },
                title: 'Perawatan',
              ),
              FilterTapTreatment(
                onTap: () {
                  topic.add("MANAGEMENT");
                },
                title: 'Manajemen',
              ),
              ButtonGreenWidget(
                title: 'Terapkan Filter',
                onPressed: () {
                  Navigator.pop(context, topic);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
