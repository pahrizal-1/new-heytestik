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
import 'package:qr_flutter/qr_flutter.dart';
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

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      state.isMinorLoading.value = true;
      method = await state.getPaymentmethod(context, widget.id);
      if (method?.howToPays?.isNotEmpty ?? false) {
        for (int i = 0; i < (method?.howToPays?.length ?? 0); i++) {
          isVisibility.add(false);
        }
      }

      if (widget.transactionType == "Konsultasi") {
        await stateConsultation.getTransactionStatus(context, widget.orderId);
      } else if (widget.transactionType == "Produk") {
        await stateProduk.getTransactionStatus(context, widget.orderId);
      } else if (widget.transactionType == "Treatment") {
        await stateTreatment.getTransactionStatus(context, widget.orderId);
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
          builder: (context) => TransaksiKonsultasiDialog(
            methode: method?.name ?? "",
            totalFee: stateConsultation
                    .transactionStatus.value.data?.transaction?.totalFee ??
                0,
            tax: stateConsultation
                    .transactionStatus.value.data?.transaction?.tax ??
                0,
            totalDiscount: stateConsultation
                    .transactionStatus.value.data?.transaction?.totalDiscount ??
                0,
            totalPaid: stateConsultation
                    .transactionStatus.value.data?.transaction?.totalPaid ??
                0,
            transactionFee: stateConsultation.transactionStatus.value.data
                    ?.transaction?.transactionFee ??
                0,
            discountPercentage: 0,
          ),
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

  Widget detailTreatment(context) {
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
                '${widget.treatment?.clinic?.name}',
                style: blackTextStyle.copyWith(
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Harga',
                style: subTitleTextStyle.copyWith(fontSize: 15),
              ),
              const SizedBox(
                height: 5,
              ),
              Obx(
                () => TextBoldSpacebetwen(
                  title: '${widget.treatment?.name} ${widget.pax} pax',
                  title2: CurrencyFormat.convertToIdr(
                      stateTreatment.transactionStatus.value.data?.transaction
                          ?.totalPrice,
                      0),
                  title1: '',
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              dividergrey(),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Biaya Lainnya',
                style: subTitleTextStyle.copyWith(fontSize: 15),
              ),
              const SizedBox(
                height: 5,
              ),
              Obx(
                () => TextBoldSpacebetwen(
                  title: 'Tax',
                  title2: CurrencyFormat.convertToIdr(
                    stateTreatment
                        .transactionStatus.value.data?.transaction?.tax,
                    0,
                  ),
                  title1: '',
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Obx(
                () => TextBoldSpacebetwen(
                  title: 'Diskon Voucher',
                  title2: CurrencyFormat.convertToIdr(
                      stateTreatment.transactionStatus.value.data?.transaction
                          ?.totalDiscount,
                      0),
                  title1: '',
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Obx(
                () => TextBoldSpacebetwen(
                  title: 'Biaya transaksi',
                  title2: CurrencyFormat.convertToIdr(
                    stateTreatment.transactionStatus.value.data?.transaction
                        ?.transactionFee,
                    0,
                  ),
                  title1: '',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              dividergrey(),
              Obx(
                () => TextBoldSpacebetwen(
                  title: 'Total Pembayaran',
                  title2: CurrencyFormat.convertToIdr(
                    stateTreatment
                        .transactionStatus.value.data?.transaction?.totalPaid,
                    0,
                  ),
                  title1: '',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget virtualAccount(String vaNumber) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextSpaceBetween(
              title: 'Nomor Virtual Account',
              title2: '',
            ),
            InkWell(
              onTap: () {
                SocialShare.copyToClipboard(
                  text: vaNumber.toString(),
                );
                SnackbarWidget.getSuccessSnackbar(
                  context,
                  "Berhasil",
                  "Berhasil disalin",
                );
              },
              child: Row(
                children: [
                  SelectableText(
                    vaNumber.toString(),
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
              ),
            )
          ],
        )
      ],
    );
  }

  Widget billerCode(String billCode, String billKey) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextSpaceBetween(
              title: 'Biller Code',
              title2: '',
            ),
            SelectableText(
              billCode,
              style: blackTextStyle.copyWith(fontSize: 15),
            ),
            const TextSpaceBetween(
              title: 'Biller Key',
              title2: '',
            ),
            SelectableText(
              billKey,
              style: blackTextStyle.copyWith(fontSize: 15),
            )
          ],
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        method?.name ?? '',
                        style: blackHigtTextStyle.copyWith(fontSize: 15),
                      ),
                      if (widget.transactionType == "Treatment")
                        if (!stateTreatment.qrCode.value)
                          Image.network(
                            '${Global.FILE}/${method?.mediaPaymentMethod?.media?.path.toString()}',
                            width: 62,
                          ),
                      if (widget.transactionType == "Produk")
                        if (!stateProduk.qrCode.value)
                          Image.network(
                            '${Global.FILE}/${method?.mediaPaymentMethod?.media?.path.toString()}',
                            width: 62,
                          )
                    ],
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                  if (widget.transactionType != "Konsultasi")
                    const SizedBox(
                      height: 21,
                    ),
                  if (widget.transactionType == "Treatment")
                    Obx(() {
                      switch (stateTreatment
                          .transactionStatus.value.data?.paymentMethod) {
                        case 'EWALLET':
                          return Container();
                        case 'FREE':
                          return Container();
                        case 'VIRTUAL_ACCOUNT':
                          if (stateTreatment
                                      .transactionStatus
                                      .value
                                      .data
                                      ?.transaction
                                      ?.paymentMethod
                                      ?.paymentGateway ==
                                  "Midtrans" &&
                              stateTreatment.transactionStatus.value.data
                                      ?.paymentMethod ==
                                  "VIRTUAL_ACCOUNT" &&
                              stateTreatment.transactionStatus.value.data
                                      ?.paymentType ==
                                  "MANDIRI") {
                            return billerCode(
                                stateTreatment.transactionStatus.value.data
                                        ?.transaction?.billerCode
                                        .toString() ??
                                    "",
                                stateTreatment.transactionStatus.value.data
                                        ?.transaction?.billKey
                                        .toString() ??
                                    "");
                          } else {
                            return virtualAccount(stateTreatment
                                    .transactionStatus
                                    .value
                                    .data
                                    ?.transaction
                                    ?.vaNumber
                                    .toString() ??
                                "");
                          }
                        case 'QR_CODE':
                          return Center(
                            child: QrImageView(
                              data: stateTreatment
                                  .transactionStatus.value.data?.qrString,
                              version: QrVersions.auto,
                              size: 200.0,
                            ),
                          );
                        case 'BANK_TRANSFER_MANUAL_VERIFICATION':
                          return Container();
                        default:
                          return Container();
                      }
                    }),
                  if (widget.transactionType == "Produk")
                    Obx(() {
                      switch (stateProduk
                          .transactionStatus.value.data?.paymentMethod) {
                        case 'EWALLET':
                          return Container();
                        case 'FREE':
                          return Container();
                        case 'VIRTUAL_ACCOUNT':
                          if (stateProduk
                                      .transactionStatus
                                      .value
                                      .data
                                      ?.transaction
                                      ?.paymentMethod
                                      ?.paymentGateway ==
                                  "Midtrans" &&
                              stateProduk.transactionStatus.value.data
                                      ?.paymentMethod ==
                                  "VIRTUAL_ACCOUNT" &&
                              stateProduk.transactionStatus.value.data
                                      ?.paymentType ==
                                  "MANDIRI") {
                            return billerCode(
                                stateProduk.transactionStatus.value.data
                                        ?.transaction?.billerCode
                                        .toString() ??
                                    "",
                                stateProduk.transactionStatus.value.data
                                        ?.transaction?.billKey
                                        .toString() ??
                                    "");
                          } else {
                            return virtualAccount(stateProduk.transactionStatus
                                    .value.data?.transaction?.vaNumber
                                    .toString() ??
                                "");
                          }
                        case 'QR_CODE':
                          return Center(
                            child: QrImageView(
                              data: stateProduk
                                  .transactionStatus.value.data?.qrString,
                              version: QrVersions.auto,
                              size: 200.0,
                            ),
                          );
                        case 'BANK_TRANSFER_MANUAL_VERIFICATION':
                          return Container();
                        default:
                          return Container();
                      }
                    }),
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
                          InkWell(
                            onTap: () {
                              SocialShare.copyToClipboard(
                                text: widget.totalPaid.toString(),
                              );
                              SnackbarWidget.getSuccessSnackbar(
                                context,
                                "Berhasil",
                                "Berhasil disalin",
                              );
                            },
                            child: Row(
                              children: [
                                Text(
                                  CurrencyFormat.convertToIdr(
                                      widget.totalPaid, 0),
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
                            ),
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
