import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/stream/news_controller.dart';
import 'package:heystetik_mobileapps/models/customer/article_model.dart';
import 'package:heystetik_mobileapps/pages/stream_page/vies_detail_beauty_stream_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/corcern_card_widgets.dart';
import 'package:heystetik_mobileapps/widget/shimmer_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AllInfoNewsPage extends StatefulWidget {
  const AllInfoNewsPage({super.key});

  @override
  State<AllInfoNewsPage> createState() => _AllInfoNewsPageState();
}

class _AllInfoNewsPageState extends State<AllInfoNewsPage> {
  final NewsController state = Get.put(NewsController());

  int activeIndex = 0;
  final images = [
    'assets/images/Berjemur1-Stream.png',
    'assets/images/Berjemur1-Stream.png',
    'assets/images/Berjemur1-Stream.png'
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(
            height: 41,
          ),
          CarouselSlider.builder(
            itemCount: images.length,
            itemBuilder: (context, index, realIndex) {
              final imge = images[index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ViewDetailBeutyStreamPage(),
                    ),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 35.48, right: 39.51),
                      child: Column(
                        children: [
                          Text(
                            'BEAUTY / CONCERN',
                            style: grenTextStyle.copyWith(fontSize: 10),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Berjemur Berlebihan Sebabkan Kerusakan Kulit?',
                            style: blackTextStyle.copyWith(fontSize: 19),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '25 Januari 2022  |  by Audrey Diwantri Alodia  | ',
                          style: subTitleTextStyle.copyWith(
                            fontSize: 10,
                          ),
                        ),
                        Image.asset(
                          'assets/icons/book-menu.png',
                          width: 9.5,
                          height: 9.5,
                        ),
                        Text(
                          ' 2 Mins',
                          style: subTitleTextStyle.copyWith(
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 350,
                      height: 181,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        image: DecorationImage(
                          image: AssetImage(
                            imge,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              );
            },
            options: CarouselOptions(
              height: 300,
              viewportFraction: 1,
              onPageChanged: (index, reason) =>
                  setState(() => activeIndex = index),
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          Center(
            child: AnimatedSmoothIndicator(
              activeIndex: activeIndex,
              count: images.length,
              effect: ScaleEffect(
                activeDotColor: greenColor,
                dotColor: const Color(0xffD9D9D9),
                dotWidth: 4,
                dotHeight: 4,
              ),
            ),
          ),
          // masih error euy
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 54, top: 50),
            child: FutureBuilder(
              future: state.getArticle(context),
              builder: (context, AsyncSnapshot<ArticleModel?> snapshot) {
                print(snapshot.connectionState);
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      shimmerWidget(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.only(right: 5),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 24),
                          decoration: BoxDecoration(
                            color: whiteColor,
                            border: Border.all(color: borderColor),
                            borderRadius: BorderRadius.circular(7),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: spaceHeigt,
                      ),
                      shimmerWidget(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.only(right: 5),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 24),
                          decoration: BoxDecoration(
                            color: whiteColor,
                            border: Border.all(color: borderColor),
                            borderRadius: BorderRadius.circular(7),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: spaceHeigt,
                      ),
                      shimmerWidget(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.only(right: 5),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 24),
                          decoration: BoxDecoration(
                            color: whiteColor,
                            border: Border.all(color: borderColor),
                            borderRadius: BorderRadius.circular(7),
                          ),
                        ),
                      ),
                    ],
                  );
                }
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    return snapshot.data!.record!.isEmpty
                        ? Center(
                            child: Text(
                              'Belum ada berita',
                              style: TextStyle(
                                fontWeight: bold,
                                fontFamily: 'ProximaNova',
                                fontSize: 15,
                              ),
                            ),
                          )
                        : SizedBox(
                            height: 70,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data!.record!.length,
                              itemBuilder: (BuildContext context, index) {
                                return const CorcernCardWidgets(
                                  img: 'assets/images/keriput-Banner.png',
                                  category: 'BEAUTY / CONCERN',
                                  judul:
                                      '3 Penyebab Keriput Di Tangan & Cara Mengatasinya',
                                  tanggal: '05 April 2022',
                                  pembuat: 'Nadira Maurizka',
                                  minute: '2 Mins',
                                );
                              },
                            ),
                          );
                  } else {
                    return Center(
                      child: Text(
                        'Belum ada berita',
                        style: TextStyle(
                          fontWeight: bold,
                          fontFamily: 'ProximaNova',
                          fontSize: 15,
                        ),
                      ),
                    );
                  }
                } else {
                  return Text('Connection State: ${snapshot.connectionState}');
                }
              },
            ),
            // child: Column(
            //   children: [
            //     CorcernCardWidgets(
            //       img: 'assets/images/keriput-Banner.png',
            //       category: 'BEAUTY / CONCERN',
            //       judul: '3 Penyebab Keriput Di Tangan & Cara Mengatasinya',
            //       tanggal: '05 April 2022',
            //       pembuat: 'Nadira Maurizka',
            //       minute: '2 Mins',
            //     ),
            //     CorcernCardWidgets(
            //       img: 'assets/images/keriput-Banner.png',
            //       category: 'BEAUTY / CONCERN',
            //       judul: '3 Penyebab Keriput Di Tangan & Cara Mengatasinya',
            //       tanggal: '05 April 2022',
            //       pembuat: 'Nadira Maurizka',
            //       minute: '2 Mins',
            //     ),
            //   ],
            // ),
          )
        ],
      ),
    );
  }
}
