// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/transaction/order/order_product_controller.dart';
import 'package:heystetik_mobileapps/core/currency_format.dart';
import 'package:heystetik_mobileapps/core/global.dart';

import 'package:heystetik_mobileapps/pages/chat_customer/promo_page.dart';
import 'package:heystetik_mobileapps/pages/solution/selesai_pembayaran_produk_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/Text_widget.dart';
import 'package:heystetik_mobileapps/widget/alert_dialog.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';
import 'package:heystetik_mobileapps/widget/card_bank_widgets.dart';

import 'package:heystetik_mobileapps/widget/loading_widget.dart';

class MetodePembayaranProduk extends StatefulWidget {
  bool isCart;
  MetodePembayaranProduk({required this.isCart, super.key});

  @override
  State<MetodePembayaranProduk> createState() => _MetodePembayaranProdukState();
}

class _MetodePembayaranProdukState extends State<MetodePembayaranProduk> {
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
              CardProdukBank(),
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
            Row(
              children: [
                Obx(
                  () => Text(
                    CurrencyFormat.convertToIdr(state.totalAmount.value, 0),
                    style: blackHigtTextStyle.copyWith(fontSize: 20),
                  ),
                ),
                InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.white,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.only(
                            topEnd: Radius.circular(25),
                            topStart: Radius.circular(25),
                          ),
                        ),
                        builder: (context) => detail(),
                      );
                    },
                    child: Icon(
                      Icons.keyboard_arrow_up,
                      size: 30,
                    ))
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

                    await state.orderProduct(
                      context,
                      widget.isCart,
                      doInPost: () async {
                        Get.offAll(SelesaikanPembayaranProdukPage(
                          isWillPop: true,
                          orderId: state.orderId.value,
                          bankImage: state.bankImage.value,
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

  Widget detail() {
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
                'Harga',
                style: subTitleTextStyle.copyWith(fontSize: 15),
              ),
              const SizedBox(
                height: 13,
              ),
              ...state.listProductItem.map((e) {
                return TextBoldSpacebetwen(
                  title: e['productName'],
                  title2: CurrencyFormat.convertToIdr(e['totalPrice'], 0),
                  title1: '',
                );
              }),
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
              Obx(
                () => TextBoldSpacebetwen(
                  title: 'Total Pembayaran',
                  title2:
                      CurrencyFormat.convertToIdr(state.totalAmount.value, 0),
                  title1: '',
                ),
              ),
              const SizedBox(
                height: 19,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
