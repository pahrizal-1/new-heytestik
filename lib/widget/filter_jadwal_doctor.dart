import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/pages/doctorpage/doctor_schedule_page.dart/schedule_doctor_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';
import 'package:heystetik_mobileapps/widget/show_modal_dialog.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../controller/doctor/schedule/schedule_doctor_controller.dart';
import '../core/convert_date.dart';

class FilterJadwalDoctor extends StatefulWidget {
  const FilterJadwalDoctor({
    super.key,
  });

  @override
  State<FilterJadwalDoctor> createState() => _FilterJadwalDoctorState();
}

class _FilterJadwalDoctorState extends State<FilterJadwalDoctor> {
  int jam = 0;
  int menit = 0;
  int isSelected = -1;
  int isSelectedResting = -1;
  TimeOfDay _time = TimeOfDay.now();
  DateTime now = DateTime.now();
  final ScheduleDoctorController state = Get.put(ScheduleDoctorController());
  String startPeriod = '';
  String endPeriod = '';
  String selectedDate = '';
  String dateCount = '';
  String rangeCount = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await state.getStatusChangeSchedule(context);
      setState(() {
        if (state.scheduleModel.value.data?.status == 'ACTIVE') {
          print('1');
          isSelected = 0;
        } else if (state.scheduleModel.value.data?.status == 'RESTING') {
          print('2');
          isSelected = 1;
        } else if (state.scheduleModel.value.data?.status == 'ONLEAVE') {
          print('3');
          isSelected = 2;
        } else {
          isSelected = -1;
        }
      });

