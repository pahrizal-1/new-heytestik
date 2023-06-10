import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:heystetik_mobileapps/pages/home/header_page.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heystetik_mobileapps/service/slideshow/slideshow_service.dart';
import 'package:heystetik_mobileapps/service/sniptips/sniptips_controller.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:url_launcher/url_launcher.dart';

import '../chat_customer/onboarding_chat_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _launchURL(String url) async {
    final Uri urlParse = Uri.parse(url);
    if (!await launchUrl(urlParse)) {
      throw Exception('Could not launch $urlParse');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          const HeaderPage(),
          FutureBuilder(
            future: SlideShowService().getSlideShow(),
            builder: (context, AsyncSnapshot snapshot) {
              print(snapshot.data);
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    height: 30,
                    width: 30,
                    child: CircularProgressIndicator(
                      color: greenColor,
                    ),
                  ),
                );
              }

              return CarouselSlider(
                options: CarouselOptions(
                  height: 170,
                  autoPlay: false,
                  initialPage: 2,
                  autoPlayAnimationDuration: const Duration(seconds: 3),
                ),
                items: snapshot.data['data'].map<Widget>((value) {
                  return Builder(
                    builder: (BuildContext context) {
                      return InkWell(
                        onTap: () {
                          _launchURL(value['link']);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/home1.png'),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              );
            },
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          transform: Matrix4.translationValues(0, -5, 0),
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            image: const DecorationImage(
                              image: AssetImage('assets/images/jerawat.png'),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Text(
                            'Jerawat',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'ProximaNova',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            image: const DecorationImage(
                              image:
                                  AssetImage('assets/images/rambutrontok.png'),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Text(
                            'Rambut\nRontok',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'ProximaNova',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          transform: Matrix4.translationValues(0, -5, 0),
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            image: const DecorationImage(
                              image: AssetImage('assets/images/kerutan.png'),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Text(
                            'Kerutan',
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'ProximaNova',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            image: const DecorationImage(
                              image:
                                  AssetImage('assets/images/bekasjerawat.png'),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Text(
                            'Bekas\nJerawat',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'ProximaNova',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          transform: Matrix4.translationValues(0, -5, 0),
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            image: const DecorationImage(
                              image: AssetImage('assets/images/ketombe.png'),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Text(
                            'Ketombe',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'ProximaNova',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Container(
                            transform: Matrix4.translationValues(0, -5, 0),
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        'assets/images/kebotakan.png'))),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: Text(
                              'Kebotakan',
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'ProximaNova',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                image: const DecorationImage(
                                    image:
                                        AssetImage('assets/images/dagu.png'))),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: Text(
                              'Bekas\nJerawat',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'ProximaNova',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                image: const DecorationImage(
                                    image: AssetImage(
                                        'assets/images/kulitkusam.png'))),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: Text(
                              'Kulit\nKusam',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'ProximaNova',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        'assets/images/skingoals.png'))),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: Text(
                              'Skin Goals\nlain',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'ProximaNova',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            transform: Matrix4.translationValues(0, -5, 0),
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                image: const DecorationImage(
                                    image: AssetImage(
                                        'assets/images/lainnya.png'))),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: Text(
                              'Lainnya',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'ProximaNova',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ])
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Weekly Snips - Tips',
                    style: TextStyle(
                        fontFamily: 'ProximaNova',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: fromCssColor('#231F20B2')),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'See More',
                      style: TextStyle(
                          fontFamily: 'ProximaNova',
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: fromCssColor('#466762')),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 5, bottom: 5),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: FutureBuilder(
                  future: SnipTipsService().getSnipTips(),
                  builder: (context, AsyncSnapshot snapshot) {
                    print(snapshot.data);

                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          height: 30,
                          width: 30,
                          child: CircularProgressIndicator(
                            color: greenColor,
                          ),
                        ),
                      );
                    }
                    return Row(
                      children: snapshot.data['data'].map<Widget>((value) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  fromCssColor('#8FC5BC'),
                                  fromCssColor('#A8EBEB')
                                ],
                              ),
                            ),
                            width: 300,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15, left: 15, right: 15),
                                  child: Text(
                                    value['tips'],
                                    style: const TextStyle(
                                      fontFamily: 'ProximaNova',
                                      fontSize: 13,
                                    ),
                                    strutStyle: const StrutStyle(
                                      height: 0.5,
                                      leading: 0.5,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Row(
                                    children: [
                                      const CircleAvatar(
                                        maxRadius: 17,
                                        backgroundImage: AssetImage(
                                            'assets/images/profiledummy.png'),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, bottom: 5),
                                            child: Text(
                                              value['doctor']['fullname'],
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 14,
                                                  fontFamily: 'ProximaNova'),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Text(
                                              value['doctor_title'],
                                              style: TextStyle(
                                                fontSize: 11,
                                                color:
                                                    fromCssColor('#231F2080'),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    );
                  }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: SizedBox(
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Skincare and Treatment',
                    style: TextStyle(
                        fontFamily: 'ProximaNova',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: fromCssColor('#231F20B2')),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'See More',
                      style: TextStyle(
                          fontFamily: 'ProximaNova',
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: fromCssColor('#466762')),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Container(
                      width: 300,
                      height: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/home2.png'))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Container(
                      width: 300,
                      height: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/home2.png'))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Container(
                      width: 300,
                      height: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/home2.png'))),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: SizedBox(
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Article',
                    style: TextStyle(
                        fontFamily: 'ProximaNova',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: fromCssColor('#231F20B2')),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'See More',
                      style: TextStyle(
                          fontFamily: 'ProximaNova',
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: fromCssColor('#466762')),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: SizedBox(
                      width: 250,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 250,
                            height: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage('assets/images/home3.png'))),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              'Atasi Kebotakan Karena Alopecia Androgenetik',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontFamily: 'ProximaNova',
                              ),
                              strutStyle: StrutStyle(
                                height: 0.5,
                                leading: 0.7,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              children: [
                                const Text(
                                  '22 Februari 2023',
                                  style: TextStyle(
                                    fontFamily: 'ProximaNova',
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Container(
                                    height: 5,
                                    width: 5,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                          'assets/icons/dot.png',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const Text(
                                  'Steffana Dewi',
                                  style: TextStyle(
                                    fontFamily: 'ProximaNova',
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: SizedBox(
                      width: 250,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 250,
                            height: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage('assets/images/home3.png'))),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              'Atasi Kebotakan Karena Alopecia Androgenetik',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontFamily: 'ProximaNova',
                              ),
                              strutStyle: StrutStyle(
                                height: 0.5,
                                leading: 0.7,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              children: [
                                const Text(
                                  '22 Februari 2023',
                                  style: TextStyle(
                                    fontFamily: 'ProximaNova',
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Container(
                                    height: 5,
                                    width: 5,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                          'assets/icons/dot.png',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const Text(
                                  'Steffana Dewi',
                                  style: TextStyle(
                                    fontFamily: 'ProximaNova',
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: SizedBox(
                      width: 250,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 250,
                            height: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage('assets/images/home3.png'))),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              'Atasi Kebotakan Karena Alopecia Androgenetik',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontFamily: 'ProximaNova',
                              ),
                              strutStyle: StrutStyle(
                                height: 0.5,
                                leading: 0.7,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              children: [
                                const Text(
                                  '22 Februari 2023',
                                  style: TextStyle(
                                    fontFamily: 'ProximaNova',
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Container(
                                    height: 5,
                                    width: 5,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                          'assets/icons/dot.png',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const Text(
                                  'Steffana Dewi',
                                  style: TextStyle(
                                    fontFamily: 'ProximaNova',
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: SizedBox(
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Article News',
                    style: TextStyle(
                        fontFamily: 'ProximaNova',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: fromCssColor('#231F20B2')),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'See More',
                      style: TextStyle(
                          fontFamily: 'ProximaNova',
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: fromCssColor('#466762')),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: SizedBox(
                      width: 250,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 250,
                            height: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage('assets/images/home4.png'))),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              'Atasi Kebotakan Karena Alopecia Androgenetik',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontFamily: 'ProximaNova',
                              ),
                              strutStyle: StrutStyle(
                                height: 0.5,
                                leading: 0.7,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              children: [
                                const Text(
                                  '22 Februari 2023',
                                  style: TextStyle(
                                    fontFamily: 'ProximaNova',
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Container(
                                    height: 5,
                                    width: 5,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                          'assets/icons/dot.png',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const Text(
                                  'Steffana Dewi',
                                  style: TextStyle(
                                    fontFamily: 'ProximaNova',
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: SizedBox(
                      width: 250,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 250,
                            height: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage('assets/images/home4.png'))),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              'Atasi Kebotakan Karena Alopecia Androgenetik',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontFamily: 'ProximaNova',
                              ),
                              strutStyle: StrutStyle(
                                height: 0.5,
                                leading: 0.7,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              children: [
                                const Text(
                                  '22 Februari 2023',
                                  style: TextStyle(
                                    fontFamily: 'ProximaNova',
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Container(
                                    height: 5,
                                    width: 5,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                          'assets/icons/dot.png',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const Text(
                                  'Steffana Dewi',
                                  style: TextStyle(
                                    fontFamily: 'ProximaNova',
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: SizedBox(
                      width: 250,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 250,
                            height: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage('assets/images/home4.png'))),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              'Atasi Kebotakan Karena Alopecia Androgenetik',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontFamily: 'ProximaNova',
                              ),
                              strutStyle: StrutStyle(
                                height: 0.5,
                                leading: 0.7,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              children: [
                                const Text(
                                  '22 Februari 2023',
                                  style: TextStyle(
                                    fontFamily: 'ProximaNova',
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Container(
                                    height: 5,
                                    width: 5,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                          'assets/icons/dot.png',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const Text(
                                  'Steffana Dewi',
                                  style: TextStyle(
                                    fontFamily: 'ProximaNova',
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          selectedItemColor: fromCssColor('#6DC0B3'),
          unselectedItemColor: fromCssColor('#616161'),
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 3),
                  child: SvgPicture.asset('assets/icons/icon_home.svg'),
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OnboardingChat(),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 3),
                    child: SvgPicture.asset('assets/icons/icon_chat.svg'),
                  ),
                ),
                label: 'Chat'),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 3),
                  child: SvgPicture.asset('assets/icons/icon_stream.svg'),
                ),
                label: 'Stream'),
            BottomNavigationBarItem(
                icon: Container(
                  height: 30,
                  width: 30,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 3),
                    child: Image.asset('assets/images/jpgsolutions.jpg'),
                    // child: Icon(Icons.health_and_safety_outlined, size: 26),
                  ),
                ),
                label: 'Solutions'),
          ],
          selectedFontSize: 12,
          unselectedFontSize: 12,
        ),
      ),
    );
  }
}
