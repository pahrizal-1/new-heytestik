import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:heystetik_mobileapps/controller/customer/transaction/order/order_consultation_controller.dart';
import 'package:heystetik_mobileapps/controller/customer/transaction/order/order_product_controller.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/models/customer/payment_method_model.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import '../../controller/customer/transaction/order/order_treatmetment_controller.dart';

class CardBankProduk extends StatefulWidget {
  const CardBankProduk({super.key});

  @override
  State<CardBankProduk> createState() => _CardBankProdukState();
}

class _CardBankProdukState extends State<CardBankProduk> {
  OrderProductController state = Get.put(OrderProductController());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Wrap(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 60,
                  left: 10,
                  right: 10,
                  bottom: 60,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Image.asset(
                            'assets/icons/danger-icons.png',
                            width: 20,
                          ),
                        ),
                        const SizedBox(
                          width: 17,
                        ),
                        Text(
                          'Pilih Metode Pembayaran',
                          style: blackHigtTextStyle.copyWith(fontSize: 20),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    state.getPaymentMethod.isEmpty
                        ? Center(
                            child: Text(
                              'Belum ada motode pembayaran',
                              style: TextStyle(
                                fontFamily: 'ProximaNova',
                                fontSize: 20,
                              ),
                            ),
                          )
                        : GroupedListView<Data, String>(
                            elements: state.getPaymentMethod.toList(),
                            groupBy: (element) => element.segment.toString(),
                            groupComparator: (value1, value2) =>
                                value2.compareTo(value1),
                            order: GroupedListOrder.ASC,
                            useStickyGroupSeparators: true,
                            shrinkWrap: true,
                            keyboardDismissBehavior:
                                ScrollViewKeyboardDismissBehavior.onDrag,
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
                                  if (element.isActive ?? false) {
                                    state.idPayment.value = element.id!.toInt();
                                    state.paymentMethod.value =
                                        element.method ?? '-';
                                    state.bankName.value = element.name ?? '-';
                                    state.paymentType.value =
                                        element.type ?? '-';
                                    state.bankImage.value = element
                                            .mediaPaymentMethod?.media?.path ??
                                        '';
                                    state.transactionFeeFunct(element);
                                    Get.back();
                                  }
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      right: 20, top: 10, bottom: 10, left: 20),
                                  height: 35,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Image.network(
                                            '${Global.FILE}/${element.mediaPaymentMethod?.media?.path.toString()}',
                                            width: 40,
                                            height: 35,
                                          ),
                                          const SizedBox(
                                            width: 19,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                element.name ?? '-',
                                                style: blackTextStyle.copyWith(
                                                  fontSize: 15,
                                                  color:
                                                      element.isActive ?? false
                                                          ? blackColor
                                                          : greyColor,
                                                ),
                                              ),
                                              Text(
                                                element.isActive ?? false
                                                    ? element.description ?? '-'
                                                    : 'Tidak tersedia untuk transaksi ini',
                                                style: blackRegulerTextStyle
                                                    .copyWith(fontSize: 12),
                                              )
                                            ],
                                          ),
                                          const Spacer(),
                                          element.isActive ?? false
                                              ? Obx(
                                                  () => Icon(
                                                    state.idPayment.value ==
                                                            element.id
                                                        ? Icons.radio_button_on
                                                        : Icons.circle_outlined,
                                                    size: 23,
                                                    color:
                                                        state.idPayment.value ==
                                                                element.id
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
                          ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CardTreatmentBank extends StatelessWidget {
  CardTreatmentBank({
    super.key,
  });

  final OrderTreatmentController state = Get.put(OrderTreatmentController());

  @override
  Widget build(BuildContext context) {
    return state.getPaymentMethod.isEmpty
        ? Center(
            child: Text(
              'Belum ada motede pembayaran',
              style: TextStyle(
                fontFamily: 'ProximaNova',
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
              return (element.isDisplayed ?? false)
                  ? InkWell(
                      onTap: () {
                        if (element.isActive ?? false) {
                          state.idPayment.value = element.id!.toInt();
                          state.paymentMethod.value = element.method ?? '-';
                          state.paymentType.value = element.type ?? '-';
                          state.bankImage.value =
                              element.mediaPaymentMethod?.media?.path ?? '';
                          state.transactionFeeFunct(element);
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
                                  // color: element.isActive ?? false ? null : blackColor,
                                ),
                                const SizedBox(
                                  width: 19,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      element.name ?? '-',
                                      style: blackTextStyle.copyWith(
                                        fontSize: 15,
                                        color: element.isActive ?? false
                                            ? blackColor
                                            : greyColor,
                                      ),
                                    ),
                                    Text(
                                      element.isActive ?? false
                                          ? element.description ?? '-'
                                          : 'Tidak tersedia untuk transaksi ini',
                                      style: blackRegulerTextStyle.copyWith(
                                          fontSize: 12),
                                    )
                                  ],
                                ),
                                const Spacer(),
                                element.isActive ?? false
                                    ? Obx(
                                        () => Icon(
                                          state.idPayment.value == element.id
                                              ? Icons.radio_button_on
                                              : Icons.circle_outlined,
                                          size: 23,
                                          color: state.idPayment.value ==
                                                  element.id
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
                    )
                  : Container();
            },
          );
  }
}

class CardKonsultasiBank extends StatelessWidget {
  CardKonsultasiBank({
    super.key,
  });

  final OrderConsultationController state =
      Get.put(OrderConsultationController());

  @override
  Widget build(BuildContext context) {
    return state.getPaymentMethod.isEmpty
        ? Center(
            child: Text(
              'Belum ada metode pembayaran',
              style: TextStyle(
                fontFamily: 'ProximaNova',
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
              return (element.isDisplayed ?? false)
                  ? InkWell(
                      onTap: () {
                        if (element.isActive ?? false) {
                          state.idPayment.value = element.id!.toInt();
                          state.paymentMethod.value = element.method ?? '-';
                          state.paymentType.value = element.type ?? '-';
                          state.bankImage.value =
                              element.mediaPaymentMethod?.media?.path ?? '';
                          state.transactionFeeFunct(element);
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.only(
                          right: 20,
                          top: 10,
                          bottom: 10,
                          left: 20,
                        ),
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
                                ),
                                const SizedBox(
                                  width: 19,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Obx(
                                      () => Text(
                                        element.name ?? '-',
                                        style: blackTextStyle.copyWith(
                                          fontSize: 15,
                                          color: element.isActive ?? false
                                              ? state.paymentType.value ==
                                                      'FREE_VOUCHER'
                                                  ? greyColor
                                                  : blackColor
                                              : greyColor,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      element.isActive ?? false
                                          ? element.description ?? '-'
                                          : 'Tidak tersedia untuk transaksi ini',
                                      style: blackRegulerTextStyle.copyWith(
                                          fontSize: 12),
                                    )
                                  ],
                                ),
                                const Spacer(),
                                element.isActive ?? false
                                    ? Obx(
                                        () => Icon(
                                          state.idPayment.value == element.id
                                              ? Icons.radio_button_on
                                              : Icons.circle_outlined,
                                          size: 23,
                                          color: state.idPayment.value ==
                                                  element.id
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
                    )
                  : Container();
            },
          );
  }
}
