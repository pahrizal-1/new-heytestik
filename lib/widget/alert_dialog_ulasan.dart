import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/galery_my_journey.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

class AlertDialogUlasan extends StatefulWidget {
  const AlertDialogUlasan({super.key});

  @override
  State<AlertDialogUlasan> createState() => _AlertDialogUlasanState();
}

class _AlertDialogUlasanState extends State<AlertDialogUlasan> {
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
          height: 245,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tambahkan gambar',
                  style: blackRegulerTextStyle.copyWith(
                      fontSize: 20, color: blackColor),
                ),
                const SizedBox(
                  height: 21,
                ),
                Text(
                  'Kamera',
                  style: blackRegulerTextStyle.copyWith(
                      fontSize: 15, color: blackColor),
                ),
                const SizedBox(
                  height: 21,
                ),
                Text(
                  'Dari galeri',
                  style: blackRegulerTextStyle.copyWith(
                      fontSize: 15, color: blackColor),
                ),
                const SizedBox(
                  height: 21,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const GaleryMyJourney()));
                  },
                  child: Text(
                    'Dari galeri ‘My Journey’',
                    style: blackRegulerTextStyle.copyWith(
                        fontSize: 15, color: blackColor),
                  ),
                ),
                const SizedBox(
                  height: 21,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'CANCEL',
                        style: blackRegulerTextStyle.copyWith(
                            fontSize: 15, color: blackColor),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
