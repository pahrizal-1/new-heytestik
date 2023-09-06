import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/global.dart';

import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/alert_dialog.dart';

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
      child: state.totalPaymentMethod.value == 0
          ? Container()
          : ListView.builder(
              shrinkWrap: true,
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.totalPaymentMethod.value,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    if (state.getPaymentMethod.value!.data![index].isActive !=
                        false) {
                      state.idPayment.value = state
                          .getPaymentMethod.value!.data![index].id!
                          .toInt();
                      state.paymentMethod.value =
                          state.getPaymentMethod.value!.data![index].method ??
                              '-';
                      state.paymentType.value =
                          state.getPaymentMethod.value!.data![index].type ??
                              '-';
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) => AlertWidget(
                          subtitle:
                              '${state.getPaymentMethod.value!.data![index].name}\n${state.getPaymentMethod.value!.data![index].description}',
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
                              '${Global.FILE}/${state.getPaymentMethod.value!.data![index].mediaPaymentMethod!.media!.path.toString()}',
                              width: 40,
                              height: 35,
                            ),
                            const SizedBox(
                              width: 19,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  state.getPaymentMethod.value!.data![index]
                                          .name ??
                                      '-',
                                  style: blackTextStyle.copyWith(fontSize: 15),
                                ),
                                Text(
                                  state.getPaymentMethod.value!.data![index]
                                          .description ??
                                      '-',
                                  style: blackRegulerTextStyle.copyWith(
                                      fontSize: 12),
                                )
                              ],
                            ),
                            const Spacer(),
                            Obx(
                              () => Icon(
                                state.idPayment.value ==
                                        state.getPaymentMethod.value!
                                            .data![index].id
                                    ? Icons.radio_button_on
                                    : Icons.circle_outlined,
                                size: 23,
                                color: state.idPayment.value ==
                                        state.getPaymentMethod.value!
                                            .data![index].id
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
