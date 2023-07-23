import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

class ListChat extends StatelessWidget {
  const ListChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            DoctorChat(
              ontap: () {},
              judul: 'Bekas Jerawat',
              chat:
                  'Silakan dicek dulu ya :) Kalau masih bingung, langsung ditanyain aja ☺️',
              img: 'assets/images/doctor-img.png',
              jamTanggal: '11:09 AM',
              valueChat: '2',
            ),
            DoctorChat(
              ontap: () {},
              judul: 'Jerawat',
              chat:
                  'dr. Risty Hafinah, Sp.DV: Silakan dicek dulu ya :) Kalau masih bingung, langsung ditanyain aja ☺️',
              img: 'assets/images/doctor1.png',
              jamTanggal: '9/9/2022',
              colorTanggal: subgreyColor,
            ),
          ],
        ),
      ),
    );
  }
}

class DoctorChat extends StatelessWidget {
  final String judul;
  final VoidCallback? ontap;
  final String chat;
  final String img;
  final String jamTanggal;
  final Color? colorTanggal;
  final String? valueChat;
  const DoctorChat({
    super.key,
    required this.judul,
    required this.chat,
    required this.img,
    required this.jamTanggal,
    this.valueChat = '',
    this.colorTanggal,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: lsymetric.copyWith(top: 30),
      child: InkWell(
        onTap: ontap,
        child: Row(
          children: [
            ClipRect(
              child: Image.asset(
                img,
                width: 52,
                height: 52,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  judul,
                  style: blackTextStyle.copyWith(fontSize: 18),
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    Container(
                      constraints: const BoxConstraints(maxWidth: 220),
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
                  jamTanggal,
                  style: grenTextStyle.copyWith(
                      fontSize: 12, fontWeight: regular, color: colorTanggal),
                ),
                const SizedBox(
                  height: 9,
                ),
                valueChat != ''
                    ? Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 7,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                            color: greenColor, shape: BoxShape.circle),
                        child: Text(
                          valueChat.toString(),
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
