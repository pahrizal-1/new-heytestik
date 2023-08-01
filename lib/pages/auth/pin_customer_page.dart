import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/more_dilog_password.dart';

import '../../../widget/costoum_pin_widgets.dart';

class PinPageCustomer extends StatefulWidget {
  const PinPageCustomer({super.key});

  @override
  State<PinPageCustomer> createState() => _PinPageCustomerState();
}

class _PinPageCustomerState extends State<PinPageCustomer> {
  final TextEditingController pinController = TextEditingController(text: '');
  String pin = '123456';
  bool isErr = false;

  addPin(String number) {
    print('number $number');
    if (pinController.text.length < 6) {
      setState(() {
        pinController.text = pinController.text + number;
      });
    }

    if (pinController.text.length == 6) {
      if (pinController.text == pin) {
        Navigator.pop(context, true);
        print('pin');
      } else {
        print('Password salahß');
        isErr = true;
        Text(
          'Password anda salah',
          style: blackTextStyle.copyWith(color: redColor),
        );
      }
    }

    print('pinController ${pinController.text}');
  }

  deletedPin() {
    if (pinController.text.isNotEmpty) {
      setState(() {
        isErr = false;
        pinController.text =
            pinController.text.substring(0, pinController.text.length - 1);
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
                    'Masukkan Kata Sandi',
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
                          (pinController.text.length >= 1)
                              ? Icons.circle
                              : Icons.circle_outlined,
                          size: 15,
                          color: whiteColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3),
                        child: Icon(
                          (pinController.text.length >= 2)
                              ? Icons.circle
                              : Icons.circle_outlined,
                          color: whiteColor,
                          size: 15,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3),
                        child: Icon(
                          (pinController.text.length >= 3)
                              ? Icons.circle
                              : Icons.circle_outlined,
                          color: whiteColor,
                          size: 15,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3),
                        child: Icon(
                          (pinController.text.length >= 4)
                              ? Icons.circle
                              : Icons.circle_outlined,
                          color: whiteColor,
                          size: 15,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3),
                        child: Icon(
                          (pinController.text.length >= 5)
                              ? Icons.circle
                              : Icons.circle_outlined,
                          color: whiteColor,
                          size: 15,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3),
                        child: Icon(
                          (pinController.text.length == 6)
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
                      GestureDetector(
                        onTap: () {
                          deletedPin();
                        },
                        child: InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => const MoreDialogPassword(),
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
