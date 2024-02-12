import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/doctor/schedule/schedule_doctor_controller.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/appar_cutome.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import 'package:heystetik_mobileapps/widget/show_modal_dialog.dart';

import '../../../widget/button_widget.dart';

class ChangeScheduleDoctorPage extends StatefulWidget {
  final String title;
  const ChangeScheduleDoctorPage({super.key, required this.title});

  @override
  State<ChangeScheduleDoctorPage> createState() =>
      _ChangeScheduleDoctorPageState();
}

class _ChangeScheduleDoctorPageState extends State<ChangeScheduleDoctorPage> {
  RxBool isActive = false.obs;
  RxBool isActiveLibur = false.obs;
  final ScheduleDoctorController state = Get.put(ScheduleDoctorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustome(
        title: 'Ubah jadwal Senin',
        colorIcons: blackColor,
        colorTitle: blackColor,
        bgColor: whiteColor,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 21, right: 21, top: 48),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Libur", style: blackTextStyle.copyWith(fontSize: 14)),
                Switch(
                  focusColor: greenColor,
                  activeColor: greenColor,
                  value: isActiveLibur.value,
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      isActiveLibur.value = value;
                    });
                  },
                ),
              ],
            ),
          ),
          dividergrey(),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Atur Jam", style: blackTextStyle.copyWith(fontSize: 14)),
                Switch(
                  focusColor: greenColor,
                  activeColor: greenColor,
                  value: isActive.value,
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      isActive.value = value;
                    });
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 18),
            child: Row(
              children: [
                Text("Mulai", style: blackTextStyle.copyWith(fontSize: 12)),
                SizedBox(
                  width: 160,
                ),
                Text("Selesai", style: blackTextStyle.copyWith(fontSize: 12)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Row(
              children: [
                SizedBox(
                  width: 100,
                  height: 45,
                  child: TextFormField(
                    enabled: true,
                    onTap: () {
                      customeModal(
                        context,
                        StatefulBuilder(
                            builder: (BuildContext context, setState) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 24),
                            child: Wrap(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: SvgPicture.asset(
                                        'assets/icons/remove-icons.svg',
                                        width: 30,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 36,
                                ),
                                Text(
                                  'Atur Jam',
                                  style: blackTextStyle.copyWith(fontSize: 20),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          'Mulai',
                                          style: blackTextStyle.copyWith(
                                              fontSize: 12),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            if (state.jam.value != 24) {
                                              setState(() {
                                                state.jam.value++;
                                              });
                                            } else {
                                              setState(() {
                                                state.jam.value = 0;
                                              });
                                            }
                                          },
                                          child: Image.asset(
                                            'assets/icons/upButton.png',
                                            width: 30,
                                            height: 30,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 22,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              state.jam.value.toString(),
                                              style: blackHigtTextStyle
                                                  .copyWith(fontSize: 30),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 22,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            if (state.jam.value <= 0) {
                                              setState(() {
                                                state.jam.value = 0;
                                              });
                                            } else {
                                              setState(() {
                                                state.jam.value--;
                                              });
                                            }
                                          },
                                          child: Image.asset(
                                            'assets/icons/button-down.png',
                                            width: 30,
                                            height: 30,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 50,
                                    ),
                                    Text(
                                      ':',
                                      style: blackHigtTextStyle,
                                    ),
                                    SizedBox(
                                      width: 50,
                                    ),
                                    Column(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            if (state.menit.value != 60) {
                                              setState(() {
                                                state.menit.value++;
                                              });
                                            } else {
                                              setState(() {
                                                state.menit.value = 0;
                                              });
                                            }
                                          },
                                          child: Image.asset(
                                            'assets/icons/upButton.png',
                                            width: 30,
                                            height: 30,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 22,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              state.menit.value.toString(),
                                              style: blackHigtTextStyle
                                                  .copyWith(fontSize: 30),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 22,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            if (state.menit.value <= 0) {
                                              setState(() {
                                                state.menit.value = 0;
                                              });
                                            } else {
                                              setState(() {
                                                state.menit.value--;
                                              });
                                            }
                                          },
                                          child: Image.asset(
                                            'assets/icons/button-down.png',
                                            width: 30,
                                            height: 30,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 59, bottom: 73),
                                  child: ButtonGreenWidget(
                                    title: 'Simpan',
                                    onPressed: () {
                                      var data =
                                          '${state.jam.value} : ${state.menit.value}';
                                      String a = '';
                                      String b = '';
                                      if (state.jam.value < 10) {
                                        setState(() {
                                          a = '0${state.jam.value}';
                                        });
                                        print(a);
                                      } else {
                                        a = '${state.jam.value}';
                                      }
                                      if (state.menit.value < 10) {
                                        setState(() {
                                          b = '0${state.menit.value}';
                                        });
                                        print(b);
                                      } else {
                                        b = '${state.menit.value}';
                                      }
                                      String c = '${a}:${b}';
                                      print(c);
                                    },
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                      );
                    },
                    readOnly: true,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: '',
                    ),
                  ),
                ),
                SizedBox(
                  width: 80,
                ),
                SizedBox(
                  width: 100,
                  height: 45,
                  child: TextFormField(
                    enabled: true,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: '',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 18, right: 18),
            child: Text(
              '+ Tambah Jadwal',
              style: TextStyle(color: greenColor, fontSize: 18),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 59, bottom: 73, left: 18, right: 18),
            child: ButtonGreenWidget(
              title: 'Simpan',
            ),
          )
        ],
      ),
    );
  }
}
