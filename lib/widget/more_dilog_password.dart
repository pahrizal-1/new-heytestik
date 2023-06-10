import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';

import '../theme/theme.dart';

class MoreDialogPassword extends StatefulWidget {
  const MoreDialogPassword({super.key});

  @override
  State<MoreDialogPassword> createState() => _MoreDialogPasswordState();
}

class _MoreDialogPasswordState extends State<MoreDialogPassword> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(1),
      content: Container(
        height: 180,
        width: 362,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 53),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Kata sandi Anda berhasil diubah!',
                style: blackHigtTextStyle.copyWith(fontSize: 15),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 104, right: 104),
                child: ButtonGreenWidget(
                  title: 'Oke',
                  height: 34,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
