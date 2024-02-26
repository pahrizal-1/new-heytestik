import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/widget/Text_widget.dart';

import '../theme/theme.dart';
import 'appbar_widget.dart';

class OrderanMoreDialog extends StatelessWidget {
  const OrderanMoreDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 25, right: 25, top: 36, bottom: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/icons/danger-icons.png',
                      width: 14,
                    ),
                  ),
                  const SizedBox(
                    width: 19,
                  ),
                  Text(
                    'Orderan Kamu',
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 22,
              ),
              Text(
                'Klinik Utama Lithea Jakarta Selatan',
                style: blackTextStyle.copyWith(
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 13,
              ),
              Text(
                'Jenis Treatment',
                style: subTitleTextStyle.copyWith(
                  fontWeight: bold,
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 13,
              ),
              Text(
                'Peeling TCA Ringan (1x)',
                style: blackRegulerTextStyle.copyWith(fontSize: 15),
              ),
              const SizedBox(
                height: 18,
              ),
              dividergrey(),
              const SizedBox(
                height: 18,
              ),
              Text(
                'Detail Pemesan',
                style: subTitleTextStyle.copyWith(fontSize: 15),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                'Rina Rasmalina',
                style: blackRegulerTextStyle.copyWith(
                    fontWeight: bold, fontSize: 15, color: blackColor),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                '08521134645',
                style: blackRegulerTextStyle.copyWith(
                    fontSize: 15, color: blackColor),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class PesananMoreDialog extends StatelessWidget {
  const PesananMoreDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 25, right: 25, top: 36, bottom: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
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
                    width: 19,
                  ),
                  Text(
                    'Detail Harga',
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 22,
              ),
              Text(
                'Klinik Utama Lithea Jakarta Selatan',
                style: blackTextStyle.copyWith(
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 13,
              ),
              Text(
                'Harga',
                style: subTitleTextStyle.copyWith(fontSize: 15),
              ),
              const SizedBox(
                height: 13,
              ),
              const TextBoldSpacebetwen(
                title: 'Peeling TCA Ringan (1x)',
                title2: 'Rp290.400',
                title1: '',
              ),
              const SizedBox(
                height: 18,
              ),
              dividergrey(),
              const SizedBox(
                height: 18,
              ),
              Text(
                'Biaya Lainnya',
                style: subTitleTextStyle.copyWith(fontSize: 15),
              ),
              const SizedBox(
                height: 12,
              ),
              const TextBoldSpacebetwen(
                title: 'Pajak',
                title2: 'Termasuk',
                title1: '',
              ),
              const SizedBox(
                height: 12,
              ),
              const TextBoldSpacebetwen(
                title: 'Biaya transaksi',
                title2: 'Rp3.000',
                title1: '',
              ),
              const SizedBox(
                height: 19,
              ),
              dividergrey(),
              const TextBoldSpacebetwen(
                title: 'Total Pembayaran',
                title2: 'Rp293.400',
                title1: '',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
