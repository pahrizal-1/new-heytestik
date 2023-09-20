import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/account/profile_controller.dart';
import 'package:heystetik_mobileapps/widget/alert_dialog.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';

import '../../theme/theme.dart';

class PotoWajahPage extends StatelessWidget {
  PotoWajahPage({super.key});
  final ProfileController state = Get.put(ProfileController());
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
                  color: whiteColor,
                ),
              ),
              const SizedBox(
                width: 11,
              ),
              Expanded(
                child: Text(
                  'Foto KTP',
                  style: whiteTextStyle.copyWith(
                    fontSize: 20,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      backgroundColor: blackColor,
      body: Padding(
        padding:
            const EdgeInsets.only(top: 56, bottom: 82, left: 25, right: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: FileImage(
                    File(state.facePhoto!.path),
                  ),
                ),
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(
              height: 134,
            ),
            Text(
              'Pastikan informasi di foto ini sudah terlihat jelas, ya :)',
              style: whiteTextStyle.copyWith(fontWeight: regular),
            ),
            SizedBox(
              height: 33,
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: TextButton.styleFrom(
                        side: BorderSide(color: borderColor, width: 0.5),
                        backgroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Foto Ulang',
                        style: TextStyle(
                          fontSize: 14,
                          color: whiteColor,
                          fontWeight: bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: Obx(
                      () => LoadingWidget(
                        isLoading: state.isLoading.value,
                        child: TextButton(
                          onPressed: () async {
                            await state.accountVerification(context,
                                doInPost: () async {
                              Get
                                ..back()
                                ..back()
                                ..back()
                                ..back()
                                ..back()
                                ..back()
                                ..back();
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialogSucsees();
                                },
                              );
                            });
                          },
                          style: TextButton.styleFrom(
                            side: BorderSide(color: greenColor, width: 2),
                            backgroundColor: greenColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            'Simpan',
                            style: TextStyle(
                              fontSize: 15,
                              color: whiteColor,
                              fontWeight: bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
