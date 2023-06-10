import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

class ChatPembukaPage extends StatefulWidget {
  const ChatPembukaPage({super.key});

  @override
  State<ChatPembukaPage> createState() => _ChatPembukaPageState();
}

class _ChatPembukaPageState extends State<ChatPembukaPage> {
  bool isSwitch = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          header(),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 21, right: 21),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Aktifkan Chat Pembuka',
                      style: blackTextStyle.copyWith(fontSize: 17),
                    ),
                    Spacer(),
                    Switch(
                      focusColor: greenColor,
                      activeColor: greenColor,
                      value: isSwitch,
                      onChanged: (value) {
                        setState(() {
                          isSwitch = value;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                const Text(
                  'Pesan Chet Terbuka',
                  style: TextStyle(color: Color(0xFFA3A3A3)),
                ),
                const SizedBox(
                  height: 9,
                ),
                TextFormField(
                  maxLines: 6,
                  minLines: 1,
                  decoration: InputDecoration(
                      focusColor: greenColor,
                      fillColor: greenColor,
                      hoverColor: greenColor,
                      hintText: "Silakan Masukan Pesan Terbuka"),
                  style: blackTextStyle.copyWith(
                      fontSize: 15,
                      color: Color(0Xff323232),
                      fontWeight: regular),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Container header() {
    return Container(
      padding: EdgeInsets.only(left: 21, right: 21),
      height: 60,
      decoration: BoxDecoration(color: greenColor),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: whiteColor,
            ),
          ),
          SizedBox(
            width: 7,
          ),
          Text(
            'Chat Pembuka',
            style: whiteTextStyle.copyWith(fontSize: 18),
          ),
          Spacer(),
          Text(
            'Simpan',
            style: whiteTextStyle.copyWith(fontSize: 15),
          ),
          SizedBox(
            width: 31,
          ),
          Icon(
            Icons.more_vert,
            color: whiteColor,
          ),
        ],
      ),
    );
  }
}
