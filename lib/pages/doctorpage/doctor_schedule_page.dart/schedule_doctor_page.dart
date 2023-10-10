import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

class ScheduleDoctorPage extends StatefulWidget {
  const ScheduleDoctorPage({super.key});

  @override
  State<ScheduleDoctorPage> createState() => _ScheduleDoctorPageState();
}

class _ScheduleDoctorPageState extends State<ScheduleDoctorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(
                          context,
                        );
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
                      "Atur Jadwal Konsultasi Doktor",
                      style: TextStyle(
                          letterSpacing: 1.5,
                          fontFamily: 'ProximaNova',
                          fontWeight: bold,
                          color: blackColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: ListView(
          children: [
            Center(
              child: Text(
                'Atur jadwal biar pasien bisa konsultasi dengan dokter',
                style: TextStyle(
                    letterSpacing: 1.5,
                    fontFamily: 'ProximaNova',
                    fontWeight: regular,
                    fontSize: 12,
                    color: blackColor),
              ),
            ),
            SizedBox(
              height: 26,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 71,
                width: 250,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 2,
                    color: Color(
                      0xffECECEC,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Text(
                      'S',
                      style: TextStyle(
                          letterSpacing: 1.5,
                          fontFamily: 'ProximaNova',
                          fontWeight: bold,
                          fontSize: 25,
                          color: greenColor),
                    ),
                    SizedBox(
                      width: 17,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Senin',
                          style: TextStyle(
                              letterSpacing: 1.5,
                              fontFamily: 'ProximaNova',
                              fontWeight: bold,
                              fontSize: 17,
                              color: blackColor),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '09-00 - 12:00 WIB',
                          style: TextStyle(
                              letterSpacing: 1.5,
                              fontFamily: 'ProximaNova',
                              fontWeight: regular,
                              fontSize: 14,
                              color: blackColor),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '19-00 - 21:00 WIB',
                          style: TextStyle(
                              letterSpacing: 1.5,
                              fontFamily: 'ProximaNova',
                              fontWeight: regular,
                              fontSize: 14,
                              color: blackColor),
                        ),
                      ],
                    ),
                    Spacer(),
                    Text(
                      'Ubah',
                      style: TextStyle(
                          letterSpacing: 1.5,
                          fontFamily: 'ProximaNova',
                          fontWeight: bold,
                          fontSize: 20,
                          color: greenColor),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
