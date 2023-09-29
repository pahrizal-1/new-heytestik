import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/pages/auth/pin_lama_customer.dart';
import 'package:heystetik_mobileapps/widget/alert_dialog.dart';

import '../../controller/customer/account/profile_controller.dart';
import '../../theme/theme.dart';
import '../../widget/button_widget.dart';

class VerifikasiKeamananPage extends StatefulWidget {
  final String noHp;
  const VerifikasiKeamananPage({super.key, required this.noHp});

  @override
  State<VerifikasiKeamananPage> createState() => _VerifikasiKeamananPageState();
}

class _VerifikasiKeamananPageState extends State<VerifikasiKeamananPage> {
  final ProfileController state = Get.put(ProfileController());

  Timer? countdownTimer;
  Duration myDuration = Duration(seconds: 120);

  void startTimer() {
    countdownTimer =
        Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
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
                  state.resendTime.value = 0;
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
                'Masukkan 6 digit kode yang telah dikirmkan ke Whatsapp',
                style: greyTextStyle,
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                widget.noHp.replaceAll(RegExp(r'.(?=.{3})'), '*'),
                style: blackTextStyle.copyWith(fontSize: 14),
              ),
              const SizedBox(
                height: 18,
              ),
              OtpTextField(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                borderRadius: BorderRadius.circular(7),
                focusedBorderColor: greenColor,
                disabledBorderColor: borderColor,
                enabledBorderColor: borderColor,
                numberOfFields: 5,
                fieldWidth: 50,
                borderColor: greenColor,
                showFieldAsBox: true,
                onSubmit: (String verifCode) {
                  print(verifCode);
                  setState(() {
                    state.otp.value = verifCode;
                  });
                  print(state.otp.value);
                },
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
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
              ),
              const SizedBox(
                height: 25,
              ),
              ButtonGreenWidget(
                title: 'Simpan',
                onPressed: () {
                  state.verifyOtp(context,);
                  print(state.otp.value);
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
                  GestureDetector(
                    onTap: () {
                      if (countdownTimer!.isActive) {
                        showDialog(
                            context: context,
                            builder: (context) => AlertWidget(
                                  subtitle: 'Coba beberapa saat lagi',
                                ));
                      } else {
                        state.verifyCodeWA(context, widget.noHp);
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

class VerifikasiEmailKeamananAkunPage extends StatefulWidget {
  final String email;
  const VerifikasiEmailKeamananAkunPage({super.key, required this.email});

  @override
  State<VerifikasiEmailKeamananAkunPage> createState() =>
      _VerifikasiEmailKeamananAkunPageState();
}

class _VerifikasiEmailKeamananAkunPageState
    extends State<VerifikasiEmailKeamananAkunPage> {
  final ProfileController state = Get.put(ProfileController());

  Timer? countdownTimer;
  Duration myDuration = Duration(seconds: 120);

  void startTimer() {
    countdownTimer =
        Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
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
                  state.resendTime.value = 0;
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
                'Masukkan 6 digit kode yang telah dikirmkan ke Email',
                style: greyTextStyle,
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                widget.email.replaceAll(RegExp(r'.(?=.{10})'), '*'),
                style: blackTextStyle.copyWith(),
              ),
              const SizedBox(
                height: 18,
              ),
              OtpTextField(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                focusedBorderColor: greenColor,
                disabledBorderColor: borderColor,
                enabledBorderColor: borderColor,
                numberOfFields: 5,
                fieldWidth: 50,
                borderColor: greenColor,
                showFieldAsBox: true,
                onSubmit: (String verifCode) {
                  print(verifCode);
                  setState(() {
                    state.otp.value = verifCode;
                  });
                  print(state.otp.value);
                },
              ),
              const SizedBox(
                height: 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
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
              ),
              const SizedBox(
                height: 25,
              ),
              ButtonGreenWidget(
                title: 'Simpan',
                onPressed: () {
                  state.verifyOtp(context);
                  // Get.to(PinPageLamaCustomer());
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
                  GestureDetector(
                    onTap: () {
                      if (countdownTimer!.isActive) {
                        showDialog(
                            context: context,
                            builder: (context) => AlertWidget(
                                  subtitle: 'Coba beberapa saat lagi',
                                ));
                      } else {
                        state.verifyCodeEmail(context, widget.email);
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
