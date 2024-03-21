// ignore_for_file: prefer_const_constructors, must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/transaction/order/order_treatmetment_controller.dart';
import 'package:heystetik_mobileapps/controller/customer/voucher/voucher_controller.dart';
import 'package:heystetik_mobileapps/models/customer/available_voucher_model.dart'
    as Available;
import 'package:heystetik_mobileapps/widget/loading_widget.dart';
import '../../theme/theme.dart';
import '../../widget/promo_kupon_widget.dart';

class TreatmentPromoPage extends StatefulWidget {
  const TreatmentPromoPage({super.key});

  @override
  State<TreatmentPromoPage> createState() => _TreatmentPromoPageState();
}

class _TreatmentPromoPageState extends State<TreatmentPromoPage> {
  Map<String, dynamic> param = {
    'type[]': ['All Solution Voucher', 'Treatment Voucher']
  };
  VoucherController stateVoucher = Get.put(VoucherController());
  final OrderTreatmentController stateOrder =
      Get.put(OrderTreatmentController());
  TextEditingController control = TextEditingController();
  List<Available.Data2> data = [];
  List<Available.Data2> find = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      data.addAll(
          await stateVoucher.getAvailableVoucherModel(context, param: param));
      find.clear();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        elevation: 0,
        backgroundColor: greenColor,
        title: Text(
          'Pakai Promo',
          style: whiteTextStyle.copyWith(fontSize: 20, fontWeight: bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: lsymetric.copyWith(top: 24, bottom: 47),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Masukkan kode Voucher yang kamu dapatkan.',
                style: blackTextStyle.copyWith(fontSize: 15),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 230,
                    height: 40,
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      color: whiteColor,
                      border: Border.all(color: borderColor),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(7),
                          bottomLeft: Radius.circular(7)),
                    ),
                    child: TextFormField(
                      controller: control,
                      decoration: InputDecoration(
                        focusedBorder: InputBorder.none,
                        hintText: 'Masukkan kode voucher',
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () async {
                        find.clear();
                        find.add(
                          await stateVoucher.findVoucherByCodeModel(
                            context,
                            control.text,
                          ),
                        );
                        setState(() {});
                      },
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: greenColor,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(7),
                              bottomRight: Radius.circular(7)),
                        ),
                        child: Center(
                          child: Text(
                            'Pakai',
                            style: whiteTextStyle.copyWith(fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Divider(
                thickness: 1,
              ),
              Obx(
                () => LoadingWidget(
                  isLoading: stateVoucher.isLoading.value,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (data.isNotEmpty)
                        const SizedBox(
                          height: 15,
                        ),
                      if (data.isNotEmpty)
                        Text(
                          'Voucher yang bisa kamu pakai',
                          style: blackTextStyle.copyWith(fontSize: 15),
                        ),
                      if (data.isEmpty)
                        const SizedBox(
                          height: 25,
                        ),
                      if (data.isEmpty)
                        Center(
                          child: Text(
                            'Belum ada voucher',
                            style: TextStyle(
                              fontFamily: 'ProximaNova',
                              fontSize: 20,
                            ),
                          ),
                        ),
                      if (control.text.isNotEmpty && find.isEmpty)
                        const SizedBox(
                          height: 25,
                        ),
                      if (control.text.isNotEmpty && find.isEmpty)
                        Center(
                          child: Text(
                            'Voucher tidak ditemukan',
                            style: TextStyle(
                              fontFamily: 'ProximaNova',
                              fontSize: 20,
                            ),
                          ),
                        ),
                      if (control.text.isNotEmpty)
                        ...find.map((val) {
                          return InkWell(
                            onTap: () {
                              if (stateOrder.totalPrice.value >
                                  (val.minimumPurchase ?? 0)) {
                                stateOrder.voucher(val);
                                setState(() {});
                                Get.back();
                              }
                            },
                            child: PromoVocer(
                              data: val,
                              itsOkay: stateOrder.totalPrice.value >
                                  (val.minimumPurchase ?? 0),
                              selected: stateOrder.voucherId.value == val.id,
                            ),
                          );
                        }).toList()
                      else
                        ...data.map((val) {
                          return InkWell(
                            onTap: () {
                              if (stateOrder.totalPrice.value >
                                  (val.minimumPurchase ?? 0)) {
                                stateOrder.voucher(val);
                                setState(() {});
                                Get.back();
                              }
                            },
                            child: PromoVocer(
                              data: val,
                              itsOkay: stateOrder.totalPrice.value >
                                  (val.minimumPurchase ?? 0),
                              selected: stateOrder.voucherId.value == val.id,
                            ),
                          );
                        }).toList(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

 // Divider(),
                      // Text(
                      //   'Voucher yang bisa kamu pakai',
                      //   style: blackTextStyle.copyWith(fontSize: 15),
                      // ),
                      // PromoVocer(
                      //   title: 'VOUCHER 15K',
                      //   bgColor: Color(0xffF1F1F1),
                      //   subTitle: 'Berakhir 2 hari lagi! ',
                      //   textTitle: borderColor,
                      // ),
                      // PromoVocer(
                      //   title: 'VOUCHER 15K',
                      //   bgColor: Color(0xffF1F1F1),
                      //   subTitle: 'Berakhir 4 hari lagi! ',
                      // ),
                      // ButtonGreenWidget(
                      //   title: 'Pakai Voucher',
                      //   onPressed: () {},
                      // )

// Container(
                      //   width: MediaQuery.of(context).size.width,
                      //   padding: const EdgeInsets.only(
                      //       left: 10, right: 87, top: 18, bottom: 18),
                      //   margin: const EdgeInsets.only(top: 13, bottom: 10),
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(7),
                      //     border: Border.all(
                      //       color: const Color(0xffcccccc),
                      //     ),
                      //   ),
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       Text(
                      //         'HEY25K',
                      //         style: blackTextStyle.copyWith(fontSize: 15),
                      //       ),
                      //       SizedBox(
                      //         height: 6,
                      //       ),
                      //       Text.rich(
                      //         TextSpan(
                      //           text: 'Khusus untuk konsultasi pertamamu',
                      //           style: greyTextStyle.copyWith(
                      //               fontSize: 13, color: Color(0xff9B9B9B)),
                      //           children: [
                      //             TextSpan(
                      //                 text: ' \nLihat detail',
                      //                 style: grenTextStyle.copyWith(fontSize: 13))
                      //           ],
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),