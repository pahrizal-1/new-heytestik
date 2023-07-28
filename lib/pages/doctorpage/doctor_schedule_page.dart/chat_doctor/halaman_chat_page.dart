import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/doctor/chat/chat_controller.dart';
import 'package:heystetik_mobileapps/models/doctor/current_schedule_model.dart';
import 'package:heystetik_mobileapps/widget/chat_doctor_widget.dart';
import 'package:heystetik_mobileapps/widget/shimmer_widget.dart';

import '../../../../theme/theme.dart';

class HalamanChatPage extends StatefulWidget {
  const HalamanChatPage({super.key});

  @override
  State<HalamanChatPage> createState() => _HalamanChatPageState();
}

class _HalamanChatPageState extends State<HalamanChatPage> {
  final DoctorChatController state = Get.put(DoctorChatController());

  int _wigetIndex = 0;
  bool isSelcted = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    state.getListRecentChat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                state.getListRecentChat();
              },
              child: Container(
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
                    FutureBuilder(
                      future: state.getCurrentDoctorSchedule(context),
                      builder: (context,
                          AsyncSnapshot<CurrentDoctorScheduleModel?> snapshot) {
                        print(snapshot.connectionState);
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Positioned(
                            left: 20,
                            right: 20,
                            top: 112,
                            child: shimmerWidget(
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 140,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: whiteColor,
                                ),
                              ),
                            ),
                          );
                        }
                        if (snapshot.connectionState == ConnectionState.done) {
                          if (snapshot.hasData) {
                            return Positioned(
                              left: 20,
                              right: 20,
                              top: 112,
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                // height: 140,
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
                                            'Jadwal Saya hari ini',
                                            style: blackHigtTextStyle.copyWith(
                                                fontSize: 15),
                                          ),
                                          const Spacer(),
                                          Text(
                                            'Atur Jadwal',
                                            style: grenTextStyle.copyWith(
                                                fontSize: 15),
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
                                      Obx(
                                        () => currentSchedule(
                                          state.isFirstSchedule.value,
                                          state.isFirstSchedule.value
                                              ? 'Online'
                                              : 'Jam pertama',
                                          state.startTime.value,
                                        ),
                                      ),
                                      const Divider(
                                        thickness: 1,
                                      ),
                                      Obx(
                                        () => currentSchedule(
                                          state.isSecondSchedule.value,
                                          state.isSecondSchedule.value
                                              ? 'Online'
                                              : 'Jam berikutnya',
                                          state.endTime.value,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return Center(
                              child: Text(
                                'Tidak ada jadwal',
                                style: TextStyle(
                                  fontWeight: bold,
                                  fontFamily: 'ProximaNova',
                                  fontSize: 15,
                                ),
                              ),
                            );
                          }
                        } else {
                          return Text(
                              'Connection State: ${snapshot.connectionState}');
                        }
                      },
                    ),
                  ],
                ),
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
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                _wigetIndex = 1;
                              });
                            },
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
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Obx(() {
                      // if (state.isLoading.value == false) {
                      //   return Positioned(
                      //     left: 20,
                      //     right: 20,
                      //     top: 112,
                      //     child: shimmerWidget(
                      //       child: Container(
                      //         width: MediaQuery.of(context).size.width,
                      //         height: 140,
                      //         decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(7),
                      //           color: whiteColor,
                      //         ),
                      //       ),
                      //     ),
                      //   );
                      // }
                      return Container(
                        height: Get.height,
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: state.listRecentChat.length,
                            itemBuilder: (context, index) {
                              return ChatAktif(
                                nametile: state.listRecentChat[index]['customer']['fullname'],
                                subNameTitle:
                                    '22 tahun; Korektif Wajah - Bekas Jerawat',
                                topic: 'Licorice',
                                sendBy: state.listRecentChat[index]['doctor']['fullname'],
                                menit: '11:30 PM',
                                pesanChat: state.listRecentChat[index]['unseen_count'],
                                chat: state.listRecentChat[index]['last_chat']['message'],
                                category: 'Skin Care',
                                roomCode: state.listRecentChat[index]['code'],
                                roomId: state.listRecentChat[index]['id'],
                                senderId: state.listRecentChat[index]['doctor']['id'],
                                receiverId: state.listRecentChat[index]['customer']['id'],
                              );
                            }),
                      );
                    })
                    // Column(
                    //   children: [
                    //     ChatAktif(
                    //       nametile: 'dila btw',
                    //       subNameTitle:
                    //           '22 tahun; Korektif Wajah - Bekas Jerawat',
                    //       topic: 'Licorice',
                    //       menit: '11:30 PM',
                    //       pesanChat: '2',
                    //       chat:
                    //           'Halo dok selamat siang..aku mau bertanya ni aku cocok nya skincarenya gimana, akhir² ini aku hanya memakai kelly saja, tidak memakai apa apa sehabis mandi kecuali kelly.. tapi 2 hari sebelum ini aku makai sunscreen YOU Spf 50+ PA ++++, eh tp sunscreen nya malah bikin kulit aku abu abu, kesel sih tapi tetep kupake karna kukira ngaruh, tapi kayanya ngga:(disini aku pengen jerawat, beruntusan, komedo, bekas jerawat hilang semua dan paling terutama kulit aku putih. kulit aku tipenya berminyak sekitaran hidung dan komedonya banyak banget apalagi di bawah bibir banyak.. mohon bantuannya dok',
                    //       category: 'Skin Care',
                    //     ),
                    //     ChatAktif(
                    //         nametile: 'Farida Dinda',
                    //         category: 'Skin Care',
                    //         subNameTitle: '22 tahun; Korektif Wajah - Jerawat',
                    //         topic: 'Licorice',
                    //         menit: '10:20 AM',
                    //         chat:
                    //             'Kalau masih bingung, bisa tanyakan langsung'),
                    //     ChatRead(
                    //         nametile: 'Farida Dinda',
                    //         category: 'Skin Care',
                    //         subNameTitle:
                    //             '22 tahun; Korektif Wajah - Kulit Kusam',
                    //         topic: 'Licorice',
                    //         menit: 'Kemarin',
                    //         chat:
                    //             'Apakah aman ya dok jika licorice + niacinamide 10% dipakai untuk kulit sensitif berjerawat? Mohon saran juga untuk kandungan skincare yg bisa mencerahkan untuk kulit sensitif berjerawat.'),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget currentSchedule(bool isCurrent, String title, String time) {
    return Row(
      children: [
        isCurrent
            ? Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green,
                ),
              )
            : Container(),
        isCurrent
            ? const SizedBox(
                width: 11,
              )
            : Container(),
        Text(
          title,
          style: subTitleTextStyle.copyWith(fontSize: 15),
        ),
        const Spacer(),
        Text(
          time,
          style: subTitleTextStyle.copyWith(fontSize: 15),
        ),
      ],
    );
  }
}

