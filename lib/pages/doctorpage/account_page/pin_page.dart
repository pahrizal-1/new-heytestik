import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/more_dilog_password.dart';

import '../../../controller/doctor/profile/profile_controller.dart';
import '../../../widget/costoum_pin_widgets.dart';

class PinPage extends StatefulWidget {
  const PinPage({super.key});

  @override
  State<PinPage> createState() => _PinPageState();
}

class _PinPageState extends State<PinPage> {
  final DoctorProfileController state = Get.put(DoctorProfileController());

  String pin = '123456';
  bool isErr = false;

  addPin(String number) {
    print('number $number');
    if (state.pinOldController.text.length < 6) {
      setState(() {
        state.pinOldController.text = state.pinOldController.text + number;
      });
    }

    print('state.pinOldController ${state.pinOldController.text}');
  }

  deletedPin() {
    if (state.pinOldController.text.isNotEmpty) {
      setState(() {
        isErr = false;
        state.pinOldController.text = state.pinOldController.text
            .substring(0, state.pinOldController.text.length - 1);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF23A49E),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 21, top: 40),
              child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: whiteColor,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 58),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Text(
                    'Masukkan Kata Sandi\nLama Anda',
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
                          (state.pinOldController.text.length >= 1)
                              ? Icons.circle
                              : Icons.circle_outlined,
                          size: 15,
                          color: whiteColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3),
                        child: Icon(
                          (state.pinOldController.text.length >= 2)
                              ? Icons.circle
                              : Icons.circle_outlined,
                          color: whiteColor,
                          size: 15,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3),
                        child: Icon(
                          (state.pinOldController.text.length >= 3)
                              ? Icons.circle
                              : Icons.circle_outlined,
                          color: whiteColor,
                          size: 15,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3),
                        child: Icon(
                          (state.pinOldController.text.length >= 4)
                              ? Icons.circle
                              : Icons.circle_outlined,
                          color: whiteColor,
                          size: 15,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3),
                        child: Icon(
                          (state.pinOldController.text.length >= 5)
                              ? Icons.circle
                              : Icons.circle_outlined,
                          color: whiteColor,
                          size: 15,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3),
                        child: Icon(
                          (state.pinOldController.text.length == 6)
                              ? Icons.circle
                              : Icons.circle_outlined,
                          color: whiteColor,
                          size: 15,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          backgroundColor: Colors.white,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadiusDirectional.only(
                              topEnd: Radius.circular(25),
                              topStart: Radius.circular(25),
                            ),
                          ),
                          context: context,
                          builder: (context) => Container(
                                height: 246,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 33, top: 47, right: 45),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Lupa Kata Sandi?',
                                        style: blackTextStyle.copyWith(
                                            fontSize: 20),
                                      ),
                                      const SizedBox(
                                        height: 28,
                                      ),
                                      Text(
                                        'Kami akan kirimkan Kata Sandi Anda\nke email yang terdaftar di akun Heystetik.',
                                        style: blackHigtTextStyle.copyWith(
                                            fontWeight: regular, fontSize: 15),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: InkWell(
                                              onTap: () {
                                                // Navigator.push(
                                                //   context,
                                                //   MaterialPageRoute(
                                                //     builder: (context) => const SearchKlinkPage(),
                                                //   ),
                                                // );
                                              },
                                              child: Container(
                                                height: 34,
                                                // width: MediaQuery.of(context).size.width,
                                                decoration: BoxDecoration(
                                                  color: whiteColor,
                                                  border: Border.all(
                                                      color: greenColor),
                                                  borderRadius:
                                                      BorderRadius.circular(7),
                                                ),
                                                child: Center(
                                                  child: Text('Batal',
                                                      style: TextStyle(
                                                          color: greenColor,
                                                          fontSize: 15)),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 12,
                                          ),
                                          Expanded(
                                            child: InkWell(
                                              onTap: () {
                                                // Navigator.push(
                                                //   context,
                                                //   MaterialPageRoute(
                                                //     builder: (context) => const SearchKlinkPage(),
                                                //   ),
                                                // );
                                              },
                                              child: Container(
                                                height: 34,
                                                // width: MediaQuery.of(context).size.width,
                                                decoration: BoxDecoration(
                                                  color: greenColor,
                                                  borderRadius:
                                                      BorderRadius.circular(7),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    'Lanjut',
                                                    style: TextStyle(
                                                        color: whiteColor,
                                                        fontSize: 15),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ));
                    },
                    child: Text(
                      'Lupa Kata Sandi?',
                      style: whiteTextStyle.copyWith(
                        fontWeight: bold,
                        fontSize: 20,
                      ),
                    ),
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
                        onTap: () {
                          Get.to(
                              PinNewPage(pinOld: state.pinOldController.text));
                          print('hey');
                        },
                        child: Container(
                          width: 70,
                          height: 70,
                          child: Center(
                              child: Text(
                            'OK',
                            style: whiteTextStyle.copyWith(
                                fontSize: 25, fontWeight: bold),
                          )),
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
                          width: 70,
                          height: 70,
                          child: Center(
                              child: Image.asset(
                            'assets/icons/aroowBac.png',
                            width: 28,
                          )),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
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

class PinNewPage extends StatefulWidget {
  String? pinOld;
  PinNewPage({super.key, required this.pinOld});

  @override
  State<PinNewPage> createState() => _PinNewPageState();
}

class _PinNewPageState extends State<PinNewPage> {
  final DoctorProfileController state = Get.put(DoctorProfileController());

  String pin = '123456';
  bool isErr = false;

  addPin(String number) {
    print('number $number');
    if (state.pinNewController.text.length < 6) {
      setState(() {
        state.pinNewController.text = state.pinNewController.text + number;
      });
    }

    print('state.pinNewController ${state.pinNewController.text}');
  }

  deletedPin() {
    if (state.pinNewController.text.isNotEmpty) {
      setState(() {
        isErr = false;
        state.pinNewController.text = state.pinNewController.text
            .substring(0, state.pinNewController.text.length - 1);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(
              "assets/images/bg-pin.png",
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 21, top: 40),
              child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: whiteColor,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 58),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
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
                  SizedBox(
                    height: 80,
                  ),
                  // ignore: prefer_const_constructors

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
                        onTap: () {
                          print('old' + widget.pinOld.toString());
                          print('new' + state.pinNewController.text.toString());
                          state.updatePassword(
                            context,
                            widget.pinOld.toString(),
                            state.pinNewController.text,
                          );
                        },
                        child: Container(
                          width: 70,
                          height: 70,
                          child: Center(
                              child: Text(
                            'OK',
                            style: whiteTextStyle.copyWith(
                                fontSize: 25, fontWeight: bold),
                          )),
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
                          width: 70,
                          height: 70,
                          child: Center(
                              child: Image.asset(
                            'assets/icons/aroowBac.png',
                            width: 28,
                          )),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
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
