// ignore_for_file: must_be_immutable, use_build_context_synchronously, unnecessary_null_comparison

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/transaction/history/history_consultation_controller.dart';
import 'package:heystetik_mobileapps/controller/customer/transaction/history/history_transaction_controller.dart';
import 'package:heystetik_mobileapps/core/convert_date.dart';
import 'package:heystetik_mobileapps/core/currency_format.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/core/open_launchUrl.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/cara_pembayaran_page.dart';
import 'package:heystetik_mobileapps/widget/Text_widget.dart';
import 'package:heystetik_mobileapps/widget/alert_dialog_transaksi.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';
import 'package:heystetik_mobileapps/widget/snackbar_widget.dart';
import 'package:social_share/social_share.dart';
import '../../theme/theme.dart';
import '../../widget/more_dialog_transaksi_widget.dart';
import 'package:heystetik_mobileapps/models/customer/payment_method_by_id_model.dart'
    as Method;

class SelesaikanPembayaranKonsultasiPage extends StatefulWidget {
  bool isWillPop;
  String bankImage;
  String orderId;
  String expireTime;
  int paymentMethodId;
  SelesaikanPembayaranKonsultasiPage({
    required this.isWillPop,
    this.bankImage = '',
    this.orderId = '',
    this.expireTime = '',
    required this.paymentMethodId,
    super.key,
  });

  @override
  State<SelesaikanPembayaranKonsultasiPage> createState() =>
      _SelesaikanPembayaranKonsultasiState();
}

