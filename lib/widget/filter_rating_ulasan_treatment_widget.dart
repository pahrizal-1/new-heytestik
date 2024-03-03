// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/alert_dialog.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';
import 'package:heystetik_mobileapps/widget/filter_radio_button_widget.dart';

class FilterRatingUlasanTreatmentWidget extends StatefulWidget {
  int? val;
  FilterRatingUlasanTreatmentWidget({super.key, this.val});

  @override
  State<FilterRatingUlasanTreatmentWidget> createState() =>
      _FilterRatingUlasanTreatmentWidgetState();
}

class _FilterRatingUlasanTreatmentWidgetState
    extends State<FilterRatingUlasanTreatmentWidget> {
  List<int> data = [1, 2, 3, 4, 5];
  int? rating;

  @override
  void initState() {
    super.initState();
    rating = widget.val;
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
                    'Rating dengan ulasan',
                    style: blackHigtTextStyle.copyWith(fontSize: 20),
                  ),
                ],
              ),
              const SizedBox(
                height: 39,
              ),
              ...data.map((e) {
                return filterRadioButtonWidget(
                  isRating: true,
                  title: e.toString(),
                  isSelected: rating == e,
                  onTap: () {
                    if (rating == e) {
                      rating = null;
                    } else {
                      rating = e;
                    }
                    setState(() {});
                  },
                );
              }),
              ButtonGreenWidget(
                title: 'Tampilkan',
                onPressed: () {
                  if (rating is int) {
                    Navigator.pop(context, rating);
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => AlertWidget(
                        subtitle: "Harap pilih rating ulasan terlebih dahulu",
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
