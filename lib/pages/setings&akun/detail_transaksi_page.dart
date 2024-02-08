// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/transaction/history/history_transaction_controller.dart';
import 'package:heystetik_mobileapps/core/convert_date.dart';
import 'package:heystetik_mobileapps/core/currency_format.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/models/customer/detail_transaksi_produk_model.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/invoic_hestetik.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/ulasan_settings_page.dart';
import 'package:heystetik_mobileapps/pages/solution/drug_solutions_page.dart';
import 'package:heystetik_mobileapps/pages/solution/solution_skincare_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/Text_widget.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';
import 'package:heystetik_mobileapps/widget/snackbar_widget.dart';
import 'package:social_share/social_share.dart';

import 'detail_status_page.dart';

class DetailTransaksiPage extends StatefulWidget {
  String transactionId;
  DetailTransaksiPage({required this.transactionId, super.key});

  @override
  State<DetailTransaksiPage> createState() => _DetailTransaksiPageState();
}

class _DetailTransaksiPageState extends State<DetailTransaksiPage> {
  final HistoryTransactionController state =
      Get.put(HistoryTransactionController());

  List<TransactionProductItems> listProduct = [];
  bool isMore = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await state.detailTransaksiProduk(
        context,
        widget.transactionId.toString(),
      );
      listProduct.addAll(
          state.detailTransaksiProd.value.data?.transactionProductItems ?? []);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
          state.detailTransaksiProd.value.data?.orderStatus == 'ORDER_COMPLETED'
              ? Wrap(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 25, right: 25, bottom: 30, top: 11),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () async {},
                            child: Container(
                              height: 40,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                border: Border.all(color: greenColor),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.more_horiz,
                                    color: blackColor,
                                    size: 17,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                Get.to(() => UlasanSetingsPage());
                              },
                              child: Container(
                                width: 142,
                                decoration: BoxDecoration(
                                    color: greenColor,
                                    border: Border.all(color: greenColor),
                                    borderRadius: BorderRadius.circular(7)),
                                height: 40,
                                child: Center(
                                  child: Text(
                                    'Beri Ulasan',
                                    style: whiteTextStyle.copyWith(
                                        fontSize: 15, fontWeight: bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : null,
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
          child: ListView(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 21, vertical: 21),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              state.detailTransaksiProd.value.data
                                              ?.orderStatus ==
                                          'NEW_ORDER' ||
                                      state.detailTransaksiProd.value.data
                                              ?.orderStatus ==
                                          'DELIVERY_PROCESS'
                                  ? 'Pesanan Diproses'
                                  : state.detailTransaksiProd.value.data
                                              ?.orderStatus ==
                                          'IN_DELIVERY'
                                      ? 'Pesanan Dikirim'
                                      : state.detailTransaksiProd.value.data
                                                  ?.orderStatus ==
                                              'ORDER_COMPLETED'
                                          ? 'Pesanan Selesai'
                                          : '-',
                              style: subGreyTextStyle.copyWith(
                                  fontSize: 15,
                                  color: const Color(0XFF323232),
                                  fontWeight: bold),
                            ),
                          ],
                        ),
                        if (state.detailTransaksiProd.value.data?.orderStatus ==
                                'IN_DELIVERY' ||
                            state.detailTransaksiProd.value.data?.orderStatus ==
                                'ORDER_COMPLETED')
                          InkWell(
                            onTap: () {
                              Get.to(
                                () => DetailStatusPage(
                                  transactionId: state
                                      .detailTransaksiProd.value.data!.id
                                      .toString(),
                                ),
                              );
                            },
                            child: Text(
                              'Lihat Detail',
                              style: grenTextStyle.copyWith(fontSize: 14),
                              textAlign: TextAlign.end,
                            ),
                          ),
                      ],
                    ),
                    dividergrey(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              'INV/20230513/KD',
                              style: subGreyTextStyle.copyWith(
                                  fontSize: 15,
                                  color: const Color(0XFF323232),
                                  fontWeight: regular),
                            ),
                            SizedBox(
                              width: 9,
                            ),
                            InkWell(
                              onTap: () {
                                SocialShare.copyToClipboard(
                                  text: 'INV/20230513/KD',
                                );
                                SnackbarWidget.getSuccessSnackbar(
                                  context,
                                  "Berhasil",
                                  "Berhasil disalin",
                                );
                              },
                              child: Image.asset(
                                'assets/icons/salin_icons.png',
                                width: 12,
                                height: 12,
                                color: blackColor,
                              ),
                            )
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            Get.to(() => InvoiceHeystetikPage());
                          },
                          child: Text(
                            'Lihat Invoice',
                            style: grenTextStyle.copyWith(fontSize: 14),
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 9,
                    ),
                    Obx(
                      () => TextSpaceBetween(
                        title: 'Tanggal Pembelian',
                        title2: ConvertDate.transactionDate(
                          state.detailTransaksiProd.value.data?.createdAt ?? '',
                        ),
                      ),
                    )
                  ],
                ),
              ),
              dividergreen(),
              Padding(
                padding: lsymetric.copyWith(top: 21),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Detail Produk',
                      style: blackTextStyle.copyWith(fontSize: 18),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    for (int index = 0;
                        index < (isMore ? listProduct.length : 1);
                        index++)
                      Container(
                        margin: EdgeInsets.only(bottom: 9),
                        decoration: BoxDecoration(
                            border: Border.all(color: borderColor),
                            borderRadius: BorderRadius.circular(7)),
                        padding:
                            EdgeInsets.symmetric(vertical: 14, horizontal: 14),
                        child: Row(
                          children: [
                            Container(
                              width: 65,
                              height: 65,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      '${Global.FILE}/${listProduct[index].product?.mediaProducts?[0].media?.path}'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    listProduct[index].product?.name ?? '-',
                                    style: grenTextStyle.copyWith(fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    '${listProduct[index].qty} items',
                                    style: subTitleTextStyle.copyWith(
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          CurrencyFormat.convertToIdr(
                                            listProduct[index].subtotal,
                                            0,
                                          ),
                                          style: blackTextStyle.copyWith(
                                              fontSize: 15),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            InkWell(
                              onTap: () {
                                if (listProduct[index].product?.type ==
                                    'DRUGS') {
                                  Get.to(() => const DrugSolutionsPage());
                                } else if (listProduct[index].product?.type ==
                                    'SKINCARE') {
                                  Get.to(() => const SolutionSkincare1Page());
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 7),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  border: Border.all(
                                    color: greenColor,
                                  ),
                                ),
                                child: Text(
                                  'Beli Lagi',
                                  style: grenTextStyle.copyWith(
                                    fontSize: 13,
                                    fontWeight: regular,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    SizedBox(
                      height: 20,
                    ),
                    if (listProduct.length > 1)
                      if (!isMore)
                        InkWell(
                          onTap: () {
                            isMore = true;
                            setState(() {});
                          },
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Tampilkan Lebih Banyak',
                                  style: grenTextStyle.copyWith(fontSize: 15),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  color: greenColor,
                                )
                              ],
                            ),
                          ),
                        ),
                    if (listProduct.length > 1)
                      if (isMore)
                        InkWell(
                          onTap: () {
                            isMore = false;
                            setState(() {});
                          },
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Tampilkan Lebih Sedikit',
                                  style: grenTextStyle.copyWith(fontSize: 15),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_up,
                                  color: greenColor,
                                )
                              ],
                            ),
                          ),
                        ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              dividergreen(),
              Padding(
                padding: lsymetric.copyWith(top: 21, bottom: 21),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Info Pengiriman',
                      style: blackTextStyle.copyWith(fontSize: 18),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 12),
                      child: Column(
                        children: [
                          Table(
                            children: [
                              TableRow(
                                children: [
                                  Text(
                                    'Kurir',
                                    style: blackRegulerTextStyle.copyWith(
                                        color: blackColor),
                                  ),
                                  Obx(
                                    () => Text(
                                      '${state.detailTransaksiProd.value.data?.shippingProduct?.shippingMethod?.type} - ${state.detailTransaksiProd.value.data?.shippingProduct?.shippingMethod?.name}',
                                      style: grenTextStyle.copyWith(
                                          fontSize: 15,
                                          color: blackColor,
                                          fontWeight: regular),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 9,
                          ),
                          Obx(
                            () => Table(
                              children: [
                                TableRow(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        SocialShare.copyToClipboard(
                                          text: state.detailTransaksiProd.value
                                              .data?.shippingProduct?.waybill,
                                        );

                                        SnackbarWidget.getSuccessSnackbar(
                                          context,
                                          "Berhasil",
                                          "Berhasil disalin",
                                        );
                                      },
                                      child: Row(
                                        children: [
                                          Text(
                                            'No Resi',
                                            style: subGreyTextStyle.copyWith(
                                                fontSize: 15,
                                                color: const Color(0XFF323232),
                                                fontWeight: regular),
                                          ),
                                          SizedBox(
                                            width: 9,
                                          ),
                                          Image.asset(
                                            'assets/icons/salin_icons.png',
                                            width: 12,
                                            height: 12,
                                            color: blackColor,
                                          )
                                        ],
                                      ),
                                    ),
                                    Text(
                                      state.detailTransaksiProd.value.data
                                              ?.shippingProduct?.waybill ??
                                          '-',
                                      style: grenTextStyle.copyWith(
                                          fontSize: 15,
                                          color: blackColor,
                                          fontWeight: regular),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 9,
                          ),
                          Obx(
                            () => Table(
                              children: [
                                TableRow(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        SocialShare.copyToClipboard(
                                          text:
                                              '${state.detailTransaksiProd.value.data?.shippingProduct?.recipientName}\n${state.detailTransaksiProd.value.data?.shippingProduct?.recipientPhone}\n${state.detailTransaksiProd.value.data?.shippingProduct?.recipientAddress}',
                                        );

                                        SnackbarWidget.getSuccessSnackbar(
                                          context,
                                          "Berhasil",
                                          "Berhasil disalin",
                                        );
                                      },
                                      child: Row(
                                        children: [
                                          Text(
                                            'Alamat',
                                            style: subGreyTextStyle.copyWith(
                                                fontSize: 15,
                                                color: const Color(0XFF323232),
                                                fontWeight: regular),
                                          ),
                                          SizedBox(
                                            width: 9,
                                          ),
                                          Image.asset(
                                            'assets/icons/salin_icons.png',
                                            width: 12,
                                            height: 12,
                                            color: blackColor,
                                          )
                                        ],
                                      ),
                                    ),
                                    Text(
                                      '${state.detailTransaksiProd.value.data?.shippingProduct?.recipientName}\n${state.detailTransaksiProd.value.data?.shippingProduct?.recipientPhone}\n${state.detailTransaksiProd.value.data?.shippingProduct?.recipientAddress}',
                                      style: grenTextStyle.copyWith(
                                          fontSize: 15,
                                          color: blackColor,
                                          fontWeight: regular),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              dividergreen(),
              Padding(
                padding: lsymetric.copyWith(top: 21, bottom: 21),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Rincian Pembayarann',
                      style: blackTextStyle.copyWith(fontSize: 18),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Obx(
                      () => TextSpaceBetween(
                        title: 'Metode Pembayaran',
                        title2: state.detailTransaksiProd.value.data
                                ?.paymentMethod?.name ??
                            '-',
                      ),
                    ),
                    SizedBox(
                      height: 9,
                    ),
                    Obx(
                      () => TextSpaceBetween(
                        title:
                            'Total Harga (${state.detailTransaksiProd.value.data?.transactionProductItems?.length ?? '0'} barang)',
                        title2: CurrencyFormat.convertToIdr(
                          state.detailTransaksiProd.value.data?.totalPrice,
                          0,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 9,
                    ),
                    Obx(
                      () => TextSpaceBetween(
                        title: 'Total Ongkos Kirim',
                        title2: CurrencyFormat.convertToIdr(
                          state.detailTransaksiProd.value.data?.deliveryFee,
                          0,
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   height: 9,
                    // ),
                    // TextSpaceBetween(
                    //   title: 'Diskon Ongkos Kirim',
                    //   title2: CurrencyFormat.convertToIdr(
                    //     0,
                    //     0,
                    //   ),
                    // ),
                    SizedBox(
                      height: 9,
                    ),
                    Obx(
                      () => TextSpaceBetween(
                        title: 'Diskon Promo',
                        title2: CurrencyFormat.convertToIdr(
                          state.detailTransaksiProd.value.data?.totalDiscount,
                          0,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 9,
                    ),
                    Obx(
                      () => TextSpaceBetween(
                        title: 'PPN',
                        title2: CurrencyFormat.convertToIdr(
                          state.detailTransaksiProd.value.data?.tax,
                          0,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 9,
                    ),
                    Obx(
                      () => TextSpaceBetween(
                        title: 'Biaya Transaksi',
                        title2: CurrencyFormat.convertToIdr(
                          state.detailTransaksiProd.value.data?.transactionFee,
                          0,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 9,
                    ),
                    dividergrey(),
                    Obx(
                      () => TextBoldSpacebetwen(
                        title: 'Total Tagihan',
                        title2: CurrencyFormat.convertToIdr(
                          state.detailTransaksiProd.value.data?.totalPaid,
                          0,
                        ),
                        title1: '',
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
