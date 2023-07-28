import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/container_widget.dart';

class NotificationDoctorPage extends StatefulWidget {
  const NotificationDoctorPage({super.key});

  @override
  State<NotificationDoctorPage> createState() => _NotificationDoctorPageState();
}

class _NotificationDoctorPageState extends State<NotificationDoctorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: greenColor,
        title: Text(
          "Notifikasi",
          style: TextStyle(
              letterSpacing: 1.5,
              fontFamily: 'ProximaNova',
              fontWeight: bold,
              color: whiteColor),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Flex(
          direction: Axis.vertical,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 19, left: 20, right: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 250,
                        child: RichText(
                          text: const TextSpan(
                            text:
                                "🔔 [Reminder] 10 menit lagi jadwal konsultasi dengan pasienmu akan dimulai.",
                            style: TextStyle(
                                fontFamily: 'ProximaNova',
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                height: 1.3,
                                color: Colors.black),
                          ),
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: '1 Jam lalu',
                          style: TextStyle(
                            fontSize: 11,
                            height: 1.3,
                            fontFamily: 'ProximaNova',
                            color: fromCssColor(
                              '#A3A3A3',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 45,
                    child: Divider(
                      thickness: 1.5,
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 250,
                            child: RichText(
                              text: const TextSpan(
                                text:
                                    "📝 ️dila btw telah membuat jadwal konsultasi denganmu",
                                style: TextStyle(
                                    fontFamily: 'ProximaNova',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    height: 1.3,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              text: '3 Jam lalu',
                              style: TextStyle(
                                fontSize: 11,
                                height: 1.3,
                                fontFamily: 'ProximaNova',
                                color: fromCssColor(
                                  '#A3A3A3',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ContainerDoctor,
                      const SizedBox(
                        height: 45,
                        child: Divider(
                          thickness: 1.5,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 250,
                                child: RichText(
                                  text: const TextSpan(
                                    text:
                                        "Yeay, Jane Cooper telah memberikan rating & ulasan untuk Anda 🎉🎉",
                                    style: TextStyle(
                                        fontFamily: 'ProximaNova',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        height: 1.3,
                                        color: Colors.black),
                                  ),
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  text: '5 Jam lalu',
                                  style: TextStyle(
                                    fontSize: 11,
                                    height: 1.3,
                                    fontFamily: 'ProximaNova',
                                    color: fromCssColor(
                                      '#A3A3A3',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          RichText(
                            text: TextSpan(
                              text: 'Lihat rating & ulasannya, yuk!',
                              style: TextStyle(
                                fontSize: 13,
                                height: 1.3,
                                fontFamily: 'ProximaNova',
                                color: fromCssColor(
                                  '#A3A3A3',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
