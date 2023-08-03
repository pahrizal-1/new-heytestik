import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/widget/daftar_transaksi_konsultasi.dart';
import 'package:heystetik_mobileapps/widget/daftar_transaksi_obat_skincare.dart';

import '../../controller/customer/transaction/history/all_history_transaction_controller.dart';
import '../../theme/theme.dart';
import '../../widget/appbar_widget.dart';
import '../../widget/daftar_transaksi_treatmnet.dart';
import '../solution/keranjang_page.dart';
import 'akun_home_page.dart';
import 'menunggu_pembayaran_page.dart';

class TabbarDaftarTransaksi extends StatelessWidget {
  TabbarDaftarTransaksi({super.key});
  final AllHistoryTransactionController state =
      Get.put(AllHistoryTransactionController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          iconTheme: iconthemeblack(),
          elevation: 2,
          backgroundColor: whiteColor,
          title: Container(
            margin: EdgeInsets.only(left: 20),
            height: 43,
            child: Center(
              child: TextFormField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: borderColor,
                      ),
                      borderRadius: BorderRadius.circular(7)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: borderColor),
                      borderRadius: BorderRadius.circular(7)),
                  prefixIcon: Icon(Icons.search),
                  prefixIconColor: subgreyColor,
                  hintText: 'Cari Alamat',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          actions: [
            const SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () {
                Get.to(KeranjangPage());
              },
              child: SvgPicture.asset(
                'assets/icons/trello-icons.svg',
              ),
            ),
            const SizedBox(
              width: 14,
            ),
            InkWell(
              onTap: () {
                Get.to(AkunHomePage());
              },
              child: SvgPicture.asset(
                'assets/icons/humberger-icons.svg',
              ),
            ),
            const SizedBox(
              width: 26,
            ),
          ],
        ),
        backgroundColor: whiteColor,
        body: Column(
          children: [
            Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: borderColor, width: 0.2),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(7),
                    bottomRight: Radius.circular(7)),
              ),
              child: TabBar(
                labelColor: greenColor,
                labelPadding: EdgeInsets.zero,
                unselectedLabelColor: subTitleColor,
                labelStyle: blackHigtTextStyle.copyWith(
                  fontSize: 15,
                  color: const Color(0XFF9B9B9B),
                ),
                dividerColor: greenColor,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 2,
                indicatorColor: greenColor,
                tabs: const [
                  Tab(
                    text: 'konsultasi',
                  ),
                  Tab(
                    text: 'Treatment',
                  ),
                  Tab(
                    text: 'Obat/skincare',
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  DaftarTransaksiKonsultasi(),
                  DaftarTransaksiTreatment(),
                  DaftarTransaksiSkinCare(),
                ],
              ),
            ),
            SizedBox(
              height: 50.0,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 26, top: 9, right: 26),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 5, bottom: 8),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: borderColor,
                            ),
                            borderRadius: BorderRadius.circular(7)),
                        child: Row(
                          children: [
                            Center(
                              child: Text(
                                'Semua Status',
                                style: blackRegulerTextStyle.copyWith(
                                    fontSize: 15, color: blackColor),
                              ),
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            const Icon(Icons.keyboard_arrow_down)
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 5, bottom: 8),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: borderColor,
                            ),
                            borderRadius: BorderRadius.circular(7)),
                        child: Row(
                          children: [
                            Center(
                              child: Text(
                                'Semua Transaksi',
                                style: blackRegulerTextStyle.copyWith(
                                    fontSize: 15, color: blackColor),
                              ),
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            const Icon(Icons.keyboard_arrow_down)
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 5, bottom: 8),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: borderColor,
                            ),
                            borderRadius: BorderRadius.circular(7)),
                        child: Row(
                          children: [
                            Center(
                              child: Text(
                                'Semua Tanggal',
                                style: blackRegulerTextStyle.copyWith(
                                    fontSize: 15, color: blackColor),
                              ),
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            const Icon(Icons.keyboard_arrow_down)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
