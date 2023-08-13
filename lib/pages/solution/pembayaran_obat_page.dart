// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/transaction/order/order_product_controller.dart';
import 'package:heystetik_mobileapps/core/currency_format.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';
import '../../theme/theme.dart';
import 'metode_pembayaran_obat_page.dart';

class PembayaranProduk extends StatefulWidget {
  List pesan;
  PembayaranProduk({required this.pesan, super.key});

  @override
  State<PembayaranProduk> createState() => _PembayaranProdukState();
}

class _PembayaranProdukState extends State<PembayaranProduk> {
  final OrderProductController state = Get.put(OrderProductController());

  @override
  void initState() {
    super.initState();
    state.initPayment(context, widget.pesan);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        state.listProductItem.clear();
        return true;
      },
      child: Scaffold(
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
                'Selesaikan Pemesananmu',
                style: whiteTextStyle.copyWith(fontSize: 20, fontWeight: bold),
              ),
            ],
          ),
        ),
        body: Obx(
          () => LoadingWidget(
            isLoading: state.isLoading.value,
            child: Padding(
              padding: lsymetric,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: state.listProductItem.length,
                itemBuilder: ((context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: kTopPadding,
                        child: ProdukPembayaran(
                          index: index,
                          price: CurrencyFormat.convertToIdr(
                              state.listProductItem[index]['totalPrice'], 0),
                          img:
                              "${Global.FILE}/${state.listProductItem[index]['img']}",
                          // qty: state.listProductItem[index]['qty'].toString(),
                          productName: state.listProductItem[index]
                              ['productName'],
                          note: state.listProductItem[index]['notes'],
                        ),
                      ),
                    ],
                  );
                }),
              ),
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
                      CurrencyFormat.convertToIdr(state.totalAmount.value, 0),
                      style: blackHigtTextStyle.copyWith(fontSize: 20),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  const Icon(Icons.keyboard_arrow_down)
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              ButtonGreenWidget(
                title: 'Lanjutkan Pembayaran',
                onPressed: () {
                  Get.to(MetodePembayaranObat());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProdukPembayaran extends StatefulWidget {
  final int index;
  final String productName;
  final String price;
  // final String qty;
  final String img;
  final String note;
  const ProdukPembayaran({
    super.key,
    required this.index,
    required this.productName,
    required this.price,
    // required this.qty,
    required this.img,
    required this.note,
  });

  @override
  State<ProdukPembayaran> createState() => _ProdukPembayaranState();
}

class _ProdukPembayaranState extends State<ProdukPembayaran> {
  final OrderProductController state = Get.put(OrderProductController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 74,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(
                          widget.img,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 9,
              ),
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.productName,
                        style: grenTextStyle.copyWith(fontSize: 15),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${state.listProductItem[widget.index]['qty'].toString()} Pcs',
                        style: blackRegulerTextStyle.copyWith(fontSize: 15),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 30,
                        width: 500,
                        child: TextFormField(
                          readOnly: true,
                          decoration: InputDecoration(
                            labelText: 'Catatan',
                            hintText: widget.note,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: greenColor,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: greenColor,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelStyle: TextStyle(
                              color: fromCssColor('#A3A3A3'),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        CurrencyFormat.convertToIdr(
                            state.listProductItem[widget.index]['totalPrice'],
                            0),
                        style: blackHigtTextStyle.copyWith(fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          dividergrey(),
        ],
      ),
    );
  }
}
