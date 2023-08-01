import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/pertanyaan_awal1_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../widget/appar_cutome.dart';

class ChatPage extends StatefulWidget {
  final int? interestConditionId;
  const ChatPage({super.key, required this.interestConditionId});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final images = [
    'assets/images/bekas-jerawat1.png',
    'assets/images/bekas-jerawat2.png',
    'assets/images/bekas-jerawat3.png',
    'assets/images/bekas-jerawat4.png',
  ];
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XfFFFFFFf),
      appBar: AppBarCustome(
        colorIcons: whiteColor,
        colorTitle: whiteColor,
        title: 'Bekas Jerawat',
        bgColor: greenColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    CarouselSlider.builder(
                      itemCount: images.length,
                      itemBuilder: (context, index, realIndex) {
                        final imge = images[index];
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(imge),
                            ),
                          ),
                        );
                      },
                      options: CarouselOptions(
                        height: 320,
                        viewportFraction: 1,
                        autoPlay: true,
                        autoPlayAnimationDuration: const Duration(seconds: 2),
                        onPageChanged: (index, reason) =>
                            setState(() => activeIndex = index),
                      ),
                    ),
                    Positioned(
                      left: 170,
                      bottom: 25,
                      child: AnimatedSmoothIndicator(
                        activeIndex: activeIndex,
                        count: images.length,
                        effect: ScaleEffect(
                            activeDotColor: greenColor,
                            dotColor: whiteColor,
                            dotWidth: 6,
                            dotHeight: 6),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Column(
                children: [
                  Container(
                    height: 280,
                    transform: Matrix4.translationValues(0, -45, 0),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            height: 140,
                            width: 280,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: const DecorationImage(
                                image: AssetImage('assets/images/linear.png'),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, top: 25, bottom: 20, right: 70),
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Hai kak :)',
                                      style: TextStyle(
                                        fontFamily: 'ProximaNova',
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                    RichText(
                                      textAlign: TextAlign.left,
                                      text: TextSpan(
                                        text:
                                            'Apakah gejalamu seperti gambar diatas?',
                                        style: TextStyle(
                                          fontFamily: 'ProximaNova',
                                          color: Colors.white,
                                          fontWeight: bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Stack(
                            children: [
                              Container(
                                transform: Matrix4.translationValues(15, -5, 0),
                                width: 160,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/doctor_1.png'),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                child: Container(
                                  width: 150,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.white.withOpacity(0),
                                        Colors.white.withOpacity(1),
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    transform: Matrix4.translationValues(0, -65, 0),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ciri-Cirinya:',
                          style: TextStyle(
                            fontWeight: bold,
                            fontSize: 20,
                            fontFamily: 'ProximaNova',
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 22,
                              width: 26,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      AssetImage('assets/icons/centang22.png'),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 25,
                            ),
                            const Text(
                              'Timbul setelah jerawat mereda.',
                              style: TextStyle(
                                fontFamily: 'ProximaNova',
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 22,
                              width: 26,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      AssetImage('assets/icons/centang22.png'),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 25,
                            ),
                            Container(
                              // color: Colors.amberAccent,
                              constraints: const BoxConstraints(maxWidth: 240),
                              child: RichText(
                                text: const TextSpan(
                                  text:
                                      'Bekas bisa berwarna merah ataupun hitam.',
                                  style: TextStyle(
                                      fontFamily: 'ProximaNova',
                                      fontSize: 16,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 22,
                              width: 26,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      AssetImage('assets/icons/centang22.png'),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 25,
                            ),
                            Container(
                              // color: Colors.amberAccent,
                              constraints: const BoxConstraints(maxWidth: 240),
                              child: RichText(
                                text: const TextSpan(
                                  text:
                                      'Ada perubahan tekstur dan lekukan di kulit yang bersifat permanen.',
                                  style: TextStyle(
                                      fontFamily: 'ProximaNova',
                                      fontSize: 16,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  ButtonGreenWidget(
                    title: 'Konsul Sekarang',
                    onPressed: () {
                      Get.to(PertanyaanAwalPage(
                          interestConditionId: widget.interestConditionId));
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: RichText(
                      text: TextSpan(
                        text:
                            'Kalau kondisimu benar seperti yang disebutkan, yuk! Langsung konsul dengan Dokter sekarang.',
                        style: TextStyle(
                          fontFamily: 'ProximaNova',
                          fontWeight: bold,
                          fontStyle: FontStyle.italic,
                          fontSize: 16,
                          height: 1.2,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
