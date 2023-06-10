import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/search_klink_page.dart';

import '../../theme/theme.dart';
import '../../widget/Text_widget.dart';

class DetailPerawatanPage extends StatelessWidget {
  const DetailPerawatanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: lsymetric.copyWith(top: 21),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Info Konsultasi',
              style: blackHigtTextStyle.copyWith(fontSize: 15),
            ),
            const SizedBox(
              height: 9,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Status Konsultasi',
                  style: subGreyTextStyle,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 30,
                    width: 80,
                    decoration: BoxDecoration(
                      color: orangeColor,
                      borderRadius: BorderRadius.circular(42),
                    ),
                    child: Center(
                      child: Text(
                        'Review',
                        style: whiteTextStyle,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 18,
            ),
            const TextBoldSpacebetwen(
              title: 'ID Konsultasi',
              title2: 'K1Z4DWJST',
              title1: '',
            ),
            const SizedBox(
              height: 18,
            ),
            const TextBoldSpacebetwen(
              title: 'Tanggal',
              title2: '13 Mei 2023',
              title1: '',
            ),
            const SizedBox(
              height: 18,
            ),
            const TextBoldSpacebetwen(
              title: 'Masa Aktif',
              title2: 'K1Z4DWJST',
              title1: '',
            ),
            const SizedBox(
              height: 46,
            ),
            Text(
              'Info Pasien',
              style: blackHigtTextStyle.copyWith(fontSize: 15),
            ),
            const SizedBox(
              height: 18,
            ),
            const TextBoldSpacebetwen(
              title: 'Nama Pasien',
              title2: 'Rina Rasmalina',
              title1: '',
            ),
            const SizedBox(
              height: 18,
            ),
            const TextBoldSpacebetwen(
              title: 'Topik Keluhan',
              title2: 'Bekas Jerawat',
              title1: '',
            ),
          ],
        ),
      ),
    );
  }
}
