import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/pages/doctorpage/doctor_schedule_page.dart/doctor_home_page.dart';
import 'package:heystetik_mobileapps/pages/interest/interest1_page.dart';

class HeaderPage extends StatefulWidget {
  const HeaderPage({super.key});

  @override
  State<HeaderPage> createState() => _HeaderPageState();
}

class _HeaderPageState extends State<HeaderPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      color: Colors.white,
      child: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: const [
                Text(
                  "Hello, ",
                  style: TextStyle(
                      fontFamily: 'ProximaNova',
                      fontWeight: FontWeight.w400,
                      fontSize: 19),
                ),
                Text(
                  "Jhon Doe",
                  style: TextStyle(
                      fontFamily: 'ProximaNova',
                      fontWeight: FontWeight.w600,
                      fontSize: 19,
                      color: Colors.black),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: InkWell(
                    // onTap: () {
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => const Interest1Page(),
                    //     ),
                    //   );
                    // },
                    child: Container(
                      height: 22,
                      width: 22,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage("assets/icons/icon-home.png"),
                        ),
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DoctorHomePage(),
                      ),
                    );
                  },
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage("assets/images/profiledummy.png")),
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
