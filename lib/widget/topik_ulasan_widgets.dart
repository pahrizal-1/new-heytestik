import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';
import 'package:heystetik_mobileapps/widget/filter_tap_widget.dart';

import '../theme/theme.dart';

class TopikUlasanWidgets extends StatelessWidget {
  const TopikUlasanWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 33, right: 33, top: 30, bottom: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/icons/danger-icons.png',
                    width: 12,
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
              const FilterTapTreatment(
                title: 'Pelayanan',
              ),
              const FilterTapTreatment(
                title: 'Perawatan',
              ),
              const FilterTapTreatment(
                title: 'Manajemen',
              ),
              const FilterTapTreatment(
                title: 'Rating Terendah',
              ),
              const ButtonGreenWidget(title: 'Terapkan Filter')
            ],
          ),
        ),
      ],
    );
  }
}
