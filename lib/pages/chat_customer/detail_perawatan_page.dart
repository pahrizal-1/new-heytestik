import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/chat/chat_controller.dart';
import 'package:heystetik_mobileapps/core/convert_date.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/invoic_hestetik.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';

import '../../theme/theme.dart';
import '../../widget/Text_widget.dart';

class DetailPerawatanPage extends StatefulWidget {
  final int? id;
  const DetailPerawatanPage({required this.id, super.key});

  @override
  State<DetailPerawatanPage> createState() => _DetailPerawatanPageState();
}

class _DetailPerawatanPageState extends State<DetailPerawatanPage> {
  final CustomerChatController state = Get.put(CustomerChatController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      state.detailConsultation(context, widget.id!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => LoadingWidget(
          isLoading: state.isLoading.value,
          child: Padding(
            padding: lsymetric.copyWith(top: 21),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Info Konsultasi',
                  style: blackHigtTextStyle.copyWith(fontSize: 15),
                ),
                const SizedBox(
                  height: 9,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Status Konsultasi',
                      style: subGreyTextStyle,
                    ),
                    Obx(
                      () => Container(
                        height: 30,
                        width: 80,
                        decoration: BoxDecoration(
                          color: state.data.value.status == 'AKTIF' ||
                                  state.data.value.status == 'SELESAI'
                              ? greenColor
                              : orangeColor,
                          borderRadius: BorderRadius.circular(42),
                        ),
                        child: Center(
                          child: Text(
                            state.data.value.status ?? '-',
                            style: whiteTextStyle,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Obx(
                  () => TextBoldSpacebetwen(
                    title: 'ID Konsultasi',
                    title2: state.data.value.code ?? '-',
                    title1: '',
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Obx(
                          () => Text(
                            state.data.value.transactionConsultation
                                    ?.consultationInvoice?.invoiceNumber ??
                                '-',
                            style: subGreyTextStyle.copyWith(
                                fontSize: 15,
                                color: const Color(0XFF323232),
                                fontWeight: regular),
                          ),
                        ),
                        SizedBox(
                          width: 9,
                        ),
                        Image.asset(
                          'assets/icons/salin_icons.png',
                          width: 12,
                          height: 12,
                          color: blackColor,
                        )
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        Get.to(InvoiceHeystetikPage());
                      },
                      child: Text(
                        'Lihat Invoice',
                        style: grenTextStyle.copyWith(fontSize: 14),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Obx(
                  () => TextBoldSpacebetwen(
                    title: 'Tanggal',
                    title2: ConvertDate.defaultDate(
                        state.data.value.createdAt ?? ''),
                    title1: '',
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Obx(
                  () => TextBoldSpacebetwen(
                    title: 'Masa Aktif',
                    title2:
                        ConvertDate.defaultDate(state.data.value.endDate ?? ''),
                    title1: '',
                  ),
                ),
                const SizedBox(
                  height: 46,
                ),
                Text(
                  'Info Pasien',
                  style: blackHigtTextStyle.copyWith(fontSize: 15),
                ),
                const SizedBox(
                  height: 8,
                ),
                Obx(
                  () => TextBoldSpacebetwen(
                    title: 'Nama Pasien',
                    title2: state.data.value.customer?.fullname ?? '-',
                    title1: '',
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Obx(
                  () => TextBoldSpacebetwen(
                    title: 'Topik Keluhan',
                    title2: state.data.value.medicalHistory?.interestCondition
                            ?.name ??
                        '-',
                    title1: '',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
