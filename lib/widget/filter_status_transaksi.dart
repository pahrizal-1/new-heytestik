import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/widget/alert_dialog.dart';

import '../theme/theme.dart';
import 'button_widget.dart';
import 'filter_tap_widget.dart';

class FilterStatusTransaksi extends StatefulWidget {
  const FilterStatusTransaksi({
    super.key,
  });

  @override
  State<FilterStatusTransaksi> createState() => _FilterStatusTransaksiState();
}

class _FilterStatusTransaksiState extends State<FilterStatusTransaksi> {
  List<String> status = [];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 33,
          right: 33,
          top: 30,
          bottom: 40,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
                  width: 22,
                ),
                Text(
                  'Status Transaksi',
                  style: blackHigtTextStyle.copyWith(fontSize: 20),
                ),
              ],
            ),
            const SizedBox(
              height: 39,
            ),
            FilterTapTreatment(
              onTap: () {
                status.add("MENUNGGU_PEMBAYARAN");
              },
              title: 'Menunggu Pembayaran',
            ),
            FilterTapTreatment(
              onTap: () {
                status.add("PESANAN_DIPROSES");
              },
              title: 'Pesanan Diproses',
            ),
            FilterTapTreatment(
              onTap: () {
                status.add("DIKIRIM");
              },
              title: 'Dikirim',
            ),
            FilterTapTreatment(
              onTap: () {
                status.add("TERKIRIM");
              },
              title: 'Terkirim',
            ),
            FilterTapTreatment(
              onTap: () {
                status.add("MENUNGGU_KONFIRMASI_KLINIK");
              },
              title: 'Menunggu Konfirmasi Klinik',
            ),
            FilterTapTreatment(
              onTap: () {
                status.add("KLINIK_MENGKONFIRMASI");
              },
              title: 'Klinik Mengkonfirmasi',
            ),
            FilterTapTreatment(
              onTap: () {
                status.add("READY");
              },
              title: 'Ready',
            ),
            FilterTapTreatment(
              onTap: () {
                status.add("REVIEW");
              },
              title: 'Review',
            ),
            FilterTapTreatment(
              onTap: () {
                status.add("AKTIF");
              },
              title: 'Aktif',
            ),
            FilterTapTreatment(
              onTap: () {
                status.add("SELESAI");
              },
              title: 'Selesai',
            ),
            ButtonGreenWidget(
              title: 'Tampilkan',
              onPressed: () {
                if (status.isNotEmpty) {
                  Navigator.pop(context, status);
                } else {
                  showDialog(
                    context: context,
                    builder: (context) => AlertWidget(
                      subtitle: "Harap pilih status transaksi terlebih dahulu",
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
