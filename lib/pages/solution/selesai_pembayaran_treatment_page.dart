import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/transaction/history/history_treatment_controller.dart';
import 'package:heystetik_mobileapps/core/convert_date.dart';
import 'package:heystetik_mobileapps/core/currency_format.dart';
import 'package:heystetik_mobileapps/widget/alert_dialog_transaksi.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';
import 'package:heystetik_mobileapps/models/customer/treatmet_model.dart';
import '../../theme/theme.dart';
import '../../widget/Text_widget.dart';
import '../chat_customer/cara_pembayaran_page.dart';

// ignore: must_be_immutable
class SelesaikanPembayaranTreatmentPage extends StatefulWidget {
  String bank;
  String orderId;
  String expireTime;
  final Data2 treatment;
  SelesaikanPembayaranTreatmentPage(
      {this.bank = '',
      this.orderId = '',
      this.expireTime = '',
      required this.treatment,
      super.key});

  @override
  State<SelesaikanPembayaranTreatmentPage> createState() =>
      _SelesaikanPembayaranTreatmentPageState();
}

class _SelesaikanPembayaranTreatmentPageState
    extends State<SelesaikanPembayaranTreatmentPage> {
  final HistoryTreatmentController state =
      Get.put(HistoryTreatmentController());
  Timer? countdownTimer;
  Duration myDuration = const Duration(hours: 1);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await state.getTransactionStatus(context, widget.orderId);
      setTime();
      startTimer();
    });
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

  Future<bool> onWillPop() async {
    showDialog(
      context: context,
      builder: (context) => const AlertDialogTransaksi(),
    );
    return Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    // final days = strDigits(myDuration.inDays);
    // Step 7
    final hours = strDigits(myDuration.inHours.remainder(24));
    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));

    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: greenColor,
          title: Row(
            children: [
              Text(
                state.bank.value.toUpperCase(),
                style: whiteTextStyle.copyWith(fontSize: 20, fontWeight: bold),
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
                                state.expirytime.value != '-'
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
                                  Text(
                                    'Salin',
                                    style: grenTextStyle.copyWith(fontSize: 14),
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
                                        isDismissible: false,
                                        context: context,
                                        backgroundColor: Colors.white,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadiusDirectional.only(
                                            topEnd: Radius.circular(25),
                                            topStart: Radius.circular(25),
                                          ),
                                        ),
                                        builder: (context) =>
                                            PesananTreatmentMoreDialog(
                                          treatment: widget.treatment,
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
                              Get.to(const CaraPembayaranPage());
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
                            'Setelah pembayaranmu terkonfirmasi, pihak klinik akan segera menghubungi kamu.Pastikan nomer HP-mu aktif ya :)',
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
                          ),
                          // const SizedBox(
                          //   height: 7,
                          // ),
                          // Container(
                          //   decoration: BoxDecoration(
                          //       border: Border.all(color: borderColor),
                          //       borderRadius: BorderRadius.circular(8)),
                          //   width: MediaQuery.of(context).size.width,
                          //   height: 51,
                          //   child: TextButton(
                          //     onPressed: () {
                          //       // Navigator.push(
                          //       //   context,
                          //       //   MaterialPageRoute(
                          //       //     builder: (context) => Resevasi3Page(),
                          //       //   ),
                          //       // );
                          //     },
                          //     style: TextButton.styleFrom(
                          //       backgroundColor: whiteColor,
                          //     ),
                          //     child: Text(
                          //       'Ganti metode pembayaran',
                          //       style: TextStyle(
                          //         fontSize: 16,
                          //         color: blackColor,
                          //         fontWeight: bold,
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
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

class PesananTreatmentMoreDialog extends StatelessWidget {
  final Data2 treatment;
  PesananTreatmentMoreDialog({
    Key? key,
    required this.treatment,
  }) : super(key: key);
  final HistoryTreatmentController state =
      Get.put(HistoryTreatmentController());
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 25, right: 25, top: 36, bottom: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/icons/danger-icons.png',
                      width: 20,
                    ),
                  ),
                  const SizedBox(
                    width: 19,
                  ),
                  Text(
                    'Detail Harga',
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 22,
              ),
              Text(
                'Klinik Utama Lithea Jakarta Selatan',
                style: blackTextStyle.copyWith(
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 13,
              ),
              Text(
                'Harga',
                style: subTitleTextStyle.copyWith(fontSize: 15),
              ),
              const SizedBox(
                height: 13,
              ),
              const TextBoldSpacebetwen(
                title: 'Peeling TCA Ringan (1x)',
                title2: 'Rp290.400',
                title1: '',
              ),
              const SizedBox(
                height: 18,
              ),
              dividergrey(),
              const SizedBox(
                height: 18,
              ),
              Text(
                'Biaya Lainnya',
                style: subTitleTextStyle.copyWith(fontSize: 15),
              ),
              const SizedBox(
                height: 12,
              ),
              const TextBoldSpacebetwen(
                title: 'Pajak',
                title2: 'Termasuk',
                title1: '',
              ),
              const SizedBox(
                height: 12,
              ),
              const TextBoldSpacebetwen(
                title: 'Biaya transaksi',
                title2: 'Rp0',
                title1: '',
              ),
              const SizedBox(
                height: 19,
              ),
              dividergrey(),
              // TextBoldSpacebetwen(
              //   title: 'Total Pembayaran',
              //   title2: state.grossAmount.value == '-'
              //       ? ''
              //       : Text(
              //           CurrencyFormat.convertToIdr(
              //               double.parse(state.grossAmount.value), 0),
              //         ),
              //   title1: '',
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
