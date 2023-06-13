import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/controller/auth/register_controller.dart';
import 'package:heystetik_mobileapps/pages/auth/info_personal_page.dart';
import 'package:heystetik_mobileapps/pages/auth/verification_email_page.dart';

import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';
import 'package:provider/provider.dart';

import '../../widget/timeline_widget.dart';

class VerificationAcooutPage extends StatefulWidget {
  const VerificationAcooutPage({super.key});

  @override
  State<VerificationAcooutPage> createState() => _VerificationAcooutPageState();
}

class _VerificationAcooutPageState extends State<VerificationAcooutPage> {
  bool _isEnable = false;
  bool isSelected = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<RegisterController>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(
                'assets/icons/danger-icons.png',
                width: 14,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TimeLineIdicatorPage(
                  iconColor: whiteColor,
                  secondiconColor: greenColor,
                  bgcolor: greenColor,
                  isFirst: true,
                  title: 'Nomor Hanpone',
                  img: 'assets/images/iphone1.png',
                  width: 18,
                  iconimg: 'assets/images/check.png',
                ),
                TimeLineIdicatorPage(
                  iconColor: greenColor,
                  secondiconColor: greenColor,
                  bgcolor: whiteColor,
                  isFirst: false,
                  isLast: true,
                  title: 'Email',
                  img: 'assets/icons/email-icons.png',
                  width: 30,
                  iconimg: 'assets/images/Vector.png',
                ),
                TimeLineIdicatorPage(
                  iconColor: greenColor,
                  secondiconColor: greenColor,
                  bgcolor: whiteColor,
                  isFirst: true,
                  isLast: true,
                  title: 'Info Personal',
                  img: 'assets/images/iphone1.png',
                  width: 20,
                  iconimg: 'assets/images/Vector.png',
                ),
                TimeLineIdicatorPage(
                  iconColor: greenColor,
                  secondiconColor: greenColor,
                  bgcolor: whiteColor,
                  isFirst: true,
                  isLast: true,
                  title: 'Beauty Profile',
                  img: 'assets/icons/logo-person.png',
                  width: 25,
                  iconimg: 'assets/images/Vector.png',
                ),
                TimeLineIdicatorPage(
                  iconColor: greenColor,
                  secondiconColor: greenColor,
                  bgcolor: whiteColor,
                  isFirst: true,
                  isLast: true,
                  title: 'Beauty Concern',
                  img: 'assets/icons/logo-person.png',
                  width: 25,
                  iconimg: 'assets/images/Vector.png',
                ),
              ],
            ),
            const SizedBox(
              height: 23,
            ),
            const Divider(
              thickness: 1,
              color: Color(0XffCCCCCC),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Verifikasi Akunmu',
                    style: blackHigtTextStyle,
                  ),
                  const SizedBox(
                    height: 23,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: greenColor,
                                    width: 2,
                                  ),
                                ),
                                border: isSelected
                                    ? OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: greenColor,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(7),
                                      )
                                    : InputBorder.none),
                            controller: state.email,
                            enabled: _isEnable,
                            style: blackTextStyle.copyWith(fontSize: 14),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: 80,
                        height: 50,
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              _isEnable = !_isEnable;
                              isSelected = !isSelected;
                            });
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: greenColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Center(
                            child: isSelected
                                ? Text('Simpan',
                                    style:
                                        whiteTextStyle.copyWith(fontSize: 14))
                                : Text(
                                    'Ubah',
                                    style:
                                        whiteTextStyle.copyWith(fontSize: 14),
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 330,
                  ),
                  ButtonGreenWidget(
                    title: 'Verifikasi Sekarang',
                    onPressed: () async {
                      await state.registerEmail(context, doInPost: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const VerificasionEmailPage(),
                          ),
                        );
                      });
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ButtonTextWidget(
                    title: 'Nanti Saja',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const InfoPersonalPage(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
