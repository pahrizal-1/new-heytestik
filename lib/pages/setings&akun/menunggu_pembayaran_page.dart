import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/transaction/history/all_history_transaction_controller.dart';
import 'package:heystetik_mobileapps/core/convert_date.dart';
import 'package:heystetik_mobileapps/core/currency_format.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/widget/daftar_transaksi_widgets.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';
import '../../theme/theme.dart';

class MenungguPemayaranPage extends StatefulWidget {
  MenungguPemayaranPage({super.key});

  @override
  State<MenungguPemayaranPage> createState() => _MenungguPemayaranPageState();
}

class _MenungguPemayaranPageState extends State<MenungguPemayaranPage> {
  final AllHistoryTransactionController state =
      Get.put(AllHistoryTransactionController());

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      state.getAllHistoryPending(context);
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
          child: state.historyPending.isEmpty
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
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 15),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.historyPending.length,
                      itemBuilder: (BuildContext context, index) {
                        if (state.historyPending[index].status ==
                            'MENUNGGU_PEMBAYARAN') {
                          if (state.historyPending[index].transactionType ==
                              'CONSULTATION') {
                            return TransaksiKonsultan(
                              namaDokter:
                                  state.historyPending[index].consultation ==
                                          null
                                      ? '-'
                                      : state.historyPending[index].consultation
                                          .doctor.fullname,
                              expireDate: state.historyPending[index]
                                          .paymentExpiryTime ==
                                      null
                                  ? ''
                                  : ConvertDate.payBefore(state
                                          .historyPending[index]
                                          .paymentExpiryTime ??
                                      '-'),
                              tanggal: ConvertDate.defaultDate(
                                  state.historyPending[index].createdAt ?? '-'),
                              pesanan: 'Konsultasi',
                              progres: state.historyPending[index].status ==
                                      'MENUNGGU_PEMBAYARAN'
                                  ? 'Menunggu Pembayaran'
                                  : state.historyPending[index].status ==
                                          'READY'
                                      ? 'Ready'
                                      : state.historyPending[index].status ==
                                              'REVIEW'
                                          ? 'Review'
                                          : state.historyPending[index]
                                                      .status ==
                                                  'AKTIF'
                                              ? 'Aktif'
                                              : state.historyPending[index]
                                                          .status ==
                                                      'SELESAI'
                                                  ? 'Selesai'
                                                  : '-',
                              keluhan:
                                  state.historyPending[index].consultation ==
                                          null
                                      ? '-'
                                      : state
                                          .historyPending[index]
                                          .consultation
                                          .medicalHistory
                                          .interestCondition
                                          .name,
                              harga: CurrencyFormat.convertToIdr(
                                  state.historyPending[index].totalPaid, 0),
                              img: state.historyPending[index].consultation ==
                                      null
                                  ? '-'
                                  : '${Global.FILE}/${state.historyPending[index].consultation.doctor.mediaUserProfilePicture.media.path}',
                            );
                          }

                          if (state.historyPending[index].transactionType ==
                              'TREATMENT') {
                            return TransaksiTreatment(
                              item: state.historyPending[index]
                                  .transactionTreatmentItems,
                              tanggal: ConvertDate.defaultDate(
                                  state.historyPending[index].createdAt ?? '-'),
                              expireDate: state.historyPending[index]
                                          .paymentExpiryTime ==
                                      null
                                  ? ''
                                  : ConvertDate.payBefore(state
                                          .historyPending[index]
                                          .paymentExpiryTime ??
                                      '-'),
                              pesanan: 'Treatment',
                              progres: state.historyPending[index].status ==
                                      'MENUNGGU_PEMBAYARAN'
                                  ? 'Menunggu Pembayaran'
                                  : state.historyPending[index].status ==
                                          'MENUNGGU_KONFIRMASI_KLINIK'
                                      ? 'Menunggu Konfirmasi Klinik'
                                      : state.historyPending[index].status ==
                                              'KLINIK_MENGKONFIRMASI'
                                          ? 'Klinik Mengkonfirmasi'
                                          : state.historyPending[index]
                                                      .status ==
                                                  'SELESAI'
                                              ? 'Selesai'
                                              : '-',
                              harga: CurrencyFormat.convertToIdr(
                                  state.historyPending[index].totalPaid, 0),
                            );
                          }
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