class _SelesaikanPembayaranKonsultasiState
    extends State<SelesaikanPembayaranKonsultasiPage> {
  final HistoryTransactionController all =
      Get.put(HistoryTransactionController());
  final HistoryConsultationController state =
      Get.put(HistoryConsultationController());
  Timer? countdownTimer;
  Duration myDuration = const Duration(hours: 1);
  Method.Data? method;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      state.isLoading.value = true;
      state.expirytime.value = widget.expireTime;
      setState(() {});
      method = await all.getPaymentmethod(context, widget.paymentMethodId);
      setState(() {});
      await state.getTransactionStatus(context, widget.orderId).then((value) {
        state.isLoading.value = false;
        setTime();
        startTimer();
        setState(() {});
      });
      // state.isLoading.value = false;
    });
  }

  setTime() {
    DateTime today = DateTime.now();
    print('expirytime 11 ${state.expirytime.value}');
    if (state.expirytime.value != '' ||
        state.expirytime.value != null ||
        state.expirytime.value.isNotEmpty) {
      print('expirytime 22 ${state.expirytime.value}');
      DateTime tdata = DateTime.parse(state.expirytime.value);
      print('data $tdata');
      var mundur = tdata.difference(today);
      print('mundur $mundur');
      print('inMilliseconds ${mundur.inSeconds}');
      myDuration = Duration(seconds: mundur.inSeconds);
      print('myDuration $myDuration');
    }
  }

  /// Timer related methods ///
  // Step 3
  void startTimer() {
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  // Step 4
  void stopTimer() {
    setState(() => countdownTimer!.cancel());
  }

  // Step 5
  void resetTimer() {
    stopTimer();
    setState(() => myDuration = const Duration(hours: 1));
  }

  // Step 6
  void setCountDown() {
    const reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    // final days = strDigits(myDuration.inDays);
    // Step 7
    final hours = strDigits(myDuration.inHours.remainder(24));
    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));

    Future<bool> onWillPop() async {
      if (widget.isWillPop) {
        showDialog(
          context: context,
          builder: (context) => const AlertDialogTransaksi(),
        );
      } else {
        Get.back();
      }
      return Future.value(false);
    }

    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: greenColor,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              InkWell(
                onTap: () {
                  if (widget.isWillPop) {
                    onWillPop();
                  } else {
                    Get.back();
                  }
                },
                child: Icon(
                  Icons.arrow_back,
                  size: 24,
                  color: whiteColor,
                ),
              ),
              const SizedBox(
                width: 11,
              ),
              Obx(() {
                if (!state.isLoading.value) {
                  return Text(
                    method?.name ?? '',
                    style:
                        whiteTextStyle.copyWith(fontSize: 20, fontWeight: bold),
                  );
                }
                return Container();
              })
            ],
          ),
        ),
        body: Obx(
          () => LoadingWidget(
            isLoading: state.isLoading.value,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        'Selesaikan Pembayaran',
                        style: blackTextStyle.copyWith(fontSize: 18),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: lsymetric,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const TextSpaceBetween(
                                title: 'Batas Akhir Pembayaran',
                                title2: '',
                              ),
                              Obx(
                                () => Text(
                                  state.expirytime.value.isNotEmpty
                                      ? ConvertDate.transactionDate(
                                          state.expirytime.value,
                                        )
                                      : '-',
                                  style: blackTextStyle.copyWith(fontSize: 14),
                                ),
                              )
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              color: const Color(0xffA72424),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/icons/logojam.png',
                                  width: 10,
                                  color: whiteColor,
                                ),
                                const SizedBox(
                                  width: 7,
                                ),
                                Text(
                                  '$hours:$minutes:$seconds',
                                  style: whiteTextStyle.copyWith(fontSize: 13),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    const Divider(
                      thickness: 7,
                      color: Color(0xffECECEC),
                    ),
                    Padding(
                      padding: lsymetric.copyWith(top: 18, bottom: 18),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                method?.name ?? '',
                                style:
                                    blackHigtTextStyle.copyWith(fontSize: 15),
                              ),
                              Image.network(
                                '${Global.FILE}/${method?.mediaPaymentMethod?.media?.path.toString()}',
                                width: 62,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          const Divider(
                            thickness: 1,
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const TextSpaceBetween(
                                    title: 'Klik Bayar untuk pembayaran',
                                    title2: '',
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      await OpenOutSide.launchURL(
                                        state.transactionStatus.value.data!
                                            .actions![0].url
                                            .toString(),
                                      );
                                    },
                                    child: Text(
                                      ' Bayar',
                                      style: grenTextStyle.copyWith(
                                        fontSize: 15,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      SocialShare.copyToClipboard(
                                        text: state.transactionStatus.value.data
                                                ?.transaction?.totalPaid
                                                .toString() ??
                                            "0",
                                      );
                                      SnackbarWidget.getSuccessSnackbar(
                                        context,
                                        "Berhasil",
                                        "Berhasil disalin",
                                      );
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const TextSpaceBetween(
                                          title: 'Total Pembayaran',
                                          title2: '',
                                        ),
                                        Row(
                                          children: [
                                            Obx(
                                              () => Text(
                                                CurrencyFormat.convertToIdr(
                                                    state
                                                            .transactionStatus
                                                            .value
                                                            .data
                                                            ?.transaction
                                                            ?.totalPaid ??
                                                        0,
                                                    0),
                                                style: blackTextStyle.copyWith(
                                                    fontSize: 15),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            Image.asset(
                                              'assets/icons/salin_icons.png',
                                              width: 14,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  InkWell(
                                    onTap: () {
                                      showModalBottomSheet(
                                        context: context,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20)),
                                        ),
                                        builder: (context) =>
                                            TransaksiKonsultasiDialog(
                                          methode: method?.name ?? "",
                                          totalFee: state
                                                  .transactionStatus
                                                  .value
                                                  .data
                                                  ?.transaction
                                                  ?.totalFee ??
                                              0,
                                          tax: state.transactionStatus.value
                                                  .data?.transaction?.tax ??
                                              0,
                                          totalDiscount: state
                                                  .transactionStatus
                                                  .value
                                                  .data
                                                  ?.transaction
                                                  ?.totalDiscount ??
                                              0,
                                          totalPaid: state
                                                  .transactionStatus
                                                  .value
                                                  .data
                                                  ?.transaction
                                                  ?.totalPaid ??
                                              0,
                                          transactionFee: state
                                                  .transactionStatus
                                                  .value
                                                  .data
                                                  ?.transaction
                                                  ?.transactionFee ??
                                              0,
                                          discountPercentage: 0,
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'Lihat Detail',
                                      style:
                                          grenTextStyle.copyWith(fontSize: 14),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          const Divider(
                            thickness: 1,
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(() => CaraPembayaranPage(
                                    id: widget.paymentMethodId,
                                    orderId: widget.orderId,
                                    totalPaid: state.transactionStatus.value
                                            .data?.transaction?.totalPaid ??
                                        0,
                                    transactionType: 'Konsultasi',
                                  ));
                            },
                            child: Center(
                              child: Text(
                                'Lihat Cara Pembayaran',
                                style: grenTextStyle.copyWith(fontSize: 15),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: 7,
                      color: Color(0xffECECEC),
                    ),
                    Padding(
                      padding: lsymetric.copyWith(top: 18),
                      child: Column(
                        children: [
                          Center(
                            child: Text(
                              'Sudah melakukan pembayaran?',
                              style: blackTextStyle.copyWith(fontSize: 18),
                            ),
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          const Text(
                            'Setelah pembayaranmu terkonfirmasi, pihak klinik akan segera menghubungi kamu. Pastikan nomer HP-mu aktif ya :)',
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          ButtonGreenWidget(
                            title: 'Saya sudah melakukan pembayaran',
                            onPressed: () async {
                              await state.getTransactionStatus(
                                context,
                                widget.orderId,
                              );
                            },
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
