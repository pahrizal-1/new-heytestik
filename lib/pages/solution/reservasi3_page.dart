import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/treatment_controller.dart';
import 'package:heystetik_mobileapps/core/currency_format.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/pages/solution/selesai_pembayaran_treatment_page.dart';
import 'package:heystetik_mobileapps/pages/solution/treatment_promo_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/Text_widget.dart';
import 'package:heystetik_mobileapps/widget/alert_dialog.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';
import 'package:heystetik_mobileapps/models/customer/treatmet_model.dart';
import 'package:heystetik_mobileapps/widget/card_bank_widgets.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';
import '../../controller/customer/transaction/order/order_treatmetment_controller.dart';

// ignore: must_be_immutable
class Resevasi3Page extends StatefulWidget {
  int pax;
  String tgl;
  final Data2 treatment;
  Resevasi3Page({
    required this.pax,
    required this.tgl,
    required this.treatment,
    super.key,
  });

  @override
  State<Resevasi3Page> createState() => _Resevasi3PageState();
}

class _Resevasi3PageState extends State<Resevasi3Page> {
  final TreatmentController stateTreatment = Get.put(TreatmentController());
  final OrderTreatmentController state = Get.put(OrderTreatmentController());
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      state.totalPrice.value =
          (widget.treatment.price! * widget.pax).toDouble();
      state.initPayment(context);
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
              'Lanjutkan Pembayaran',
              style: whiteTextStyle.copyWith(fontSize: 20, fontWeight: bold),
            ),
          ],
        ),
      ),
      body: Obx(
        () => LoadingWidget(
          isLoading: state.isLoading.value,
          child: ListView(
            children: [
              Padding(
                padding: lsymetric.copyWith(top: 25, bottom: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: NetworkImage(
                                  "${Global.FILE}/${widget.treatment.mediaTreatments![0].media!.path}",
                                ),
                                fit: BoxFit.cover),
                          ),
                        ),
                        const SizedBox(
                          width: 13,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${widget.treatment.clinic?.name}',
                              style: blackHigtTextStyle.copyWith(fontSize: 15),
                            ),
                            Text(
                              '${widget.treatment.clinic?.city?.name}',
                              style: blackHigtTextStyle.copyWith(fontSize: 12),
                            ),
                            Text(
                              widget.tgl,
                              style: subTitleTextStyle.copyWith(
                                fontSize: 12,
                                letterSpacing: 0.4,
                              ),
                            ),
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
                                borderRadius: BorderRadiusDirectional.only(
                                  topEnd: Radius.circular(25),
                                  topStart: Radius.circular(25),
                                ),
                              ),
                              builder: (context) => order(),
                            );
                          },
                          child: const Icon(
                            Icons.keyboard_arrow_down,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const dividergreen(),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TreatmentPromoPage(),
                    ),
                  );
                },
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 18),
                  padding: const EdgeInsets.only(
                    top: 15,
                    bottom: 15,
                    left: 14,
                    right: 14,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: borderColor),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/icons/persen_icons.png',
                        width: 25,
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Obx(
                              () => Text(
                                (state.voucherName.value.isNotEmpty)
                                    ? state.voucherName.value
                                    : 'Pakai Voucher',
                                style: blackTextStyle.copyWith(
                                  fontSize: 12,
                                  fontWeight: medium,
                                ),
                              ),
                            ),
                            if (state.voucherName.value.isNotEmpty)
                              Text(
                                '1 voucher dipakai',
                                style: subTitleTextStyle.copyWith(fontSize: 13),
                              ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      const Icon(Icons.keyboard_arrow_right)
                    ],
                  ),
                ),
              ),
              CardTreatmentBank(),
              // Padding(
              //   padding: lsymetric.copyWith(top: 22, bottom: 22),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Text(
              //         'Ringkasan Pembayaran',
              //         style: blackTextStyle.copyWith(fontSize: 18),
              //       ),
              //       const SizedBox(
              //         height: 27,
              //       ),
              //       Obx(
              //         () => TextSpaceBetween(
              //           title: 'Total Perawatan',
              //           title2: CurrencyFormat.convertToIdr(
              //             state.totalPrice.value,
              //             0,
              //           ),
              //         ),
              //       ),
              //       const SizedBox(
              //         height: 12,
              //       ),
              //       Row(
              //         children: [
              //           Text(
              //             'Biaya Jasa Aplikasi',
              //             style: subGreyTextStyle.copyWith(
              //                 fontSize: 14,
              //                 color: const Color(0XFF323232),
              //                 fontWeight: regular),
              //           ),
              //           const SizedBox(
              //             width: 4,
              //           ),
              //           Image.asset(
              //             'assets/icons/alert.png',
              //             width: 11,
              //           ),
              //           const Spacer(),
              //           Text(
              //             'Rp0',
              //             style: subGreyTextStyle.copyWith(fontSize: 14),
              //           ),
              //         ],
              //       ),
              //       const SizedBox(
              //         height: 12,
              //       ),
              //       const TextSpaceBetween(
              //         title: 'Biaya Pembayaran',
              //         title2: 'Rp0',
              //       )
              //     ],
              //   ),
              // ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 23, vertical: 15),
                color: subwhiteColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ringkasan Pembayaran',
                      style: blackTextStyle.copyWith(fontSize: 15),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 4),
                          child: Icon(
                            Icons.circle,
                            size: 7,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                            child: Text(
                          'Hanya berlaku dengan menggunakan akun BCA. Pembayaran dengan akun bank lain tidak akan diproses.',
                          style: blackRegulerTextStyle.copyWith(fontSize: 13),
                        ))
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 4),
                          child: Icon(
                            Icons.circle,
                            size: 7,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                            child: Text(
                          'Pastikan nomor Virtual Account kamu sesuai dengan instruksi pembayaran.',
                          style: blackRegulerTextStyle.copyWith(fontSize: 13),
                        ))
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 4),
                          child: Icon(
                            Icons.circle,
                            size: 7,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Text(
                            'Pastikan kembali nominal pembayaran sesuai dengan pemesanan yang kamu lakukan.',
                            style: blackRegulerTextStyle.copyWith(fontSize: 13),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: lsymetric.copyWith(top: 22, bottom: 22),
                child: Column(
                  children: [
                    Text.rich(
                      TextSpan(
                        text: 'Dengan menekan tombol bayar, kamu menyetujui',
                        style: greyTextStyle.copyWith(fontSize: 12),
                        children: [
                          TextSpan(
                            text: ' Syarat & Ketentuan',
                            style: grenTextStyle.copyWith(fontSize: 13),
                            children: [
                              TextSpan(
                                text: ' dan',
                                style: greyTextStyle.copyWith(fontSize: 12),
                                children: [
                                  TextSpan(
                                      text: ' Kebijakan Privasi',
                                      style:
                                          grenTextStyle.copyWith(fontSize: 13),
                                      children: [
                                        TextSpan(
                                          text: ' Heystetik.',
                                          style: greyTextStyle.copyWith(
                                              fontSize: 12),
                                        )
                                      ]),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
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
              'Total Bayar',
              style: blackRegulerTextStyle,
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Obx(
                  () => Text(
                    CurrencyFormat.convertToIdr(
                      state.totalPaid.value,
                      0,
                    ),
                    style: blackHigtTextStyle.copyWith(fontSize: 20),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                InkWell(
                  onTap: () {
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
                      builder: (context) => detail(context),
                    );
                  },
                  child: Icon(
                    Icons.keyboard_arrow_up,
                    size: 30,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
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
                    await state.orderTreatment(
                      context,
                      widget.treatment.id!.toInt(),
                      widget.pax,
                      doInPost: () async {
                        Get.offAll(SelesaikanPembayaranTreatmentPage(
                          isWillPop: true,
                          treatment: widget.treatment,
                          orderId: state.orderId.value,
                          bankImage: state.bankImage.value,
                          expireTime: state.expireTime.value,
                          pax: widget.pax,
                          paymentMethodId: state.idPayment.value,
                        ));
                      },
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget order() {
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
                      width: 14,
                    ),
                  ),
                  const SizedBox(
                    width: 19,
                  ),
                  Text(
                    'Orderan Kamu',
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
                'Jenis Treatment',
                style: subTitleTextStyle.copyWith(
                  fontWeight: bold,
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 13,
              ),
              Text(
                '${widget.treatment.name}',
                style: blackRegulerTextStyle.copyWith(fontSize: 15),
              ),
              const SizedBox(
                height: 18,
              ),
              dividergrey(),
              const SizedBox(
                height: 18,
              ),
              Text(
                'Detail Pemesan',
                style: subTitleTextStyle.copyWith(fontSize: 15),
              ),
              const SizedBox(
                height: 12,
              ),
              Obx(
                () => Text(
                  stateTreatment.fullName.value,
                  style: blackRegulerTextStyle.copyWith(
                      fontWeight: bold, fontSize: 15, color: blackColor),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Obx(
                () => Text(
                  "+62${stateTreatment.phone.value}",
                  style: blackRegulerTextStyle.copyWith(
                    fontSize: 15,
                    color: blackColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
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
                  title: '${widget.treatment.name} ${widget.pax} pax',
                  title2:
                      CurrencyFormat.convertToIdr(state.totalPrice.value, 0),
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
                    state.tax.value,
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
                  title2:
                      "${CurrencyFormat.convertToIdr(state.totalDiscount.value, 0)} ${state.discountPercentage.value == 0 ? '' : '(${state.discountPercentage.value}%)'}",
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
                    state.transactionFee.value,
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
                    state.totalPaid.value,
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
}
