// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/notification/notification_controller.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/appar_cutome.dart';
import 'package:heystetik_mobileapps/models/customer/setting_notif_model.dart'
    as SettingNotif;

class NotifikasiSettingPage extends StatefulWidget {
  const NotifikasiSettingPage({super.key});

  @override
  State<NotifikasiSettingPage> createState() => _NotifikasiSettingPageState();
}

class _NotifikasiSettingPageState extends State<NotifikasiSettingPage> {
  final NotificationController state = Get.put(NotificationController());
  List<SettingNotif.Data> data = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      data.addAll(await state.getSettingNotif(context));
      setState(() {});
    });
  }

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
            child: switchNotif(
              title: 'Jeda semua notifikasi',
              selected: false,
              onTap: () async {},
            ),
          ),
          Container(
            height: 35,
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 8),
            width: MediaQuery.of(context).size.width,
            color: Color(0xfffcccccc).withOpacity(0.4),
            child: Text(
              'Stream',
              style: blackTextStyle.copyWith(
                fontSize: 15,
                color: Color(0xfffb0b0b0),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
            child: Column(
              children: [
                ...data.map((val) {
                  bool selected = val.isEnabled ?? false;
                  return val.name == 'Teman di Heystetik'
                      ? Row(
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
                              value: selected,
                              onChanged: (value) async {
                                selected = !selected;
                                setState(() {});
                                bool cek = await state.postSettingNotif(
                                  context,
                                  val.type ?? '',
                                  val.isEnabled == true ? false : true,
                                );
                                if (cek) {
                                  selected = true;
                                  data.clear();
                                  data.addAll(
                                      await state.getSettingNotif(context));
                                } else {
                                  selected = false;
                                }
                                setState(() {});
                              },
                            ),
                          ],
                        )
                      : switchNotif(
                          title: val.name ?? '-',
                          selected: selected,
                          onTap: () async {
                            selected = !selected;
                            setState(() {});
                            bool cek = await state.postSettingNotif(
                              context,
                              val.type ?? '',
                              val.isEnabled == true ? false : true,
                            );
                            if (cek) {
                              selected = true;
                              data.clear();
                              data.addAll(await state.getSettingNotif(context));
                            } else {
                              selected = false;
                            }
                            setState(() {});
                          },
                        );
                })
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget switchNotif(
      {required String title,
      required bool selected,
      required Function() onTap}) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              title,
              style: blackRegulerTextStyle.copyWith(
                  fontSize: 15, color: Color(0xfff323232)),
            ),
            const Spacer(),
            Switch(
              focusColor: greenColor,
              activeColor: greenColor,
              value: selected,
              onChanged: (value) {
                onTap();
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
