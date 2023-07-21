import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/transaction/history/history_consultation_controller.dart';
import 'package:heystetik_mobileapps/core/convert_date.dart';
import 'package:heystetik_mobileapps/core/currency_format.dart';
import 'package:heystetik_mobileapps/models/customer/transaction_history_consultation_model.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/menunggu_pembayaran_page.dart';
import 'package:heystetik_mobileapps/widget/shimmer_widget.dart';

import '../../theme/theme.dart';

import '../../widget/daftar_transaksi_widgets.dart';

class DaftarTransaksiPage extends StatelessWidget {
  DaftarTransaksiPage({super.key});
  final HistoryConsultationController state =
      Get.put(HistoryConsultationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        automaticallyImplyLeading: false,
        backgroundColor: whiteColor,
        title: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: blackColor,
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: borderColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(13),
                        child: Image.asset(
                          'assets/icons/search1.png',
                          width: 12,
                          color: subgreyColor,
                        ),
                      ),
                      hintText: 'Cari Alamat',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        actions: [
          SvgPicture.asset(
            'assets/icons/trello-icons.svg',
          ),
          const SizedBox(
            width: 14,
          ),
          SvgPicture.asset(
            'assets/icons/humberger-icons.svg',
          ),
          const SizedBox(
            width: 26,
          ),
        ],
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(55.0),
            child: Container(
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MenungguPemayaranPage(),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/icons/uang-icons.png',
                          width: 20,
                          height: 11,
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
                          () => state.totalPendingPayment.value == 0
                              ? Container()
                              : Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 2),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: redColor),
                                  child: Text(
                                    state.totalPendingPayment.value.toString(),
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
                future: state.getHistoryConsultation(context),
                builder: (context,
                    AsyncSnapshot<TransactionHistoryConsultationModel?>
                        snapshot) {
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
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data!.data?.data?.length,
                        itemBuilder: (BuildContext context, index) {
                          return DaftarTransaksiProduk(
                            nameProduk: 'dr. Risty Hafinah, Sp.DV',
                            tanggal: ConverDate.defaultDate(
                                snapshot.data!.data?.data?[index].createdAt ??
                                    '-'),
                            pesanan: 'Konsultasi',
                            progres: snapshot.data!.data?.data?[index].status ==
                                    'MENUNGGU_PEMBAYARAN'
                                ? 'Menunggu Pembayaran'
                                : snapshot.data!.data?.data?[index].status ==
                                        'READY'
                                    ? 'Review'
                                    : 'Selesai',
                            jumlahBarang: 'Bekas Jerawat',
                            // totalBelanjaan: 'Total Harga',
                            harga: CurrencyFormat.convertToIdr(
                                snapshot.data!.data?.data?[index].totalPaid, 0),
                            // titleButton: 'Konsultasi lagi',
                            // colorTittleProgres:  greenColor,
                            // colortittleBg: subgreenColor,
                            img: 'assets/images/doctor-img.png',
                            isConsultation: true,
                          );
                        },
                      );
                    } else {
                      return Center(
                        child: Text(
                          'Tidak ada data',
                          style: TextStyle(
                            fontWeight: bold,
                            fontFamily: 'ProximaNova',
                            fontSize: 15,
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
              // DaftarTransaksiProduk(
              //   nameProduk: 'Pesan Obat & Skincare',
              //   tanggal: '12 Jun 2023',
              //   pesanan: 'Teenderm Hydra 40ml',
              //   progres: 'Selesai',
              //   jumlahBarang: '1',
              //   produkLainnya: '+2 produk lainnya',
              //   totalBelanjaan: 'Total Belanja',
              //   harga: 'Rp915.000',
              //   titleButton: 'Beli Lagi',
              //   colorTittleProgres: greenColor,
              //   colortittleBg: subgreenColor,
              //   img: 'assets/images/penting1.png',
              // ),
              // const DaftarTransaksiProduk(
              //   nameProduk: 'Pesan Obat & Skincare',
              //   tanggal: '12 Jun 2023',
              //   pesanan: 'Teenderm Hydra 40ml',
              //   progres: 'Diproses',
              //   jumlahBarang: '1',
              //   produkLainnya: '+2 produk lainnya',
              //   totalBelanjaan: 'Total Belanja',
              //   harga: 'Rp915.000',
              //   titleButton: 'Beli Lagi',
              //   colorTittleProgres: Color.fromARGB(255, 255, 102, 0),
              //   colortittleBg: Color.fromARGB(255, 255, 204, 170),
              //   img: 'assets/images/penting1.png',
              // ),
              // DaftarTransaksiProduk(
              //   nameProduk: 'dr. Risty Hafinah, Sp.DV',
              //   tanggal: '10 Jun 2023',
              //   pesanan: 'Konsultasi',
              //   progres: 'Aktif',
              //   jumlahBarang: 'Bekas Jerawat',
              //   totalBelanjaan: 'Total Harga',
              //   harga: 'Rp915.000',
              //   titleButton: 'Konsultasi lagi',
              //   colorTittleProgres: greenColor,
              //   colortittleBg: subgreenColor,
              //   img: 'assets/images/doctor-img.png',
              // ),
              // const DaftarTransaksiProduk(
              //   nameProduk: 'Peeling TCA Ringan',
              //   tanggal: '10 Jun 2023',
              //   pesanan: 'Reservasi Treatment',
              //   progres: 'Menunggu Konfirmasi Klinik',
              //   jumlahBarang: 'Klinik Utama Lithea',
              //   totalBelanjaan: 'Total Belanja',
              //   harga: 'Rp915.000',
              //   titleButton: 'Reservasi lagi',
              //   colorTittleProgres: Color.fromARGB(255, 255, 102, 0),
              //   colortittleBg: Color.fromARGB(255, 255, 204, 170),
              //   img: 'assets/images/treat1.png',
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
