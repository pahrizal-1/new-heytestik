// ignore_for_file: must_be_immutable, duplicate_ignore

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

class AlertConfirmationWidget extends StatelessWidget {
  String subtitle;
  Function() action;
  AlertConfirmationWidget(
      {required this.subtitle, required this.action, super.key});

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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Text(
                    'Tidak',
                    style: grenTextStyle.copyWith(fontSize: 15),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () async => await action(),
                  child: Text(
                    'Ya',
                    style: grenTextStyle.copyWith(fontSize: 15),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AlertDialogSucsees extends StatefulWidget {
  const AlertDialogSucsees({super.key});

  @override
  State<AlertDialogSucsees> createState() => _AlertDialogSucseesState();
}

class _AlertDialogSucseesState extends State<AlertDialogSucsees> {
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
        height: 300,
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
                    height: 234,
                    width: 241,
                    transform: Matrix4.translationValues(10, -100, 0),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/potoalert.png',
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Container(
                    transform: Matrix4.translationValues(0, -70, 0),
                    child: Column(
                      children: [
                        Text(
                          'Yeaay!',
                          style: blackHigtTextStyle.copyWith(fontSize: 30),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Akun Profilmu Sudah lengkap',
                          style: greyTextStyle.copyWith(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 12, top: 12),
              child: Align(
                alignment: Alignment.topRight,
                child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/icons/danger-icons.png',
                      height: 20,
                      width: 20,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
