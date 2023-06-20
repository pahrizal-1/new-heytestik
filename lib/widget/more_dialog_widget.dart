import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/pages/auth/auth_page.dart';
import 'package:heystetik_mobileapps/pages/auth/info_personal_page.dart';
import 'package:heystetik_mobileapps/pages/auth/verification_account_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/Text_widget.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';
import 'package:heystetik_mobileapps/widget/timeline_widget.dart';

class MoreDialog extends StatelessWidget {
  const MoreDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      alignment: Alignment.center,
      content: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 6,
        ),
        height: 310,
        width: 400,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        'assets/icons/danger-icons.png',
                        width: 17,
                      )),
                ],
              ),
            ),
            Text(
              'Status Akun',
              style: blackHigtTextStyle.copyWith(fontSize: 24),
            ),
            Text(
              'Yuk, lengkapi profil Heystetik-mu :)',
              style: greyTextStyle,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TimeMoreDialogPage(
                  iconColor: whiteColor,
                  secondiconColor: greenColor,
                  bgcolor: greenColor,
                  isFirst: true,
                  title: 'Nomor Hanpone',
                  img: 'assets/images/iphone1.png',
                  width: 18,
                  iconimg: 'assets/images/check.png',
                ),
                TimeMoreDialogPage(
                  iconColor: greenColor,
                  secondiconColor: greenColor,
                  bgcolor: whiteColor,
                  isFirst: false,
                  isLast: false,
                  title: 'Email',
                  img: 'assets/icons/email-icons.png',
                  width: 30,
                  iconimg: 'assets/images/Vector.png',
                ),
                TimeMoreDialogPage(
                  iconColor: greenColor,
                  secondiconColor: greenColor,
                  bgcolor: whiteColor,
                  isFirst: false,
                  isLast: false,
                  title: 'Info Personal',
                  img: 'assets/images/iphone1.png',
                  width: 20,
                  iconimg: 'assets/images/Vector.png',
                ),
                TimeMoreDialogPage(
                  iconColor: greenColor,
                  secondiconColor: greenColor,
                  bgcolor: whiteColor,
                  isFirst: false,
                  isLast: false,
                  title: 'Beauty Profile',
                  img: 'assets/icons/logo-person.png',
                  width: 25,
                  iconimg: 'assets/images/Vector.png',
                ),
                TimeMoreDialogPage(
                  iconColor: greenColor,
                  secondiconColor: greenColor,
                  bgcolor: whiteColor,
                  isFirst: false,
                  isLast: true,
                  title: 'Skin Goals',
                  img: 'assets/icons/logo-person.png',
                  width: 25,
                  iconimg: 'assets/images/Vector.png',
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            ButtonGreenWidget(
              title: 'Lengkapi Profil',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const VerificationAcooutPage(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class TextMoreDialog extends StatelessWidget {
  const TextMoreDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.all(10),
      content: Container(
        padding: EdgeInsets.only(left: 39, right: 39, top: 39),
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
              'Verifikasi Berhasil',
              style: blackHigtTextStyle.copyWith(fontSize: 24),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Yey! Email rasmalina.rina@gmail.com telah berhasil terverifikasi.',
              style: greyTextStyle.copyWith(fontSize: 13),
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const InfoPersonalPage(),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Lanjut',
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

class ProfilMoreDialog extends StatefulWidget {
  const ProfilMoreDialog({super.key});

  @override
  State<ProfilMoreDialog> createState() => _ProfilMoreDialogState();
}

class _ProfilMoreDialogState extends State<ProfilMoreDialog> {
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
        height: 270,
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
                          'assets/images/more-image.png',
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Container(
                    transform: Matrix4.translationValues(0, -50, 0),
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
            Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AuthPage(),
                    ),
                  );
                },
                child: Container(
                  height: 45,
                  width: 45,
                  child: Icon(
                    Icons.close,
                    color: Colors.grey,
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

class DetailMoreDialogFilter extends StatelessWidget {
  const DetailMoreDialogFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.all(0.1),
      content: Container(
        height: 380,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 21, top: 35, right: 21),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_outlined,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Detail Perawatan',
                    style: blackTextStyle.copyWith(fontSize: 20),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 34, vertical: 37),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextBoldSpacebetwen(
                        title1: '',
                        title: 'Durasi Perawatan',
                        title2: '15 Menit',
                      ),
                      SizedBox(
                        height: 11,
                      ),
                      TextBoldSpacebetwen(
                        title1: '',
                        title: 'Masa Pemulihan',
                        title2: '2-4 Hari',
                      ),
                      SizedBox(
                        height: 11,
                      ),
                      TextBoldSpacebetwen(
                        title1: '',
                        title: 'Tipe',
                        title2: 'Non- Surgical',
                      ),
                      SizedBox(
                        height: 34,
                      ),
                      Text(
                        'Detail Perawatan',
                        style: TextStyle(color: blackColor, fontSize: 15),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 5,
                            height: 5,
                            decoration: BoxDecoration(
                                color: blackColor, shape: BoxShape.circle),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Cleasing',
                            style: blackHigtTextStyle.copyWith(fontSize: 15),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 5,
                            height: 5,
                            decoration: BoxDecoration(
                                color: blackColor, shape: BoxShape.circle),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Foto Befoer-After',
                            style: blackHigtTextStyle.copyWith(fontSize: 15),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 5,
                            height: 5,
                            decoration: BoxDecoration(
                                color: blackColor, shape: BoxShape.circle),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Diberikan Cairan Felling',
                            style: blackHigtTextStyle.copyWith(fontSize: 15),
                          ),
                        ],
                      )
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
