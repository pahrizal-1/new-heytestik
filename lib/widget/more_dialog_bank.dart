import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';

import '../pages/chat_customer/chat_contomer_page.dart';
import '../theme/theme.dart';

class BankMoreDialog extends StatefulWidget {
  const BankMoreDialog({super.key});

  @override
  State<BankMoreDialog> createState() => _BankMoreDialogState();
}

class _BankMoreDialogState extends State<BankMoreDialog> {
  // void initState() {
  //   super.initState();
  //   Timer(
  //     const Duration(seconds: 1),
  //     () => Navigator.of(context).pushReplacement(
  //       MaterialPageRoute(
  //         builder: (BuildContext context) => const AuthPage(),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(0.1),
      content: Container(
        height: 370,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 200,
                    width: 240,
                    transform: Matrix4.translationValues(10, -60, 0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/images/more-image.png",
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Container(
                    transform: Matrix4.translationValues(0, -50, 0),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 37, left: 37),
                      child: Column(
                        children: [
                          Text(
                            'Pembayaranmu Berhasil ',
                            style: blackHigtTextStyle.copyWith(
                                fontSize: 22, fontStyle: FontStyle.italic),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Langsung chat Dokter sekarang, yuk!',
                            style: greyTextStyle.copyWith(fontSize: 16),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          ButtonGreenWidget(
                            title: 'Chat Dokter',
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const ChatCostomerPage(),
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: InkWell(
                // onTap: () {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => const AuthPage(),
                //     ),
                //   );
                // },
                child: Container(
                  height: 45,
                  width: 45,
                  child: Icon(
                    Icons.close,
                    color: Color(0xff323232),
                    size: 30,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
