import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/transaction/history/history_consultation_controller.dart';
import 'package:heystetik_mobileapps/core/convert_date.dart';
import 'package:heystetik_mobileapps/core/currency_format.dart';
import 'package:heystetik_mobileapps/widget/daftar_transaksi_widgets.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';

import '../../theme/theme.dart';

class MenungguPemayaranPage extends StatefulWidget {
  MenungguPemayaranPage({super.key});

  @override
  State<MenungguPemayaranPage> createState() => _MenungguPemayaranPageState();
}

class _MenungguPemayaranPageState extends State<MenungguPemayaranPage> {
  final HistoryConsultationController state =
      Get.put(HistoryConsultationController());
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      state.getHistoryConsultationPaymentpending(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        automaticallyImplyLeading: false,
        backgroundColor: whiteColor,
        title: Padding(
          padding: const EdgeInsets.only(left: 6),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: blackColor,
                ),
              ),
              const SizedBox(
                width: 11,
              ),
              Expanded(
                child: Text(
                  'Menunggu Pembayaran',
                  style: blackTextStyle.copyWith(
                    fontSize: 20,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: Obx(
        () => LoadingWidget(
          isLoading: state.isLoading.value,
          child: state.paymentPending!.isEmpty
              ? Center(
                  child: Text(
                    'Tidak ada data',
                    style: TextStyle(
                      fontWeight: bold,
                      fontFamily: 'ProximaNova',
                      fontSize: 20,
                    ),
                  ),
                )
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 15),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.paymentPending!.length,
                      itemBuilder: (BuildContext context, index) {
                        if (state.paymentPending![index].status ==
                            'MENUNGGU_PEMBAYARAN') {
                          return DaftarTransaksiProduk(
                            nameProduk: 'dr. Risty Hafinah, Sp.DV',
                            tanggal: ConverDate.defaultDate(
                                state.paymentPending?[index].createdAt ?? '-'),
                            pesanan: 'Konsultasi',
                            progres: 'Menunggu Pembayaran',
                            jumlahBarang: 'Bekas Jerawat',
                            harga: CurrencyFormat.convertToIdr(
                                state.paymentPending?[index].totalPaid, 0),
                            img: 'assets/images/doctor-img.png',
                            isConsultation: true,
                          );
                        }
                        return Container();
                      },
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
