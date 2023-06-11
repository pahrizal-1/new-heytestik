import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:heystetik_mobileapps/pages/doctorpage/doctor_schedule_page.dart/notification_doctor_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/container_widget.dart';

class HomePageDoctor extends StatelessWidget {
  const HomePageDoctor({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Flex(
        direction: Axis.vertical,
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: greenColor,
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/doctor1.png'))),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15, left: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hai,',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'ProximaNova',
                                    color: whiteColor,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'dr. Risty Hafinah, Sp.DV',
                                  style: TextStyle(
                                    fontWeight: bold,
                                    fontFamily: 'ProximaNova',
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const NotificationDoctorPage(),
                            ),
                          );
                        },
                        child: Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage(
                                  'assets/icons/notification-dot.png'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              transform: Matrix4.translationValues(0, -45, 0),
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0.1,
                    blurRadius: 2,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Jadwal Hari ini, 24 Feb 2023',
                        style: TextStyle(
                          fontWeight: bold,
                          color: fromCssColor('#6B6B6B'),
                          fontSize: 16,
                          fontFamily: 'ProximaNova,',
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '10:00 - 12:00',
                        style: TextStyle(
                          fontWeight: bold,
                          fontSize: 25,
                          color: fromCssColor('#5DA89C'),
                          fontFamily: 'ProximaNova,',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: 23,
                      width: 25,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/icons/calender-logo.png'))),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Jadwal Konsultasi Dengan Pasien',
                      style: TextStyle(
                        fontWeight: bold,
                        fontFamily: 'ProximaNova',
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
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
                              'Dila Btw',
                              style: TextStyle(
                                  color: fromCssColor('#323232'),
                                  fontWeight: bold,
                                  fontFamily: 'ProximaNova',
                                  fontSize: 15),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
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
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      '10:00 WIB',
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
                              padding: const EdgeInsets.only(bottom: 5),
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
                              color: fromCssColor('#FFC36A'),
                            ),
                            child: Center(
                              child: Text(
                                'Diambil',
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
                ),
                const SizedBox(
                  height: 10,
                ),
                ContainerSchedule,
                const SizedBox(
                  height: 10,
                ),
                ContainerSchedule,
                const SizedBox(
                  height: 10,
                ),
                ContainerSchedule,
                const SizedBox(
                  height: 10,
                ),
                ContainerSchedule
              ],
            ),
          ),
        ],
      ),
    );
  }
}
