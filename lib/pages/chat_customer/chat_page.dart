import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/pertanyaan_awal1_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: greenColor,
        elevation: 0,
        title: Text(
          "Bekas Jerawat",
          style: TextStyle(
            letterSpacing: 0.2,
            fontWeight: bold,
            fontFamily: "ProximaNova",
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 320,
                initialPage: 0,
                viewportFraction: 1,
                autoPlay: true,
                autoPlayAnimationDuration: Duration(seconds: 2),
              ),
              items: [
                'assets/images/01.png',
                'assets/images/02.png',
                'assets/images/03.png',
                'assets/images/04.png',
              ].map((imagePath) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(imagePath),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
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
                              image: DecorationImage(
                                image: AssetImage("assets/images/linear.png"),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, top: 25, bottom: 20, right: 70),
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Hai kak :)",
                                      style: TextStyle(
                                        fontFamily: "ProximaNova",
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                    RichText(
                                      textAlign: TextAlign.left,
                                      text: TextSpan(
                                        text:
                                            "Apakah gejalamu seperti gambar diatas?",
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
                                decoration: BoxDecoration(
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
                            fontFamily: "ProximaNova",
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 22,
                              width: 26,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      AssetImage('assets/icons/centang2.png'),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            Text(
                              "Timbul setelah jerawat mereda.",
                              style: TextStyle(
                                fontFamily: "ProximaNova",
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 22,
                              width: 26,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      AssetImage('assets/icons/centang2.png'),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            Container(
                              // color: Colors.amberAccent,
                              constraints: BoxConstraints(maxWidth: 240),
                              child: RichText(
                                text: const TextSpan(
                                  text:
                                      "Bekas bisa berwarna merah ataupun hitam.",
                                  style: TextStyle(
                                      fontFamily: "ProximaNova",
                                      fontSize: 16,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 22,
                              width: 26,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      AssetImage('assets/icons/centang2.png'),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            Container(
                              // color: Colors.amberAccent,
                              constraints: BoxConstraints(maxWidth: 240),
                              child: RichText(
                                text: const TextSpan(
                                  text:
                                      "Ada perubahan tekstur dan lekukan di kulit yang bersifat permanen.",
                                  style: TextStyle(
                                      fontFamily: "ProximaNova",
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
                    title: "Konsul Sekarang",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PertanyaanAwalPage()),
                      );
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: RichText(
                      text: TextSpan(
                        text:
                            "Kalau kondisimu benar seperti yang disebutkan, yuk! Langsung konsul dengan Dokter sekarang.",
                        style: TextStyle(
                            fontFamily: "ProximaNova",
                            fontWeight: bold,
                            fontStyle: FontStyle.italic,
                            fontSize: 16,
                            height: 1.2,
                            color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(
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
