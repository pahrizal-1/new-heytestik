import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:heystetik_mobileapps/pages/auth/auth_page.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';

class Interest8Page extends StatefulWidget {
  const Interest8Page({super.key});

  @override
  State<Interest8Page> createState() => _Interest8PageState();
}

class _Interest8PageState extends State<Interest8Page> {
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
                    "Prefrence Budget",
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
                  TextFormField(
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: fromCssColor('#231F203D'),
                        ),
                      ),
                      labelText: ' Ex : Rp 20.000 - 100.000',
                      hintStyle: TextStyle(
                        fontFamily: 'ProximaNova',
                        fontSize: 16,
                        color: Colors.grey[300],
                      ),
                    ),
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
                          builder: (context) => const AuthPage(),
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
