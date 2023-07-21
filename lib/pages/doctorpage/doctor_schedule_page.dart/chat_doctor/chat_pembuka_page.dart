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
  bool isSelected = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: greenColor,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Row(
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
              const SizedBox(
                width: 7,
              ),
              Text(
                'Chat Pembuka',
                style: whiteTextStyle.copyWith(fontSize: 18, fontWeight: bold),
              ),
            ],
          ),
          actions: [
            isSelected
                ? Padding(
                    padding: const EdgeInsets.only(right: 20, top: 2),
                    child: Row(
                      children: [
                        Text(
                          'Simpan',
                          style: whiteTextStyle.copyWith(fontSize: 15),
                        ),
                        const SizedBox(
                          width: 31,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              isSelected = !isSelected;
                            });
                          },
                          child: Icon(
                            Icons.more_vert,
                            color: whiteColor,
                          ),
                        ),
                      ],
                    ))
                : Padding(
                    padding: const EdgeInsets.only(top: 9, bottom: 9),
                    child: Container(
                      padding: const EdgeInsets.only(
                          left: 13, right: 11, bottom: 9, top: 9),
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          topLeft: Radius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Buang perubahan',
                        style: grenTextStyle.copyWith(fontSize: 15),
                      ),
                    ),
                  )
          ]),
      body: ListView(
        children: [
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
                    const Spacer(),
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
                      focusedBorder: UnderlineInputBorder(
                        //<-- SEE HERE
                        borderSide: BorderSide(width: 1, color: subgreyColor),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        //<-- SEE HERE
                        borderSide: BorderSide(width: 1, color: subgreyColor),
                      ),
                      // ignore: prefer_single_quotes
                      hintText: "Silakan Masukan Pesan Terbuka"),
                  style: blackTextStyle.copyWith(
                      fontSize: 15,
                      color: const Color(0Xff323232),
                      fontWeight: regular),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
