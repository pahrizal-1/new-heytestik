import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/alert_dialog.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';

import '../../controller/customer/account/profile_controller.dart';

class VerifikasiSetingsProfilePage extends StatefulWidget {
  const VerifikasiSetingsProfilePage({super.key});

  @override
  State<VerifikasiSetingsProfilePage> createState() => _VerifikasiSetingsProfilePageState();
}

class _VerifikasiSetingsProfilePageState extends State<VerifikasiSetingsProfilePage> {
  final ProfileController state = Get.put(ProfileController());

  Timer? countdownTimer;
  Duration myDuration = Duration(seconds: 120);

  void startTimer() {
    countdownTimer = Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
  }

  void stopTimer() {
    setState(() => countdownTimer!.cancel());
  }

  void resetTimer() {
    stopTimer();
    setState(() => myDuration = Duration(seconds: 120));
    startTimer();
  }

  void setCountDown() {
    final reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  // @override
  // void dispose() {
  //   // state.timeCondition();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: const EdgeInsets.only(left: 6),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  // state.resendTime.value = 0;
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: blackColor,
                ),
              ),
              const SizedBox(
                width: 11,
              ),
            ],
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //       builder: (BuildContext context) =>
              //           VerifikasiDataSetingsPage()),
              // );
            },
            child: Image.asset(
              'assets/icons/more-six.png',
              width: 15,
              height: 15,
            ),
          ),
          const SizedBox(
            width: 26,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: lsymetric.copyWith(top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Verifikasi Code',
                style: grenTextStyle.copyWith(fontSize: 28),
              ),
              const SizedBox(
                height: 9,
              ),
              Text(
                'Masukkan 5 digit kode yang telah dikirmkan ke Whatsapp',
                style: greyTextStyle,
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                state.nomorHpController.text.replaceAll(RegExp(r'.(?=.{3})'), '*'),
                style: blackTextStyle.copyWith(),
              ),
              const SizedBox(
                height: 18,
              ),
              OtpTextField(
                focusedBorderColor: greenColor,
                disabledBorderColor: borderColor,
                enabledBorderColor: borderColor,
                numberOfFields: 5,
                fieldWidth: 50,
                borderColor: greenColor,
                showFieldAsBox: true,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onCodeChanged: (verif) {
                  setState(() {
                    state.otp.value = verif;
                  });
                },
                onSubmit: (String verifCode) {
                  print(verifCode);
                  setState(() {
                    state.otp.value = verifCode;
                  });
                  print(state.otp.value);
                },
              ),
              const SizedBox(
                height: 25,
              ),
              ButtonGreenWidget(
                title: 'Simpan',
                onPressed: () {
                  if (state.otp.value.length < 5) {
                    showDialog(
                      context: Get.context!,
                      builder: (context) => AlertWidget(subtitle: 'Tolong Lengkapi Code Terlebih Dahulu'),
                    );
                  } else {
                    state.updatePhone(context);
                  }
                  // state.verifyCode(context);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Belum mendapatkan kode?',
                    style: greyTextStyle.copyWith(fontSize: 14),
                  ),
                  countdownTimer!.isActive
                      ? Row(
                          children: [
                            Text(
                              '$minutes:$seconds',
                              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Text(
                              'detik',
                              style: grenTextStyle.copyWith(fontSize: 18),
                            ),
                          ],
                        )
                      : GestureDetector(
                          onTap: () {
                            if (countdownTimer!.isActive) {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertWidget(
                                        subtitle: 'Coba beberapa saat lagi',
                                      ));
                            } else {
                              state.verifyCodeWA(context, state.nomorHpController.text);
                              resetTimer();
                            }
                          },
                          child: state.isLoading.value
                              ? CircularProgressIndicator()
                              : Text(
                                  ' Kirim Ulang',
                                  style: grenTextStyle.copyWith(fontSize: 14),
                                ),
                        ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class VerifikasiEmailSetingsProfilePage extends StatefulWidget {
  const VerifikasiEmailSetingsProfilePage({super.key});

  @override
  State<VerifikasiEmailSetingsProfilePage> createState() => _VerifikasiEmailSetingsProfilePageState();
}

class _VerifikasiEmailSetingsProfilePageState extends State<VerifikasiEmailSetingsProfilePage> {
  final ProfileController state = Get.put(ProfileController());

  Timer? countdownTimer;
  Duration myDuration = Duration(seconds: 120);

  void startTimer() {
    countdownTimer = Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
  }

  void stopTimer() {
    setState(() => countdownTimer!.cancel());
  }

  void resetTimer() {
    stopTimer();
    setState(() => myDuration = Duration(seconds: 120));
    startTimer();
  }

  void setCountDown() {
    final reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    // state.timeCondition();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: const EdgeInsets.only(left: 6),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: blackColor,
                ),
              ),
              const SizedBox(
                width: 11,
              ),
            ],
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //       builder: (BuildContext context) =>
              //           VerifikasiDataSetingsPage()),
              // );
            },
            child: Image.asset(
              'assets/icons/more-six.png',
              width: 15,
              height: 15,
            ),
          ),
          const SizedBox(
            width: 26,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: lsymetric.copyWith(top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Verifikasi Code',
                style: grenTextStyle.copyWith(fontSize: 28),
              ),
              const SizedBox(
                height: 9,
              ),
              Text(
                'Masukkan 5 digit kode yang telah dikirmkan ke Email',
                style: greyTextStyle,
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                state.emailBaruController.text.replaceAll(RegExp(r'.(?=.{10})'), '*'),
                style: blackTextStyle.copyWith(),
              ),
              const SizedBox(
                height: 18,
              ),
              OtpTextField(
                focusedBorderColor: greenColor,
                disabledBorderColor: borderColor,
                enabledBorderColor: borderColor,
                numberOfFields: 5,
                fieldWidth: 50,
                borderColor: greenColor,
                showFieldAsBox: true,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onCodeChanged: (verif) {
                  setState(() {
                    state.otp.value = verif;
                  });
                },
                onSubmit: (String verifCode) {
                  print(verifCode);
                  setState(() {
                    state.otp.value = verifCode;
                  });
                  print(state.otp.value);
                },
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     Text('$minutes:$seconds', style: subTitleTextStyle),
              //     SizedBox(
              //       width: 2,
              //     ),
              //     Text(
              //       'detik',
              //       style: grenTextStyle.copyWith(fontSize: 12),
              //     ),
              //   ],
              // ),
              const SizedBox(
                height: 25,
              ),
              ButtonGreenWidget(
                title: 'Simpan',
                onPressed: () {
                  if (state.otp.value.length < 5) {
                    showDialog(
                      context: Get.context!,
                      builder: (context) => AlertWidget(subtitle: 'Tolong Lengkapi Code Terlebih Dahulu'),
                    );
                  } else {
                    state.updateEmail(context);
                  }
                  // state.verifyCode(context);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Belum mendapatkan kode?',
                    style: greyTextStyle.copyWith(fontSize: 14),
                  ),
                  countdownTimer!.isActive
                      ? Row(
                          children: [
                            Text('$minutes:$seconds', style: subTitleTextStyle),
                            SizedBox(
                              width: 2,
                            ),
                            Text(
                              'detik',
                              style: grenTextStyle.copyWith(fontSize: 12),
                            ),
                          ],
                        )
                      : GestureDetector(
                          onTap: () {
                            if (countdownTimer!.isActive) {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertWidget(
                                        subtitle: 'Coba beberapa saat lagi',
                                      ));
                            } else {
                              state.verifyCodeEmail(context, state.emailBaruController.text);
                              resetTimer();
                            }
                          },
                          child: Text(
                            ' Kirim Ulang',
                            style: grenTextStyle.copyWith(fontSize: 14),
                          ),
                        ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
