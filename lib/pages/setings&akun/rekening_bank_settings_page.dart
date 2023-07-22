import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/tambah_bank_customer.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';

import '../../theme/theme.dart';
import '../../widget/text_form_widget.dart';

class RekeningBankSettings extends StatelessWidget {
  const RekeningBankSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: const EdgeInsets.only(left: 6),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: blackColor,
                ),
              ),
              const SizedBox(
                width: 11,
              ),
              Expanded(
                child: Text(
                  'Rekening Bank',
                  style: blackTextStyle.copyWith(
                    fontSize: 20,
                  ),
                ),
              )
            ],
          ),
        ),
        actions: [
          Image.asset(
            'assets/icons/alert-new.png',
            width: 22,
            height: 22,
          ),
          const SizedBox(
            width: 26,
          ),
        ],
      ),
      body: Padding(
        padding: lsymetric.copyWith(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Kamu bisa simpan maksimal 3 rekening bank',
              style: blackHigtTextStyle.copyWith(fontSize: 15),
            ),
            Text(
              'Saldo Heystetik kamu bisa ditarik ke rekening ini.',
              style: blackRegulerTextStyle,
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              children: [
                Image.asset(
                  'assets/images/logo-bca.png',
                  width: 70,
                ),
                const SizedBox(
                  width: 14,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'PT. BCA (BANK CENTRAL ASIA) TBK',
                      style: blackHigtTextStyle.copyWith(fontSize: 13),
                    ),
                    Text(
                      '0211231234',
                      style: blackRegulerTextStyle.copyWith(color: blackColor),
                    ),
                    Text(
                      'a.n RINA RASMALINA',
                      style: blackRegulerTextStyle.copyWith(color: blackColor),
                    )
                  ],
                ),
                const Spacer(),
                Expanded(child: Image.asset('assets/icons/trash.png'))
              ],
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
                                                  const TambahBankCustomerPage());
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
            ),
            const SizedBox(
              height: 36,
            )
          ],
        ),
      ),
    );
  }
}
