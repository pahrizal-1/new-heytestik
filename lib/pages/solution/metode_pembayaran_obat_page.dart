import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/transaction/order/order_product_controller.dart';
import 'package:heystetik_mobileapps/core/currency_format.dart';
import 'package:heystetik_mobileapps/core/global.dart';

import 'package:heystetik_mobileapps/pages/chat_customer/promo_page.dart';
import 'package:heystetik_mobileapps/pages/solution/selesai_pembayaran_obat_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/Text_widget.dart';
import 'package:heystetik_mobileapps/widget/alert_dialog.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';

import 'package:heystetik_mobileapps/widget/loading_widget.dart';
import '../../widget/show_dialog_sousions_payment.dart';

class MetodePembayaranObat extends StatefulWidget {
  const MetodePembayaranObat({super.key});

  @override
  State<MetodePembayaranObat> createState() => _MetodePembayaranObatState();
}

class _MetodePembayaranObatState extends State<MetodePembayaranObat> {
  final OrderProductController state = Get.put(OrderProductController());
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      state.getPaymentmethod(context);
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
              Wrap(
                children: state.listProductItem.map((e) {
                  return Padding(
                    padding: lsymetric.copyWith(top: 25, bottom: 15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: NetworkImage(
                                  "${Global.FILE}/${e['img']}",
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
                              e['productName'],
                              style: blackHigtTextStyle.copyWith(fontSize: 15),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              'Catatan : ${e['notes']}',
                              style: subTitleTextStyle.copyWith(
                                fontSize: 12,
                                letterSpacing: 0.4,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text(
                                  '${e['qty']} PCS',
                                  style: subTitleTextStyle.copyWith(
                                    fontSize: 12,
                                    letterSpacing: 0.4,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  CurrencyFormat.convertToIdr(
                                      e['totalPrice'], 0),
                                  style:
                                      blackHigtTextStyle.copyWith(fontSize: 15),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
              dividergreen(),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PromoPage(),
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Belum ada voucher yang tersedia',
                            style: blackTextStyle.copyWith(fontSize: 11),
                          ),
                          Text(
                            '0 voucher dipakai',
                            style: subTitleTextStyle,
                          ),
                        ],
                      ),
                      const Spacer(),
                      const Icon(Icons.keyboard_arrow_right)
                    ],
                  ),
                ),
              ),
              const dividergreen(),
              Padding(
                padding: lsymetric.copyWith(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pilih Metode Pembayaran',
                      style: blackHigtTextStyle.copyWith(fontSize: 18),
                    ),
                    CardProductBank(),
                  ],
                ),
              ),
              const dividergreen(),
              Padding(
                padding: lsymetric.copyWith(top: 22, bottom: 22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ringkasan Pembayaran',
                      style: blackTextStyle.copyWith(fontSize: 18),
                    ),
                    const SizedBox(
                      height: 27,
                    ),
                    Obx(
                      () => TextSpaceBetween(
                        title: 'Total Pembayaran',
                        title2: CurrencyFormat.convertToIdr(
                            state.totalAmount.value, 0),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Text(
                          'Biaya Jasa Aplikasi',
                          style: subGreyTextStyle.copyWith(
                              fontSize: 14,
                              color: const Color(0XFF323232),
                              fontWeight: regular),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Image.asset(
                          'assets/icons/alert.png',
                          width: 11,
                        ),
                        const Spacer(),
                        Text(
                          'Rp0',
                          style: subGreyTextStyle.copyWith(fontSize: 14),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const TextSpaceBetween(
                      title: 'Biaya Pembayaran',
                      title2: 'Rp0',
                    )
                  ],
                ),
              ),
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
              'Total Pembayaran',
              style: blackRegulerTextStyle,
            ),
            const SizedBox(
              height: 4,
            ),
            Obx(
              () => Text(
                CurrencyFormat.convertToIdr(state.totalAmount.value, 0),
                style: blackHigtTextStyle.copyWith(fontSize: 20),
              ),
            ),
            const SizedBox(
              width: 12,
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

                    await state.orderProduct(
                      context,
                      doInPost: () async {
                        Get.offAll(SelesaiPembayaranObatPage(
                          orderId: state.orderId.value,
                          bank: state.bank.value,
                          expireTime: state.expireTime.value,
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
}

class CardProductBank extends StatelessWidget {
  CardProductBank({
    super.key,
  });

  final OrderProductController state = Get.put(OrderProductController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: state.totalPaymentMethod.value == 0
          ? Container()
          : ListView.builder(
              shrinkWrap: true,
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.totalPaymentMethod.value,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    if (state.listPaymentMethod.value!.data![index].isActive !=
                        false) {
                      state.idPayment.value = state
                          .listPaymentMethod.value!.data![index].id!
                          .toInt();
                      state.paymentMethod.value =
                          state.listPaymentMethod.value!.data![index].method ??
                              '-';
                      state.paymentType.value =
                          state.listPaymentMethod.value!.data![index].type ??
                              '-';
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) => AlertWidget(
                          subtitle:
                              '${state.listPaymentMethod.value!.data![index].name}\n${state.listPaymentMethod.value!.data![index].description}',
                        ),
                      );
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    height: 35,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Image.network(
                              '${Global.FILE}/${state.listPaymentMethod.value!.data![index].mediaPaymentMethod!.media!.path.toString()}',
                              width: 40,
                              height: 35,
                            ),
                            const SizedBox(
                              width: 19,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  state.listPaymentMethod.value!.data![index]
                                          .name ??
                                      '-',
                                  style: blackTextStyle.copyWith(fontSize: 15),
                                ),
                                Text(
                                  state.listPaymentMethod.value!.data![index]
                                          .description ??
                                      '-',
                                  style: blackRegulerTextStyle.copyWith(
                                      fontSize: 12),
                                )
                              ],
                            ),
                            const Spacer(),
                            Obx(
                              () => Icon(
                                state.idPayment.value ==
                                        state.listPaymentMethod.value!
                                            .data![index].id
                                    ? Icons.radio_button_on
                                    : Icons.circle_outlined,
                                size: 23,
                                color: state.idPayment.value ==
                                        state.listPaymentMethod.value!
                                            .data![index].id
                                    ? greenColor
                                    : blackColor,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
