import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class ViewChatPage extends StatelessWidget {
  ViewChatPage({super.key});
  List images = [
    'assets/images/Rectangle 206.png',
    'assets/images/Rectangle 207.png',
    'assets/images/Rectangle 208.png',
    'assets/images/Rectangle 2081.png'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        backgroundColor: greenColor,
        title: const Text('Berkas Jerawat'),
      ),
      body: Column(
        children: [
          CarouselSlider(
            items: [
              Stack(
                children: [
                  Image.asset(
                    'assets/images/Rectangle 206.png',
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    left: 32,
                    top: 190,
                    child: Text(
                      'Noda berwarna\nkemerahan (PIE)',
                      style: whiteTextStyle.copyWith(fontSize: 20),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  Image.asset(
                    'assets/images/Rectangle 207.png',
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    left: 200,
                    top: 100,
                    child: Text(
                      'Noda berwarna\nkemerahan (PIE)',
                      style: blackTextStyle.copyWith(fontSize: 20),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  Image.asset(
                    'assets/images/Rectangle 208.png',
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    left: 32,
                    top: 190,
                    child: Text(
                      'Kulit wajah bertekstur\n& lekukan yang bersifat\npermanen (bopeng)',
                      style: whiteTextStyle.copyWith(fontSize: 20),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  Image.asset(
                    'assets/images/Rectangle 2081.png',
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    left: 120,
                    top: 20,
                    child: Text(
                      'Terjadi keloid (bekas\njerawat yang menonjol)',
                      style: whiteTextStyle.copyWith(fontSize: 20),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),
            ],
            options: CarouselOptions(
              height: 300,
              viewportFraction: 1,
            ),
          ),
          SizedBox(
            height: 14,
          ),
          Stack(
            children: [
              Image.asset('assets/images/Butongreen.png'),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hai Kak :)',
                      style: whiteTextStyle.copyWith(fontSize: 15),
                    ),
                    Text(
                      'Apa Gejalamu Apakah\nSeperti Gambar\ndiatas ?',
                      style: whiteTextStyle.copyWith(fontSize: 20),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
