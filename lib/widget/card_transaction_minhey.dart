// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/core/convert_date.dart';
import 'package:heystetik_mobileapps/core/currency_format.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/models/customer/transaction_history_model.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

class CardTransKons extends StatelessWidget {
  Data2 data;
  CardTransKons({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16, bottom: 16),
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                ConvertDate.defaultDate(data.createdAt ?? '-'),
                style: blackRegulerTextStyle.copyWith(fontSize: 10),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: data.detail?.status == 'MENUNGGU_PEMBAYARAN'
                      ? const Color.fromARGB(255, 255, 204, 170)
                      : data.detail?.status == 'READY'
                          ? const Color.fromARGB(255, 255, 204, 170)
                          : data.detail?.status == 'REVIEW'
                              ? const Color.fromARGB(255, 255, 204, 170)
                              : data.detail?.status == 'AKTIF'
                                  ? subgreenColor
                                  : data.detail?.status == 'SELESAI'
                                      ? subgreenColor
                                      : subgreenColor,
                ),
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                child: Text(
                  data.detail?.status == 'MENUNGGU_PEMBAYARAN'
                      ? 'Menunggu Pembayaran'
                      : data.detail?.status == 'READY'
                          ? 'Ready'
                          : data.detail?.status == 'REVIEW'
                              ? 'Review'
                              : data.detail?.status == 'AKTIF'
                                  ? 'Aktif'
                                  : data.detail?.status == 'SELESAI'
                                      ? 'Selesai'
                                      : 'Selesai',
                  style: grenTextStyle.copyWith(
                    fontSize: 10,
                    color: data.detail?.status == 'MENUNGGU_PEMBAYARAN'
                        ? const Color.fromARGB(255, 255, 102, 0)
                        : data.detail?.status == 'READY'
                            ? const Color.fromARGB(255, 255, 102, 0)
                            : data.detail?.status == 'REVIEW'
                                ? const Color.fromARGB(255, 255, 102, 0)
                                : data.detail?.status == 'AKTIF'
                                    ? greenColor
                                    : data.detail?.status == 'SELESAI'
                                        ? greenColor
                                        : greenColor,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              data.detail?.consultation == null
                  ? Container()
                  : Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            '${Global.FILE}/${data.detail?.consultation?.doctor!.mediaUserProfilePicture?.media?.path}',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
              SizedBox(
                width: 14,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.detail?.consultation?.doctor?.fullname ?? '-',
                    style: blackTextStyle.copyWith(fontSize: 13),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    data.detail?.medicalHistory?.interestCondition?.concern
                            ?.name ??
                        '-',
                    style: subTitleTextStyle.copyWith(fontSize: 13),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Total :',
                      style: blackRegulerTextStyle.copyWith(fontSize: 12),
                      children: [
                        TextSpan(
                          text:
                              ' ${CurrencyFormat.convertToIdr(data.detail?.totalPaid, 0)}',
                          style: grenTextStyle.copyWith(
                            fontSize: 12,
                            color: Color(
                              0xffF76707,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

class CardTransTreat extends StatelessWidget {
  Data2 data;
  CardTransTreat({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16, bottom: 16),
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                ConvertDate.defaultDate(data.createdAt ?? '-'),
                style: blackRegulerTextStyle.copyWith(fontSize: 10),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: data.detail?.status == 'MENUNGGU_PEMBAYARAN'
                      ? const Color.fromARGB(255, 255, 204, 170)
                      : data.detail?.status == 'MENUNGGU_KONFIRMASI_KLINIK'
                          ? const Color.fromARGB(255, 255, 204, 170)
                          : data.detail?.status == 'KLINIK_MENGKONFIRMASI'
                              ? subgreenColor
                              : data.detail?.status == 'SELESAI'
                                  ? subgreenColor
                                  : subgreenColor,
                ),
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                child: Text(
                  data.detail?.status == 'MENUNGGU_PEMBAYARAN'
                      ? 'Menunggu Pembayaran'
                      : data.detail?.status == 'MENUNGGU_KONFIRMASI_KLINIK'
                          ? 'Menunggu Konfirmasi Klinik'
                          : data.detail?.status == 'KLINIK_MENGKONFIRMASI'
                              ? 'Klinik Mengkonfirmasi'
                              : data.detail?.status == 'SELESAI'
                                  ? 'Selesai'
                                  : 'Selesai',
                  style: grenTextStyle.copyWith(
                    fontSize: 10,
                    color: data.detail?.status == 'MENUNGGU_PEMBAYARAN'
                        ? const Color.fromARGB(255, 255, 102, 0)
                        : data.detail?.status == 'MENUNGGU_KONFIRMASI_KLINIK'
                            ? const Color.fromARGB(255, 255, 102, 0)
                            : data.detail?.status == 'KLINIK_MENGKONFIRMASI'
                                ? greenColor
                                : data.detail?.status == 'SELESAI'
                                    ? greenColor
                                    : greenColor,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              data.detail?.transactionTreatmentItems == null
                  ? Container()
                  : Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            '${Global.FILE}/${data.detail?.transactionTreatmentItems?[0].treatment?.mediaTreatments?[0].media?.path}',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
              SizedBox(
                width: 14,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.detail?.transactionTreatmentItems?[0].treatment
                            ?.name ??
                        '-',
                    style: blackTextStyle.copyWith(fontSize: 13),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    data.detail?.transactionTreatmentItems?[0].treatment?.clinic
                            ?.name ??
                        '-',
                    style: subTitleTextStyle.copyWith(fontSize: 13),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Total :',
                      style: blackRegulerTextStyle.copyWith(fontSize: 12),
                      children: [
                        TextSpan(
                          text:
                              ' ${CurrencyFormat.convertToIdr(data.detail?.totalPaid, 0)}',
                          style: grenTextStyle.copyWith(
                            fontSize: 12,
                            color: Color(
                              0xffF76707,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

class CardTransProd extends StatelessWidget {
  Data2 data;
  CardTransProd({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16, bottom: 16),
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                ConvertDate.defaultDate(data.createdAt ?? '-'),
                style: blackRegulerTextStyle.copyWith(fontSize: 10),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: data.detail?.orderStatus.toString() == 'NEW_ORDER' ||
                          data.detail?.orderStatus.toString() ==
                              'DELIVERY_PROCESS' ||
                          data.detail?.orderStatus.toString() == 'IN_DELIVERY'
                      ? const Color.fromARGB(255, 255, 204, 170)
                      : data.detail?.orderStatus.toString() == 'ORDER_COMPLETED'
                          ? subgreenColor
                          : subgreenColor,
                ),
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                child: Text(
                  data.detail?.orderStatus.toString() == 'NEW_ORDER' ||
                          data.detail?.orderStatus.toString() ==
                              'DELIVERY_PROCESS'
                      ? 'Pesanan Diproses'
                      : data.detail?.orderStatus.toString() == 'IN_DELIVERY'
                          ? 'Pesanan Dikirim'
                          : data.detail?.orderStatus.toString() ==
                                  'ORDER_COMPLETED'
                              ? 'Selesai'
                              : 'Selesai',
                  style: grenTextStyle.copyWith(
                    fontSize: 10,
                    color: data.detail?.orderStatus.toString() == 'NEW_ORDER' ||
                            data.detail?.orderStatus.toString() ==
                                'DELIVERY_PROCESS' ||
                            data.detail?.orderStatus.toString() == 'IN_DELIVERY'
                        ? const Color.fromARGB(255, 255, 102, 0)
                        : data.detail?.orderStatus.toString() ==
                                'ORDER_COMPLETED'
                            ? greenColor
                            : greenColor,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        '${Global.FILE}/${data.detail?.transactionProductItems?[0].product!.mediaProducts?[0].media?.path}'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 14,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.detail?.transactionProductItems?[0].product?.name ??
                        '-',
                    style: blackTextStyle.copyWith(fontSize: 13),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  RichText(
                    text: TextSpan(
                      text: '1 Barang',
                      style: subTitleTextStyle.copyWith(fontSize: 12),
                      children: [
                        TextSpan(
                          text: (data.detail?.transactionProductItems?.length ??
                                      0) >
                                  1
                              ? ' +${(data.detail?.transactionProductItems?.length ?? 0) - 1} barang lainnya'
                              : '',
                          style: grenTextStyle.copyWith(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Total :',
                      style: blackRegulerTextStyle.copyWith(fontSize: 12),
                      children: [
                        TextSpan(
                          text:
                              ' ${CurrencyFormat.convertToIdr(data.detail?.totalPaid, 0)}',
                          style: grenTextStyle.copyWith(
                            fontSize: 12,
                            color: Color(
                              0xffF76707,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
