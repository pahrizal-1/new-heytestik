import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme/theme.dart';
import 'button_widget.dart';
import 'filter_tap_widget.dart';

class RatingDenganUlasanWidgets extends StatefulWidget {
  const RatingDenganUlasanWidgets({
    super.key,
  });

  @override
  State<RatingDenganUlasanWidgets> createState() => _RatingDenganUlasanWidgetsState();
}

class _RatingDenganUlasanWidgetsState extends State<RatingDenganUlasanWidgets> {
  List<String> rating = [];
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
                    'Rating dengan ulasan',
                    style: blackHigtTextStyle.copyWith(fontSize: 20),
                  ),
                ],
              ),
              const SizedBox(
                height: 39,
              ),
              FilterTapRating(
                onTap: () {
                  if (rating.contains("1")) {
                    rating.remove("1");
                  } else {
                    rating.add("1");
                  }
                },
                title: '1',
              ),
              FilterTapRating(
                onTap: () {
                  if (rating.contains("2")) {
                    rating.remove("2");
                  } else {
                    rating.add("2");
                  }
                },
                title: '2',
              ),
              FilterTapRating(
                onTap: () {
                  if (rating.contains("3")) {
                    rating.remove("3");
                  } else {
                    rating.add("3");
                  }
                },
                title: '3',
              ),
              FilterTapRating(
                onTap: () {
                  if (rating.contains("4")) {
                    rating.remove("4");
                  } else {
                    rating.add("4");
                  }
                },
                title: '4',
              ),
              FilterTapRating(
                onTap: () {
                  if (rating.contains("5")) {
                    rating.remove("5");
                  } else {
                    rating.add("5");
                  }
                },
                title: '5',
              ),
              ButtonGreenWidget(
                title: 'Tampilkan',
                onPressed: () {
                  Navigator.pop(context, rating);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
