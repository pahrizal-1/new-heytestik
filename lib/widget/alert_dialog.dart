import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

// ignore: must_be_immutable
class AlertWidget extends StatelessWidget {
  String subtitle;

  AlertWidget({required this.subtitle, super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(10),
      content: Container(
        padding: const EdgeInsets.only(left: 39, right: 39, top: 39),
        height: 210,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Info',
              style: blackHigtTextStyle.copyWith(fontSize: 24),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              subtitle,
              style: greyTextStyle.copyWith(fontSize: 13),
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Oke',
                    style: grenTextStyle.copyWith(fontSize: 15),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
