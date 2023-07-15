import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AllInfoStreamPage extends StatefulWidget {
  const AllInfoStreamPage({super.key});

  @override
  State<AllInfoStreamPage> createState() => _AllInfoStreamPageState();
}

class _AllInfoStreamPageState extends State<AllInfoStreamPage> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(top: 41, right: 35, left: 35),
              child: Center(
                child: Column(
                  children: [],
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 14, top: 14),
                        width: 350,
                        height: 181,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            image: const DecorationImage(
                                image: AssetImage(
                                  'assets/images/Berjemur1-Stream.png',
                                ),
                                fit: BoxFit.cover)),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 14, top: 14),
                    width: 350,
                    height: 181,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      image: const DecorationImage(
                        image: AssetImage(
                          'assets/images/Berjemur1-Stream.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          Center(
            child: AnimatedSmoothIndicator(
              activeIndex: activeIndex,
              count: 2,
              effect: ScaleEffect(
                  activeDotColor: greenColor,
                  dotColor: const Color(0xffD9D9D9),
                  dotWidth: 6,
                  dotHeight: 6),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 54, top: 50),
            child: Column(
              children: [
                CorcernCardWidgets(
                  img: 'assets/images/keriput-Banner.png',
                  category: 'BEAUTY / CONCERN',
                  judul: '3 Penyebab Keriput Di Tangan & Cara Mengatasinya',
                  tanggal: '05 April 2022',
                  pembuat: 'Nadira Maurizka',
                  minute: '2 Mins',
                ),
                CorcernCardWidgets(
                  img: 'assets/images/keriput-Banner.png',
                  category: 'BEAUTY / CONCERN',
                  judul: '3 Penyebab Keriput Di Tangan & Cara Mengatasinya',
                  tanggal: '05 April 2022',
                  pembuat: 'Nadira Maurizka',
                  minute: '2 Mins',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CorcernCardWidgets extends StatelessWidget {
  final String img;
  final String category;
  final String tanggal;
  final String minute;
  final String pembuat;
  final String judul;
  const CorcernCardWidgets({
    super.key,
    required this.img,
    required this.category,
    required this.tanggal,
    required this.minute,
    required this.pembuat,
    required this.judul,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 11),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 77,
                width: 110,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(img),
                  ),
                ),
              ),
              const SizedBox(
                width: 14,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category,
                      style: grenTextStyle.copyWith(fontSize: 10),
                    ),
                    Text(
                      judul,
                      style: blackTextStyle.copyWith(fontSize: 14),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '$tanggal  |  $pembuat',
                      style: subTitleTextStyle.copyWith(fontSize: 8),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/icons/book-menu.png',
                          color: const Color(0xffFA3A3A3),
                          width: 8.445,
                        ),
                        Text(
                          ' $minute',
                          style: subTitleTextStyle.copyWith(fontSize: 9),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 11,
        ),
        dividergrey()
      ],
    );
  }
}
