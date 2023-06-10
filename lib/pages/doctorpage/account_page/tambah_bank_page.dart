import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:heystetik_mobileapps/pages/doctorpage/account_page/rekening_bank_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

import '../../../widget/button_widget.dart';

class TambahBankPage extends StatelessWidget {
  const TambahBankPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: 32,
          right: 33,
          top: 65,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                RekeningBankPage()),
                      );
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: 24,
                    ),
                  ),
                  SizedBox(
                    width: 18,
                  ),
                  Text(
                    'Tambah Rekening',
                    style: blackHigtTextStyle.copyWith(fontSize: 20),
                  ),
                ],
              ),
              const SizedBox(
                height: 37,
              ),
              Text(
                'Nama Bank',
                style: subTitleTextStyle.copyWith(fontSize: 12),
              ),
              const SizedBox(
                height: 9,
              ),
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1.5, color: Color(0xFFCCCCCC)),
                  ),
                ),
                child: Row(
                  children: [
                    Text(
                      'PT BANK RAKYAT INDONESIA (PERSERO) Tbk',
                      style: blackHigtTextStyle.copyWith(fontSize: 14),
                    ),
                    const Spacer(),
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(Icons.keyboard_arrow_down))
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Nomor Rekening',
                style: subTitleTextStyle.copyWith(fontSize: 12),
              ),
              Row(
                children: [
                  Expanded(
                      child: Container(
                          child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      fillColor: greenColor,
                      hoverColor: greenColor,
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: greenColor),
                      ),
                    ),
                  ))),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: subgreyColor),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    width: 58,
                    height: 28,
                    child: Center(
                      child: Text(
                        'Periksa',
                        style: blackHigtTextStyle.copyWith(
                            fontSize: 13, color: const Color(0xfF6B6B6B)),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 390,
              ),
              Text.rich(
                TextSpan(
                  text: 'Dengan klik “Simpan”, kamu menyetujui',
                  style: greyTextStyle.copyWith(fontSize: 13),
                  children: [
                    TextSpan(
                      text: " Kebijakan Privasi",
                      style: grenTextStyle.copyWith(
                        fontSize: 13,
                      ),
                      children: [
                        TextSpan(
                            text: " dan",
                            style: greyTextStyle.copyWith(fontSize: 13),
                            children: [
                              TextSpan(
                                  text: " Syarat dan Ketentuan",
                                  style: grenTextStyle.copyWith(fontSize: 13))
                            ]),
                      ],
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              ButtonGreenWidget(
                title: 'Simpan',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => RekeningBankPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
