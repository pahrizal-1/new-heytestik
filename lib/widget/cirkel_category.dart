import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

class CirkelCategory extends StatelessWidget {
  final String img;
  final String title;
  const CirkelCategory({
    Key? key,
    required this.img,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              border: Border.all(color: borderColor, width: 0.2),
              borderRadius: BorderRadius.circular(30),
              image:
                  DecorationImage(image: NetworkImage(img), fit: BoxFit.cover),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 70,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: blackRegulerTextStyle.copyWith(
                fontSize: 12,
                color: blackColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
