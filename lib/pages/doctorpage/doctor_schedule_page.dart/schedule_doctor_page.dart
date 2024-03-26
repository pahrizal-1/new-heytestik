import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/pages/doctorpage/doctor_schedule_page.dart/change_scehdule_doctor_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:intl/intl.dart';

import '../../../controller/doctor/schedule/schedule_doctor_controller.dart';
import '../../../core/string_name.dart';
import '../../../models/doctor/doctor_schedule_model.dart' as DoctorItemModel;

class ScheduleDoctorPage extends StatefulWidget {
  const ScheduleDoctorPage({super.key});

  @override
  State<ScheduleDoctorPage> createState() => _ScheduleDoctorPageState();
}

class _ScheduleDoctorPageState extends State<ScheduleDoctorPage> {
  final ScheduleDoctorController state = Get.put(ScheduleDoctorController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      state.getListStatusSchedule(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 20),
              child: Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.arrow_back,
                      size: 30,
                    ),
                  ),
                  SizedBox(
                    width: 9,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Atur Jadwal Konsultasi Dokter',
                        style: blackHigtTextStyle.copyWith(fontSize: 20),
                      ),
                      Text(
                        'Atur jadwal biar pasien bisa konsultasi dengan dokter',
                        style: subTitleTextStyle.copyWith(fontSize: 12),
                      )
                    ],
                  )
                ],
              ),
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: state.scheduleWeekModel.value.data?.length ?? 0,
                itemBuilder: (context, index) {
                  String subName = getInitials(state.scheduleWeekModel.value.data?[index].day ?? '-');
                  String timeRangesString = state.scheduleWeekModel.value.data?[index].startEndTime ?? '';

                  // Remove square brackets
                  timeRangesString = timeRangesString.replaceAll('[', '').replaceAll(']', '');

                  // Split the string by comma to get individual time ranges
                  List<String> timeRanges = timeRangesString.split(',');

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          // height: 71,
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              width: 2,
                              color: Color(
                                0xffECECEC,
                              ),
                            ),
                          ),
                          child: Row(
                            children: [
                              Text(
                                subName,
                                style: TextStyle(letterSpacing: 1.5, fontFamily: 'ProximaNova', fontWeight: bold, fontSize: 25, color: greenColor),
                              ),
                              SizedBox(
                                width: 17,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    state.scheduleWeekModel.value.data?[index].day ?? '',
                                    style: TextStyle(letterSpacing: 1.5, fontFamily: 'ProximaNova', fontWeight: bold, fontSize: 17, color: blackColor),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  // for (var i in time)
                                  Column(
                                    children: state.scheduleWeekModel.value.data![index].doctorScheduleTimes!
                                        .map(
                                          (e) => Text(
                                            '${DateFormat('HH:mm').format(
                                              DateTime.parse('${e.startTime}').toUtc().add(
                                                    Duration(hours: 7, minutes: 00),
                                                  ),
                                            )} WIB - ${DateFormat('HH:mm').format(
                                              DateTime.parse('${e.endTime}').toUtc().add(
                                                    Duration(hours: 7, minutes: 00),
                                                  ),
                                            )} WIB',
                                          ),
                                        )
                                        .toList(),
                                  )
                                ],
                              ),
                              Spacer(),
                              InkWell(
                                  onTap: () {
                                    print('index ${state.scheduleWeekModel.value.data![index].doctorScheduleTimes.runtimeType}');
                                    String name = '';
                                    List dummy = [];
                                    state.scheduleWeekModel.value.data?[index].doctorScheduleTimes!.map((e) {
                                      name = e.startTime.toString();
                                      dummy.add(e.toJson());
                                    }).toList();

                                    print('name ${name}');
                                    print('dumy ${dummy}');

                                    Get.to(ChangeScheduleDoctorPage(
                                      title: state.scheduleWeekModel.value.data?[index].day ?? '',
                                      timeStart: dummy,
                                      dayNumber: state.scheduleWeekModel.value.data?[index].dayNumber?.toInt() ?? 0,
                                    ))?.then((value) {
                                      state.getListStatusSchedule(context);
                                      state.mulaiScheduleWeek = [];
                                      state.selesaiScheduleWeek = [];
                                      state.changeSelesaiJamMinute = [];
                                    });
                                  },
                                  child: Text(
                                    'Ubah',
                                    style: grenTextStyle.copyWith(fontSize: 14),
                                  )),
                              SizedBox(
                                width: 14,
                              ),
                            ],
                          ),
                        ),
                      ),
                      // CardSchedule(
                      //   mark: subName,
                      //   title: state.scheduleWeekModel.value.data?[index].day ?? '',
                      //   time: name,
                      // ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  );
                })
          ],
        ),
      ),
    );
  }
}
