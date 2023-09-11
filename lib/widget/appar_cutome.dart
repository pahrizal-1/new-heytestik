import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/theme.dart';
import 'package:intl/intl.dart';

class AppBarCustome extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final SvgPicture? imgicons;
  final Color colorIcons;
  final Color colorTitle;
  final Color bgColor;
  final SvgPicture? imgicons2;
  final SvgPicture? imgicon3;
  final SvgPicture? imgicon4;
  final VoidCallback? onta1;
  const AppBarCustome({
    super.key,
    required this.title,
    this.imgicons,
    this.imgicons2,
    this.imgicon3,
    this.imgicon4,
    this.onta1,
    required this.colorIcons,
    required this.colorTitle,
    required this.bgColor,
  });

  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: bgColor,
      title: Padding(
        padding: const EdgeInsets.only(left: 6),
        child: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: colorIcons,
              ),
            ),
            const SizedBox(
              width: 11,
            ),
            Expanded(
              child: Text(
                title,
                style: blackTextStyle.copyWith(
                    color: colorTitle,
                    fontSize: 20,
                    overflow: TextOverflow.ellipsis),
              ),
            )
          ],
        ),
      ),
    );
  }
}
