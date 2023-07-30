import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

import '../../../controller/doctor/profile/profile_controller.dart';
import '../../../widget/costoum_pin_widgets.dart';

class PinPageBaruDoctor extends StatefulWidget {
  final String pinOld;
  const PinPageBaruDoctor({
    super.key,
    required this.pinOld,
  });

  @override
  State<PinPageBaruDoctor> createState() => _PinPageBaruDoctorState();
}

class _PinPageBaruDoctorState extends State<PinPageBaruDoctor> {
  final DoctorProfileController state = Get.put(DoctorProfileController());
  final TextEditingController pinController = TextEditingController(text: '');
  String pin = '123456';
  bool isErr = false;

  addPin(String number) {
    print('number $number');
    if (state.pinNewController.text.length < 6) {
      setState(() {
        state.pinNewController.text = state.pinNewController.text + number;
      });
    }
  }

  deletedPin() {
    if (state.pinNewController.text.isNotEmpty) {
      setState(() {
        state.pinNewController.text = state.pinNewController.text
            .substring(0, state.pinNewController.text.length - 1);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff24A7A0),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 21, top: 50),
              child: InkWell(
                  onTap: () {
                    state.pinNewController.text = '';
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: whiteColor,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 61,
                top: 20,
                right: 61,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Text(
                    'Masukkan Kata Sandi\nBaru Anda',
                    style: whiteTextStyle.copyWith(
                      fontWeight: bold,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 57,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(3),
                        child: Icon(
                          (state.pinNewController.text.length >= 1)
                              ? Icons.circle
                              : Icons.circle_outlined,
                          size: 15,
                          color: whiteColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3),
                        child: Icon(
                          (state.pinNewController.text.length >= 2)
                              ? Icons.circle
                              : Icons.circle_outlined,
                          color: whiteColor,
                          size: 15,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3),
                        child: Icon(
                          (state.pinNewController.text.length >= 3)
                              ? Icons.circle
                              : Icons.circle_outlined,
                          color: whiteColor,
                          size: 15,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3),
                        child: Icon(
                          (state.pinNewController.text.length >= 4)
                              ? Icons.circle
                              : Icons.circle_outlined,
                          color: whiteColor,
                          size: 15,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3),
                        child: Icon(
                          (state.pinNewController.text.length >= 5)
                              ? Icons.circle
                              : Icons.circle_outlined,
                          color: whiteColor,
                          size: 15,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3),
                        child: Icon(
                          (state.pinNewController.text.length == 6)
                              ? Icons.circle
                              : Icons.circle_outlined,
                          color: whiteColor,
                          size: 15,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  // ignore: prefer_const_constructors
                  SizedBox(
                    height: 39,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomInputButton(
                        title: '1',
                        onTap: () {
                          addPin('1');
                        },
                      ),
                      CustomInputButton(
                        title: '2',
                        onTap: () {
                          addPin('2');
                        },
                      ),
                      CustomInputButton(
                        title: '3',
                        onTap: () {
                          addPin('3');
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomInputButton(
                        title: '4',
                        onTap: () {
                          addPin('4');
                        },
                      ),
                      CustomInputButton(
                        title: '5',
                        onTap: () {
                          addPin('5');
                        },
                      ),
                      CustomInputButton(
                        title: '6',
                        onTap: () {
                          addPin('6');
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomInputButton(
                        title: '7',
                        onTap: () {
                          addPin('7');
                        },
                      ),
                      CustomInputButton(
                        title: '8',
                        onTap: () {
                          addPin('8');
                        },
                      ),
                      CustomInputButton(
                        title: '9',
                        onTap: () {
                          addPin('9');
                        },
                      ),
                    ],
                  ),
                  // ignore: prefer_const_constructors
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: InkWell(
                          onTap: () {
                            state.updatePassword(context, widget.pinOld,
                                state.pinNewController.text);
                            // showDialog(
                            //   context: context,
                            //   builder: (context) => const MoreDialogPassword(),
                            // );
                          },
                          child: Container(
                            width: 73,
                            height: 73,
                            child: Center(
                                child: Text(
                              'OK',
                              style: whiteTextStyle.copyWith(
                                  fontSize: 25, fontWeight: bold),
                            )),
                          ),
                        ),
                      ),
                      CustomInputButton(
                        title: '0',
                        onTap: () {
                          addPin('0');
                        },
                      ),
                      GestureDetector(
                        onTap: () {
                          deletedPin();
                        },
                        child: Container(
                          width: 75,
                          height: 75,
                          child: Center(
                              child: Image.asset(
                            'assets/icons/aroowBac.png',
                            width: 35,
                          )),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 39,
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
