// ignore_for_file: prefer_const_constructors, must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/transaction/order/order_product_controller.dart';
import 'package:heystetik_mobileapps/core/currency_format.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

import 'Text_widget.dart';

class TransaksiKonsultasiDialog extends StatelessWidget {
  String methode;
  int totalFee;
  int totalDiscount;
  int? discountPercentage;
  int tax;
  int transactionFee;
  int totalPaid;
  TransaksiKonsultasiDialog({
    super.key,
    required this.methode,
    required this.totalFee,
    required this.totalDiscount,
    this.discountPercentage = 0,
    required this.tax,
    required this.transactionFee,
    required this.totalPaid,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: whiteColor,
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        'assets/icons/danger-icons.png',
                        width: 15,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 17,
                  ),
                  Text(
                    'Detail Pembayaran',
                    style: blackTextStyle.copyWith(fontSize: 18),
                  ),
                ],
              ),
              SizedBox(
                height: 29,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'Metode Pembayaran',
                      style: greyTextStyle.copyWith(fontSize: 15),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      methode,
                      style: blackHigtTextStyle.copyWith(fontSize: 15),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 11,
              ),
              Divider(
                thickness: 3,
              ),
              SizedBox(
                height: 11,
              ),
              TextBoldSpacebetwen(
                title: 'Biaya Sesi',
                title2: CurrencyFormat.convertToIdr(totalFee, 0),
                title1: ' 30 Menit',
              ),
              SizedBox(
                height: 10,
              ),
              TextBoldSpacebetwen(
                title: 'Diskon Voucher',
                title2:
                    "${CurrencyFormat.convertToIdr(totalDiscount, 0)} ${discountPercentage == 0 ? '' : '($discountPercentage%)'}",
                title1: '',
              ),
              SizedBox(
                height: 10,
              ),
              TextBoldSpacebetwen(
                title: 'Tax',
                title2: CurrencyFormat.convertToIdr(tax, 0),
                title1: '',
              ),
              SizedBox(
                height: 10,
              ),
              TextBoldSpacebetwen(
                title: 'Biaya Transaksi',
                title2: CurrencyFormat.convertToIdr(
                  transactionFee,
                  0,
                ),
                title1: '',
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                thickness: 3,
              ),
              SizedBox(
                height: 5,
              ),
              TextBoldSpacebetwen(
                title: 'Total Tagihan',
                title2: CurrencyFormat.convertToIdr(totalPaid, 0),
                title1: '',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PilihPengirimMoreDialog extends StatefulWidget {
  const PilihPengirimMoreDialog({super.key});

  @override
  State<PilihPengirimMoreDialog> createState() =>
      _PilihPengirimMoreDialogState();
}

class _PilihPengirimMoreDialogState extends State<PilihPengirimMoreDialog> {
  OrderProductController state = Get.put(OrderProductController());

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Padding(
          padding: const EdgeInsets.all(30),
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: whiteColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset(
                          'assets/icons/danger-icons.png',
                          width: 15,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 17,
                    ),
                    Text(
                      'Pilih Pengiriman',
                      style: blackTextStyle.copyWith(fontSize: 18),
                    ),
                  ],
                ),
                SizedBox(
                  height: 37,
                ),
                ...state.getShippingMethod.map(
                  (element) {
                    return InkWell(
                      onTap: () {
                        if (element.isActive!) {
                          state.shipping(element);
                          setState(() {});
                          Get.back();
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.only(
                          bottom: 14,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              element.name ?? '-',
                              style: blackHigtTextStyle.copyWith(
                                fontSize: 18,
                                color:
                                    element.isActive! ? blackColor : greyColor,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              element.description ?? '-',
                              style: subTitleTextStyle,
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Divider(
                              thickness: 2,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ).toList(),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
