import 'package:flutter/material.dart';

import '../theme/theme.dart';

class CategoryProfilAkun extends StatefulWidget {
  final String title;
  final Function()? onPressed;
  const CategoryProfilAkun({
    super.key,
    required this.title,
    this.onPressed,
  });

  @override
  State<CategoryProfilAkun> createState() => _CategoryProfilAkunState();
}

class _CategoryProfilAkunState extends State<CategoryProfilAkun> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: (){
            widget.onPressed == null ? (){} : widget.onPressed!();
          },
          child: Container(
            margin: const EdgeInsets.only(right: 5),
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 6,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: borderColor,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Center(
                  child: Text(
                    widget.title,
                    style: blackRegulerTextStyle.copyWith(
                      fontSize: 13,
                      color: blackColor,
                    ),
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
