import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:heystetik_mobileapps/pages/doctorpage/account_page/tambah_bank_page.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';

import '../../../theme/theme.dart';

class RekeningBankPage extends StatelessWidget {
  const RekeningBankPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: greenColor,
        title: Text(
          'Rekening Bank',
          style: whiteTextStyle.copyWith(fontWeight: bold, fontSize: 20),
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 19, bottom: 50),
        child: Column(
          children: [
            Row(
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('PT. BCA (BANK CENTRAL ASIA) TBK'),
                    Text('0212871964\na.n Risty Hafinah')
                  ],
                ),
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: subgreyColor),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  width: 58,
                  height: 28,
                  child: Center(
                    child: Text(
                      'Hapus',
                      style: blackHigtTextStyle.copyWith(
                          fontSize: 13, color: const Color(0xfF6B6B6B)),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 17,
            ),
            const Divider(
              thickness: 2,
            ),
            const SizedBox(
              height: 17,
            ),
            Container(
              padding: const EdgeInsets.only(
                  left: 18, right: 50, top: 10, bottom: 10),
              height: 68,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                border: Border.all(color: greenColor),
                borderRadius: BorderRadius.circular(7),
                color: const Color.fromRGBO(36, 167, 160, 0.2),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Catatan :',
                    style: blackHigtTextStyle.copyWith(fontSize: 13),
                  ),
                  Text(
                    'Akun Rekening Bank yang aktif maksimal berjumlah 3 (tiga) buah',
                    style: blackHigtTextStyle.copyWith(
                        fontSize: 12, fontWeight: regular),
                  ),
                ],
              ),
            ),
            const Spacer(),
            ButtonGreenWidget(
              title: 'Tambah Rekening Lain',
              onPressed: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  backgroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.only(
                      topEnd: Radius.circular(25),
                      topStart: Radius.circular(25),
                    ),
                  ),
                  builder: (context) => SingleChildScrollView(
                    child: Wrap(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 60, left: 33, right: 33),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
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
                                    width: 17,
                                  ),
                                  Text(
                                    'Pilih Nama Bank',
                                    style: blackHigtTextStyle.copyWith(
                                        fontSize: 20),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 22,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    child: Container(
                                      height: 12,
                                      width: 12,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'assets/icons/search1.png'),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    constraints:
                                        const BoxConstraints(maxWidth: 280),
                                    child: TextFormField(
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'ProximaNova'),
                                      decoration: InputDecoration(
                                        hintText: 'Cari Nama Bank',
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(
                                          fontFamily: 'ProximaNova',
                                          color: fromCssColor(
                                            '#9B9B9B',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                keyboardDismissBehavior:
                                    ScrollViewKeyboardDismissBehavior.onDrag,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: 10,
                                itemBuilder: (BuildContext context, int index) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          showModalBottomSheet(
                                              isScrollControlled: true,
                                              context: context,
                                              backgroundColor:
                                                  Colors.transparent,
                                              shape:
                                                  const RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadiusDirectional
                                                        .only(
                                                  topEnd: Radius.circular(25),
                                                  topStart: Radius.circular(25),
                                                ),
                                              ),
                                              builder: (context) =>
                                                  const TambahBankPage());
                                        },
                                        child: Text(
                                          'PT BANK RAKYAT INDONESIA (PERSERO) Tbk',
                                          style: blackHigtTextStyle.copyWith(
                                              fontSize: 14),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      const Divider(
                                        thickness: 2,
                                      )
                                    ],
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
