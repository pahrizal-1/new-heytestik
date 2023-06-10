import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:heystetik_mobileapps/pages/doctorpage/doctor_schedule_page.dart/chat_doctor/balasan_chat_page.dart';
import 'package:heystetik_mobileapps/pages/doctorpage/doctor_schedule_page.dart/chat_doctor/chat_pembuka_page.dart';
import 'package:heystetik_mobileapps/pages/doctorpage/doctor_schedule_page.dart/chat_doctor/rekomendasi_skincare1_page.dart';
import 'package:heystetik_mobileapps/pages/doctorpage/doctor_schedule_page.dart/chat_doctor/rekomendasi_treatmen1_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

class PengaturanPage extends StatelessWidget {
  const PengaturanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: greenColor,
        title: Text(
          'PENGATURAN',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'ProximaNova',
            fontWeight: bold,
            fontSize: 20,
            letterSpacing: 0.5,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 18, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/icons/alert-circle1.png'),
                          fit: BoxFit.fill),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    constraints: const BoxConstraints(maxWidth: 280),
                    child: RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                        text:
                            'Kamu dapat membuat template untuk balasan chat dan resep rekomendasi pasien secara otomatis.',
                        style: TextStyle(
                          fontFamily: 'ProximaNova',
                          color: fromCssColor('#6B6B6B'),
                          fontSize: 13,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Chat',
                style: TextStyle(
                  fontFamily: 'ProximaNova',
                  fontWeight: bold,
                  letterSpacing: 0.5,
                  color: fromCssColor('#323232'),
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ChatPembukaPage(),
                    ),
                  );
                },
                child: Row(
                  children: [
                    Container(
                      height: 20,
                      width: 20,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/icons/chat1.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 22,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Chat Pembuka',
                          style: TextStyle(
                            fontWeight: bold,
                            fontFamily: 'ProximaNova',
                            fontSize: 15,
                            letterSpacing: 0.5,
                            color: fromCssColor(
                              '#323232',
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          'Sambut pasien baru secara otomatis',
                          style: TextStyle(
                            fontFamily: 'ProximaNova',
                            fontSize: 12,
                            letterSpacing: 0.2,
                            color: fromCssColor(
                              '#A3A3A3',
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BalasanCepatPage(),
                    ),
                  );
                },
                child: Row(
                  children: [
                    Container(
                      height: 25,
                      width: 20,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/icons/light1.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 22,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Balasan Cepat',
                          style: TextStyle(
                            fontWeight: bold,
                            fontFamily: 'ProximaNova',
                            fontSize: 15,
                            letterSpacing: 0.5,
                            color: fromCssColor(
                              '#323232',
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          'Gunakan berulang kali pesan yang sering dipakai',
                          style: TextStyle(
                            fontFamily: 'ProximaNova',
                            fontSize: 12,
                            letterSpacing: 0.2,
                            color: fromCssColor(
                              '#A3A3A3',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 55,
                child: Center(
                  child: Divider(thickness: 2),
                ),
              ),
              Text(
                'Resep',
                style: TextStyle(
                  fontFamily: 'ProximaNova',
                  fontWeight: bold,
                  letterSpacing: 0.5,
                  color: fromCssColor('#323232'),
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 21,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            RekomendasiSkincare1Page()),
                  );
                },
                child: Row(
                  children: [
                    Container(
                      height: 23,
                      width: 23,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/icons/skincare1.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 22,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Rekomendasi Skincare',
                          style: TextStyle(
                            fontWeight: bold,
                            fontFamily: 'ProximaNova',
                            fontSize: 15,
                            letterSpacing: 0.5,
                            color: fromCssColor(
                              '#323232',
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Container(
                          constraints: BoxConstraints(maxWidth: 250),
                          child: RichText(
                            text: TextSpan(
                              text:
                                  'Buat template resep yang sering diberikan ke pasien',
                              style: TextStyle(
                                fontFamily: 'ProximaNova',
                                color: fromCssColor('#A3A3A3'),
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            RekomendasiTreatmen1Page()),
                  );
                },
                child: Row(
                  children: [
                    Container(
                      height: 25,
                      width: 23,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/icons/treatmen1.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 22,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Rekomendasi Treatment',
                          style: TextStyle(
                            fontWeight: bold,
                            fontFamily: 'ProximaNova',
                            fontSize: 15,
                            letterSpacing: 0.5,
                            color: fromCssColor(
                              '#323232',
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Container(
                          constraints: BoxConstraints(maxWidth: 250),
                          child: RichText(
                            text: TextSpan(
                              text:
                                  'Buat template resep yang sering diberikan ke pasien',
                              style: TextStyle(
                                fontFamily: 'ProximaNova',
                                color: fromCssColor('#A3A3A3'),
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
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
