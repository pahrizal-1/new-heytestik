import 'package:flutter/material.dart';

import 'package:heystetik_mobileapps/pages/stream_page/buat_postingan_pool_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

import 'buat_postingan_general.dart';

class BuatPostinganPage extends StatefulWidget {
  const BuatPostinganPage({super.key});

  @override
  State<BuatPostinganPage> createState() => _BuatPostinganPageState();
}

class _BuatPostinganPageState extends State<BuatPostinganPage> {
  int iSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: iSelected == 0
          ? const BuatPostinganGeneral()
          : const BuatPostingaPollPage(),
      bottomNavigationBar: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
          height: 48,
          width: 390,
          decoration: BoxDecoration(
            border: Border.all(color: borderColor),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    iSelected = 0;
                  });
                },
                child: Image.asset(
                  'assets/icons/camera.png',
                  width: 24,
                  height: 24,
                  color: iSelected == 0 ? greenColor : const Color(0xffCCCCCC),
                ),
              ),
              const SizedBox(
                width: 29,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    iSelected = 1;
                  });
                },
                child: Image.asset(
                  'assets/icons/poll.png',
                  width: 24,
                  height: 24,
                  color: iSelected == 1 ? greenColor : const Color(0xffCCCCCC),
                ),
              ),
              const SizedBox(
                width: 21,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
