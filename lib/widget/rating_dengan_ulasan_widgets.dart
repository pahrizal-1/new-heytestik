import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme/theme.dart';
import 'button_widget.dart';
import 'filter_tap_widget.dart';

class RatingDenganUlasanWidgets extends StatelessWidget {
  const RatingDenganUlasanWidgets({
    super.key,
  });

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
                    'Rating dengan ulasan',
                    style: blackHigtTextStyle.copyWith(fontSize: 20),
                  ),
                ],
              ),
              const SizedBox(
                height: 39,
              ),
              const FilterTapRating(
                title: '1',
              ),
              const FilterTapRating(
                title: '2',
              ),
              const FilterTapRating(
                title: '3',
              ),
              const FilterTapRating(
                title: '4',
              ),
              const FilterTapRating(
                title: '5',
              ),
              const ButtonGreenWidget(title: 'Tampilkan')
            ],
          ),
        ),
      ],
    );
  }
}
