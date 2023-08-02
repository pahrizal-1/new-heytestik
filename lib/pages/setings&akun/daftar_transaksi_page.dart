import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/transaction/history/all_history_transaction_controller.dart';
import 'package:heystetik_mobileapps/core/convert_date.dart';
import 'package:heystetik_mobileapps/core/currency_format.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/akun_home_page.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/menunggu_pembayaran_page.dart';
import 'package:heystetik_mobileapps/pages/solution/keranjang_page.dart';
import 'package:heystetik_mobileapps/widget/shimmer_widget.dart';
import '../../theme/theme.dart';

import '../../widget/appbar_widget.dart';
import '../../widget/daftar_transaksi_widgets.dart';

class DaftarTransaksiPage extends StatelessWidget {
  DaftarTransaksiPage({super.key});

  final AllHistoryTransactionController state =
      Get.put(AllHistoryTransactionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(55.0),
            child: SizedBox(
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
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(7),
                  boxShadow: [
                    BoxShadow(
                      color: blackColor,
                      blurRadius: 0.5,
                    ),
                  ],
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 13, vertical: 13),
                  child: InkWell(
                    onTap: () {
                      Get.to(() => MenungguPemayaranPage());
                    },
                    child: Row(
                      children: [
                        Container(
                          width: 25,
                          height: 25,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                  'assets/icons/transaksi_logo.png',
                                ),
                                fit: BoxFit.cover),
                          ),
                        ),
                        const SizedBox(
                          width: 11,
                        ),
                        Text(
                          'Menunggu Pembayaran',
                          style: blackHigtTextStyle.copyWith(fontSize: 15),
                        ),
                        const Spacer(),
                        Obx(
                          () => state.totalPending.value == 0
                              ? Container()
                              : Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 2),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: redColor),
                                  child: Text(
                                    state.totalPending.value.toString(),
                                    style:
                                        whiteTextStyle.copyWith(fontSize: 10),
                                  ),
                                ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Image.asset(
                          'assets/icons/arrow-left-hight.png',
                          width: 24,
                          height: 24,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: spaceHeigt,
              ),
              FutureBuilder(
                future: state.getAllHistory(context),
                builder: (context, AsyncSnapshot snapshot) {
                  print(snapshot.connectionState);
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Column(
                      children: [
                        shimmerWidget(
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            width: MediaQuery.of(context).size.width,
                            height: 140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: whiteColor,
                            ),
                          ),
                        ),
                        shimmerWidget(
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            width: MediaQuery.of(context).size.width,
                            height: 140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: whiteColor,
                            ),
                          ),
                        ),
                        shimmerWidget(
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            width: MediaQuery.of(context).size.width,
                            height: 140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: whiteColor,
                            ),
                          ),
                        ),
                        shimmerWidget(
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            width: MediaQuery.of(context).size.width,
                            height: 140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: whiteColor,
                            ),
                          ),
                        ),
                        shimmerWidget(
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            width: MediaQuery.of(context).size.width,
                            height: 140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: whiteColor,
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      return state.historyNotPending.isEmpty
                          ? Center(
                              child: Text(
                                'Belum ada transaksi',
                                style: TextStyle(
                                  fontWeight: bold,
                                  fontFamily: 'ProximaNova',
                                  fontSize: 20,
                                ),
                              ),
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: state.historyNotPending.length,
                              itemBuilder: (BuildContext context, index) {
                                if (state.historyNotPending[index]
                                        .transactionType ==
                                    'CONSULTATION') {
                                  return TransaksiKonsultan(
                                    namaDokter: state.historyNotPending[index]
                                                .consultation ==
                                            null
                                        ? '-'
                                        : state.historyNotPending[index]
                                            .consultation.doctor.fullname,
                                    tanggal: ConvertDate.defaultDate(state
                                            .historyNotPending[index]
                                            .createdAt ??
                                        '-'),
                                    pesanan: 'Konsultasi',
                                    progres: state.historyNotPending[index]
                                                .status ==
                                            'MENUNGGU_PEMBAYARAN'
                                        ? 'Menunggu Pembayaran'
                                        : state.historyNotPending[index]
                                                    .status ==
                                                'READY'
                                            ? 'Ready'
                                            : state.historyNotPending[index]
                                                        .status ==
                                                    'REVIEW'
                                                ? 'Review'
                                                : state.historyNotPending[index]
                                                            .status ==
                                                        'AKTIF'
                                                    ? 'Aktif'
                                                    : state
                                                                .historyNotPending[
                                                                    index]
                                                                .status ==
                                                            'SELESAI'
                                                        ? 'Selesai'
                                                        : '-',
                                    keluhan: state.historyNotPending[index]
                                                .consultation ==
                                            null
                                        ? '-'
                                        : state
                                            .historyNotPending[index]
                                            .consultation
                                            .medicalHistory
                                            .interestCondition
                                            .name,
                                    harga: CurrencyFormat.convertToIdr(
                                        state
                                            .historyNotPending[index].totalPaid,
                                        0),
                                    img: state.historyNotPending[index]
                                                .consultation ==
                                            null
                                        ? '-'
                                        : '${Global.FILE}/${state.historyNotPending[index].consultation.doctor.mediaUserProfilePicture.media.path}',
                                  );
                                }

                                if (state.historyNotPending[index]
                                        .transactionType ==
                                    'TREATMENT') {
                                  return TransaksiTreatment(
                                    item: state.historyNotPending[index]
                                        .transactionTreatmentItems,
                                    tanggal: ConvertDate.defaultDate(state
                                            .historyNotPending[index]
                                            .createdAt ??
                                        '-'),
                                    pesanan: 'Treatment',
                                    progres: state.historyNotPending[index]
                                                .status ==
                                            'MENUNGGU_PEMBAYARAN'
                                        ? 'Menunggu Pembayaran'
                                        : state.historyNotPending[index]
                                                    .status ==
                                                'MENUNGGU_KONFIRMASI_KLINIK'
                                            ? 'Menunggu Konfirmasi Klinik'
                                            : state.historyNotPending[index]
                                                        .status ==
                                                    'KLINIK_MENGKONFIRMASI'
                                                ? 'Klinik Mengkonfirmasi'
                                                : state.historyNotPending[index]
                                                            .status ==
                                                        'SELESAI'
                                                    ? 'Selesai'
                                                    : '-',
                                    harga: CurrencyFormat.convertToIdr(
                                        state
                                            .historyNotPending[index].totalPaid,
                                        0),
                                  );
                                }
                                return null;
                              });
                    } else {
                      return Center(
                        child: Text(
                          'Belum ada transaksi',
                          style: TextStyle(
                            fontWeight: bold,
                            fontFamily: 'ProximaNova',
                            fontSize: 20,
                          ),
                        ),
                      );
                    }
                  } else {
                    return Text(
                        'Connection State: ${snapshot.connectionState}');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
