import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/transaction/order/order_treatmetment_controller.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/treatment_controller.dart';
import 'package:heystetik_mobileapps/core/convert_date.dart';
import 'package:heystetik_mobileapps/core/currency_format.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/pages/solution/reservasi3_page.dart';
import 'package:heystetik_mobileapps/widget/alert_dialog.dart';

import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';
import 'package:heystetik_mobileapps/models/customer/treatmet_model.dart';
import '../../theme/theme.dart';

class Reservasi2Page extends StatefulWidget {
  final Data2 treatment;
  const Reservasi2Page({required this.treatment, super.key});

  @override
  State<Reservasi2Page> createState() => _Reservasi2PageState();
}

class _Reservasi2PageState extends State<Reservasi2Page> {
  final TreatmentController stateTreatment = Get.put(TreatmentController());
  final OrderTreatmentController stateOrder =
      Get.put(OrderTreatmentController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      stateTreatment.getDataUser();
      stateTreatment.getClinicDetail(context, widget.treatment.clinicId!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: greenColor,
        title: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back),
            ),
            const SizedBox(
              width: 11,
            ),
            Text(
              'Selesaikan Pesananmu',
              style: whiteTextStyle.copyWith(fontSize: 20, fontWeight: bold),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 29),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 72,
                          height: 72,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(
                                "${Global.FILE}/${widget.treatment.mediaTreatments![0].media!.path}",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 13,
                    ),
                    Container(
                        constraints: const BoxConstraints(maxWidth: 150),
                        child: Text(
                          '${widget.treatment.clinic?.name} ${widget.treatment.clinic?.city?.name}',
                          style: blackHigtTextStyle.copyWith(fontSize: 15),
                        )),
                    const SizedBox(
                      height: 3,
                    ),
                    const Spacer(),
                    const Icon(Icons.keyboard_arrow_right)
                  ],
                ),
                dividergrey(),
                const SizedBox(
                  height: 21,
                ),
                Text(
                  "${widget.treatment.name}",
                  style: blackTextStyle.copyWith(fontSize: 15),
                ),
                const SizedBox(
                  height: 8,
                ),
                Obx(
                  () => Text(
                    '${stateTreatment.pax.value} pax',
                    style: blackRegulerTextStyle.copyWith(fontSize: 15),
                  ),
                ),
                const SizedBox(
                  height: 17,
                ),
                dividergrey(),
                const SizedBox(
                  height: 17,
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/call-icons.svg',
                    ),
                    const SizedBox(
                      width: 17,
                    ),
                    Expanded(
                      child: Text(
                        'Klinik akan langsung menghubungi Anda untuk mengkonfirmasi jadwal kedatangan Anda.',
                        style: blackRegulerTextStyle.copyWith(
                            fontSize: 12, color: blackColor),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/calender-icons.svg',
                    ),
                    const SizedBox(
                      width: 17,
                    ),
                    Expanded(
                      child: Text(
                        'Perubahan terkait jadwal treatment dapat dilakukan dengan langsung menghubungi klinik.',
                        style: blackRegulerTextStyle.copyWith(
                            fontSize: 12, color: blackColor),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/clender2.svg',
                    ),
                    const SizedBox(
                      width: 17,
                    ),
                    Expanded(
                      child: Text(
                        'Tidak bisa refund',
                        style: blackRegulerTextStyle.copyWith(
                            fontSize: 12, color: blackColor),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          const dividergreen(),
          Padding(
            padding: lsymetric.copyWith(top: 27, bottom: 27),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Informasi Pasien',
                  style: blackHigtTextStyle.copyWith(fontSize: 15),
                ),
                const SizedBox(
                  height: 17,
                ),
                const Text(
                  'Nama Pasien',
                ),
                const SizedBox(
                  height: 3,
                ),
                Obx(
                  () => Text(
                    stateTreatment.fullName.value,
                    style: blackHigtTextStyle.copyWith(fontSize: 15),
                  ),
                ),
                dividergrey(),
                const SizedBox(
                  height: 24,
                ),
                const Text(
                  'No. HP Aktif',
                ),
                const SizedBox(
                  height: 3,
                ),
                Obx(
                  () => Text(
                    stateTreatment.phone.value,
                    style: blackHigtTextStyle.copyWith(fontSize: 15),
                  ),
                ),
                dividergrey(),
              ],
            ),
          ),
          const dividergreen(),
          Padding(
            padding: lsymetric.copyWith(top: 27),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Jadwal Kedatangan',
                  style: blackHigtTextStyle.copyWith(fontSize: 15),
                ),
                const SizedBox(
                  height: 6,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/icons/alert.png',
                        width: 15,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        'Tanggal dan waktu mengikuti zona waktu klinik',
                        style: subTitleTextStyle,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Jam Kedatangan',
                  style: blackRegulerTextStyle.copyWith(fontSize: 15),
                ),
                SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          stateOrder.selectDate(context);
                        },
                        child: Image.asset(
                          'assets/icons/calender-logo.png',
                          color: greenColor,
                          width: 20,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Obx(
                        () => Text(
                          stateOrder.arrivalDate.value != ''
                              ? ConvertDate.normalDate(
                                  stateOrder.arrivalDate.value)
                              : 'Atur tanggal terlebih dahulu',
                          style: blackTextStyle.copyWith(fontSize: 14),
                        ),
                      )
                    ],
                  ),
                ),
                dividergrey(),
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            stateOrder.selectTime(context, '1');
                          },
                          child: Image.asset(
                            'assets/icons/logojam.png',
                            color: greenColor,
                            width: 23,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Obx(
                          () => Text(
                            stateOrder.arrivalTimeFirst.value != ''
                                ? stateOrder.arrivalTimeFirst.value
                                : 'Atur jam terlebih dahulu',
                            style: blackTextStyle.copyWith(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                    dividergrey(),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            stateOrder.selectTime(context, '2');
                          },
                          child: Image.asset(
                            'assets/icons/logojam.png',
                            color: greenColor,
                            width: 23,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Obx(
                          () => Text(
                            stateOrder.arrivalTimeLast.value != ''
                                ? stateOrder.arrivalTimeLast.value
                                : 'Atur jam terlebih dahulu',
                            style: blackTextStyle.copyWith(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                    dividergrey(),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 25,
        ),
        height: 149,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total Perawatan',
              style: blackRegulerTextStyle,
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Text(
                  CurrencyFormat.convertToIdr(
                      widget.treatment.price! * stateTreatment.pax.value, 0),
                  style: blackHigtTextStyle.copyWith(fontSize: 20),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            ButtonGreenWidget(
              title: 'Lanjutkan Pembayaran',
              onPressed: () {
                if (stateOrder.arrivalDate.value == '' ||
                    stateOrder.arrivalTimeFirst.value == '' ||
                    stateOrder.arrivalTimeLast.value == '') {
                  showDialog(
                    context: context,
                    builder: (context) => AlertWidget(
                        subtitle:
                            'Atur Tanggal dan Jam kedatangan harus diisi'),
                  );
                  return;
                }

                if (cekJadwal()) {
                  Get.to(
                    Resevasi3Page(
                      pax: stateTreatment.pax.value,
                      tgl: ConvertDate.normalDate(stateOrder.arrivalDate.value),
                      treatment: widget.treatment,
                    ),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }

  bool cekJadwal() {
    var cek = stateTreatment
        .responseClinicDetail.value.data!.clinicOperationHours!
        .firstWhereOrNull(
      (element) =>
          element.day == ConvertDate.dayOnly(stateOrder.arrivalDate.value),
    );

    if (cek == null) {
      print("TIDAK ADA JADWAL PADA HARI YG ANDA PILIH");
      showDialog(
        context: context,
        builder: (context) =>
            AlertWidget(subtitle: 'Jadwal tidak sesuai dengan jadwal klinik'),
      );
      return false;
    } else {
      if (cek.isActive!) {
        DateTime pilihJamAwal = DateTime.parse(
            '2023-08-03T${stateOrder.arrivalTimeFirst.value.substring(0, 5)}');
        // print('pilihJamAwal $pilihJamAwal');
        DateTime jadwalJamAwal =
            DateTime.parse('2023-08-03T${cek.startTime!.substring(11, 16)}');
        // print('jadwalJamAwal $jadwalJamAwal');

        DateTime pilihJamAkhir = DateTime.parse(
            '2023-08-03T${stateOrder.arrivalTimeLast.value.substring(0, 5)}');
        // print('pilihJamAkhir $pilihJamAkhir');
        DateTime jadwalJamAkhir =
            DateTime.parse('2023-08-03T${cek.endTime!.substring(11, 16)}');
        // print('jadwalJamAkhir $jadwalJamAkhir');

        bool awalIsAfter = pilihJamAwal.isAfter(jadwalJamAwal);
        // print("awalIsAfter $awalIsAfter");
        bool awalIsBefore = pilihJamAwal.isBefore(jadwalJamAkhir);
        // print("awalIsBefore $awalIsBefore");

        bool akhirIsBefore = pilihJamAkhir.isBefore(jadwalJamAkhir);
        // print("akhirIsBefore $akhirIsBefore");
        bool akhirIsAfter = pilihJamAkhir.isAfter(jadwalJamAwal);
        // print("akhirIsAfter $akhirIsAfter");
        if (pilihJamAwal.isBefore(pilihJamAkhir)) {
          if (awalIsAfter && awalIsBefore && akhirIsAfter && akhirIsBefore) {
            print("JADWAL AMANN");
            return true;
          } else {
            String aa = stateOrder.arrivalTimeFirst.value.substring(0, 5);
            String bb = stateOrder.arrivalTimeLast.value.substring(0, 5);
            String cc = cek.startTime!.substring(11, 16);
            String dd = cek.endTime!.substring(11, 16);
            if (aa == cc && bb == dd) {
              print("JADWAL AWAL DAN AKHIR SAMA, MASIH AMAN");
              return true;
            } else {
              showDialog(
                context: context,
                builder: (context) => AlertWidget(
                    subtitle: 'Jadwal tidak sesuai dengan jadwal klinik'),
              );
              print("JADWAL TIDAK AMANN");
              return false;
            }
          }
        } else {
          showDialog(
            context: context,
            builder: (context) => AlertWidget(
                subtitle: 'Jam awal tidak boleh lewat dari jam akhir'),
          );
          print("JADWAL TIDAK AMANN");
          return false;
        }
      } else {
        print("JADWAL LIBUR / TIDAK AKTIF");
        showDialog(
          context: context,
          builder: (context) =>
              AlertWidget(subtitle: 'Jadwal tidak sesuai dengan jadwal klinik'),
        );
        return false;
      }
    }
  }
}
