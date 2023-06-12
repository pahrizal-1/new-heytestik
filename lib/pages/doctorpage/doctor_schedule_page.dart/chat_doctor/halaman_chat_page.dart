import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/widget/chat_doctor_widget.dart';

import '../../../../theme/theme.dart';

class HalamanChatPage extends StatefulWidget {
  const HalamanChatPage({super.key});

  @override
  State<HalamanChatPage> createState() => _HalamanChatPageState();
}

class _HalamanChatPageState extends State<HalamanChatPage> {
  int _wigetIndex = 0;
  bool isSelcted = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 275,
                color: whiteColor,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      height: 156,
                      color: greenColor,
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/icons/logoheystetik.png',
                            width: 122,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      left: 20,
                      right: 20,
                      top: 112,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 140,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: whiteColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 18),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Jadwal Saya',
                                    style: blackHigtTextStyle.copyWith(
                                        fontSize: 15),
                                  ),
                                  const Spacer(),
                                  Text(
                                    'Atur Jadwal',
                                    style: grenTextStyle.copyWith(fontSize: 15),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_right,
                                    color: greenColor,
                                    size: 30,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 10,
                                    height: 10,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.green),
                                  ),
                                  const SizedBox(
                                    width: 11,
                                  ),
                                  Text(
                                    'Online',
                                    style: subTitleTextStyle.copyWith(
                                        fontSize: 15),
                                  ),
                                  const Spacer(),
                                  Text(
                                    '10:00',
                                    style: subTitleTextStyle.copyWith(
                                        fontSize: 15),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '-',
                                    style: subTitleTextStyle.copyWith(
                                        fontSize: 15),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '10:20',
                                    style: subTitleTextStyle.copyWith(
                                        fontSize: 15),
                                  ),
                                ],
                              ),
                              const Divider(
                                thickness: 1,
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 11,
                                  ),
                                  Text(
                                    'Selanjutnya hari ini',
                                    style: subTitleTextStyle.copyWith(
                                        fontSize: 15),
                                  ),
                                  const Spacer(),
                                  Text(
                                    '10:00',
                                    style: subTitleTextStyle.copyWith(
                                        fontSize: 15),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '-',
                                    style: subTitleTextStyle.copyWith(
                                        fontSize: 15),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '20:20',
                                    style: subTitleTextStyle.copyWith(
                                        fontSize: 15),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  decoration: BoxDecoration(color: whiteColor),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Jawab Chat Pasien ',
                        style: blackTextStyle.copyWith(
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(
                        height: 27,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  _wigetIndex = 0;
                                });
                              },
                              child: Container(
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Aktif (5)',
                                          style: grenTextStyle.copyWith(
                                              fontSize: 15,
                                              color: _wigetIndex == 0
                                                  ? greenColor
                                                  : greyColor),
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      thickness: 2,
                                      color: _wigetIndex == 0
                                          ? greenColor
                                          : const Color(0xffD9D9D9),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  _wigetIndex = 1;
                                });
                              },
                              child: Container(
                                child: Column(
                                  children: [
                                    Text(
                                      'Selesai',
                                      style: greyTextStyle.copyWith(
                                          fontSize: 15,
                                          color: _wigetIndex == 1
                                              ? greenColor
                                              : greyColor),
                                    ),
                                    Divider(
                                      thickness: 2,
                                      color: _wigetIndex == 1
                                          ? greenColor
                                          : const Color(0xffD9D9D9),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          IndexedStack(
            index: _wigetIndex,
            children: const [
              ChatAktif1(),
              ChatSekesau(),
            ],
          )
        ],
      ),
    );
  }
}

