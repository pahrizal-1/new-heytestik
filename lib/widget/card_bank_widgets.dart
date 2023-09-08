import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:heystetik_mobileapps/core/global.dart';

import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/alert_dialog.dart';
import 'package:heystetik_mobileapps/models/customer/payment_method_model.dart';
import '../../controller/customer/transaction/order/order_treatmetment_controller.dart';

class CardTreatmentBank extends StatelessWidget {
  CardTreatmentBank({
    super.key,
  });

  final OrderTreatmentController state = Get.put(OrderTreatmentController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: state.getPaymentMethod.isEmpty
          ? const Center(
              child: Text(
                'Tiddak ada metode pemayaran',
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
              groupSeparatorBuilder: (String value) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  value,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              itemBuilder: (c, element) {
                return InkWell(
                  onTap: () {
                    if (element.isActive != false) {
                      state.idPayment.value = element.id!.toInt();
                      state.paymentMethod.value = element.method ?? '-';
                      state.paymentType.value = element.type ?? '-';
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) => AlertWidget(
                          subtitle:
                              '${element.name}\nTidak tersedia untuk transaksi ini',
                        ),
                      );
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    height: 35,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                            Obx(
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
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}

class CardBankTranferManual extends StatefulWidget {
  const CardBankTranferManual({
    super.key,
  });

  @override
  State<CardBankTranferManual> createState() => _CardBankState();
}

class _CardBankState extends State<CardBankTranferManual> {
  List<String> nameBank = [
    'Transfer Bank BCA',
  ];
  List<String> img = [
    'assets/images/logo-bca.png',
  ];
  int isSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(1, (index) {
        return InkWell(
          onTap: () {
            setState(() {
              isSelected = index;
            });
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 14, bottom: 12),
            child: Row(
              children: [
                Image.asset(
                  img[index],
                  width: 52,
                  color: blackColor,
                ),
                const SizedBox(
                  width: 19,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      nameBank[index],
                      style: blackTextStyle.copyWith(fontSize: 15),
                    ),
                    Text(
                      'Tidak tersedia untuk transaksi ini',
                      style: blackRegulerTextStyle.copyWith(fontSize: 12),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
