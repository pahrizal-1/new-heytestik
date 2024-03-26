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
  List datum = [];
  bool isSelectedJeda = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      get();
    });
  }

  get() async {
    data.clear();
    data.addAll(await state.getSettingNotif(context));
    var adaGak = data.firstWhereOrNull(
      (item) => item.isEnabled == false,
    );
    if (adaGak == null) {
      isSelectedJeda = true;
    } else {
      isSelectedJeda = false;
    }
    datum.clear();
    for (int index = 0; index < data.length; index++) {
      if (data[index].name != 'Teman di Heystetik') {
        datum.add({
          "type": data[index].type,
          "is_enabled": isSelectedJeda ? false : true
        });
      }
    }
    setState(() {});
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
              selected: isSelectedJeda,
              onTap: () async {
                isSelectedJeda = !isSelectedJeda;
                setState(() {});
                bool cek = await state.postSettingNotif(
                  context,
                  data: datum,
                  isJeda: true,
                  isEnabled: isSelectedJeda ? false : true,
                );
                if (cek) {
                  isSelectedJeda = true;
                  get();
                } else {
                  isSelectedJeda = false;
                }
                setState(() {});
              },
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
                  bool selected = val.isEnabled!;
                  return val.name == 'Teman di Heystetik'
                      ? Container()
                      //     ? Row(
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         children: [
                      //           Column(
                      //             crossAxisAlignment: CrossAxisAlignment.start,
                      //             children: [
                      //               Text(
                      //                 'Teman di Heystetik',
                      //                 style: blackRegulerTextStyle.copyWith(
                      //                     fontSize: 15, color: blackColor),
                      //               ),
                      //               SizedBox(
                      //                 height: 2,
                      //               ),
                      //               Text(
                      //                 'Laura, salah satu kontak kamu, ada di Heystetik\nsebagai @laurado. Apakah kamu ingin mengikuti?',
                      //                 style: subTitleTextStyle.copyWith(
                      //                   fontSize: 11,
                      //                 ),
                      //               ),
                      //             ],
                      //           ),
                      //           const Spacer(),
                      //           Switch(
                      //             focusColor: greenColor,
                      //             activeColor: greenColor,
                      //             value: selected,
                      //             onChanged: (value) async {
                      //               List data = [
                      //                 {
                      //                   "type": val.type,
                      //                   "is_enabled":
                      //                       val.isEnabled == true ? false : true
                      //                 }
                      //               ];
                      //               selected = !selected;
                      //               setState(() {});
                      //               bool cek = await state.postSettingNotif(
                      //                 context,
                      //                 data: data,
                      //                 isEnabled:
                      //                     val.isEnabled == true ? false : true,
                      //               );
                      //               if (cek) {
                      //                 selected = true;
                      //                 get();
                      //               } else {
                      //                 selected = false;
                      //               }
                      //               setState(() {});
                      //             },
                      //           ),
                      //         ],
                      //       )
                      : switchNotif(
                          title: val.name ?? '-',
                          selected: selected,
                          onTap: () async {
                            List data = [
                              {
                                "type": val.type,
                                "is_enabled":
                                    val.isEnabled == true ? false : true
                              }
                            ];
                            selected = !selected;
                            bool cek = await state.postSettingNotif(
                              context,
                              data: data,
                              isEnabled: val.isEnabled == true ? false : true,
                            );
                            if (cek) {
                              selected ? selected = true : selected = false;
                              get();
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
