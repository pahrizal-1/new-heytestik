import 'package:flutter/material.dart';

import '../theme/theme.dart';

class TagsNews extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;

  const TagsNews({
    super.key,
    required this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.only(right: 5, bottom: 7),
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 5,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          border: Border.all(
            color: greenColor,
            width: 1,
          ),
        ),
        child: Text(
          title,
          style: blackRegulerTextStyle.copyWith(
            fontSize: 14,
            color: blackColor,
          ),
        ),
      ),
    );
  }
}
