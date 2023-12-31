// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/transaction/history/history_consultation_controller.dart';
import 'package:heystetik_mobileapps/controller/customer/transaction/history/history_product_controller.dart';
import 'package:heystetik_mobileapps/controller/customer/transaction/history/history_transaction_controller.dart';
import 'package:heystetik_mobileapps/controller/customer/transaction/history/history_treatment_controller.dart';
import 'package:heystetik_mobileapps/core/currency_format.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/models/customer/payment_method_by_id_model.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';
import 'package:heystetik_mobileapps/widget/more_dialog_transaksi_widget.dart';
import 'package:heystetik_mobileapps/widget/snackbar_widget.dart';
import 'package:social_share/social_share.dart';
import '../../widget/Text_widget.dart';
import 'package:heystetik_mobileapps/models/customer/treatmet_model.dart'
    as Treatment;

class CaraPembayaranPage extends StatefulWidget {
  int id;
  String orderId;
  int totalPaid;
  String transactionType;
  int? pax;
  Treatment.Data2? treatment;
  CaraPembayaranPage({
    super.key,
    required this.id,
    required this.orderId,
    required this.totalPaid,
    required this.transactionType,
    this.pax = 0,
    this.treatment,
  });

  @override
  State<CaraPembayaranPage> createState() => _CaraPembayaranPageState();
}

class _CaraPembayaranPageState extends State<CaraPembayaranPage> {
  final HistoryTransactionController state =
      Get.put(HistoryTransactionController());
  final HistoryConsultationController stateConsultation =
      Get.put(HistoryConsultationController());
  final HistoryProductController stateProduk =
      Get.put(HistoryProductController());
  final HistoryTreatmentController stateTreatment =
      Get.put(HistoryTreatmentController());
  Data? method;
  List<bool> isVisibility = [];

  String paymentType = '-';
  String billerCode = '-';
  String billerKey = '-';
  String virtualAccount = '-';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      state.isMinorLoading.value = true;
      method = await state.getPaymentmethod(context, widget.id);
      if (method!.howToPays!.isNotEmpty) {
        for (int i = 0; i < method!.howToPays!.length; i++) {
          isVisibility.add(false);
        }
      }

      if (widget.transactionType == "Konsultasi") {
        await stateConsultation.getTransactionStatus(context, widget.orderId);
        paymentType = stateConsultation.paymentType.value;
        billerCode = stateConsultation.billerCode.value;
        billerKey = stateConsultation.billerKey.value;
        virtualAccount = stateConsultation.virtualAccount.value;
      } else if (widget.transactionType == "Produk") {
        await stateProduk.getTransactionStatus(context, widget.orderId);
        paymentType = stateProduk.paymentType.value;
        billerCode = stateProduk.billerCode.value;
        billerKey = stateProduk.billerKey.value;
        virtualAccount = stateProduk.virtualAccount.value;
      } else if (widget.transactionType == "Treatment") {
        await stateTreatment.getTransactionStatus(context, widget.orderId);
        paymentType = stateTreatment.paymentType.value;
        billerCode = stateTreatment.billerCode.value;
        billerKey = stateTreatment.billerKey.value;
        virtualAccount = stateTreatment.virtualAccount.value;
      }
      state.isMinorLoading.value = false;
      setState(() {});
    });
  }

  _detail() {
    switch (widget.transactionType) {
      case 'Konsultasi':
        showModalBottomSheet(
          context: context,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          builder: (context) => const TransaksiMoreDialog(),
        );
        break;
      case 'Treatment':
        showModalBottomSheet(
          isDismissible: false,
          context: context,
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.only(
              topEnd: Radius.circular(25),
              topStart: Radius.circular(25),
            ),
          ),
          builder: (context) => detailTreatment(context),
        );
        break;
      case 'Produk':
        break;
    }
  }

  Widget detailTreatment(BuildContext context) {
    return Wrap(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 36, bottom: 40),
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
                '${widget.treatment?.clinic?.name}',
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
                title: '${widget.treatment?.name} ${widget.pax} pax',
                title2: CurrencyFormat.convertToIdr(
                    widget.treatment!.price! * widget.pax!, 0),
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
                    widget.treatment!.price! * widget.pax!, 0),
                title1: '',
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        elevation: 0,
        backgroundColor: greenColor,
        title: Text(
          'Cara Pembayaran',
          style: whiteTextStyle.copyWith(fontSize: 20, fontWeight: bold),
        ),
      ),
      body: Obx(
        () => LoadingWidget(
          isLoading: state.isMinorLoading.value,
          child: SingleChildScrollView(
            child: Padding(
              padding: lsymetric.copyWith(top: 27),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        method?.name ?? '-',
                        style: blackTextStyle.copyWith(fontSize: 15),
                      ),
                      const Spacer(),
                      Image.network(
                        '${Global.FILE}/${method?.mediaPaymentMethod?.media?.path.toString()}',
                        width: 60,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                  const SizedBox(
                    height: 21,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (paymentType == "bank_transfer")
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const TextSpaceBetween(
                              title: 'Nomor Virtual Account',
                              title2: '',
                            ),
                            SelectableText(
                              virtualAccount,
                              style: blackTextStyle.copyWith(fontSize: 15),
                            )
                          ],
                        )
                      else if (paymentType == "echannel")
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const TextSpaceBetween(
                              title: 'Biller Code',
                              title2: '',
                            ),
                            SelectableText(
                              billerCode,
                              style: blackTextStyle.copyWith(fontSize: 15),
                            ),
                            const TextSpaceBetween(
                              title: 'Biller Key',
                              title2: '',
                            ),
                            SelectableText(
                              billerKey,
                              style: blackTextStyle.copyWith(fontSize: 15),
                            ),
                          ],
                        ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          SocialShare.copyToClipboard(
                            text: virtualAccount,
                          );

                          SnackbarWidget.getSuccessSnackbar(
                            context,
                            "Berhasil",
                            "Berhasil disalin",
                          );
                        },
                        child: Text(
                          'Salin',
                          style: grenTextStyle.copyWith(fontSize: 14),
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
                  const SizedBox(
                    height: 18,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TextSpaceBetween(
                            title: 'Total Pembayaran',
                            title2: '',
                          ),
                          Row(
                            children: [
                              Text(
                                CurrencyFormat.convertToIdr(
                                  widget.totalPaid,
                                  0,
                                ),
                                style: blackTextStyle.copyWith(fontSize: 15),
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
                      if (widget.transactionType != 'Produk')
                        InkWell(
                          onTap: () {
                            _detail();
                          },
                          child: Text(
                            'Lihat Detail',
                            style: grenTextStyle.copyWith(fontSize: 14),
                          ),
                        ),
                      const SizedBox(
                        width: 8,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  ...List.generate(
                    method?.howToPays!.length ?? 0,
                    (index) => Column(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              isVisibility[index] = !isVisibility[index];
                            });
                          },
                          child: Row(
                            children: [
                              Text(
                                method!.howToPays![index].name ?? '-',
                                style: blackTextStyle.copyWith(fontSize: 15),
                              ),
                              const Spacer(),
                              Icon(
                                isVisibility[index]
                                    ? Icons.keyboard_arrow_up
                                    : Icons.keyboard_arrow_down,
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Visibility(
                          visible: isVisibility[index],
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                method!.howToPays![index].steps ?? '-',
                                style: blackRegulerTextStyle.copyWith(
                                  fontSize: 15,
                                  color: const Color(
                                    0xff323232,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          thickness: 2,
                        ),
                        const SizedBox(
                          height: 10,
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
    );
  }
}
