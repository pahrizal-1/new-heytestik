import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/widget/rating_dengan_ulasan_widgets.dart';
import 'package:heystetik_mobileapps/widget/show_modal_dialog.dart';

import '../theme/theme.dart';

class CategoryProfilAkun extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  const CategoryProfilAkun({
    super.key,
    required this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: onPressed,
          // shomodal(context, const RatingDenganUlasanWidgets());

          child: Container(
            margin: const EdgeInsets.only(right: 5),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
                border: Border.all(
                  color: borderColor,
                ),
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
                Center(
                  child: Text(
                    title,
                    style: blackRegulerTextStyle.copyWith(
                        fontSize: 13, color: blackColor),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
