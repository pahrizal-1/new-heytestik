// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/transaction/history/history_transaction_controller.dart';
import 'package:heystetik_mobileapps/core/convert_date.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';

import '../../theme/theme.dart';
import '../../widget/timeline_status_widget.dart';

class DetailStatusPage extends StatefulWidget {
  String transactionId;
  DetailStatusPage({required this.transactionId, super.key});

  @override
  State<DetailStatusPage> createState() => _DetailStatusPageState();
}

class _DetailStatusPageState extends State<DetailStatusPage> {
  final HistoryTransactionController state =
      Get.put(HistoryTransactionController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await state.trackingProduct(
        context,
        widget.transactionId.toString(),
      );
      setState(() {});
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
                  'Detail Pesanan',
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25, top: 43),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/icons/detail_status1.png',
                        width: 55,
                        height: 55,
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'assets/icons/detail_status2.png',
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'assets/icons/detail_status3.png',
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'assets/icons/detail_status4.png',
                        width: 55,
                        height: 55,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    TimeLineStatusWidgets(
                      isFirst: true,
                      isLast: false,
                      isPast: false,
                    ),
                    TimeLineStatusWidgets(
                      isFirst: false,
                      isLast: false,
                      isPast: state.detailTransaksiProd.value.data!
                                  .orderStatus ==
                              'ORDER_COMPLETED'
                          ? false
                          : state.detailTransaksiProd.value.data!.orderStatus ==
                                  'IN_DELIVERY'
                              ? false
                              : true,
                    ),
                    TimeLineStatusWidgets(
                      isFirst: false,
                      isLast: false,
                      isPast:
                          state.detailTransaksiProd.value.data!.orderStatus ==
                                  'ORDER_COMPLETED'
                              ? false
                              : true,
                    ),
                    TimeLineStatusWidgets(
                      isFirst: false,
                      isLast: true,
                      isPast:
                          state.detailTransaksiProd.value.data!.orderStatus ==
                                  'ORDER_COMPLETED'
                              ? false
                              : true,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Obx(
                    () => Text(
                      state.detailTransaksiProd.value.data!.orderStatus ==
                                  'NEW_ORDER' ||
                              state.detailTransaksiProd.value.data
                                      ?.orderStatus ==
                                  'DELIVERY_PROCESS'
                          ? 'Pesanan Diproses'
                          : state.detailTransaksiProd.value.data!.orderStatus ==
                                  'IN_DELIVERY'
                              ? 'Pesanan Dikirim'
                              : state.detailTransaksiProd.value.data!
                                          .orderStatus ==
                                      'ORDER_COMPLETED'
                                  ? 'Pesanan Selesai'
                                  : '-',
                      style: grenTextStyle.copyWith(
                        fontSize: 15,
                        fontWeight: regular,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 51,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Detail Produk',
                        style: blackTextStyle.copyWith(fontSize: 20),
                      ),
                      ...state.trackingProd.value.data!
                          .asMap()
                          .entries
                          .map((item) {
                        return TimeLineStatusPengrimanWidgets(
                          isFirst: item.key == 0 ? true : false,
                          isLast: (state.trackingProd.value.data!.length - 1) ==
                                  item.key
                              ? true
                              : false,
                          isPast: false,
                          colortitle1: greenColor,
                          jam:
                              '${ConvertDate.schedule(item.value.date.toString())} WIB',
                          title1: ConvertDate.normalDate(
                              item.value.date.toString()),
                          title2: item.value.status.toString(),
                          title3: item.value.description.toString(),
                        );
                      }).toList(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