      if (state.scheduleModel.value.data?.restingDuration == '30 menit') {
        isSelectedResting = 0;
      } else if (state.scheduleModel.value.data?.restingDuration == '90 menit') {
        isSelectedResting = 1;
      } else if (state.scheduleModel.value.data?.restingDuration == null) {
        isSelectedResting = -1;
      } else {
        isSelectedResting = 2;
        List<String> parts = state.scheduleModel.value.data!.restingDurationTime!.split(':');

        // The first part is the hours
        state.jamStatusDoktor.value = int.parse(parts[0]);
        state.menitStatusDoktor.value = int.parse(parts[1]);

        print("Hours: ${state.jamStatusDoktor.value} dan ${state.menitStatusDoktor.value}");
        // state.jamStatusDoktor.value = state.scheduleModel.value
      }
    });
  }

  void _selectTime() async {
    TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (newTime != null) {
      setState(() {
        _time = newTime;
      });
      print(newTime.format(context)); //output 10:51 PM
      print(newTime.hour); //output 10:51 PM
      print(newTime.minute); //output 10:51 PM
      DateTime parsedTime = DateTime(now.year, now.month, now.day, _time.hour, _time.minute);
      final format = DateFormat.jm();
      print('format ' + format.format(parsedTime).toString());
    } else {
      print("Time is not selected");
    }
  }

  void onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    if (args.value is PickerDateRange) {
      state.startPeriod.value = '${DateFormat('yyyy-MM-dd').format(args.value.startDate)}';
      state.endPeriod.value = '${DateFormat('yyyy-MM-dd').format(args.value.endDate ?? args.value.startDate)}';

      state.restingStartDate.value = ConvertDate.defaultDate(state.startPeriod.value);
      state.restingEndDate.value = ConvertDate.defaultDate(state.endPeriod.value);

      print('start date ${state.startPeriod.value}');
      print('end date ${state.endPeriod.value}');
    } else if (args.value is DateTime) {
      selectedDate = args.value.toString();
    } else if (args.value is List<DateTime>) {
      dateCount = args.value.length.toString();
    } else {
      rangeCount = args.value.length.toString();
    }
  }

  String formatSecondsToHMS(int seconds) {
    if (seconds >= 3600) {
      int hours = seconds ~/ 3600;
      int remainingSeconds = seconds % 3600;
      int minutes = remainingSeconds ~/ 60;
      int remainingSecondsAfterMinutes = remainingSeconds % 60;

      String hoursStr = hours.toString().padLeft(2, '');
      String minutesStr = minutes.toString().padLeft(2, '');
      String secondsStr = remainingSecondsAfterMinutes.toString().padLeft(2, '');

      return '$hoursStr jam $minutesStr menit $secondsStr detik';
    } else {
      int minutes = seconds ~/ 60;
      int remainingSeconds = seconds % 60;

      String minutesStr = minutes.toString().padLeft(2, '');
      String secondsStr = remainingSeconds.toString().padLeft(2, '');

      return '$minutesStr menit $secondsStr detik';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
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
              'Status Jadwal Dokter',
              style: blackTextStyle.copyWith(fontSize: 20),
            ),
            Text(
              'Cek status jadwal dokter saat ini dan ubah statusnya dari sini.',
              style: blackRegulerTextStyle.copyWith(fontSize: 12, color: blackColor),
            ),
            SizedBox(
              height: 22,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  isSelected = 0;
                  isSelectedResting = -1;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 18, horizontal: 11),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: whiteColor,
                  border: Border.all(
                    color: borderColor,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0.1,
                      blurRadius: 2,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Jadwal Konsultasi Normal',
                          style: blackTextStyle.copyWith(fontSize: 14),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                print('step ${state.activeSchedule.value}');
                              },
                              child: Text(
                                'Jadwal hari ini ${state.activeSchedule.value}',
                                style: blackRegulerTextStyle.copyWith(fontSize: 12),
                              ),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            InkWell(
                              onTap: () {
                                // Get.to(ScheduleDoctorPage());
                                Navigator.push(context, MaterialPageRoute(builder: (context) => ScheduleDoctorPage()));
                              },
                              child: Text(
                                'Edit',
                                style: grenTextStyle.copyWith(fontSize: 12),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    Icon(
                      isSelected == 0 ? Icons.radio_button_on : Icons.circle_outlined,
                      color: isSelected == 0 ? greenColor : blackColor,
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  isSelected = 1;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 18, horizontal: 11),
                margin: EdgeInsets.only(
                  top: 14,
                  bottom: 14,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: whiteColor,
                  border: Border.all(
                    color: borderColor,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0.1,
                      blurRadius: 2,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Istirahat',
                          style: blackTextStyle.copyWith(fontSize: 14),
                        ),
                        Text(
                          'Offline sesuai durasi yang ditentukan.',
                          style: blackRegulerTextStyle.copyWith(fontSize: 12),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isSelectedResting = 0;
                                });
                              },
                              child: Container(
                                width: 81,
                                height: 30,
                                margin: EdgeInsets.only(right: 8),
                                decoration: BoxDecoration(color: isSelectedResting == 0 ? greenColor : Color(0xffECECEC), borderRadius: BorderRadius.circular(7)),
                                child: Center(
                                  child: Text(
                                    '30 Menit',
                                    style: blackTextStyle.copyWith(
                                      fontSize: 13,
                                      color: isSelectedResting == 0 ? whiteColor : blackColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isSelectedResting = 1;
                                });
                              },
                              child: Container(
                                width: 81,
                                height: 30,
                                margin: EdgeInsets.only(right: 8),
                                decoration: BoxDecoration(color: isSelectedResting == 1 ? greenColor : Color(0xffECECEC), borderRadius: BorderRadius.circular(7)),
                                child: Center(
                                  child: Text(
                                    '90 Menit',
                                    style: blackTextStyle.copyWith(
                                      fontSize: 13,
                                      color: isSelectedResting == 1 ? whiteColor : blackColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                customeModal(
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
                                            'Atur durasi istirahat',
                                            style: blackTextStyle.copyWith(fontSize: 20),
                                          ),
                                          Text(
                                            'Berapa lama dokter mau istirahat?.',
                                            style: blackRegulerTextStyle.copyWith(fontSize: 12, color: blackColor),
                                          ),
                                          SizedBox(
                                            height: 50,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Column(
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      if (state.jamStatusDoktor.value != 24) {
                                                        setState(() {
                                                          state.jamStatusDoktor.value++;
                                                        });
                                                      } else {
                                                        setState(() {
                                                          state.jamStatusDoktor.value = 0;
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
                                                        state.jamStatusDoktor.value.toString(),
                                                        style: blackHigtTextStyle.copyWith(fontSize: 30),
                                                      ),
                                                      SizedBox(
                                                        width: 20,
                                                      ),
                                                      Text(
                                                        'Jam',
                                                        style: blackTextStyle.copyWith(fontWeight: FontWeight.normal, fontSize: 14),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 22,
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      if (state.jamStatusDoktor.value <= 0) {
                                                        setState(() {
                                                          state.jamStatusDoktor.value = 0;
                                                        });
                                                      } else {
                                                        setState(() {
                                                          state.jamStatusDoktor.value--;
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
                                                      if (state.menitStatusDoktor.value != 60) {
                                                        setState(() {
                                                          state.menitStatusDoktor.value++;
                                                        });
                                                      } else {
                                                        setState(() {
                                                          state.menitStatusDoktor.value = 0;
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
                                                        state.menitStatusDoktor.value.toString(),
                                                        style: blackHigtTextStyle.copyWith(fontSize: 30),
                                                      ),
                                                      SizedBox(
                                                        width: 20,
                                                      ),
                                                      Text(
                                                        'Menit',
                                                        style: blackTextStyle.copyWith(fontWeight: FontWeight.normal, fontSize: 14),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 22,
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      if (state.menitStatusDoktor.value <= 0) {
                                                        setState(() {
                                                          state.menitStatusDoktor.value = 0;
                                                        });
                                                      } else {
                                                        setState(() {
                                                          state.menitStatusDoktor.value--;
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
                                              onPressed: () {
                                                Navigator.pop(context);
                                                if (state.jamStatusDoktor < 10) {
                                                  setState(() {
                                                    state.formatJamResting.value = '0${state.jamStatusDoktor}';
                                                  });
                                                } else {
                                                  state.formatJamResting.value = '${state.jamStatusDoktor}';
                                                }
                                                if (state.menitStatusDoktor < 10) {
                                                  setState(() {
                                                    state.formatMenitResting.value = '0${state.menitStatusDoktor}';
                                                  });
                                                } else {
                                                  state.formatMenitResting.value = '${state.menitStatusDoktor}';
                                                }
                                                state.formatResting.value = '${state.formatJamResting.value}:${state.formatMenitResting.value}';
                                                print('state.menitStatusDoktor ${state.formatResting.value}');
                                              },
                                              title: 'Konfiramsi',
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  }),
                                ).then(
                                  (value) => setState(() {
                                    isSelectedResting = 2;
                                  }),
                                );
                              },
                              child: Container(
                                width: 81,
                                height: 30,
                                decoration: BoxDecoration(color: isSelectedResting == 2 ? greenColor : Color(0xffECECEC), borderRadius: BorderRadius.circular(7)),
                                child: Center(
                                  child: Text(
                                    'Lainnya',
                                    style: blackTextStyle.copyWith(
                                      fontSize: 13,
                                      color: isSelectedResting == 2 ? whiteColor : blackColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Spacer(),
                    Icon(
                      isSelected == 1 ? Icons.radio_button_on : Icons.circle_outlined,
                      color: isSelected == 1 ? greenColor : blackColor,
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  isSelected = 2;
                  isSelectedResting = -1;
                });
                // onSelectionChanged();
                showDialog<Widget>(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      color: Colors.white,
                      child: SfDateRangePicker(
                        showActionButtons: true,
                        onSelectionChanged: onSelectionChanged,
                        selectionMode: DateRangePickerSelectionMode.range,
                        initialSelectedRange: PickerDateRange(DateTime.now().subtract(const Duration(days: 4)), DateTime.now().add(const Duration(days: 3))),
                        onSubmit: (value) {
                          Get.back();
                        },
                        onCancel: () {
                          Get.back();
                        },
                      ),
                    );
                  },
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 18, horizontal: 11),
                margin: EdgeInsets.only(
                  bottom: 32,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: whiteColor,
                  border: Border.all(
                    color: borderColor,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0.1,
                      blurRadius: 2,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Libur',
                            style: blackTextStyle.copyWith(fontSize: 14),
                          ),
                          Text(
                            'Offline sesuai durasi yang ditentukan.',
                            style: blackRegulerTextStyle.copyWith(fontSize: 12),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/icons/calender-logo.png',
                                width: 14,
                                height: 14,
                                color: blackColor,
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Expanded(
                                child: Text(
                                  'Dari tanggal ${state.restingStartDate} - Sampai tanggal ${state.restingEndDate}',
                                  style: subTitleTextStyle.copyWith(fontSize: 14, fontWeight: regular),
                                  // softWrap: true,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    // Spacer(),
                    Icon(
                      isSelected == 2 ? Icons.radio_button_on : Icons.circle_outlined,
                      color: isSelected == 2 ? greenColor : blackColor,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 53),
              child: ButtonGreenWidget(
                onPressed: () {
                  state.postStatusScheduleDoctor(
                    context,
                    isSelected,
                    duration: state.formatResting.value,
                  );
                },
                title: 'Ubah Status',
              ),
            )
          ],
        ),
      );
    });
  }
}
