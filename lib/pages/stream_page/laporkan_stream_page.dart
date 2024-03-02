import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/appar_cutome.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';
import 'package:heystetik_mobileapps/widget/filter_publish_widgets.dart';
import 'package:heystetik_mobileapps/widget/show_modal_dialog.dart';

class LaporkanStreamPage extends StatelessWidget {
  const LaporkanStreamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBarCustome(
        title: 'Laporkan',
        colorIcons: blackColor,
        colorTitle: blackColor,
        bgColor: whiteColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Alasan',
              style: blackTextStyle.copyWith(fontSize: 18),
            ),
            SizedBox(
              height: 18,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    customeModal(
                      context,
                      Wrap(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 35,
                              right: 34,
                              top: 40,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Alasan melaporkan',
                                  style: blackTextStyle.copyWith(fontSize: 17),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                FilterSpamStream(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Spam',
                        style:
                            blackRegulerTextStyle.copyWith(color: blackColor),
                      ),
                      Spacer(),
                      Icon(
                        Icons.keyboard_arrow_down,
                        size: 25,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 1,
                  color: borderColor,
                ),
              ],
            ),
            SizedBox(
              height: 41,
            ),
            Text(
              'Jelaskan lebih detail ya kenapa kamu melaporkan ini',
              style: blackTextStyle.copyWith(fontSize: 18),
            ),
            SizedBox(
              height: 18,
            ),
            TextFormField(
              maxLines: 10,
              minLines: 1,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                fillColor: greenColor,
                hoverColor: greenColor,
                hintText: 'Tulis detail alasannya disini ya',
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: greenColor),
                ),
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                    Get.back();
                  },
                  child: Container(
                    width: 165,
                    decoration: BoxDecoration(
                        border: Border.all(color: greenColor),
                        borderRadius: BorderRadius.circular(7)),
                    height: 50,
                    child: Center(
                      child: Text(
                        'Batal',
                        style: grenTextStyle.copyWith(
                            fontSize: 15, fontWeight: bold),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      customeModal(
                        context,
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 42, horizontal: 27),
                          child: Wrap(
                            children: [
                              Text(
                                'Laporkan',
                                style:
                                    blackHigtTextStyle.copyWith(fontSize: 20),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                'Apakah kamu yakin untuk melaporkan postingan stream ini?',
                                style: blackRegulerTextStyle.copyWith(
                                    fontSize: 15),
                              ),
                              SizedBox(
                                height: 60,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: ButtonWhiteWidget(
                                      title: 'Kembali',
                                      onPressed: () {
                                        Get.back();
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: 14,
                                  ),
                                  Expanded(
                                    child: ButtonGreenWidget(
                                      title: 'Laporkan',
                                      onPressed: () async {},
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: 165,
                      decoration: BoxDecoration(
                          color: greenColor,
                          border: Border.all(color: greenColor),
                          borderRadius: BorderRadius.circular(7)),
                      height: 50,
                      child: Center(
                        child: Text(
                          'Konfirmasi',
                          style: whiteTextStyle.copyWith(
                              fontSize: 15, fontWeight: bold),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
