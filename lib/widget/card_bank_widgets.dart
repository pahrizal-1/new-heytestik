import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:heystetik_mobileapps/controller/customer/transaction/order/order_product_controller.dart';
import 'package:heystetik_mobileapps/core/global.dart';

import 'package:heystetik_mobileapps/theme/theme.dart';

import 'package:heystetik_mobileapps/models/customer/payment_method_model.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import '../../controller/customer/transaction/order/order_treatmetment_controller.dart';

class CardTreatmentBank extends StatelessWidget {
  CardTreatmentBank({
    super.key,
  });

  final OrderTreatmentController state = Get.put(OrderTreatmentController());

  @override
  Widget build(BuildContext context) {
    return state.getPaymentMethod.isEmpty
        ? Text(
            'Tidak ada metode pemayaran',
            style: TextStyle(
              fontSize: 20,
            ),
          )
        : GroupedListView<Data, String>(
            elements: state.getPaymentMethod.toList(),
            groupBy: (element) => element.segment.toString(),
            groupComparator: (value1, value2) => value2.compareTo(value1),
            order: GroupedListOrder.ASC,
            useStickyGroupSeparators: true,
            shrinkWrap: true,
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            physics: const NeverScrollableScrollPhysics(),
            groupSeparatorBuilder: (String value) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                dividergreen(),
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 10, top: 10, left: 20, right: 20),
                  child: Text(
                    value,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            itemBuilder: (c, element) {
              return InkWell(
                onTap: () {
                  if (element.isActive != false) {
                    state.idPayment.value = element.id!.toInt();
                    state.paymentMethod.value = element.method ?? '-';
                    state.paymentType.value = element.type ?? '-';
                  }
                },
                child: Container(
                  margin: const EdgeInsets.only(
                      right: 20, top: 10, bottom: 10, left: 20),
                  height: 35,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.network(
                            '${Global.FILE}/${element.mediaPaymentMethod!.media!.path.toString()}',
                            width: 40,
                            height: 35,
                            color: element.isActive! ? null : blackColor,
                          ),
                          const SizedBox(
                            width: 19,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                element.name ?? '-',
                                style: blackTextStyle.copyWith(fontSize: 15),
                              ),
                              Text(
                                element.isActive!
                                    ? element.description ?? '-'
                                    : 'Tidak tersedia untuk transaksi ini',
                                style: blackRegulerTextStyle.copyWith(
                                    fontSize: 12),
                              )
                            ],
                          ),
                          const Spacer(),
                          element.isActive!
                              ? Obx(
                                  () => Icon(
                                    state.idPayment.value == element.id
                                        ? Icons.radio_button_on
                                        : Icons.circle_outlined,
                                    size: 23,
                                    color: state.idPayment.value == element.id
                                        ? greenColor
                                        : blackColor,
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
  }
}

class CardProdukBank extends StatelessWidget {
  CardProdukBank({
    super.key,
  });

  final OrderProductController state = Get.put(OrderProductController());

  @override
  Widget build(BuildContext context) {
    return state.getPaymentMethod.isEmpty
        ? Center(
            child: Text(
              'Tidak ada metode pemayaran',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          )
        : GroupedListView<Data, String>(
            elements: state.getPaymentMethod.toList(),
            groupBy: (element) => element.segment.toString(),
            groupComparator: (value1, value2) => value2.compareTo(value1),
            order: GroupedListOrder.ASC,
            useStickyGroupSeparators: true,
            shrinkWrap: true,
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            physics: const NeverScrollableScrollPhysics(),
            groupSeparatorBuilder: (String value) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                dividergreen(),
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 10, top: 10, left: 20, right: 20),
                  child: Text(
                    value,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            itemBuilder: (c, element) {
              return InkWell(
                onTap: () {
                  if (element.isActive != false) {
                    state.idPayment.value = element.id!.toInt();
                    state.paymentMethod.value = element.method ?? '-';
                    state.paymentType.value = element.type ?? '-';
                  }
                },
                child: Container(
                  margin: const EdgeInsets.only(
                      right: 20, top: 10, bottom: 10, left: 20),
                  height: 35,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.network(
                            '${Global.FILE}/${element.mediaPaymentMethod!.media!.path.toString()}',
                            width: 40,
                            height: 35,
                            color: element.isActive! ? null : blackColor,
                          ),
                          const SizedBox(
                            width: 19,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                element.name ?? '-',
                                style: blackTextStyle.copyWith(fontSize: 15),
                              ),
                              Text(
                                element.isActive!
                                    ? element.description ?? '-'
                                    : 'Tidak tersedia untuk transaksi ini',
                                style: blackRegulerTextStyle.copyWith(
                                    fontSize: 12),
                              )
                            ],
                          ),
                          const Spacer(),
                          element.isActive!
                              ? Obx(
                                  () => Icon(
                                    state.idPayment.value == element.id
                                        ? Icons.radio_button_on
                                        : Icons.circle_outlined,
                                    size: 23,
                                    color: state.idPayment.value == element.id
                                        ? greenColor
                                        : blackColor,
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
  }
}

class CardKonsultasiBank extends StatelessWidget {
  CardKonsultasiBank({
    super.key,
  });

  final OrderProductController state = Get.put(OrderProductController());

  @override
  Widget build(BuildContext context) {
    return state.getPaymentMethod.isEmpty
        ? Center(
            child: Text(
              'Tidak ada metode pemayaran',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          )
        : GroupedListView<Data, String>(
            elements: state.getPaymentMethod.toList(),
            groupBy: (element) => element.segment.toString(),
            groupComparator: (value1, value2) => value2.compareTo(value1),
            order: GroupedListOrder.ASC,
            useStickyGroupSeparators: true,
            shrinkWrap: true,
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            physics: const NeverScrollableScrollPhysics(),
            groupSeparatorBuilder: (String value) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                dividergreen(),
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 10, top: 10, left: 20, right: 20),
                  child: Text(
                    value,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            itemBuilder: (c, element) {
              return InkWell(
                onTap: () {
                  if (element.isActive != false) {
                    state.idPayment.value = element.id!.toInt();
                    state.paymentMethod.value = element.method ?? '-';
                    state.paymentType.value = element.type ?? '-';
                  }
                },
                child: Container(
                  margin: const EdgeInsets.only(
                      right: 20, top: 10, bottom: 10, left: 20),
                  height: 35,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.network(
                            '${Global.FILE}/${element.mediaPaymentMethod!.media!.path.toString()}',
                            width: 40,
                            height: 35,
                            color: element.isActive! ? null : blackColor,
                          ),
                          const SizedBox(
                            width: 19,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                element.name ?? '-',
                                style: blackTextStyle.copyWith(fontSize: 15),
                              ),
                              Text(
                                element.isActive!
                                    ? element.description ?? '-'
                                    : 'Tidak tersedia untuk transaksi ini',
                                style: blackRegulerTextStyle.copyWith(
                                    fontSize: 12),
                              )
                            ],
                          ),
                          const Spacer(),
                          element.isActive!
                              ? Obx(
                                  () => Icon(
                                    state.idPayment.value == element.id
                                        ? Icons.radio_button_on
                                        : Icons.circle_outlined,
                                    size: 23,
                                    color: state.idPayment.value == element.id
                                        ? greenColor
                                        : blackColor,
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
  }
}
