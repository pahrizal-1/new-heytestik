// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/convert_date.dart';
import 'package:heystetik_mobileapps/core/currency_format.dart';
import 'package:heystetik_mobileapps/core/current_time.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';

import '../../controller/customer/chat/chat_controller.dart';
import '../../theme/theme.dart';

class InvoiceHeystetikPage extends StatelessWidget {
  InvoiceHeystetikPage({super.key});
  final CustomerChatController state = Get.put(CustomerChatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        automaticallyImplyLeading: false,
        backgroundColor: whiteColor,
        title: Padding(
          padding: const EdgeInsets.only(left: 6),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: blackColor,
                ),
              ),
              const SizedBox(
                width: 11,
              ),
              Text(
                'Invoice Heystetik',
                style: blackHigtTextStyle.copyWith(fontSize: 20),
              )
            ],
          ),
        ),
        actions: [
          InkWell(
              onTap: () {},
              child: Image.asset(
                'assets/icons/download-icons.png',
                width: 24,
                height: 24,
              )),
          const SizedBox(
            width: 26,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/icons/logo-hestetikc.png',
                        width: 113,
                        height: 27,
                      ),
                      Text(
                        'INVOICE',
                        style: blackHigtTextStyle.copyWith(fontSize: 13),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    'Invoice Konsultasi',
                    style: blackTextStyle.copyWith(fontSize: 9.24),
                  ),
                  Text(
                    'Invoice ini merupakan bukti pembayaran yang sah.',
                    style: blackTextStyle.copyWith(fontSize: 8),
                  ),
                  const SizedBox(height: 15),
                  Obx(
                    () => Text(
                      '${state.data.value.transactionConsultation?.consultationInvoice?.doctorName ?? '-'}\nNPWP: ${state.data.value.transactionConsultation?.consultationInvoice?.doctorNpwp ?? '-'}',
                      style: blackHigtTextStyle.copyWith(fontSize: 8),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Alamat',
                    style: blackRegulerTextStyle.copyWith(fontSize: 8),
                  ),
                  Obx(
                    () => Text(
                      state.data.value.transactionConsultation
                              ?.consultationInvoice?.doctorAddress ??
                          '-',
                      style: blackTextStyle.copyWith(fontSize: 8),
                    ),
                  ),
                ],
              ),
            ),
            dividergrey(),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 24, right: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Obx(
                        () => RichText(
                          text: TextSpan(
                            text: 'Untuk ',
                            style: blackRegulerTextStyle.copyWith(
                              fontSize: 8,
                              color: blackColor,
                            ),
                            children: [
                              TextSpan(
                                text: state.data.value.transactionConsultation
                                        ?.consultationInvoice?.customerName ??
                                    '-',
                                style: blackHigtTextStyle.copyWith(fontSize: 8),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Spacer(),
                      Text(
                        state.data.value.transactionConsultation
                                ?.consultationInvoice?.invoiceNumber ??
                            '-',
                        style: blackTextStyle.copyWith(fontSize: 8),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Obx(
                        () => RichText(
                          text: TextSpan(
                            text: 'NPWP ',
                            style: blackRegulerTextStyle.copyWith(
                              fontSize: 8,
                              color: blackColor,
                            ),
                            children: [
                              TextSpan(
                                text: state.data.value.transactionConsultation
                                        ?.consultationInvoice?.customerNpwp ??
                                    '-',
                                style: blackHigtTextStyle.copyWith(fontSize: 8),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: borderColor)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 7, top: 7, bottom: 7, right: 7),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Obx(
                                () => RichText(
                                  text: TextSpan(
                                    text: 'ID Konsultasi ',
                                    style: blackRegulerTextStyle.copyWith(
                                      fontSize: 8,
                                      color: blackColor,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: state
                                                .data
                                                .value
                                                .transactionConsultation
                                                ?.consultationInvoice
                                                ?.consultationId ??
                                            '-',
                                        style: blackHigtTextStyle.copyWith(
                                            fontSize: 8),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Obx(
                                () => RichText(
                                  text: TextSpan(
                                    text: 'Tanggal Konsultasi ',
                                    style: blackRegulerTextStyle.copyWith(
                                      fontSize: 8,
                                      color: blackColor,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: ConvertDate.defaultDate(state
                                                .data
                                                .value
                                                .transactionConsultation
                                                ?.consultationInvoice
                                                ?.consultationDate ??
                                            ''),
                                        style: blackHigtTextStyle.copyWith(
                                            fontSize: 8),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  dividergrey(),
                  const SizedBox(
                    height: 12,
                  ),
                  dividergrey(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'DETAIL TRANSAKSI',
                        style: blackTextStyle.copyWith(fontSize: 7.872),
                      ),
                      Text(
                        'TOTAL',
                        style: blackTextStyle.copyWith(fontSize: 7.872),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  dividergrey(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(
                        () => Text(
                          'Konsultasi dengan ${state.data.value.transactionConsultation?.consultationInvoice?.doctorName ?? '-'}\nSIP No.503/053/DPMPTSP/DU/2020',
                          style:
                              blackRegulerTextStyle.copyWith(fontSize: 7.872),
                        ),
                      ),
                      Obx(
                        () => Text(
                          CurrencyFormat.convertToIdr(
                              state.data.value.transactionConsultation
                                      ?.consultationInvoice?.totalFee ??
                                  0,
                              0),
                          style:
                              blackRegulerTextStyle.copyWith(fontSize: 7.872),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Subtotal\nDiskon',
                        style: blackRegulerTextStyle.copyWith(fontSize: 7.872),
                      ),
                      const SizedBox(
                        width: 28,
                      ),
                      Obx(
                        () => Text(
                          '${CurrencyFormat.convertToIdr(state.data.value.transactionConsultation?.consultationInvoice?.totalFee ?? 0, 0)}\n${CurrencyFormat.convertToIdr(state.data.value.transactionConsultation?.consultationInvoice?.totalDiscount ?? 0, 0)}',
                          style:
                              blackRegulerTextStyle.copyWith(fontSize: 7.872),
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 23,
                    padding: const EdgeInsets.only(right: 8),
                    color: const Color(0xffF1F1F1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Total',
                          style: blackTextStyle.copyWith(
                            fontSize: 8,
                          ),
                        ),
                        const SizedBox(
                          width: 34,
                        ),
                        Obx(
                          () => Text(
                            CurrencyFormat.convertToIdr(
                                state.data.value.transactionConsultation
                                        ?.consultationInvoice?.totalPaid ??
                                    0,
                                0),
                            style: blackRegulerTextStyle.copyWith(
                              fontSize: 8,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Obx(
                    () => Text(
                      'Invoice ini tidak membutuhkan stempel atau tanda tangan basah dan dibuat pada ${ConvertDate.defaultDate(state.data.value.transactionConsultation?.consultationInvoice?.createdAt ?? '')} pukul ${CurrentTime.timeChat(state.data.value.transactionConsultation?.consultationInvoice?.createdAt ?? '')}',
                      style: blackRegulerTextStyle.copyWith(
                          fontSize: 8, fontStyle: FontStyle.italic),
                    ),
                  ),
                  const SizedBox(
                    height: 23,
                  ),
                  Center(
                    child: RichText(
                      text: TextSpan(
                          text: 'Butuh bantuan? Hubungi kami di',
                          style: blackRegulerTextStyle.copyWith(fontSize: 8),
                          children: [
                            TextSpan(
                              text: ' info@heystetik.com',
                              style: grenTextStyle.copyWith(
                                fontSize: 8,
                                fontWeight: regular,
                              ),
                            )
                          ]),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