// class ChatAktif1 extends StatelessWidget {
//   const ChatAktif1({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//       top: 380,
//       left: 0,
//       right: 0,
//       bottom: 0,
//       child: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 33),
//           child: Column(
//             children: [
//               ChatAktif(
//                 nametile: 'dila btw',
//                 subNameTitle: '22 tahun; Korektif Wajah - Bekas Jerawat',
//                 topic: 'Licorice',
//                 menit: '11:30 PM',
//                 pesanChat: '2',
//                 chat:
//                     'Halo dok selamat siang..aku mau bertanya ni aku cocok nya skincarenya gimana, akhir² ini aku hanya memakai kelly saja, tidak memakai apa apa sehabis mandi kecuali kelly.. tapi 2 hari sebelum ini aku makai sunscreen YOU Spf 50+ PA ++++, eh tp sunscreen nya malah bikin kulit aku abu abu, kesel sih tapi tetep kupake karna kukira ngaruh, tapi kayanya ngga:(disini aku pengen jerawat, beruntusan, komedo, bekas jerawat hilang semua dan paling terutama kulit aku putih. kulit aku tipenya berminyak sekitaran hidung dan komedonya banyak banget apalagi di bawah bibir banyak.. mohon bantuannya dok',
//                 category: 'Skin Care',
//               ),
//               ChatAktif(
//                   nametile: 'Farida Dinda',
//                   category: 'Skin Care',
//                   subNameTitle: '22 tahun; Korektif Wajah - Jerawat',
//                   topic: 'Licorice',
//                   menit: '10:20 AM',
//                   chat: 'Kalau masih bingung, bisa tanyakan langsung'),
//               ChatRead(
//                   nametile: 'Farida Dinda',
//                   category: 'Skin Care',
//                   subNameTitle: '22 tahun; Korektif Wajah - Kulit Kusam',
//                   topic: 'Licorice',
//                   menit: 'Kemarin',
//                   chat:
//                       'Apakah aman ya dok jika licorice + niacinamide 10% dipakai untuk kulit sensitif berjerawat? Mohon saran juga untuk kandungan skincare yg bisa mencerahkan untuk kulit sensitif berjerawat.'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ChatSekesau extends StatelessWidget {
//   const ChatSekesau({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//       top: 380,
//       left: 0,
//       right: 0,
//       bottom: 0,
//       child: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 33),
//           child: Column(
//             children: [
//               ChatAktif(
//                 category: 'Skin Care',
//                 nametile: 'Pahrizal',
//                 subNameTitle: 'Untuk Diri Sendiri, 22 tahun ',
//                 topic: 'Jerawat',
//                 menit: 'Kermarin',
//                 chat:
//                     'Halo dok selamat siang..aku mau bertanya ni aku cocok nya skincarenya gimana, akhir² ini aku hanya memakai kelly saja, tidak memakai apa apa sehabis mandi kecuali kelly.. tapi 2 hari sebelum ini aku makai sunscreen YOU Spf 50+ PA ++++, eh tp sunscreen nya malah bikin kulit aku abu abu, kesel sih tapi tetep kupake karna kukira ngaruh, tapi kayanya ngga:(disini aku pengen jerawat, beruntusan, komedo, bekas jerawat hilang semua dan paling terutama kulit aku putih. kulit aku tipenya berminyak sekitaran hidung dan komedonya banyak banget apalagi di bawah bibir banyak.. mohon bantuannya dok',
//               ),
//               ChatAktif(
//                   category: 'Skin Care',
//                   nametile: 'Muhyi Abdul Basiit',
//                   subNameTitle: 'Untuk Diri Sendiri, 20 tahun ',
//                   topic: 'Jerawat',
//                   menit: 'Kermarin',
//                   chat:
//                       'Apakah aman ya dok jika licorice + niacinamide 10% dipakai untuk kulit sensitif berjerawat? Mohon saran juga untuk kandungan skincare yg bisa mencerahkan untuk kulit sensitif berjerawat.'),
//               ChatRead(
//                 category: 'Skin Care',
//                 nametile: 'Udin Bimlliah',
//                 subNameTitle: 'Untuk Diri Sendiri, 20 tahun ',
//                 topic: 'Jerawat',
//                 menit: '12/03/23',
//                 chat: 'Kalau masih bingung, bisa tanyakan langsung',
//               ),
//               ChatRead(
//                 category: 'Skin Care',
//                 nametile: 'Udin Bimlliah',
//                 subNameTitle: 'Untuk Diri Sendiri, 20 tahun ',
//                 topic: 'Jerawat',
//                 menit: '12/03/23',
//                 chat: 'Kalau masih bingung, bisa tanyakan langsung',
//               ),
//               ChatRead(
//                 category: 'Skin Care',
//                 nametile: 'Udin Bimlliah',
//                 subNameTitle: 'Untuk Diri Sendiri, 20 tahun ',
//                 topic: 'Jerawat',
//                 menit: '12/03/23',
//                 chat: 'Kalau masih bingung, bisa tanyakan langsung',
//               ),
//               ChatRead(
//                 category: 'Skin Care',
//                 nametile: 'Udin Bimlliah',
//                 subNameTitle: 'Untuk Diri Sendiri, 20 tahun ',
//                 topic: 'Jerawat',
//                 menit: '12/03/23',
//                 chat: 'Kalau masih bingung, bisa tanyakan langsung',
//               ),
//               ChatRead(
//                 category: 'Skin Care',
//                 nametile: 'Udin Bimlliah',
//                 subNameTitle: 'Untuk Diri Sendiri, 20 tahun ',
//                 topic: 'Jerawat',
//                 menit: '12/03/23',
//                 chat: 'Kalau masih bingung, bisa tanyakan langsung',
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
