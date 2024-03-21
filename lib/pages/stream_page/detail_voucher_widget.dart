// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/core/currency_format.dart';
import 'package:heystetik_mobileapps/models/customer/available_voucher_model.dart'
    as Available;
import 'package:heystetik_mobileapps/theme/theme.dart';

class DetailVoucherWidget extends StatelessWidget {
  final Available.Data2 data;
  const DetailVoucherWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    Available.Data2? detail;
    DateTime? currDt;
    detail = data;
    if ((detail.periodEnd?.isNotEmpty ?? false) && detail.periodEnd != null) {
      String strDt = detail.periodEnd ?? "";
      DateTime parseDt = DateTime.parse(strDt);
      currDt = parseDt.subtract(Duration(days: DateTime.now().day));
    }
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Detail Voucher',
                  style: blackTextStyle.copyWith(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              data.type ?? "",
              style: blackRegulerTextStyle.copyWith(fontSize: 15),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              data.name ?? "",
              style: blackRegulerTextStyle.copyWith(fontSize: 15),
            ),
            if (currDt != null)
              SizedBox(
                height: 10,
              ),
            if (currDt != null)
              Text(
                "Berakhir ${currDt.day} hari lagi! ",
                style: blackRegulerTextStyle.copyWith(fontSize: 15),
              ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Minimum Transaksi ${CurrencyFormat.convertToIdr(data.minimumPurchase, 0)}",
              style: blackRegulerTextStyle.copyWith(fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
