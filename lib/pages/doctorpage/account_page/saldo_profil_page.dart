import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:heystetik_mobileapps/pages/doctorpage/account_page/penarikan_dana_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';

class SaldoProfilPage extends StatelessWidget {
  const SaldoProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: greenColor,
        title: Row(
          children: [
            InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back)),
            const SizedBox(
              width: 7,
            ),
            Text(
              'Saldo Saya',
              style: whiteTextStyle.copyWith(fontWeight: bold, fontSize: 20),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 16, left: 25, right: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/icons/alert-circle1.png',
                    width: 27,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        text: 'Sekarang kamu Bisa Tarik saldo',
                        style: greyTextStyle.copyWith(fontSize: 13),
                        children: [
                          TextSpan(
                            text: " Pada Tanggal 25 Setiap Bulannya",
                            style: blackHigtTextStyle.copyWith(
                                fontSize: 13, color: Color(0xFF6B6B6B)),
                            children: [
                              TextSpan(
                                text: " Ke rekening bank Yang Tersimpan.",
                                style: greyTextStyle.copyWith(fontSize: 13),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 47,
              ),
              Center(
                child: Text(
                  'Saldo Saya',
                  style: blackTextStyle.copyWith(
                      fontSize: 15, fontWeight: regular),
                ),
              ),
              Center(
                child: Text(
                  'Rp5.000.000',
                  style: blackTextStyle.copyWith(
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              ButtonGreenWidget(
                title: 'Tarik Saldo',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PenarikanDana()));
                },
              ),
              const SizedBox(
                height: 48,
              ),
              Text(
                'Riwayat Saldo Saya',
                style: blackHigtTextStyle.copyWith(fontSize: 18),
              ),
              const SizedBox(
                height: 30,
              ),
              _penarikandana(),
              const SizedBox(
                height: 19,
              ),
              _penarikandana(),
              const SizedBox(
                height: 19,
              ),
              _penarikandana(),
              const SizedBox(
                height: 19,
              ),
              _penarikandana(),
            ],
          ),
        ),
      ),
    );
  }

  Column _penarikandana() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Penarikan Saldo',
              style: blackTextStyle.copyWith(fontSize: 15),
            ),
            const Spacer(),
            Text(
              'Berhasil',
              style: grenTextStyle.copyWith(fontSize: 12),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          '-Rp5.000.000',
          style: TextStyle(color: redColor, fontSize: 13, fontWeight: bold),
        ),
        Text(
          'Withdrawal (BCA - 0212871964 - Risty Hafinah)',
          style: subTitleTextStyle,
        ),
        Text(
          '*25-01-2023, 17:30 WIB : Processed\n*25-01-2023, 17:45 WIB : Completed',
          style: subTitleTextStyle,
        ),
        const SizedBox(
          height: 19,
        ),
        const Divider(
          thickness: 1,
        )
      ],
    );
  }
}
