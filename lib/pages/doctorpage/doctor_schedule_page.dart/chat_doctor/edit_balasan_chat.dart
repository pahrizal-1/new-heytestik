import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/doctor/settings/setting_controller.dart';
import '../../../../theme/theme.dart';

class EditBalasanChat extends StatefulWidget {
  final int id;
  const EditBalasanChat({
    super.key,
    required this.id,
  });

  @override
  State<EditBalasanChat> createState() => _EditBalasanChatState();
}

class _EditBalasanChatState extends State<EditBalasanChat> {
  final SettingController state = Get.put(SettingController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    state.finReply(widget.id);
  }

  @override
  Widget build(BuildContext context) {
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
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    size: 22,
                  ),
                ),
                const SizedBox(
                  width: 9,
                ),
                Text(
                  'Edit Balasan Cepat',
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
                state.updateQuickChat(context, widget.id);
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
            Text(
              'Shortcut',
              style: subTitleTextStyle,
            ),
            TextFormField(
              controller: state.shortcutController,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.only(top: 10, bottom: 10),
                focusedBorder: UnderlineInputBorder(
                  //<-- SEE HERE
                  borderSide: BorderSide(width: 1, color: subgreyColor),
                ),
                enabledBorder: UnderlineInputBorder(
                  //<-- SEE HERE
                  borderSide: BorderSide(width: 1, color: subgreyColor),
                ),
              ),
            ),
            const SizedBox(
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
                  ),
                ),
                const Spacer(),
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
