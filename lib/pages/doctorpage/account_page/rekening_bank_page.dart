import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/pages/doctorpage/account_page/tambah_bank_doctor_page.dart';

import 'package:heystetik_mobileapps/pages/doctorpage/account_page/tambah_bank_page.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';

import '../../../controller/customer/account/bank_controller.dart';
import '../../../theme/theme.dart';
import '../../../widget/pilih_bank_widgets.dart';
import '../../setings&akun/tambah_bank_customer.dart';

class RekeningBankPage extends StatefulWidget {
  const RekeningBankPage({super.key});

  @override
  State<RekeningBankPage> createState() => _RekeningBankPageState();
}

class _RekeningBankPageState extends State<RekeningBankPage> {
  final BankController state = Get.put(BankController());
  @override
  void initState() {
    super.initState();
    state.selectListBank(context);
  }

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
                Column(
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
              onPressed: () async {
                // clear search
                state.clearForm();
                Get.to(TambahBankDoctorPage());
              },
            ),
          ],
        ),
      ),
    );
  }
}
