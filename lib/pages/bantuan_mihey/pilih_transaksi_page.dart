// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/transaction/history/history_transaction_controller.dart';

import 'package:heystetik_mobileapps/pages/chat_customer/selesai_pembayaran_konsultasi_page.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/success_page.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/detail_transaksi_page.dart';
import 'package:heystetik_mobileapps/pages/solution/selesai_pembayaran_produk_page.dart';
import 'package:heystetik_mobileapps/pages/solution/selesai_pembayaran_treatment_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/models/customer/transaction_history_model.dart';
import 'package:heystetik_mobileapps/widget/card_transaction_minhey.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';

class PilihTranskasiMinheyPage extends StatefulWidget {
  const PilihTranskasiMinheyPage({super.key});

  @override
  State<PilihTranskasiMinheyPage> createState() =>
      _PilihTranskasiMinheyPageState();
}

class _PilihTranskasiMinheyPageState extends State<PilihTranskasiMinheyPage> {
  final HistoryTransactionController state =
      Get.put(HistoryTransactionController());
  final ScrollController scrollController = ScrollController();
  final TextEditingController searchController = TextEditingController();

  List<Data2> history = [];
  int page = 1;
  String? search;
  Map<String, dynamic> filter = {};
  int totalPending = 0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      history.addAll(await state.getAllHistory(
        context,
        page,
        search: search,
        filter: filter,
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
            history.addAll(await state.getAllHistory(
              context,
              page,
              search: search,
              filter: filter,
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
        elevation: 0,
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
                child: Image.asset(
                  'assets/icons/danger-icons.png',
                  width: 15,
                ),
              ),
              const SizedBox(
                width: 18,
              ),
              Text(
                'Pilih transaksi',
                style: blackHigtTextStyle.copyWith(fontSize: 20),
              ),
            ],
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(56.0),
          child: Container(
            padding:
                const EdgeInsets.only(left: 25, right: 25, bottom: 10, top: 10),
            height: 56.0,
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(
                  color: fromCssColor('#CCCCCC'),
                ),
                borderRadius: BorderRadius.circular(35),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 10,
                    ),
                    child: Image.asset(
                      'assets/icons/search1.png',
                      width: 10,
                    ),
                  ),
                  Container(
                    transform: Matrix4.translationValues(0, -2, 0),
                    constraints: const BoxConstraints(maxWidth: 250),
                    child: TextFormField(
                      controller: searchController,
                      onEditingComplete: () async {
                        page = 1;
                        history.clear();
                        search = searchController.text;
                        history.addAll(await state.getAllHistory(
                          context,
                          page,
                          search: search,
                          filter: filter,
                        ));
                        setState(() {});
                      },
                      style: const TextStyle(
                          fontSize: 15, fontFamily: "ProximaNova"),
                      decoration: InputDecoration(
                        hintText: "Cari Transaksi",
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          fontFamily: "ProximaNova",
                          color: fromCssColor(
                            '#9B9B9B',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 25,
          right: 25,
        ),
        child: Obx(
          () => LoadingWidget(
            isLoading:
                state.isLoadingMore.value ? false : state.isLoading.value,
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
                        ListView.builder(
                          shrinkWrap: true,
                          keyboardDismissBehavior:
                              ScrollViewKeyboardDismissBehavior.onDrag,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: history.length,
                          itemBuilder: (BuildContext context, int index) {
                            if (history[index].transactionType ==
                                'CONSULTATION') {
                              return InkWell(
                                onTap: () {
                                  if (history[index].detail?.status ==
                                      'MENUNGGU_PEMBAYARAN') {
                                    Get.to(() =>
                                        SelesaikanPembayaranKonsultasiPage(
                                          isWillPop: false,
                                          orderId:
                                              history[index].detail!.orderId!,
                                          expireTime: '',
                                          paymentMethodId: history[index]
                                              .detail!
                                              .paymentMethodId!,
                                        ));
                                  } else if (history[index].detail?.status ==
                                      'READY') {
                                    Get.to(() => SuccessPage(
                                          isNotConsultation: false,
                                          orderId:
                                              history[index].detail?.orderId ??
                                                  '',
                                          isWillPop: false,
                                        ));
                                  }
                                },
                                child: CardTransKons(
                                  data: history[index],
                                ),
                              );
                            } else if (history[index].transactionType ==
                                'TREATMENT') {
                              return InkWell(
                                onTap: () {
                                  if (history[index].detail?.status ==
                                      'MENUNGGU_PEMBAYARAN') {
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
                                  }
                                },
                                child: CardTransTreat(
                                  data: history[index],
                                ),
                              );
                            } else if (history[index].transactionType ==
                                'PRODUCT') {
                              return InkWell(
                                onTap: () {
                                  if (history[index].detail?.status ==
                                      'MENUNGGU_PEMBAYARAN') {
                                    Get.to(
                                      () => SelesaikanPembayaranProdukPage(
                                        isWillPop: false,
                                        orderId:
                                            history[index].detail!.orderId!,
                                        expireTime: '',
                                        paymentMethodId: history[index]
                                            .detail!
                                            .paymentMethodId!,
                                      ),
                                    );
                                  } else if (history[index].detail?.status ==
                                      'SELESAI') {
                                    Get.to(
                                      () => DetailTransaksiPage(
                                        transactionId:
                                            history[index].detail!.id!,
                                      ),
                                    );
                                  }
                                },
                                child: CardTransProd(
                                  data: history[index],
                                ),
                              );
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Obx(
                          () => state.isLoading.value
                              ? Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: LoadingMore(),
                                )
                              : Container(),
                        ),
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
