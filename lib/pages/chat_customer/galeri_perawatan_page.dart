import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';
import 'package:heystetik_mobileapps/widget/container_widget.dart';

class JourneyPage extends StatefulWidget {
  const JourneyPage({super.key});

  @override
  State<JourneyPage> createState() => _JourneyPageState();
}

class _JourneyPageState extends State<JourneyPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.symmetric(
                vertical: 20, horizontal: 24.0), // Atur padding horizontal
            content: Container(
              // Atur lebar container sesuai dengan lebar maksimum
              child: RichText(
                text: TextSpan(
                  text: 'Yuk, buat ',
                  style: TextStyle(
                    fontFamily: 'ProximaNova',
                    fontStyle: FontStyle.italic,
                    fontSize: 15,
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: ' ‘My Journey’',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                        color: fromCssColor("#24A7A0"),
                      ),
                    ),
                    TextSpan(
                      text:
                          ' untuk melihat progres baikmu menuju skingoals yang kamu inginkan :)',
                      style:
                          TextStyle(fontStyle: FontStyle.normal, height: 1.2),
                    ),
                  ],
                ),
              ),
            ),
            actions: <Widget>[
              ButtonGreenWidget(
                title: "Buat My Journey",
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'My Journey Photos',
          style: TextStyle(
            fontWeight: bold,
            fontFamily: 'ProximaNova',
            fontSize: 20,
          ),
        ),
      ),
      // body: SingleChildScrollView(
      //   child: Padding(
      //     padding: const EdgeInsets.only(left: 25, right: 25),
      //     child: Column(
      //       children: [
      //         Row(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             Column(
      //               children: [
      //                 Padding(
      //                   padding: const EdgeInsets.only(top: 25, bottom: 20),
      //                   child: Text(
      //                     "Kondisi Awal",
      //                     style: TextStyle(
      //                       fontWeight: bold,
      //                       fontSize: 16,
      //                       letterSpacing: 0.5,
      //                       color: blackColor,
      //                       fontFamily: "ProximaNova",
      //                     ),
      //                   ),
      //                 ),
      //                 Container(
      //                   height: 150,
      //                   width: 150,
      //                   decoration: const BoxDecoration(
      //                     image: DecorationImage(
      //                         image: AssetImage("assets/images/before1.png"),
      //                         fit: BoxFit.fill),
      //                   ),
      //                 ),
      //                 const SizedBox(
      //                   height: 10,
      //                 ),
      //                 Container(
      //                   height: 150,
      //                   width: 150,
      //                   decoration: const BoxDecoration(
      //                     image: DecorationImage(
      //                         image: AssetImage("assets/images/before2.png"),
      //                         fit: BoxFit.fill),
      //                   ),
      //                 ),
      //                 const SizedBox(
      //                   height: 10,
      //                 ),
      //                 Container(
      //                   height: 150,
      //                   width: 150,
      //                   decoration: const BoxDecoration(
      //                     image: DecorationImage(
      //                         image: AssetImage("assets/images/before3.png"),
      //                         fit: BoxFit.fill),
      //                   ),
      //                 ),
      //                 const SizedBox(
      //                   height: 10,
      //                 ),
      //                 Container(
      //                   height: 150,
      //                   width: 150,
      //                   decoration: const BoxDecoration(
      //                     image: DecorationImage(
      //                         image: AssetImage("assets/images/before4.png"),
      //                         fit: BoxFit.fill),
      //                   ),
      //                 ),
      //               ],
      //             ),
      //             Column(
      //               children: [
      //                 Padding(
      //                   padding: const EdgeInsets.only(top: 25, bottom: 20),
      //                   child: Text(
      //                     "Kondisi Awal",
      //                     style: TextStyle(
      //                       fontWeight: bold,
      //                       fontSize: 16,
      //                       letterSpacing: 0.5,
      //                       color: blackColor,
      //                       fontFamily: "ProximaNova",
      //                     ),
      //                   ),
      //                 ),
      //                 Container(
      //                   height: 150,
      //                   width: 150,
      //                   decoration: const BoxDecoration(
      //                     image: DecorationImage(
      //                         image: AssetImage("assets/images/after1.png"),
      //                         fit: BoxFit.fill),
      //                   ),
      //                 ),
      //                 const SizedBox(
      //                   height: 10,
      //                 ),
      //                 WidgetPhoto,
      //                 const SizedBox(
      //                   height: 10,
      //                 ),
      //                 WidgetPhoto,
      //                 const SizedBox(
      //                   height: 10,
      //                 ),
      //                 WidgetPhoto,
      //                 const SizedBox(
      //                   height: 20,
      //                 )
      //               ],
      //             )
      //           ],
      //         )
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
