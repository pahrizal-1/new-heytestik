// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/transaction/history/history_transaction_controller.dart';
import 'package:heystetik_mobileapps/controller/customer/transaction/history/history_treatment_controller.dart';
import 'package:heystetik_mobileapps/core/convert_date.dart';
import 'package:heystetik_mobileapps/core/currency_format.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/widget/alert_dialog_transaksi.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';
import 'package:heystetik_mobileapps/models/customer/treatmet_model.dart';
import 'package:heystetik_mobileapps/widget/snackbar_widget.dart';
import 'package:social_share/social_share.dart';
import '../../theme/theme.dart';
import '../../widget/Text_widget.dart';
import '../chat_customer/cara_pembayaran_page.dart';
import 'package:heystetik_mobileapps/models/customer/payment_method_by_id_model.dart'
    as Method;

// ignore: must_be_immutable
class SelesaikanPembayaranTreatmentPage extends StatefulWidget {
  bool isWillPop;
  String bank;
  String bankImage;
  String orderId;
  String expireTime;
  final Data2 treatment;
  int pax;
  int paymentMethodId;
  SelesaikanPembayaranTreatmentPage({
    required this.isWillPop,
    this.bank = '',
    this.bankImage = '',
    this.orderId = '',
    this.expireTime = '',
    required this.treatment,
    this.pax = 0,
    required this.paymentMethodId,
    super.key,
  });

  @override
  State<SelesaikanPembayaranTreatmentPage> createState() =>
      _SelesaikanPembayaranTreatmentPageState();
}

class _SelesaikanPembayaranTreatmentPageState
    extends State<SelesaikanPembayaranTreatmentPage> {
  final HistoryTransactionController all =
      Get.put(HistoryTransactionController());
  final HistoryTreatmentController state =
      Get.put(HistoryTreatmentController());
  Timer? countdownTimer;
  Duration myDuration = const Duration(hours: 1);
  Method.Data? method;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      state.isLoading.value = true;
      method = await all.getPaymentmethod(context, widget.paymentMethodId);
      await state.getTransactionStatus(context, widget.orderId);
      state.isLoading.value = false;
      setTime();
      startTimer();
      setState(() {});
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
              Text(
                method?.name ?? '-',
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
                                method?.name ?? '-',
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
                                    onTap: () {
                                      SocialShare.copyToClipboard(
                                        text: state.virtualAccount.value,
                                      );
                                      SnackbarWidget.getSuccessSnackbar(context,
                                          "Berhasil", "Berhasil disalin");
                                    },
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
                                        builder: (context) => detail(context),
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
                              Get.to(CaraPembayaranPage(
                                id: widget.paymentMethodId,
                                totalPaid: int.parse(
                                    double.parse(state.grossAmount.value)
                                        .round()
                                        .toString()),
                                vaNumber: state.virtualAccount.value,
                                transactionType: 'Treatment',
                                treatment: widget.treatment,
                                pax: widget.pax,
                              ));
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

  Widget detail(BuildContext context) {
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
                '${widget.treatment.clinic?.name}',
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
              TextBoldSpacebetwen(
                title: '${widget.treatment.name} ${widget.pax} pax',
                title2: CurrencyFormat.convertToIdr(
                    widget.treatment.price! * widget.pax, 0),
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
              TextBoldSpacebetwen(
                title: 'Total Pembayaran',
                title2: CurrencyFormat.convertToIdr(
                    widget.treatment.price! * widget.pax, 0),
                title1: '',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
