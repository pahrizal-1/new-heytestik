import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:heystetik_mobileapps/pages/home/notifikasion_page.dart';
import 'package:heystetik_mobileapps/pages/profile_costumer/profil_customer_page.dart';
import 'package:heystetik_mobileapps/service/customer/slideshow/slideshow_service.dart';
import 'package:heystetik_mobileapps/service/customer/sniptips/sniptips_controller.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/local_storage.dart';
import '../setings&akun/akun_home_page.dart';

class HomepageCutomer extends StatefulWidget {
  const HomepageCutomer({super.key});

  @override
  State<HomepageCutomer> createState() => _HomepageCutomerState();
}

class _HomepageCutomerState extends State<HomepageCutomer> {
  _launchURL(String url) async {
    final Uri urlParse = Uri.parse(url);
    if (!await launchUrl(urlParse)) {
      throw Exception('Could not launch $urlParse');
    }
  }

  String username = '';

  @override
  void initState() {
    super.initState();
    getUsername();
  }

  void getUsername() async {
    username = await LocalStorage().getFullName();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: whiteColor,
        title: Padding(
          padding: const EdgeInsets.only(left: 6),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfilCustomerPage(),
                    ),
                  );
                },
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: AssetImage('assets/images/profiledummy.png')),
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
              const SizedBox(
                width: 11,
              ),
              Text(
                'Hai, ',
                style: blackRegulerTextStyle.copyWith(fontSize: 18),
              ),
              Text(
                username,
                style: blackTextStyle.copyWith(fontSize: 18),
              )
            ],
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotifikasionPage(),
                ),
              );
            },
            child: SvgPicture.asset(
              'assets/icons/notification-dot-black.svg',
            ),
          ),
          const SizedBox(
            width: 21,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AkunHomePage(),
                ),
              );
            },
            child: SvgPicture.asset(
              'assets/icons/humberger-icons.svg',
            ),
          ),
          const SizedBox(
            width: 26,
          ),
        ],
      ),
      body: ListView(
        children: [
          FutureBuilder(
            future: SlideShowService().getSlideShow(),
            builder: (context, AsyncSnapshot snapshot) {
              print(snapshot.data);
              if (!snapshot.hasData) {
                return Shimmer.fromColors(
                  baseColor: greyColor.withOpacity(0.25),
                  highlightColor: whiteColor.withOpacity(0.6),
                  child: CarouselSlider(
                    options: CarouselOptions(height: 184.0),
                    items: [1, 2, 3, 4, 5].map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(7)),
                          );
                        },
                      );
                    }).toList(),
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
                    style: blackHigtTextStyle.copyWith(
                      fontStyle: FontStyle.italic,
                      fontSize: 16,
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
                      return Shimmer.fromColors(
                          baseColor: greyColor.withOpacity(0.25),
                          highlightColor: whiteColor.withOpacity(0.6),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, top: 5, bottom: 5),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  Container(
                                    height: 100,
                                    width: 300,
                                    decoration: BoxDecoration(
                                      color: greyColor.withOpacity(0.9),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    height: 100,
                                    width: 300,
                                    decoration: BoxDecoration(
                                      color: greyColor.withOpacity(0.9),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ));
                    }
                    return Row(
                      children: snapshot.data['data'].map<Widget>((value) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Container(
                            height: 121,
                            width: 315,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: const DecorationImage(
                                image: AssetImage(
                                  'assets/icons/bg_wekkly.png',
                                ),
                              ),
                            ),
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
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: SizedBox(
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Cek artikel yang kamu sukai, yuk!',
                    style: blackHigtTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'Liat Semua',
                      style: TextStyle(
                          fontFamily: 'ProximaNova',
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: greenColor),
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
                    'Hot News 🔥',
                    style: blackHigtTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'Liat Semua',
                      style: TextStyle(
                          fontFamily: 'ProximaNova',
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: greenColor),
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
    );
  }
}
