// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/register/register_controller.dart';
import 'package:heystetik_mobileapps/pages/auth/info_personal_page.dart';
import 'package:heystetik_mobileapps/pages/auth/verification_email_page.dart';

import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';
import 'package:heystetik_mobileapps/widget/more_dialog_widget.dart';
import 'package:heystetik_mobileapps/widget/snackbar_widget.dart';
import 'package:provider/provider.dart';

import '../../widget/timeline_widget.dart';

class VerificationAcooutPage extends StatefulWidget {
  const VerificationAcooutPage({super.key});

  @override
  State<VerificationAcooutPage> createState() => _VerificationAcooutPageState();
}

class _VerificationAcooutPageState extends State<VerificationAcooutPage> {
  // bool _isEnable = false;
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
      body: Column(
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
                img: 'assets/icons/iphone1.png',
                width: 15,
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
                width: 25,
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
                width: 25,
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
                width: 20,
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
                width: 20,
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 25,
                right: 25,
                bottom: 40,
              ),
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
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                hintText: 'Masukan Email',
                                contentPadding: EdgeInsets.only(
                                    top: 1, bottom: 1, left: 10),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: greenColor,
                                    width: 2,
                                  ),
                                ),
                                suffixIcon: Icon(
                                  Icons.email_outlined,
                                  color: greyColor,
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: greenColor,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(7),
                                )),
                            controller: state.email,
                            style: blackTextStyle.copyWith(fontSize: 14),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                    ],
                  ),
                  const Spacer(),
                  Obx(
                    () => LoadingWidget(
                      isLoading: state.isLoading.value,
                      child: ButtonGreenWidget(
                        title: 'Verifikasi Sekarang',
                        onPressed: () async {
                          await state.registerEmail(context,
                              doInPost: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VerificasionEmailPage(),
                              ),
                            );
                            SnackbarWidget.getSuccessSnackbar(
                              context,
                              'Info',
                              'OTP Berhasil Dikirim',
                            );
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ButtonTextWidget(
                    title: 'Nanti Saja',
                    onPressed: () async {
                      await state.registerEmailWithoutVerification(context,
                          doInPost: () async {
                        await showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) {
                            return NantiSajaDialog();
                          },
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const InfoPersonalPage(),
                          ),
                        );
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
