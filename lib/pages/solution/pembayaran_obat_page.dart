import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/transaction/order/order_treatmetment_controller.dart';
import 'package:heystetik_mobileapps/controller/customer/treatment/treatment_controller.dart';
import 'package:heystetik_mobileapps/core/convert_date.dart';
import 'package:heystetik_mobileapps/core/currency_format.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/pages/solution/reservasi3_page.dart';
import 'package:heystetik_mobileapps/widget/alert_dialog.dart';

import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';
import 'package:heystetik_mobileapps/models/customer/treatmet_model.dart';
import '../../theme/theme.dart';
import 'metode_pembayaran_obat_page.dart';

class PembayaranObat extends StatefulWidget {
  PembayaranObat({super.key});

  @override
  State<PembayaranObat> createState() => _PembayaranObatState();
}

class _PembayaranObatState extends State<PembayaranObat> {
  // final TreatmentController stateTreatment = Get.put(TreatmentController());
  // final OrderTreatmentController stateOrder =
  //     Get.put(OrderTreatmentController());

  // @override
  // void initState() {
  //   super.initState();
  //   stateTreatment.getDataUser();
  // }

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
              'Selesaikan Pemesananmu',
              style: whiteTextStyle.copyWith(fontSize: 20, fontWeight: bold),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 29),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProdukPembayaran(
                  harga: '20',
                  img: "assets/images/produk2.png",
                  jumplah: '1',
                  namaProduk: 'Nama Produk',
                ),
              ],
            ),
          ),
        ],
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
              'Total Perawatan',
              style: blackRegulerTextStyle,
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Text(
                  "Rp20.000",
                  style: blackHigtTextStyle.copyWith(fontSize: 20),
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
    );
  }
}

class ProdukPembayaran extends StatelessWidget {
  final String namaProduk;
  final String harga;
  final String jumplah;
  final String img;

  const ProdukPembayaran({
    super.key,
    required this.namaProduk,
    required this.harga,
    required this.jumplah,
    required this.img,
  });

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
                        image: AssetImage(
                          img,
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
                        namaProduk,
                        style: grenTextStyle.copyWith(fontSize: 15),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '$jumplah Pcs',
                        style: blackRegulerTextStyle.copyWith(fontSize: 15),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 30,
                        width: 500,
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Catatan',
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
                      Container(
                        width: 100,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          border: Border.all(color: borderColor),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.remove,
                              size: 15,
                              color: greyColor,
                            ),
                            const SizedBox(
                              width: 21,
                            ),
                            Text('1'),
                            const SizedBox(
                              width: 21,
                            ),
                            Icon(
                              Icons.add,
                              size: 15,
                              color: greenColor,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        harga,
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
