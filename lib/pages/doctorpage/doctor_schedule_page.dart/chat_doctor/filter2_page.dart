import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';
import 'package:heystetik_mobileapps/widget/card_widget.dart';

class Filter2Page extends StatefulWidget {
  const Filter2Page({super.key});

  @override
  State<Filter2Page> createState() => _Filter2PageState();
}

class _Filter2PageState extends State<Filter2Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    size: 22,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Filter",
                  style: TextStyle(
                    fontFamily: 'ProximaNova',
                    fontWeight: bold,
                    fontSize: 20,
                    color: blackColor,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                transform: Matrix4.translationValues(0, -5, 0),
                child: Divider(
                  thickness: 1,
                ),
              ),
              Text(
                "Brand",
                style: TextStyle(
                  fontFamily: "Proximanova",
                  fontSize: 20,
                  letterSpacing: 1,
                  fontWeight: bold,
                  color: blackColor,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CardImage(imageBrand: "assets/images/p1.png"),
                    SizedBox(
                      width: 5,
                    ),
                    CardImage(imageBrand: "assets/images/p2.png"),
                    SizedBox(
                      width: 5,
                    ),
                    CardImage(imageBrand: "assets/images/p3.png"),
                    SizedBox(
                      width: 5,
                    ),
                    CardImage(imageBrand: "assets/images/p4.png"),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Jenis Produk",
                style: TextStyle(
                  fontFamily: "Proximanova",
                  fontSize: 20,
                  letterSpacing: 0.5,
                  fontWeight: bold,
                  color: blackColor,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  CardFilter(title: "Cleanser"),
                  SizedBox(
                    width: 5,
                  ),
                  CardFilter(title: "Toner"),
                  SizedBox(
                    width: 5,
                  ),
                  CardFilter(title: "Mosturizer")
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  CardFilter(title: "Serum"),
                  SizedBox(
                    width: 5,
                  ),
                  CardFilter(title: "Night Cream"),
                ],
              ),
              SizedBox(
                height: 115,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 150,
                    height: 35,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: TextButton.styleFrom(
                        side: BorderSide(color: greenColor, width: 2),
                        backgroundColor: whiteColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        "Batal",
                        style: TextStyle(
                          fontSize: 13,
                          color: greenColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    height: 35,
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        backgroundColor: greenColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        "Tampilkan",
                        style: TextStyle(
                          fontSize: 13,
                          color: whiteColor,
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
