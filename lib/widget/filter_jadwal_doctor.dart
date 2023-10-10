import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';
import 'package:heystetik_mobileapps/widget/show_modal_dialog.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class FilterJadwalDoctor extends StatefulWidget {
  const FilterJadwalDoctor({
    super.key,
  });

  @override
  State<FilterJadwalDoctor> createState() => _FilterJadwalDoctorState();
}

class _FilterJadwalDoctorState extends State<FilterJadwalDoctor> {
  int isSelected = -1;
  @override
  Widget build(BuildContext context) {
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
            style:
                blackRegulerTextStyle.copyWith(fontSize: 12, color: blackColor),
          ),
          SizedBox(
            height: 22,
          ),
          InkWell(
            onTap: () {
              setState(() {
                isSelected = 0;
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
                          Text(
                            'Jadwal hari ini 10:00 - 12:00, 19:00 - 21:00',
                            style: blackRegulerTextStyle.copyWith(fontSize: 12),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            'Edit',
                            style: grenTextStyle.copyWith(fontSize: 12),
                          )
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  Icon(
                    isSelected == 0
                        ? Icons.radio_button_on
                        : Icons.circle_outlined,
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
                          Container(
                            width: 81,
                            height: 30,
                            margin: EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                                color: Color(0xffECECEC),
                                borderRadius: BorderRadius.circular(7)),
                            child: Center(
                              child: Text(
                                '30 Menit',
                                style: blackTextStyle.copyWith(fontSize: 13),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              customeshomodal(
                                  context,
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20, top: 24),
                                    child: Wrap(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
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
                                          style: blackTextStyle.copyWith(
                                              fontSize: 20),
                                        ),
                                        Text(
                                          'Berapa lama dokter mau istirahat?.',
                                          style: blackRegulerTextStyle.copyWith(
                                              fontSize: 12, color: blackColor),
                                        ),
                                        SizedBox(
                                          height: 22,
                                        ),
                                      ],
                                    ),
                                  ));
                            },
                            child: Container(
                              width: 81,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: Color(0xffECECEC),
                                  borderRadius: BorderRadius.circular(7)),
                              child: Center(
                                child: Text(
                                  'Lainnya',
                                  style: blackTextStyle.copyWith(fontSize: 13),
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
                    isSelected == 1
                        ? Icons.radio_button_on
                        : Icons.circle_outlined,
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
              });
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
                  Column(
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
                          Text(
                            'Dari tanggal - Sampai tanggal',
                            style: subTitleTextStyle.copyWith(
                                fontSize: 14, fontWeight: regular),
                          ),
                        ],
                      )
                    ],
                  ),
                  Spacer(),
                  Icon(
                    isSelected == 2
                        ? Icons.radio_button_on
                        : Icons.circle_outlined,
                    color: isSelected == 2 ? greenColor : blackColor,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 53),
            child: ButtonGreenWidget(
              title: 'Ubah status',
            ),
          )
        ],
      ),
    );
  }
}