class ChatAktif1 extends StatelessWidget {
  const ChatAktif1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      top: 380,
      left: 0,
      right: 0,
      bottom: 0,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 33),
          child: Column(
            children: [
              ChatAktif(
                nametile: 'dila btw',
                subNameTitle: '22 tahun; Korektif Wajah - Bekas Jerawat',
                topic: 'Licorice',
                menit: '11:30 PM',
                pesanChat: '2',
                chat:
                    'Halo dok selamat siang..aku mau bertanya ni aku cocok nya skincarenya gimana, akhir² ini aku hanya memakai kelly saja, tidak memakai apa apa sehabis mandi kecuali kelly.. tapi 2 hari sebelum ini aku makai sunscreen YOU Spf 50+ PA ++++, eh tp sunscreen nya malah bikin kulit aku abu abu, kesel sih tapi tetep kupake karna kukira ngaruh, tapi kayanya ngga:(disini aku pengen jerawat, beruntusan, komedo, bekas jerawat hilang semua dan paling terutama kulit aku putih. kulit aku tipenya berminyak sekitaran hidung dan komedonya banyak banget apalagi di bawah bibir banyak.. mohon bantuannya dok',
                category: 'Skin Care',
              ),
              ChatAktif(
                  nametile: 'Farida Dinda',
                  category: 'Skin Care',
                  subNameTitle: '22 tahun; Korektif Wajah - Jerawat',
                  topic: 'Licorice',
                  menit: '10:20 AM',
                  chat: 'Kalau masih bingung, bisa tanyakan langsung'),
              ChatRead(
                  nametile: 'Farida Dinda',
                  category: 'Skin Care',
                  subNameTitle: '22 tahun; Korektif Wajah - Kulit Kusam',
                  topic: 'Licorice',
                  menit: 'Kemarin',
                  chat:
                      'Apakah aman ya dok jika licorice + niacinamide 10% dipakai untuk kulit sensitif berjerawat? Mohon saran juga untuk kandungan skincare yg bisa mencerahkan untuk kulit sensitif berjerawat.'),
            ],
          ),
        ),
      ),
    );
  }
}

class ChatSekesau extends StatelessWidget {
  const ChatSekesau({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      top: 380,
      left: 0,
      right: 0,
      bottom: 0,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 33),
          child: Column(
            children: [
              ChatAktif(
                category: 'Skin Care',
                nametile: 'Pahrizal',
                subNameTitle: 'Untuk Diri Sendiri, 22 tahun ',
                topic: 'Jerawat',
                menit: 'Kermarin',
                chat:
                    'Halo dok selamat siang..aku mau bertanya ni aku cocok nya skincarenya gimana, akhir² ini aku hanya memakai kelly saja, tidak memakai apa apa sehabis mandi kecuali kelly.. tapi 2 hari sebelum ini aku makai sunscreen YOU Spf 50+ PA ++++, eh tp sunscreen nya malah bikin kulit aku abu abu, kesel sih tapi tetep kupake karna kukira ngaruh, tapi kayanya ngga:(disini aku pengen jerawat, beruntusan, komedo, bekas jerawat hilang semua dan paling terutama kulit aku putih. kulit aku tipenya berminyak sekitaran hidung dan komedonya banyak banget apalagi di bawah bibir banyak.. mohon bantuannya dok',
              ),
              ChatAktif(
                  category: 'Skin Care',
                  nametile: 'Muhyi Abdul Basiit',
                  subNameTitle: 'Untuk Diri Sendiri, 20 tahun ',
                  topic: 'Jerawat',
                  menit: 'Kermarin',
                  chat:
                      'Apakah aman ya dok jika licorice + niacinamide 10% dipakai untuk kulit sensitif berjerawat? Mohon saran juga untuk kandungan skincare yg bisa mencerahkan untuk kulit sensitif berjerawat.'),
              ChatRead(
                category: 'Skin Care',
                nametile: 'Udin Bimlliah',
                subNameTitle: 'Untuk Diri Sendiri, 20 tahun ',
                topic: 'Jerawat',
                menit: '12/03/23',
                chat: 'Kalau masih bingung, bisa tanyakan langsung',
              ),
              ChatRead(
                category: 'Skin Care',
                nametile: 'Udin Bimlliah',
                subNameTitle: 'Untuk Diri Sendiri, 20 tahun ',
                topic: 'Jerawat',
                menit: '12/03/23',
                chat: 'Kalau masih bingung, bisa tanyakan langsung',
              ),
              ChatRead(
                category: 'Skin Care',
                nametile: 'Udin Bimlliah',
                subNameTitle: 'Untuk Diri Sendiri, 20 tahun ',
                topic: 'Jerawat',
                menit: '12/03/23',
                chat: 'Kalau masih bingung, bisa tanyakan langsung',
              ),
              ChatRead(
                category: 'Skin Care',
                nametile: 'Udin Bimlliah',
                subNameTitle: 'Untuk Diri Sendiri, 20 tahun ',
                topic: 'Jerawat',
                menit: '12/03/23',
                chat: 'Kalau masih bingung, bisa tanyakan langsung',
              ),
              ChatRead(
                category: 'Skin Care',
                nametile: 'Udin Bimlliah',
                subNameTitle: 'Untuk Diri Sendiri, 20 tahun ',
                topic: 'Jerawat',
                menit: '12/03/23',
                chat: 'Kalau masih bingung, bisa tanyakan langsung',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
