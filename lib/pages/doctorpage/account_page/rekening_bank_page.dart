import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/pages/doctorpage/account_page/tambah_bank_page.dart';
import 'package:heystetik_mobileapps/pages/doctorpage/doctor_schedule_page.dart/doctor_home_page.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';

import '../../../theme/theme.dart';
import '../../../widget/text_form_widget.dart';

class RekeningBankPage extends StatelessWidget {
  const RekeningBankPage({super.key});

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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DoctorHomePage(),
                    ),
                  );
                },
                child: const Icon(Icons.arrow_back)),
            const SizedBox(
              width: 7,
            ),
            Text(
              'Rekening Bank',
              style: whiteTextStyle.copyWith(fontWeight: bold, fontSize: 20),
            ),
          ],
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 19, bottom: 50),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('PT. BCA (BANK CENTRAL ASIA) TBK'),
                    Text('0212871964\na.n Risty Hafinah')
                  ],
                ),
                Spacer(),
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
              padding:
                  EdgeInsets.only(left: 18, right: 50, top: 10, bottom: 10),
              height: 68,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                border: Border.all(color: greenColor),
                borderRadius: BorderRadius.circular(7),
                color: Color.fromRGBO(36, 167, 160, 0.2),
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
                              SearchTextField(
                                title: 'Cari Kodisi',
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                keyboardDismissBehavior:
                                    ScrollViewKeyboardDismissBehavior.onDrag,
                                physics: NeverScrollableScrollPhysics(),
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
                                      SizedBox(
                                        height: 16,
                                      ),
                                      Divider(
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
