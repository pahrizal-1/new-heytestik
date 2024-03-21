// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/core/currency_format.dart';
import 'package:heystetik_mobileapps/models/customer/available_voucher_model.dart'
    as Available;
import 'package:heystetik_mobileapps/pages/stream_page/detail_voucher_widget.dart';
import '../theme/theme.dart';

class PromoVocer extends StatefulWidget {
  final Available.Data2 data;
  bool itsOkay;
  bool selected;
  PromoVocer({
    super.key,
    required this.data,
    required this.itsOkay,
    required this.selected,
  });

  @override
  State<PromoVocer> createState() => _PromoVocerState();
}

class _PromoVocerState extends State<PromoVocer> {
  Available.Data2? detail;
  DateTime? currDt;

  @override
  void initState() {
    super.initState();
    detail = widget.data;
    if ((detail?.periodEnd?.isNotEmpty ?? false) && detail?.periodEnd != null) {
      String strDt = detail?.periodEnd ?? "";
      DateTime parseDt = DateTime.parse(strDt);
      currDt = parseDt.subtract(Duration(days: DateTime.now().day));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 87, top: 18, bottom: 18),
      margin: const EdgeInsets.only(top: 13, bottom: 10),
      decoration: BoxDecoration(
        color: widget.itsOkay ? whiteColor : borderColor,
        borderRadius: BorderRadius.circular(7),
        border: Border.all(
          color: widget.selected ? greenColor : borderColor,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (detail?.code?.isNotEmpty ?? false)
            Text(
              detail?.code ?? "",
              style: blackTextStyle.copyWith(fontSize: 15, color: blackColor),
            ),
          if (detail?.code?.isNotEmpty ?? false)
            const SizedBox(
              height: 6,
            ),
          Text(
            detail?.name ?? "",
            style: blackTextStyle.copyWith(
              fontSize: 15,
              color:
                  (detail?.code?.isNotEmpty ?? false) ? redColor : blackColor,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            "Minimum Transaksi ${CurrencyFormat.convertToIdr(detail?.minimumPurchase ?? 0, 0)}",
            style: blackRegulerTextStyle.copyWith(fontSize: 15),
          ),
          const SizedBox(
            height: 6,
          ),
          Row(
            children: [
              if (currDt != null)
                Image.asset(
                  'assets/icons/logojam.png',
                  width: 10,
                  color: greyColor,
                ),
              if (currDt != null)
                const SizedBox(
                  width: 2,
                ),
              if (currDt != null)
                Text(
                  "Berakhir ${currDt?.day} hari lagi! ",
                  style: greyTextStyle.copyWith(
                      fontSize: 13, color: const Color(0xff9B9B9B)),
                ),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.white,
                    isScrollControlled: true,
                    showDragHandle: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadiusDirectional.only(
                        topEnd: Radius.circular(25),
                        topStart: Radius.circular(25),
                      ),
                    ),
                    builder: (context) =>
                        DetailVoucherWidget(data: widget.data),
                  );
                },
                child: Text(
                  "Lihat detail",
                  style: grenTextStyle.copyWith(fontSize: 13),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
