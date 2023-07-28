import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/pages/doctorpage/doctor_schedule_page.dart/chat_doctor/edit_balasan_chat.dart';
import 'package:heystetik_mobileapps/pages/doctorpage/doctor_schedule_page.dart/chat_doctor/tambah_balasan_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

import '../../../../controller/doctor/settings/setting_controller.dart';

class BalasanCepatPage extends StatefulWidget {
  const BalasanCepatPage({super.key});

  @override
  State<BalasanCepatPage> createState() => _BalasanCepatPageState();
}

class _BalasanCepatPageState extends State<BalasanCepatPage> {
  final SettingController state = Get.put(SettingController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    state.getReplyChat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: greenColor,
        title: Padding(
          padding: const EdgeInsets.only(left: 6),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  state.quickListChat.value = [];
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: whiteColor,
                ),
              ),
              const SizedBox(
                width: 11,
              ),
              Text(
                'Balasan Cepat',
                style: whiteTextStyle.copyWith(fontSize: 20),
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 19),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Container(
                    height: 12,
                    width: 12,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/icons/search1.png'),
                      ),
                    ),
                  ),
                ),
                Container(
                  constraints: const BoxConstraints(maxWidth: 280),
                  child: TextFormField(
                    style: const TextStyle(
                        fontSize: 15, fontFamily: 'ProximaNova'),
                    decoration: InputDecoration(
                      hintText: 'Cari Balasan',
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
              height: 13,
            ),
            Row(
              children: [
                Image.asset(
                  'assets/icons/alert.png',
                  width: 17,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Expanded(
                  child: Text(
                    'Untuk menggunakan balasan cepat, ketik “/” pada keyboard atau klik tombol balasan cepat',
                    style: TextStyle(color: Color(0Xff9B9B9B)),
                  ),
                ),
              ],
            ),
            Obx(
              () => Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: state.quickListChat.length,
                    itemBuilder: (context, index) {
                      return CardTambhan(
                        title: state.quickListChat[index]['shortcut'],
                        subTitle: state.quickListChat[index]['message'],
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Container(
          height: 60,
          width: 60,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        const TambahBalasanPage()),
              );
            },
            backgroundColor: greenColor,
            child: const Icon(
              Icons.add,
              size: 40,
            ),
          ),
        ),
      ),
    );
  }
}

class CardTambhan extends StatelessWidget {
  final String title;
  final String subTitle;

  const CardTambhan({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 22,
        ),
        const Divider(
          thickness: 2,
        ),
        const SizedBox(
          height: 22,
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const EditBalasanChat(),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: blackHigtTextStyle.copyWith(fontSize: 15),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                subTitle,
                style: blackTextStyle.copyWith(
                    color: const Color(0XffA3A3A3), fontWeight: regular),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
