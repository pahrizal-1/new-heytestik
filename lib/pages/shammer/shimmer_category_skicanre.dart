import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/shimmer_widget.dart';

Widget shimmerCategorySkincare(BuildContext context) {
  return shimmerWidget(
    child: Padding(
      padding: EdgeInsets.only(left: 25, top: 20),
      child: Wrap(
        spacing: 12,
        runSpacing: 12,
        children: List.generate(10, (index) {
          return Container(
            height: 83,
            width: 90,
            decoration: BoxDecoration(
                color: greyColor, borderRadius: BorderRadius.circular(14)),
          );
        }),
      ),
    ),
  );
}
