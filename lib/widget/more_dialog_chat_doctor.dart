// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../theme/theme.dart';

class MoreDialogChatDoctor extends StatefulWidget {
  const MoreDialogChatDoctor({super.key});

  @override
  State<MoreDialogChatDoctor> createState() => _MoreDialogChatDoctorState();
}

class _MoreDialogChatDoctorState extends State<MoreDialogChatDoctor> {
  // @override
  // void initState() {
  //   super.initState();
  //   Timer(
  //     const Duration(seconds: 2),
  //     () => Navigator.of(context).pushReplacement(
  //       MaterialPageRoute(
  //         builder: (BuildContext context) => const SelesaiPembayaranPage(),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      padding: EdgeInsets.symmetric(horizontal: 22, vertical: 39),
      decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      child: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                width: 17,
              ),
              Text(
                'JAWAB CHAT PASIEN',
                style: blackTextStyle.copyWith(fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0XFFD9D9D9),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 17,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/icons/logo.png',
                          width: 39,
                        ),
                        SizedBox(
                          width: 11,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'dila btw',
                              style: blackTextStyle.copyWith(fontSize: 15),
                            ),
                            Text(
                              'Untuk Diri Sendiri, 22 tahun ',
                              style: subTitleTextStyle,
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 17,
                    ),
                    Text(
                      'Mengapa jerawat aku banyak bekasnya?',
                      style: blackHigtTextStyle.copyWith(fontSize: 15),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      'Category: Acne',
                      style: subTitleTextStyle,
                    ),
                    Text(
                      'Topic : Mengilangkan Rasa Rindu',
                      style: subTitleTextStyle,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Halo dok selamat siang..aku mau bertanya ni aku cocok nya skincarenya gimana, akhir² ini aku hanya memakai kelly saja, tidak memakai apa apa sehabis mandi kecuali kelly.. tapi 2 hari sebelum ini aku makai sunscreen YOU Spf 50+ PA ++++, eh tp sunscreen nya malah bikin kulit aku abu abu, kesel sih tapi tetep kupake karna kukira ngaruh, tapi kayanya ngga:(disini aku pengen jerawat, beruntusan, komedo, bekas jerawat hilang semua dan paling terutama kulit aku putih. kulit aku tipenya berminyak sekitaran hidung dan komedonya banyak banget apalagi di bawah bibir banyak.. mohon bantuannya dok Halo dok selamat siang..aku mau bertanya ni aku cocok nya skincarenya gimana, akhir² ini aku hanya memakai kelly saja, tidak memakai apa apa sehabis mandi kecuali kelly.. tapi 2 hari sebelum ',
                            style: greyTextStyle.copyWith(
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                'Apakah Anda yakin ingin menjawab pertanyaan ini?',
                style: blackTextStyle.copyWith(fontSize: 12),
              ),
              SizedBox(
                height: 17,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(
                          context,
                        );
                      },
                      child: Container(
                        height: 34,
                        // width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: whiteColor,
                          border: Border.all(color: greenColor),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Center(
                          child: Text('Tidak',
                              style:
                                  TextStyle(color: greenColor, fontSize: 15)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const ChatDoctorPage(),
                        //   ),
                        // );
                      },
                      child: Container(
                        height: 34,
                        // width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: greenColor,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Center(
                          child: Text(
                            'Ya',
                            style: TextStyle(color: whiteColor, fontSize: 15),
                          ),
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
    );
  }
}
