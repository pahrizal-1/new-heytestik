import 'package:flutter/material.dart';

class CelebrityNewsPage extends StatefulWidget {
  const CelebrityNewsPage({super.key});

  @override
  State<CelebrityNewsPage> createState() => _CelebrityNewsPageState();
}

class _CelebrityNewsPageState extends State<CelebrityNewsPage> {
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
          Padding(
            padding: const EdgeInsets.only(top: 200),
            child: Center(
              child: Text(
                'Belum Ada berita',
                style: TextStyle(
                  fontFamily: 'ProximaNova',
                  fontSize: 20,
                ),
              ),
            ),
          )
          // const SizedBox(
          //   height: 41,
          // ),
          // CarouselSlider.builder(
          //   itemCount: images.length,
          //   itemBuilder: (context, index, realIndex) {
          //     final imge = images[index];
          //     return Column(
          //       crossAxisAlignment: CrossAxisAlignment.center,
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         Padding(
          //           padding: const EdgeInsets.only(left: 35.48, right: 39.51),
          //           child: Column(
          //             children: [
          //               Text(
          //                 'CELEBRITY',
          //                 style: grenTextStyle.copyWith(fontSize: 10),
          //               ),
          //               const SizedBox(
          //                 height: 5,
          //               ),
          //               Text(
          //                 'Berjemur Berlebihan Sebabkan Kerusakan Kulit?',
          //                 style: blackTextStyle.copyWith(fontSize: 19),
          //                 textAlign: TextAlign.center,
          //               ),
          //               const SizedBox(
          //                 height: 10,
          //               ),
          //             ],
          //           ),
          //         ),
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             Text(
          //               '25 Januari 2022  |  by Audrey Diwantri Alodia  | ',
          //               style: subTitleTextStyle.copyWith(
          //                 fontSize: 10,
          //               ),
          //             ),
          //             Image.asset(
          //               'assets/icons/book-menu.png',
          //               width: 9.5,
          //               height: 9.5,
          //             ),
          //             Text(
          //               ' 2 Mins',
          //               style: subTitleTextStyle.copyWith(
          //                 fontSize: 10,
          //               ),
          //             ),
          //           ],
          //         ),
          //         const SizedBox(
          //           height: 10,
          //         ),
          //         Container(
          //           width: 350,
          //           height: 181,
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(7),
          //             image: DecorationImage(
          //               image: AssetImage(
          //                 imge,
          //               ),
          //               fit: BoxFit.cover,
          //             ),
          //           ),
          //         ),
          //         const SizedBox(
          //           height: 10,
          //         ),
          //       ],
          //     );
          //   },
          //   options: CarouselOptions(
          //     height: 300,
          //     viewportFraction: 1,
          //     onPageChanged: (index, reason) =>
          //         setState(() => activeIndex = index),
          //   ),
          // ),
          // const SizedBox(
          //   height: 7,
          // ),
          // Center(
          //   child: AnimatedSmoothIndicator(
          //     activeIndex: activeIndex,
          //     count: images.length,
          //     effect: ScaleEffect(
          //         activeDotColor: greenColor,
          //         dotColor: const Color(0xffD9D9D9),
          //         dotWidth: 4,
          //         dotHeight: 4),
          //   ),
          // ),
          // Padding(
          //   padding: EdgeInsets.only(left: 20, right: 54, top: 50),
          //   child: Column(
          //     children: [
          //       CorcernCardWidgets(
          //         img: 'assets/images/keriput-Banner.png',
          //         category: 'BEAUTY / CONCERN',
          //         judul: '3 Penyebab Keriput Di Tangan & Cara Mengatasinya',
          //         tanggal: '05 April 2022',
          //         pembuat: 'Nadira Maurizka',
          //         minute: '2 Mins',
          //       ),
          //       CorcernCardWidgets(
          //         img: 'assets/images/keriput-Banner.png',
          //         category: 'BEAUTY / CONCERN',
          //         judul: '3 Penyebab Keriput Di Tangan & Cara Mengatasinya',
          //         tanggal: '05 April 2022',
          //         pembuat: 'Nadira Maurizka',
          //         minute: '2 Mins',
          //       ),
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}
