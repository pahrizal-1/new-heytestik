import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

class SolutionSkincare1Page extends StatefulWidget {
  const SolutionSkincare1Page({super.key});

  @override
  State<SolutionSkincare1Page> createState() => _SolutionSkincare1PageState();
}

class _SolutionSkincare1PageState extends State<SolutionSkincare1Page> {
  int _current = 0;
  final List<String> images = [
    'assets/images/001.png',
    'assets/images/002.png',
    'assets/images/003.png',
  ];
  List<String> imageList = [
    'assets/images/cleanser01.png',
    'assets/images/serum02.png',
    'assets/images/mosturizer03.png',
    'assets/images/toner04.png',
    'assets/images/eyecream05.png',
    'assets/images/sunscreen06.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: whiteColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.arrow_back,
                  color: blackColor,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Skincare",
                  style: TextStyle(
                      fontFamily: "ProximaNova",
                      fontWeight: bold,
                      fontSize: 20,
                      color: blackColor),
                ),
              ],
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 22,
                    width: 22,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/icons/bell.png"),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 22,
                    width: 22,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/icons/trolii.png"),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 22,
                    width: 22,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/icons/menu3.png"),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: fromCssColor("#CCCCCC"),
                        ),
                        borderRadius: BorderRadius.circular(35),
                      ),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Container(
                                height: 12,
                                width: 12,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/icons/search1.png"))),
                              ),
                            ),
                            Container(
                              transform: Matrix4.translationValues(0, -4, 0),
                              constraints: const BoxConstraints(maxWidth: 280),
                              child: TextFormField(
                                style: const TextStyle(
                                    fontSize: 15, fontFamily: "ProximaNova"),
                                decoration: InputDecoration(
                                  hintText: "Cari Skincare",
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                    fontFamily: "ProximaNova",
                                    color: fromCssColor(
                                      '#9B9B9B',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ]),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Dermatologist’s choice for you👌🏻",
                          style: TextStyle(
                            fontWeight: bold,
                            fontFamily: 'ProximaNova',
                            fontSize: 18,
                            letterSpacing: 0.5,
                            color: fromCssColor(
                              '#323232',
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          constraints: const BoxConstraints(maxWidth: 320),
                          child: RichText(
                            text: TextSpan(
                              text:
                                  "Pilihan skincare berdasarkan konsultasimu.",
                              style: TextStyle(
                                fontFamily: 'ProximaNova',
                                color: fromCssColor('#A3A3A3'),
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      child: Row(
                        children: [
                          Container(
                            height: 265,
                            width: 155,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    offset: const Offset(0, 0),
                                  ),
                                ],
                                color: Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 130,
                                    width: 155,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/produk6.png"),
                                          fit: BoxFit.fill),
                                    ),
                                  ),
                                  Container(
                                    constraints:
                                        const BoxConstraints(maxWidth: 155),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Text(
                                            "ISISPHARMA",
                                            style: TextStyle(
                                              fontFamily: "ProximaNova",
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Text(
                                            "Teenderm Gel",
                                            style: TextStyle(
                                              fontFamily: "ProximaNova",
                                              height: 1.3,
                                              fontSize: 13,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: 14,
                                        width: 30,
                                        decoration: BoxDecoration(
                                          color: fromCssColor("#C92A2A33"),
                                        ),
                                        child: Center(
                                          child: Text(
                                            textAlign: TextAlign.center,
                                            "20%",
                                            style: TextStyle(
                                              fontWeight: bold,
                                              fontSize: 11,
                                              fontFamily: "ProximaNova",
                                              color: fromCssColor("#FF0000"),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          text: "Rp250.000",
                                          style: TextStyle(
                                            color: fromCssColor("#9B9B9B"),
                                            fontFamily: "ProximaNova",
                                            fontSize: 11,
                                            decoration:
                                                TextDecoration.lineThrough,
                                            decorationColor:
                                                fromCssColor("#9B9B9B"),
                                            decorationThickness: 1,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Text(
                                    "Rp200.000",
                                    style: TextStyle(
                                      fontFamily: "ProximaNova",
                                      fontSize: 15,
                                      fontWeight: bold,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 1),
                                    child: Text(
                                      "Jakarta Selatan",
                                      style: TextStyle(
                                        fontFamily: "ProximaNova",
                                        fontSize: 11,
                                        color: fromCssColor("#9B9B9B"),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: 9,
                                        width: 9,
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                "assets/icons/fav.png"),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        "4.9 (120k)",
                                        style: TextStyle(
                                          fontFamily: "ProximaNova",
                                          fontSize: 11,
                                          color: fromCssColor("#9B9B9B"),
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    child: InkWell(
                                      onTap: () {},
                                      child: Container(
                                        height: 25,
                                        decoration: BoxDecoration(
                                          color: greenColor,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "+ Keranjang",
                                            style: TextStyle(
                                              fontFamily: "ProximaNova",
                                              fontSize: 12,
                                              color: whiteColor,
                                              fontWeight: bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Container(
                            height: 265,
                            width: 155,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    offset: const Offset(0, 0),
                                  ),
                                ],
                                color: Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 130,
                                    width: 155,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/produk6.png"),
                                          fit: BoxFit.fill),
                                    ),
                                  ),
                                  Container(
                                    constraints:
                                        const BoxConstraints(maxWidth: 155),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Text(
                                            "ISISPHARMA",
                                            style: TextStyle(
                                              fontFamily: "ProximaNova",
                                              fontSize: 13,
                                              fontWeight: bold,
                                            ),
                                          ),
                                        ),
                                        const FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Text(
                                            "Teenderm Gel",
                                            style: TextStyle(
                                              fontFamily: "ProximaNova",
                                              height: 1.3,
                                              fontSize: 13,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: 14,
                                        width: 30,
                                        decoration: BoxDecoration(
                                          color: fromCssColor("#C92A2A33"),
                                        ),
                                        child: Center(
                                          child: Text(
                                            textAlign: TextAlign.center,
                                            "20%",
                                            style: TextStyle(
                                              fontWeight: bold,
                                              fontSize: 11,
                                              fontFamily: "ProximaNova",
                                              color: fromCssColor("#FF0000"),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          text: "Rp250.000",
                                          style: TextStyle(
                                            color: fromCssColor("#9B9B9B"),
                                            fontFamily: "ProximaNova",
                                            fontSize: 11,
                                            decoration:
                                                TextDecoration.lineThrough,
                                            decorationColor:
                                                fromCssColor("#9B9B9B"),
                                            decorationThickness: 1,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Text(
                                    "Rp200.000",
                                    style: TextStyle(
                                      fontFamily: "ProximaNova",
                                      fontSize: 15,
                                      fontWeight: bold,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 1),
                                    child: Text(
                                      "Jakarta Selatan",
                                      style: TextStyle(
                                        fontFamily: "ProximaNova",
                                        fontSize: 11,
                                        color: fromCssColor("#9B9B9B"),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: 9,
                                        width: 9,
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                "assets/icons/fav.png"),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        "4.9 (120k)",
                                        style: TextStyle(
                                          fontFamily: "ProximaNova",
                                          fontSize: 11,
                                          color: fromCssColor("#9B9B9B"),
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    child: InkWell(
                                      onTap: () {},
                                      child: Container(
                                        height: 25,
                                        decoration: BoxDecoration(
                                          color: greenColor,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "+ Keranjang",
                                            style: TextStyle(
                                              fontFamily: "ProximaNova",
                                              fontSize: 12,
                                              color: whiteColor,
                                              fontWeight: bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              CarouselSlider(
                options: CarouselOptions(
                  height: 195,
                  initialPage: 0,
                  viewportFraction: 1,
                  autoPlay: true,
                  autoPlayAnimationDuration: const Duration(seconds: 3),
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                ),
                items: images.map((imagePath) {
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
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: images.map((imagePath) {
                  int index = images.indexOf(imagePath);
                  return Container(
                    width: 7.0,
                    height: 7.0,
                    margin: EdgeInsets.symmetric(horizontal: 4.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _current == index
                          ? greenColor
                          : fromCssColor("#D9D9D9"),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Shop by Category",
                      style: TextStyle(
                        fontWeight: bold,
                        fontFamily: 'ProximaNova',
                        fontSize: 18,
                        letterSpacing: 0.5,
                        color: fromCssColor(
                          '#323232',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 300,
                            child: GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                childAspectRatio: 0.85,
                              ),
                              itemCount: imageList.length,
                              itemBuilder: (BuildContext context, int index) {
                                List<String> textList = [
                                  "Cleanser",
                                  "Serum",
                                  "Mosturizer",
                                  "Toner",
                                  "Eye Cream",
                                  "Sunscreen"
                                ];
                                return Container(
                                  height: 135,
                                  width: 105,
                                  margin: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 100,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                imageList[index],
                                              ),
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      FittedBox(
                                        child: Text(
                                          textList[index],
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontFamily: "ProximaNova"),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
