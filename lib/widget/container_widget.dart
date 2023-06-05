import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

Container ContainerSchedule = Container(
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),
  ),
  child: Padding(
    padding: const EdgeInsets.all(15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Jane Cooper',
              style: TextStyle(
                  color: fromCssColor('#323232'),
                  fontWeight: bold,
                  fontFamily: 'ProximaNova',
                  fontSize: 15),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: fromCssColor('#1ACE42')),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text(
                      "10:00 WIB",
                      style: TextStyle(
                        color: fromCssColor('#6B6B6B'),
                        fontFamily: 'ProximaNova',
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: Text(
                'Category: Face Concerns',
                style: TextStyle(
                    fontFamily: 'ProximaNova',
                    fontSize: 11,
                    color: fromCssColor('#A3A3A3')),
              ),
            ),
            Text(
              'Topic: Acne Scars (Bopeng bekas jerawat)',
              style: TextStyle(
                  fontFamily: 'ProximaNova',
                  fontSize: 11,
                  color: fromCssColor('#A3A3A3')),
            ),
          ],
        ),
        InkWell(
          child: Container(
            height: 35,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: fromCssColor('#6DC0B3'),
            ),
            child: Center(
              child: Text(
                'Terima',
                style: TextStyle(
                  fontWeight: bold,
                  fontFamily: 'ProximaNova',
                  fontSize: 13,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        )
      ],
    ),
  ),
);

Container ContainerDoctor = Container(
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),
  ),
  child: Padding(
    padding: const EdgeInsets.all(15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: fromCssColor('#1ACE42')),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Jane Cooper',
                  style: TextStyle(
                      color: fromCssColor('#323232'),
                      fontWeight: bold,
                      fontFamily: 'ProximaNova',
                      fontSize: 15),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Jadwal: 24 Feb 2023 | 10:00 WIB",
                style: TextStyle(
                  color: fromCssColor('#6B6B6B'),
                  fontFamily: 'ProximaNova',
                  fontSize: 13,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: Text(
                'Category: Face Concerns',
                style: TextStyle(
                    fontFamily: 'ProximaNova',
                    fontSize: 11,
                    color: fromCssColor('#A3A3A3')),
              ),
            ),
            Text(
              'Topic: Acne Scars (Bopeng bekas jerawat)',
              style: TextStyle(
                  fontFamily: 'ProximaNova',
                  fontSize: 11,
                  color: fromCssColor('#A3A3A3')),
            ),
          ],
        ),
        InkWell(
          child: Container(
            height: 35,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: fromCssColor('#6DC0B3'),
            ),
            child: Center(
              child: Text(
                'Terima',
                style: TextStyle(
                  fontWeight: bold,
                  fontFamily: 'ProximaNova',
                  fontSize: 13,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        )
      ],
    ),
  ),
);
