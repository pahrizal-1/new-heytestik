import 'package:flutter/material.dart';

import 'package:heystetik_mobileapps/pages/doctorpage/account_page/rekening_bank_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

class PenarikanDana extends StatefulWidget {
  const PenarikanDana({super.key});

  @override
  State<PenarikanDana> createState() => _PenarikanDanaState();
}

class _PenarikanDanaState extends State<PenarikanDana> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: greenColor,
        title: Row(
          children: [
            InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back)),
            SizedBox(
              width: 7,
            ),
            Text(
              'Penarikan Saldo',
              style: whiteTextStyle.copyWith(fontWeight: bold, fontSize: 20),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
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
                    height: 39,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Saldo',
                        style: blackHigtTextStyle.copyWith(fontSize: 20),
                      ),
                      Text(
                        'Rp5.000.000',
                        style: blackHigtTextStyle.copyWith(fontSize: 20),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Nominal Penarikan',
                        style: blackHigtTextStyle.copyWith(
                            fontSize: 12, fontWeight: regular),
                      ),
                      Text(
                        'Tarik Semua',
                        style: grenTextStyle.copyWith(fontSize: 12),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      fillColor: greenColor,
                      hoverColor: greenColor,
                      hintText: 'RP',
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: greenColor),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    'Min. penarikan Rp10.000',
                    style: subTitleTextStyle,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Divider(
              thickness: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 25, right: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Rekening Tujuan',
                    style: blackHigtTextStyle.copyWith(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isSelected = !isSelected;
                      });
                    },
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'PT. BCA (BANK CENTRAL ASIA) TBK',
                            ),
                            Text('0212871964 - Risty Hafinah')
                          ],
                        ),
                        const Spacer(),
                        Icon(
                          isSelected
                              ? Icons.radio_button_on
                              : Icons.circle_outlined,
                          color: isSelected ? greenColor : blackColor,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 31,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RekeningBankPage(),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/icons/pensil.png',
                          width: 15,
                        ),
                        SizedBox(
                          width: 14,
                        ),
                        Text(
                          'Atur Rekening',
                          style: grenTextStyle.copyWith(fontSize: 15),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 19,
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 25, right: 25),
              child: Column(
                children: [
                  Text(
                    'Dengan klik tombol di bawah, kamu telah setuju dengan ketentuan penarikan saldo.',
                    style: subTitleTextStyle,
                  ),
                  const SizedBox(
                    height: 19,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        backgroundColor: const Color(0XffD9D9D9),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Tarik Saldo',
                        style: TextStyle(
                          fontSize: 16,
                          color: whiteColor,
                          fontWeight: bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 39,
            ),
          ],
        ),
      ),
    );
  }
}
