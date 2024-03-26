import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/doctor/schedule/schedule_doctor_controller.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/appar_cutome.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import 'package:heystetik_mobileapps/widget/show_modal_dialog.dart';
import 'package:intl/intl.dart';

import '../../../models/doctor/doctor_schedule_model.dart';
import '../../../widget/button_widget.dart';

class ChangeScheduleDoctorPage extends StatefulWidget {
  final String title;
  // final Map<String, dynamic> data;
  final List<dynamic> timeStart;
  final int dayNumber;
  // final List timeEnd;
  const ChangeScheduleDoctorPage({
    super.key,
    required this.title,
    required this.timeStart,
    required this.dayNumber,
    // required this.timeStart,
    // required this.timeEnd,
  });

  @override
  State<ChangeScheduleDoctorPage> createState() => _ChangeScheduleDoctorPageState();
}

class _ChangeScheduleDoctorPageState extends State<ChangeScheduleDoctorPage> {
  RxBool isActive = false.obs;
  RxBool isActiveLibur = false.obs;
  String timeRangesString = '';
  List<String> timeRanges = [];
  List<String> parts = [];
  String mulaiParts = '';
  String selesaiParts = '';
  final ScheduleDoctorController state = Get.put(ScheduleDoctorController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      state.parseAndProcessTimes();

      // parts.addAll([widget.data.toString()]);
    });
    setState(() {
      for (var i = 0; i < widget.timeStart.length; i++) {
        print('ihsalah i ${DateFormat('HH:mm').format(
          DateTime.parse('${widget.timeStart[i]['start_time']}').toUtc().add(
                Duration(hours: 7, minutes: 00),
              ),
        )}');
        state.mulaiScheduleWeek.addAll([
          TextEditingController(
            text: DateFormat('HH:mm').format(
              DateTime.parse('${widget.timeStart[i]['start_time']}').toUtc().add(
                    Duration(hours: 7, minutes: 00),
                  ),
            ),
          )
        ]);
        state.selesaiScheduleWeek.addAll([
          TextEditingController(
            text: DateFormat('HH:mm').format(
              DateTime.parse('${widget.timeStart[i]['end_time']}').toUtc().add(
                    Duration(hours: 7, minutes: 00),
                  ),
            ),
          ),
        ]);
        state.changeMulaiJamMinute.addAll([
          {
            'start_time': 0,
            'end_time': 0,
          }
        ]);
        state.changeSelesaiJamMinute.addAll([
          {
            'start_time': 0,
            'end_time': 0,
          }
        ]);
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    //   state.countScheduleWeek;
    //   state.mulaiScheduleWeek.forEach((element) {
    //     element.dispose();
    //   });
    //   state.selesaiScheduleWeek.forEach((element) {
    //     element.dispose();
    //   });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustome(
        onta1: () {
          Navigator.pop(context);
          state.changeMulaiJamMinute = [];
          state.changeSelesaiJamMinute = [];
          state.mulaiScheduleWeek = [];
          state.selesaiScheduleWeek = [];
        },
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
                    setState(() {
                      isActiveLibur.value = value;
                    });
                    print('isACt ${isActiveLibur.value}');
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
          ListView.builder(
              itemCount: widget.timeStart.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 100,
                        height: 45,
                        child: TextFormField(
                          controller: state.mulaiScheduleWeek[index],
                          enabled: true,
                          onTap: () {
                            customScheduleHour(context, index);
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
                          controller: state.selesaiScheduleWeek[index],
                          enabled: true,
                          onTap: () {
                            customEndScheduleHour(context, index);
                          },
                          readOnly: true,
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: '',
                          ),
                        ),
                      ),
                      state.countScheduleWeek >= 2
                          ? IconButton(
                              onPressed: () {
                                // print('state ${state.mulaiScheduleWeek}');
                                setState(() {
                                  state.countScheduleWeek -= 1;
                                  widget.timeStart.length -= 1;
                                  // list mulai
                                  state.mulaiScheduleWeek.removeAt(index);
                                  // list selesai
                                  state.selesaiScheduleWeek.removeAt(index);
                                  state.changeMulaiJamMinute.removeAt(index);
                                  state.changeSelesaiJamMinute.removeAt(index);
                                });
                              },
                              icon: Icon(Icons.close))
                          : SizedBox(),
                    ],
                  ),
                );
              }),
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 18, right: 18),
            child: InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                print('testing widget');
                // List count nya
                setState(() {
                  state.countScheduleWeek += 1;
                  widget.timeStart.length += 1;
                  // list mulai
                  state.mulaiScheduleWeek.addAll([
                    TextEditingController(),
                  ]);
                  // list selesai
                  state.selesaiScheduleWeek.addAll([
                    TextEditingController(),
                  ]);
                  state.changeMulaiJamMinute.addAll([
                    {'start_time': 0, 'end_time': 0}
                  ]);
                  state.changeSelesaiJamMinute.addAll([
                    {'start_time': 0, 'end_time': 0}
                  ]);
                });
              },
              child: Text(
                '+ Tambah Jadwal',
                style: TextStyle(color: greenColor, fontSize: 18),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 59, bottom: 73, left: 18, right: 18),
            child: ButtonGreenWidget(
              title: 'Simpan',
              onPressed: () {
                state.postStatusWeekScheduleDoctor(
                  context,
                  widget.timeStart.length,
                  widget.dayNumber,
                  isActiveLibur.value,
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Future<dynamic> customScheduleHour(BuildContext context, int index) {
    return customeModal(
      context,
      StatefulBuilder(builder: (BuildContext context, setState) {
        return Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 24),
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
                        style: blackTextStyle.copyWith(fontSize: 12),
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
                          if (state.changeMulaiJamMinute[index]['start_time'] != 24) {
                            setState(() {
                              state.changeMulaiJamMinute[index]['start_time']++;
                            });
                          } else {
                            setState(() {
                              state.changeMulaiJamMinute[index]['start_time'] = 0;
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            state.changeMulaiJamMinute[index]['start_time'].toString(),
                            style: blackHigtTextStyle.copyWith(fontSize: 30),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      InkWell(
                        onTap: () {
                          if (state.changeMulaiJamMinute[index]['start_time'] <= 0) {
                            setState(() {
                              state.changeMulaiJamMinute[index]['start_time'] = 0;
                            });
                          } else {
                            setState(() {
                              state.changeMulaiJamMinute[index]['start_time']--;
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
                          if (state.changeMulaiJamMinute[index]['end_time'] != 60) {
                            setState(() {
                              state.changeMulaiJamMinute[index]['end_time']++;
                            });
                          } else {
                            setState(() {
                              state.changeMulaiJamMinute[index]['end_time'] = 0;
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            state.changeMulaiJamMinute[index]['end_time'].toString(),
                            style: blackHigtTextStyle.copyWith(fontSize: 30),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      InkWell(
                        onTap: () {
                          if (state.changeMulaiJamMinute[index]['end_time'] <= 0) {
                            setState(() {
                              state.changeMulaiJamMinute[index]['end_time'] = 0;
                            });
                          } else {
                            setState(() {
                              state.changeMulaiJamMinute[index]['end_time']--;
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
                padding: const EdgeInsets.only(top: 59, bottom: 73),
                child: ButtonGreenWidget(
                  title: 'Simpan',
                  onPressed: () {
                    String a = '';
                    String b = '';
                    if (state.changeMulaiJamMinute[index]['start_time'] < 10) {
                      setState(() {
                        a = '0${state.changeMulaiJamMinute[index]['start_time']}';
                      });
                    } else {
                      a = '${state.changeMulaiJamMinute[index]['start_time']}';
                    }
                    if (state.changeMulaiJamMinute[index]['end_time'] < 10) {
                      setState(() {
                        b = '0${state.changeMulaiJamMinute[index]['end_time']}';
                      });
                    } else {
                      b = '${state.changeMulaiJamMinute[index]['end_time']}';
                    }
                    String c = '${a}:${b}';
                    state.mulaiScheduleWeek[index].text = c;

                    Navigator.pop(context);
                  },
                ),
              )
            ],
          ),
        );
      }),
    );
  }

  Future<dynamic> customEndScheduleHour(BuildContext context, int index) {
    return customeModal(
      context,
      StatefulBuilder(builder: (BuildContext context, setState) {
        return Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 24),
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
                        style: blackTextStyle.copyWith(fontSize: 12),
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
                          if (state.changeSelesaiJamMinute[index]['start_time'] != 24) {
                            setState(() {
                              state.changeSelesaiJamMinute[index]['start_time']++;
                            });
                          } else {
                            setState(() {
                              state.changeSelesaiJamMinute[index]['start_time'] = 0;
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            state.changeSelesaiJamMinute[index]['start_time'].toString(),
                            style: blackHigtTextStyle.copyWith(fontSize: 30),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      InkWell(
                        onTap: () {
                          if (state.changeSelesaiJamMinute[index]['start_time'] <= 0) {
                            setState(() {
                              state.changeSelesaiJamMinute[index]['start_time'] = 0;
                            });
                          } else {
                            setState(() {
                              state.changeSelesaiJamMinute[index]['start_time']--;
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
                          if (state.changeSelesaiJamMinute[index]['end_time'] != 60) {
                            setState(() {
                              state.changeSelesaiJamMinute[index]['end_time']++;
                            });
                          } else {
                            setState(() {
                              state.changeSelesaiJamMinute[index]['end_time'] = 0;
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            state.changeSelesaiJamMinute[index]['end_time'].toString(),
                            style: blackHigtTextStyle.copyWith(fontSize: 30),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      InkWell(
                        onTap: () {
                          if (state.changeSelesaiJamMinute[index]['end_time'] <= 0) {
                            setState(() {
                              state.changeSelesaiJamMinute[index]['end_time'] = 0;
                            });
                          } else {
                            setState(() {
                              state.changeSelesaiJamMinute[index]['end_time']--;
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
                padding: const EdgeInsets.only(top: 59, bottom: 73),
                child: ButtonGreenWidget(
                  title: 'Simpan',
                  onPressed: () {
                    String a = '';
                    String b = '';
                    if (state.changeSelesaiJamMinute[index]['start_time'] < 10) {
                      setState(() {
                        a = '0${state.changeSelesaiJamMinute[index]['start_time']}';
                      });
                    } else {
                      a = '${state.changeSelesaiJamMinute[index]['start_time']}';
                    }
                    if (state.changeSelesaiJamMinute[index]['end_time'] < 10) {
                      setState(() {
                        b = '0${state.changeSelesaiJamMinute[index]['end_time']}';
                      });
                    } else {
                      b = '${state.changeSelesaiJamMinute[index]['end_time']}';
                    }
                    String c = '${a}:${b}';

                    state.selesaiScheduleWeek[index].text = c;
                    Navigator.pop(context);
                  },
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
