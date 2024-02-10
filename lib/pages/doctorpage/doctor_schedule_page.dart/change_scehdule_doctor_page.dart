import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/doctor/schedule/schedule_doctor_controller.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
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
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(
                        context,
                      );
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      size: 22,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Ubah Jadwal ${widget.title}",
                    style: TextStyle(
                        letterSpacing: 1.5,
                        fontFamily: 'ProximaNova',
                        fontWeight: bold,
                        color: blackColor),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Libur",
                  style: TextStyle(
                      letterSpacing: 1.5,
                      fontFamily: 'ProximaNova',
                      fontWeight: medium,
                      fontSize: 18,
                      color: blackColor),
                ),
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
          Divider(
            thickness: 2,
            color: Colors.grey,
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Atur Jam",
                  style: TextStyle(
                      letterSpacing: 1.5,
                      fontFamily: 'ProximaNova',
                      fontWeight: medium,
                      fontSize: 18,
                      color: blackColor),
                ),
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
                Text(
                  "Mulai",
                  style: TextStyle(
                      letterSpacing: 1.5,
                      fontFamily: 'ProximaNova',
                      fontWeight: medium,
                      fontSize: 18,
                      color: blackColor),
                ),
                SizedBox(
                  width: 100,
                ),
                Text(
                  "Selesai",
                  style: TextStyle(
                      letterSpacing: 1.5,
                      fontFamily: 'ProximaNova',
                      fontWeight: medium,
                      fontSize: 18,
                      color: blackColor),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 18),
            child: Row(
              children: [
                SizedBox(
                  width: 100,
                  height: 45,
                  child: TextFormField(
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
                  width: 100,
                ),
                SizedBox(
                  width: 100,
                  height: 45,
                  child: TextFormField(
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
