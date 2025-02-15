// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/transaction/history/history_transaction_controller.dart';
import 'package:heystetik_mobileapps/core/convert_date.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/pages/solution/selesai_pembayaran_treatment_page.dart';
import 'package:heystetik_mobileapps/widget/daftar_transaksi_widgets.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';
import '../../models/customer/transaction_history_model.dart';
import '../../theme/theme.dart';

class MenungguPemayaranPage extends StatefulWidget {
  String? search;
  Map<String, dynamic> filter;
  MenungguPemayaranPage({
    required this.search,
    required this.filter,
    super.key,
  });

  @override
  State<MenungguPemayaranPage> createState() => _MenungguPemayaranPageState();
}

class _MenungguPemayaranPageState extends State<MenungguPemayaranPage> {
  final HistoryTransactionController state =
      Get.put(HistoryTransactionController());
  final ScrollController scrollController = ScrollController();
  List<Data2> history = [];
  int page = 1;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      history.addAll(await state.getAllHistoryPending(
        context,
        page,
        search: widget.search,
        filter: widget.filter,
      ));
      setState(() {});
    });

    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool isTop = scrollController.position.pixels == 0;
        if (!isTop) {
          page += 1;
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
            state.isLoadingMore.value = true;
            history.addAll(await state.getAllHistoryPending(
              context,
              page,
              search: widget.search,
              filter: widget.filter,
            ));
            setState(() {});
            state.isLoadingMore.value = false;
          });
        }
      }
    });
    super.initState();
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
          isLoading: state.isLoadingMore.value ? false : state.isLoading.value,
          child: history.isEmpty
              ? Center(
                  child: Text(
                    'Belum ada transaksi',
                    style: TextStyle(
                      fontFamily: 'ProximaNova',
                      fontSize: 20,
                    ),
                  ),
                )
              : SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 15),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: history.length,
                          itemBuilder: (BuildContext context, index) {
                            if (history[index].transactionType ==
                                'CONSULTATION') {
                              return TransaksiKonsultan(
                                namaDokter:
                                    history[index].detail?.consultation == null
                                        ? '-'
                                        : history[index]
                                                .detail
                                                ?.consultation
                                                ?.doctor
                                                ?.fullname ??
                                            '-',
                                expireDate:
                                    history[index].detail?.paymentExpiryTime ==
                                            null
                                        ? ''
                                        : ConvertDate.payBefore(history[index]
                                                .detail
                                                ?.paymentExpiryTime ??
                                            '-'),
                                tanggal: ConvertDate.defaultDate(
                                    history[index].detail?.createdAt ?? '-'),
                                pesanan: 'Konsultasi',
                                progres: history[index].detail?.status ==
                                        'MENUNGGU_PEMBAYARAN'
                                    ? 'Menunggu Pembayaran'
                                    : history[index].detail?.status == 'READY'
                                        ? 'Ready'
                                        : history[index].detail?.status ==
                                                'REVIEW'
                                            ? 'Review'
                                            : history[index].detail?.status ==
                                                    'AKTIF'
                                                ? 'Aktif'
                                                : history[index]
                                                            .detail
                                                            ?.status ==
                                                        'SELESAI'
                                                    ? 'Selesai'
                                                    : '-',
                                keluhan: history[index]
                                        .detail
                                        ?.medicalHistory
                                        ?.interestCondition
                                        ?.concern
                                        ?.name ??
                                    '-',
                                harga: history[index].detail!.totalPaid!,
                                img: history[index].detail?.consultation == null
                                    ? '-'
                                    : '${Global.FILE}/${history[index].detail?.consultation?.doctor?.mediaUserProfilePicture?.media?.path}',
                                orderId:
                                    history[index].transactionId.toString(),
                                paymentMethodId:
                                    history[index].detail!.paymentMethodId!,
                                vaNumber:
                                    history[index].detail?.vaNumber ?? '-',
                              );
                            }

                            if (history[index].transactionType == 'TREATMENT') {
                              return InkWell(
                                onTap: () {
                                  Get.to(
                                      () => SelesaikanPembayaranTreatmentPage(
                                            isWillPop: false,
                                            orderId: history[index]
                                                .transactionId
                                                .toString(),
                                            expireTime: '',
                                            paymentMethodId: history[index]
                                                .detail!
                                                .paymentMethodId!,
                                          ));
                                },
                                child: TransaksiTreatment(
                                  item: history[index]
                                      .detail
                                      ?.transactionTreatmentItems,
                                  orderId:
                                      history[index].transactionId.toString(),
                                  tanggal: ConvertDate.defaultDate(
                                      history[index].detail?.createdAt ?? '-'),
                                  expireDate: history[index]
                                              .detail
                                              ?.paymentExpiryTime ==
                                          null
                                      ? ''
                                      : ConvertDate.payBefore(history[index]
                                              .detail
                                              ?.paymentExpiryTime ??
                                          '-'),
                                  pesanan: 'Treatment',
                                  progres: history[index].detail?.status ==
                                          'MENUNGGU_PEMBAYARAN'
                                      ? 'Menunggu Pembayaran'
                                      : history[index].detail?.status ==
                                              'MENUNGGU_KONFIRMASI_KLINIK'
                                          ? 'Menunggu Konfirmasi Klinik'
                                          : history[index].detail?.status ==
                                                  'KLINIK_MENGKONFIRMASI'
                                              ? 'Klinik Mengkonfirmasi'
                                              : history[index].detail?.status ==
                                                      'SELESAI'
                                                  ? 'Selesai'
                                                  : '-',
                                  harga: history[index].detail!.totalPaid!,
                                  paymentMethodId:
                                      history[index].detail!.paymentMethodId!,
                                  vaNumber:
                                      history[index].detail?.vaNumber ?? '-',
                                ),
                              );
                            }

                            if (history[index].transactionType == 'PRODUCT') {
                              return TransaksiProduk(
                                orderId:
                                    history[index].transactionId.toString(),
                                product: history[index].detail,
                              );
                            }
                            return null;
                          },
                        ),
                      ),
                      Obx(
                        () =>
                            state.isLoading.value ? LoadingMore() : Container(),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
