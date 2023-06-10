import 'package:flutter/material.dart';

import 'package:heystetik_mobileapps/theme/theme.dart';

import '../pages/doctorpage/doctor_schedule_page.dart/chat_doctor/chat_doctor.dart';

class ChatAktif extends StatelessWidget {
  final String nametile;
  final String subNameTitle;
  final String topic;

  final String category;
  final String menit;
  final String chat;
  final String? pesanChat;

  const ChatAktif(
      {super.key,
      required this.nametile,
      required this.subNameTitle,
      required this.topic,
      required this.menit,
      required this.chat,
      required this.category,
      this.pesanChat = ''});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ChatDoctorPage(),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/icons/logo.png',
                  width: 39,
                ),
                const SizedBox(
                  width: 11,
                ),
                Container(
                  constraints: const BoxConstraints(maxWidth: 200),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        nametile,
                        style: blackTextStyle.copyWith(fontSize: 15),
                      ),
                      Text(
                        subNameTitle,
                        style: subTitleTextStyle.copyWith(fontSize: 10),
                      ),
                      Text(
                        chat,
                        style: blackTextStyle.copyWith(
                            fontSize: 14, fontWeight: regular),
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
                const Spacer(),
                Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        menit,
                        style: subTitleTextStyle,
                        softWrap: false,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      pesanChat != ''
                          ? Container(
                              height: 20,
                              width: 25,
                              decoration: BoxDecoration(
                                  color: greenColor, shape: BoxShape.circle),
                              child: Center(
                                child: Text(
                                  pesanChat.toString(),
                                  style: whiteTextStyle,
                                ),
                              ),
                            )
                          : Container(),
                    ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ChatRead extends StatelessWidget {
  final String nametile;
  final String subNameTitle;
  final String topic;

  final String category;
  final String menit;
  final String chat;

  const ChatRead({
    super.key,
    required this.nametile,
    required this.subNameTitle,
    required this.topic,
    required this.menit,
    required this.chat,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          enableDrag: false,
          isDismissible: false,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) => const ChatDoctorPage(),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/icons/logo.png',
                  width: 39,
                ),
                const SizedBox(
                  width: 11,
                ),
                Container(
                  constraints: const BoxConstraints(maxWidth: 200),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        nametile,
                        style: blackTextStyle.copyWith(fontSize: 15),
                      ),
                      Text(
                        subNameTitle,
                        style: subTitleTextStyle.copyWith(fontSize: 10),
                      ),
                      Text(
                        chat,
                        style: blackTextStyle.copyWith(
                            fontSize: 14, fontWeight: regular),
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
                const Spacer(),
                Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        menit,
                        style: subTitleTextStyle,
                        softWrap: false,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Image.asset(
                        'assets/images/logo_cheac_wa.png',
                        width: 20,
                      ),
                    ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
