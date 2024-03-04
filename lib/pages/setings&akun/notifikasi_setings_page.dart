import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/appar_cutome.dart';

class NotifikasiSettingsPage extends StatefulWidget {
  const NotifikasiSettingsPage({super.key});

  @override
  State<NotifikasiSettingsPage> createState() => _NotifikasiSettingsPageState();
}

bool isSelected = false;

class _NotifikasiSettingsPageState extends State<NotifikasiSettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBarCustome(
        title: 'Notifikasi',
        colorIcons: blackColor,
        colorTitle: blackColor,
        bgColor: whiteColor,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
            child: SwitchNotifikasi(
              title: 'Jeda semua notifikasi',
            ),
          ),
          Container(
            height: 35,
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 8),
            width: MediaQuery.of(context).size.width,
            color: Color(0xFFfCCCCCC).withOpacity(0.4),
            child: Text(
              'Stream',
              style: blackTextStyle.copyWith(
                fontSize: 15,
                color: Color(0xfffB0B0B0),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
            child: Column(
              children: [
                SwitchNotifikasi(
                  title: 'Mention',
                ),
                SizedBox(
                  height: 12,
                ),
                SwitchNotifikasi(
                  title: 'Postingan yang disukai',
                ),
                SizedBox(
                  height: 12,
                ),
                SwitchNotifikasi(
                  title: 'Balasan',
                ),
                SizedBox(
                  height: 12,
                ),
                SwitchNotifikasi(
                  title: 'Followers',
                ),
                SizedBox(
                  height: 12,
                ),
                SwitchNotifikasi(
                  title: 'Repost',
                ),
                SizedBox(
                  height: 12,
                ),
                SwitchNotifikasi(
                  title: 'Postingan akun yang diikuti',
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Teman di Heystetik',
                          style: blackRegulerTextStyle.copyWith(
                              fontSize: 15, color: blackColor),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          'Laura, salah satu kontak kamu, ada di Heystetik\nsebagai @laurado. Apakah kamu ingin mengikuti?',
                          style: subTitleTextStyle.copyWith(
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Switch(
                      focusColor: greenColor,
                      activeColor: greenColor,
                      value: isSelected,
                      onChanged: (value) {
                        setState(() {
                          isSelected = value;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SwitchNotifikasi extends StatefulWidget {
  final String title;
  const SwitchNotifikasi({
    super.key,
    required this.title,
  });

  @override
  State<SwitchNotifikasi> createState() => _SwitchNotifikasiState();
}

bool isSwitch = false;

class _SwitchNotifikasiState extends State<SwitchNotifikasi> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              widget.title,
              style: blackRegulerTextStyle.copyWith(
                  fontSize: 15, color: Color(0xfff323232)),
            ),
            const Spacer(),
            Switch(
              focusColor: greenColor,
              activeColor: greenColor,
              value: isSwitch,
              onChanged: (value) {
                setState(() {
                  isSwitch = value;
                });
              },
            ),
          ],
        ),
        Container(
          height: 1,
          color: borderColor.withOpacity(0.4),
        )
      ],
    );
  }
}
