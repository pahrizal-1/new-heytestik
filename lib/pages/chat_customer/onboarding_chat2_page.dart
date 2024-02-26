import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/chat_contomer_page.dart';
import 'package:heystetik_mobileapps/pages/profile_costumer/profil_customer_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

import '../../widget/pencarian_search_widget.dart';
import '../home/notifikasion_page.dart';
import '../setings&akun/akun_home_page.dart';

class OnboardingChat2 extends StatelessWidget {
  const OnboardingChat2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: greenColor,
        title: Padding(
          padding: const EdgeInsets.only(left: 6),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfilCustomerPage(),
                    ),
                  );
                },
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: AssetImage('assets/images/profiledummy.png')),
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
              const SizedBox(
                width: 11,
              ),
              Text(
                'Chat',
                style: whiteTextStyle.copyWith(fontSize: 18),
              )
            ],
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PencarianPageWidget(),
                ),
              );
            },
            child: SvgPicture.asset(
              'assets/icons/search.svg',
              color: whiteColor,
            ),
          ),
          const SizedBox(
            width: 14,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotifikasionPage(),
                ),
              );
            },
            child: SvgPicture.asset(
              'assets/icons/notif-icons.svg',
              color: whiteColor,
            ),
          ),
          const SizedBox(
            width: 14,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AkunHomePage(),
                ),
              );
            },
            child: SvgPicture.asset(
              'assets/icons/humberger-icons.svg',
              color: whiteColor,
            ),
          ),
          const SizedBox(
            width: 26,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // DoctorChat(
            //   judul: 'Bekas Jerawat',
            //   chat:
            //       'Silakan dicek dulu ya :) Kalau masih bingung, langsung ditanyain aja ☺️',
            //   img: 'assets/images/doctor-img.png',
            //   jamTanggal: '11:09 AM',
            //   valueChat: '2',
            // ),
            // DoctorChat(
            //   judul: 'Jerawat',
            //   chat:
            //       'dr. Risty Hafinah, Sp.DV: Silakan dicek dulu ya :) Kalau masih bingung, langsung ditanyain aja ☺️',
            //   img: 'assets/images/doctor1.png',
            //   jamTanggal: '9/9/2022',
            //   colorTanggal: subgreyColor,
            // ),
          ],
        ),
      ),
    );
  }
}

class DoctorChat extends StatelessWidget {
  final String nametile;
  final String sendBy;
  final String menit;
  final String chat;
  final int? pesanChat;
  final String roomCode;
  final int roomId;
  final int senderId;
  final int receiverId;
  const DoctorChat({
    super.key,
    required this.nametile,
    required this.sendBy,
    required this.menit,
    required this.chat,
    this.pesanChat,
    required this.roomCode,
    required this.roomId,
    required this.senderId,
    required this.receiverId,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: lsymetric.copyWith(top: 30),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatCostomerPage(
                roomCode: roomCode,
                sendBy: sendBy,
                receiverBy: nametile,
                roomId: roomId,
                senderId: senderId,
                receiverId: receiverId,
              ),
            ),
          );
        },
        child: Row(
          children: [
            ClipRect(
              child: Image.asset(
                'assets/images/doctor-img.png',
                width: 52,
                height: 52,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nametile,
                  style: blackTextStyle.copyWith(fontSize: 18),
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    Container(
                      constraints: const BoxConstraints(maxWidth: 230),
                      child: Text(
                        chat,
                        style: blackTextStyle.copyWith(
                          fontSize: 13,
                        ),
                        softWrap: false,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  menit,
                  style: grenTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: regular,
                    color: subgreyColor,
                  ),
                ),
                SizedBox(
                  height: 9,
                ),
                pesanChat != ''
                    ? Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 7,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                            color: greenColor, shape: BoxShape.circle),
                        child: Text(
                          pesanChat.toString(),
                          style: whiteTextStyle.copyWith(
                              fontSize: 12, color: whiteColor),
                        ),
                      )
                    : Container(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
