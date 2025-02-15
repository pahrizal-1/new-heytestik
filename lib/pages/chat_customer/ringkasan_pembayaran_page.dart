// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/transaction/order/order_consultation_controller.dart';
import 'package:heystetik_mobileapps/core/currency_format.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/konsultasi_promo_page.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/selesai_pembayaran_konsultasi_page.dart';
import 'package:heystetik_mobileapps/pages/tabbar/tabbar_customer.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/alert_dialog.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';
import 'package:heystetik_mobileapps/widget/card_bank_widgets.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';
import 'package:heystetik_mobileapps/widget/more_dialog_transaksi_widget.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:heystetik_mobileapps/models/customer/interest_conditions_model.dart';

class RingkasanPembayaranPage extends StatefulWidget {
  final int? interestConditionId;
  Data detail;
  RingkasanPembayaranPage(
      {required this.interestConditionId, required this.detail, super.key});

  @override
  State<RingkasanPembayaranPage> createState() =>
      _RingkasanPembayaranPageState();
}

class _RingkasanPembayaranPageState extends State<RingkasanPembayaranPage> {
  final OrderConsultationController state =
      Get.put(OrderConsultationController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      state.initPayment(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        elevation: 0,
        backgroundColor: greenColor,
        title: Row(
          children: [
            Text(
              'Ringkasan Pembayaran',
              style: whiteTextStyle.copyWith(fontSize: 20, fontWeight: bold),
            ),
            Spacer(),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TabBarCustomer(),
                  ),
                );
              },
              child: Image.asset(
                'assets/icons/icon-home-chat.png',
                width: 18,
              ),
            ),
            SizedBox(
              width: 16,
            )
          ],
        ),
      ),
      body: Obx(
        () => LoadingWidget(
          isLoading: state.isLoading.value,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: lsymetric.copyWith(top: 23),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LinearPercentIndicator(
                        linearStrokeCap: LinearStrokeCap.butt,
                        animation: true,
                        lineHeight: 6,
                        padding: EdgeInsets.all(1),
                        percent: 1,
                        progressColor: greenColor,
                        backgroundColor: greenColor,
                      ),
                      const SizedBox(
                        height: 13,
                      ),
                      Text(
                        'Cek Pesanan',
                        style: grenTextStyle.copyWith(fontSize: 15),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        'Terima kasih sudah mengisi data dirimu :)\nSilakan selesaikan pembayaranmu untuk\nmemulai konsultasi dengan Dokter.',
                        style: subGreyTextStyle.copyWith(
                            fontSize: 15,
                            color: Color(0XFF323232),
                            fontWeight: regular),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                const Divider(
                  thickness: 6,
                  color: Color(0xffECECEC),
                ),
                Padding(
                  padding: lsymetric.copyWith(top: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Konsultasi untuk',
                        style: subGreyTextStyle.copyWith(
                            fontSize: 15,
                            color: Color(0XFF323232),
                            fontWeight: regular),
                      ),
                      Obx(
                        () => Text(
                          state.fullName.value,
                          style: blackHigtTextStyle.copyWith(fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: lsymetric.copyWith(top: 18, bottom: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Biaya Sesi',
                            style: subGreyTextStyle.copyWith(
                                fontSize: 15,
                                color: Color(0XFF323232),
                                fontWeight: regular),
                          ),
                          Text(
                            ' 30 Menit',
                            style: blackHigtTextStyle.copyWith(fontSize: 15),
                          ),
                        ],
                      ),
                      Obx(
                        () => Text(
                          CurrencyFormat.convertToIdr(state.totalFee.value, 0),
                          style: blackHigtTextStyle.copyWith(fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  thickness: 6,
                  color: Color(0xffECECEC),
                ),
                Padding(
                  padding: lsymetric.copyWith(top: 18, bottom: 18),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => KonsultasiPromoPage(),
                        ),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(12),
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: whiteColor,
                        border: Border.all(
                          color: Color(0xffCCCCCC),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          Image.asset('assets/icons/persen_icons.png'),
                          SizedBox(
                            width: 10,
                          ),
                          Obx(() {
                            if (state.voucherName.value.isNotEmpty) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    state.voucherName.value,
                                    style: blackTextStyle.copyWith(
                                      fontSize: 12,
                                      fontWeight: medium,
                                    ),
                                  ),
                                  Text(
                                    '1 voucher dipakai',
                                    style: subTitleTextStyle.copyWith(
                                        fontSize: 13),
                                  ),
                                ],
                              );
                            } else {
                              return Text(
                                'Pakai Voucher',
                                style: blackTextStyle.copyWith(
                                  fontSize: 12,
                                  fontWeight: medium,
                                ),
                              );
                            }
                          }),
                          Spacer(),
                          Icon(
                            Icons.keyboard_arrow_right,
                            size: 25,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                CardKonsultasiBank(),
                const Divider(
                  thickness: 6,
                  color: Color(0xffECECEC),
                ),
                Padding(
                  padding: lsymetric.copyWith(top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total Harga',
                        style: blackTextStyle.copyWith(
                          fontSize: 15,
                          fontWeight: medium,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            backgroundColor: whiteColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20)),
                            ),
                            builder: (context) => Obx(
                              () => TransaksiKonsultasiDialog(
                                methode: state.paymentType.value,
                                totalFee: state.totalFee.value.round(),
                                tax: state.tax.value.round(),
                                totalDiscount:
                                    state.totalDiscount.value.round(),
                                totalPaid: state.totalPaid.value.round(),
                                transactionFee:
                                    state.transactionFee.value.round(),
                                discountPercentage:
                                    state.discountPercentage.value,
                              ),
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            Obx(
                              () => Text(
                                CurrencyFormat.convertToIdr(
                                    state.totalPaid.value, 0),
                                style: blackHigtTextStyle.copyWith(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_up,
                              size: 30,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Obx(
                        () => LoadingWidget(
                          isLoading: state.isMinorLoading.value,
                          child: ButtonGreenWidget(
                            title: 'Bayar',
                            onPressed: () async {
                              if (state.paymentMethod.isEmpty ||
                                  state.paymentType.isEmpty) {
                                return await showDialog(
                                  context: context,
                                  builder: (context) => AlertWidget(
                                    subtitle:
                                        'Harap pilih metode pembayaran terlebih dahulu',
                                  ),
                                );
                              }

                              await state.order(
                                context,
                                widget.interestConditionId!.toInt(),
                                isWajah: widget.detail.concern?.segment ==
                                    "Korektif Wajah",
                                doInPost: () async {
                                  Get.offAll(SelesaikanPembayaranKonsultasiPage(
                                    isWillPop: true,
                                    orderId: state.orderId.value,
                                    // bank: state.bank.value,
                                    bankImage: state.bankImage.value,
                                    expireTime: state.expireTime.value,
                                    paymentMethodId: state.idPayment.value,
                                  ));
                                },
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
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
