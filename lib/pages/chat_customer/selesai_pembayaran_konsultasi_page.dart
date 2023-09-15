// ignore_for_file: must_be_immutable

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/transaction/history/history_consultation_controller.dart';
import 'package:heystetik_mobileapps/core/convert_date.dart';
import 'package:heystetik_mobileapps/core/currency_format.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/cara_pembayaran_page.dart';
import 'package:heystetik_mobileapps/widget/Text_widget.dart';
import 'package:heystetik_mobileapps/widget/alert_dialog_transaksi.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';

import '../../theme/theme.dart';
import '../../widget/more_dialog_transaksi_widget.dart';

class SelesaikanPembayaranKonsultasiPage extends StatefulWidget {
  String bank;
  String orderId;
  String expireTime;
  SelesaikanPembayaranKonsultasiPage({
    this.bank = '',
    this.orderId = '',
    this.expireTime = '',
    super.key,
  });

  @override
  State<SelesaikanPembayaranKonsultasiPage> createState() =>
      _SelesaikanPembayaranKonsultasiState();
}

class _SelesaikanPembayaranKonsultasiState
    extends State<SelesaikanPembayaranKonsultasiPage> {
  final HistoryConsultationController state =
      Get.put(HistoryConsultationController());
  Timer? countdownTimer;
  Duration myDuration = const Duration(hours: 1);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      state.bank.value = widget.bank;
      state.expirytime.value = widget.expireTime;
      await state.getTransactionStatus(context, widget.orderId);
      setTime();
      startTimer();
    });
  }

  _copy() {
    final value = ClipboardData(text: state.virtualAccount.value);
    Clipboard.setData(value);
  }

  setTime() {
    DateTime today = DateTime.now();
    print('now $today');
    print('expirytime ${state.expirytime.value}');
    DateTime tdata = DateTime.parse(state.expirytime.value);
    print('data $tdata');

    var mundur = tdata.difference(today);
    print('mundur $mundur');
    print('inMilliseconds ${mundur.inSeconds}');
    myDuration = Duration(seconds: mundur.inSeconds);
    print('myDuration $myDuration');
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
      showDialog(
        context: context,
        builder: (context) => const AlertDialogTransaksi(),
      );
      return Future.value(false);
    }

    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: greenColor,
          title: Row(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    onWillPop();
                  });
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
              Obx(
                () => Text(
                  state.bank.value.toUpperCase(),
                  style:
                      whiteTextStyle.copyWith(fontSize: 20, fontWeight: bold),
                ),
              ),
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
                              Text(
                                state.expirytime.value.isNotEmpty
                                    ? ConvertDate.transactionDate(
                                        state.expirytime.value,
                                      )
                                    : '-',
                                style: blackTextStyle.copyWith(fontSize: 14),
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
                                state.bank.value.toUpperCase(),
                                style:
                                    blackHigtTextStyle.copyWith(fontSize: 15),
                              ),
                              Image.asset(
                                'assets/images/logo-bca.png',
                                width: 62,
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const TextSpaceBetween(
                                        title: 'Nomor Virtual Account',
                                        title2: '',
                                      ),
                                      SelectableText(
                                        state.virtualAccount.value,
                                        style: blackTextStyle.copyWith(
                                            fontSize: 15),
                                      )
                                    ],
                                  ),
                                  const Spacer(),
                                  InkWell(
                                    onTap: _copy,
                                    child: Text(
                                      'Salin',
                                      style:
                                          grenTextStyle.copyWith(fontSize: 14),
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
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const TextSpaceBetween(
                                        title: 'Total Pembayaran',
                                        title2: '',
                                      ),
                                      Row(
                                        children: [
                                          state.grossAmount.value == '-'
                                              ? Container()
                                              : Text(
                                                  CurrencyFormat.convertToIdr(
                                                      double.parse(state
                                                          .grossAmount.value),
                                                      0),
                                                  style: blackTextStyle
                                                      .copyWith(fontSize: 15),
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
                                            const TransaksiMoreDialog(),
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const CaraPembayaranPage(),
                                ),
                              );
                            },
                            child: Center(
                              child: Text(
                                'Lihat Cara Pembayaran',
                                style: grenTextStyle.copyWith(fontSize: 15),
                              ),
                            ),
                          )
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
                                  context, widget.orderId);
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
