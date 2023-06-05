import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:heystetik_mobileapps/pages/interest/interest3_page.dart';
import 'package:heystetik_mobileapps/pages/interest/interest5_page.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';

class Interest4Page extends StatefulWidget {
  const Interest4Page({super.key});

  @override
  State<Interest4Page> createState() => _Interest4PageState();
}

class _Interest4PageState extends State<Interest4Page> {
  bool isIconSelected1 = false;
  bool isIconSelected2 = false;
  bool isIconSelected3 = false;
  bool isIconSelected4 = false;
  bool isIconSelected5 = false;
  bool isIconSelected6 = false;
  bool isIconSelected7 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 32, right: 32, top: 40),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Back",
                            style: TextStyle(
                              fontFamily: 'ProximaNova',
                              color: fromCssColor('#575757CC'),
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 30,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/logoheystetik2.png'),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    "Body Concern",
                    style: TextStyle(
                      fontFamily: 'ProximaNova',
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Please complete this form for create account.If you need help please email on loremipsum@mail.com",
                    style: TextStyle(
                      fontFamily: 'ProximaNova',
                      color: fromCssColor('#575757'),
                    ),
                    strutStyle: const StrutStyle(
                      height: 0.7,
                      leading: 0.6,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                isIconSelected2 = !isIconSelected2;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: isIconSelected2
                                    ? fromCssColor('#6DC0B3')
                                    : fromCssColor('#D3EAE680'),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: 50,
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        isIconSelected2
                                            ? Icons.check_circle_rounded
                                            : Icons.add_circle,
                                        size: 18,
                                        color: isIconSelected2
                                            ? Colors.white
                                            : fromCssColor('#313D3B99'),
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        'Dryness',
                                        style: TextStyle(
                                            letterSpacing: 0.5,
                                            fontSize: 12,
                                            fontFamily: 'ProximaNova',
                                            color: isIconSelected2
                                                ? Colors.white
                                                : fromCssColor('#313D3B99'),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                isIconSelected3 = !isIconSelected3;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: isIconSelected3
                                    ? fromCssColor('#6DC0B3')
                                    : fromCssColor('#D3EAE680'),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: 50,
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        isIconSelected3
                                            ? Icons.check_circle_rounded
                                            : Icons.add_circle,
                                        size: 18,
                                        color: isIconSelected3
                                            ? Colors.white
                                            : fromCssColor('#313D3B99'),
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        'Cellulute',
                                        style: TextStyle(
                                            letterSpacing: 0.5,
                                            fontSize: 12,
                                            fontFamily: 'ProximaNova',
                                            color: isIconSelected3
                                                ? Colors.white
                                                : fromCssColor('#313D3B99'),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                isIconSelected4 = !isIconSelected4;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: isIconSelected4
                                    ? fromCssColor('#6DC0B3')
                                    : fromCssColor('#D3EAE680'),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: 50,
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        isIconSelected4
                                            ? Icons.check_circle_rounded
                                            : Icons.add_circle,
                                        size: 18,
                                        color: isIconSelected4
                                            ? Colors.white
                                            : fromCssColor('#313D3B99'),
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        'Body Acne',
                                        style: TextStyle(
                                            letterSpacing: 0.5,
                                            fontSize: 12,
                                            fontFamily: 'ProximaNova',
                                            color: isIconSelected4
                                                ? Colors.white
                                                : fromCssColor('#313D3B99'),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                isIconSelected5 = !isIconSelected5;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: isIconSelected5
                                    ? fromCssColor('#6DC0B3')
                                    : fromCssColor('#D3EAE680'),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: 50,
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        isIconSelected5
                                            ? Icons.check_circle_rounded
                                            : Icons.add_circle,
                                        size: 18,
                                        color: isIconSelected5
                                            ? Colors.white
                                            : fromCssColor('#313D3B99'),
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        'Dullnesss',
                                        style: TextStyle(
                                            letterSpacing: 0.5,
                                            fontSize: 12,
                                            fontFamily: 'ProximaNova',
                                            color: isIconSelected5
                                                ? Colors.white
                                                : fromCssColor('#313D3B99'),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                isIconSelected6 = !isIconSelected6;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: isIconSelected6
                                    ? fromCssColor('#6DC0B3')
                                    : fromCssColor('#D3EAE680'),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: 50,
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        isIconSelected6
                                            ? Icons.check_circle_rounded
                                            : Icons.add_circle,
                                        size: 18,
                                        color: isIconSelected6
                                            ? Colors.white
                                            : fromCssColor('#313D3B99'),
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        'Loose Skin',
                                        style: TextStyle(
                                            letterSpacing: 0.5,
                                            fontSize: 12,
                                            fontFamily: 'ProximaNova',
                                            color: isIconSelected6
                                                ? Colors.white
                                                : fromCssColor('#313D3B99'),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                isIconSelected7 = !isIconSelected7;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: isIconSelected7
                                    ? fromCssColor('#6DC0B3')
                                    : fromCssColor('#D3EAE680'),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: 50,
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        isIconSelected7
                                            ? Icons.check_circle_rounded
                                            : Icons.add_circle,
                                        size: 18,
                                        color: isIconSelected7
                                            ? Colors.white
                                            : fromCssColor('#313D3B99'),
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        'Unwanted Hair',
                                        style: TextStyle(
                                            letterSpacing: 0.5,
                                            fontSize: 12,
                                            fontFamily: 'ProximaNova',
                                            color: isIconSelected7
                                                ? Colors.white
                                                : fromCssColor('#313D3B99'),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            isIconSelected1 = !isIconSelected1;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: isIconSelected1
                                ? fromCssColor('#6DC0B3')
                                : fromCssColor('#D3EAE680'),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: 50,
                          width: 110,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    isIconSelected1
                                        ? Icons.check_circle_rounded
                                        : Icons.add_circle,
                                    size: 18,
                                    color: isIconSelected1
                                        ? Colors.white
                                        : fromCssColor('#313D3B99'),
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    'Sensitivity',
                                    style: TextStyle(
                                        letterSpacing: 0.5,
                                        fontSize: 12,
                                        fontFamily: 'ProximaNova',
                                        color: isIconSelected1
                                            ? Colors.white
                                            : fromCssColor('#313D3B99'),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 72),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ButtonGreenWidget(
                    title: 'Next',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Interest5Page(),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
