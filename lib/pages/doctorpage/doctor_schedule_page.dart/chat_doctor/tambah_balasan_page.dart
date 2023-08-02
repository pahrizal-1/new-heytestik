import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

import '../../../../controller/doctor/settings/setting_controller.dart';

class TambahBalasanPage extends StatelessWidget {
  const TambahBalasanPage({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingController state = Get.put(SettingController());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: greenColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    state.shortcutController.text = '';
                    state.messageController.text = '';
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    size: 22,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  'Tambah Balasan Cepat',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'ProximaNova',
                    fontWeight: bold,
                    fontSize: 20,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: () {
                state.postQuickChat(context);
              },
              child: Text(
                'SIMPAN',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'ProximaNova',
                  fontWeight: bold,
                  fontSize: 15,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 19, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Shortcut'),
            SizedBox(height: 7),
            TextFormField(
              keyboardType: TextInputType.multiline,
              minLines: 1, //Normal textInputField will be displayed
              maxLines: 5,
              controller: state.shortcutController,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Kata-kata yang akan mengambil balasan ini',
              style: subTitleTextStyle,
            ),
            const SizedBox(
              height: 58,
            ),
            Text(
              'Pesan Balasan',
              style: subTitleTextStyle,
            ),
            Row(
              children: [
                Container(
                  width: 284,
                  child: TextFormField(
                    controller: state.messageController,
                    maxLines: 6,
                    minLines: 1,
                    decoration: InputDecoration(
                      focusColor: greenColor,
                      fillColor: greenColor,
                      hoverColor: greenColor,
                    ),
                    style: blackTextStyle.copyWith(
                        fontSize: 15,
                        color: Color(0Xff323232),
                        fontWeight: regular),
                  ),
                ),
                Spacer(),
                Image.asset(
                  'assets/icons/onlyCamaera.png',
                  width: 22,
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'Masukkan teks atau pilih media',
              style: subTitleTextStyle,
            )
          ],
        ),
      ),
    );
  }
}
