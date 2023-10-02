import 'dart:io';

import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/show_modal_dialog.dart';
import 'package:image_picker/image_picker.dart';

class UploadPotoStream extends StatefulWidget {
  const UploadPotoStream({super.key});

  @override
  State<UploadPotoStream> createState() => _UploadPotoStreamState();
}

class _UploadPotoStreamState extends State<UploadPotoStream> {
  String name = "-";
  int iSelected = 0;
  bool isSelected = false;
  List<File> imagePath = [];
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
              Text(
                'Upload Foto',
                style: blackHigtTextStyle.copyWith(fontSize: 20),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 18,
                    top: 5,
                    bottom: 5,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: greenColor,
                  ),
                  child: Text(
                    'Pilih',
                    style: whiteTextStyle.copyWith(fontSize: 13),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () {
                customeshomodal(
                  context,
                  Wrap(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 35, vertical: 32),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () async {
                                final returnedImage = await ImagePicker()
                                    .pickImage(source: ImageSource.camera);
                                if (returnedImage == null) return;
                                imagePath.add(File(returnedImage.path));
                                setState(() {});
                              },
                              child: Text(
                                'Kamera',
                                style: blackRegulerTextStyle.copyWith(
                                    fontSize: 15, color: blackColor),
                              ),
                            ),
                            const SizedBox(
                              height: 21,
                            ),
                            InkWell(
                              onTap: () async {
                                final returnedImage = await ImagePicker()
                                    .pickImage(source: ImageSource.gallery);
                                if (returnedImage == null) return;
                                imagePath.add(File(returnedImage.path));
                                setState(() {});
                              },
                              child: Text(
                                'Dari galeri',
                                style: blackRegulerTextStyle.copyWith(
                                    fontSize: 15, color: blackColor),
                              ),
                            ),
                            const SizedBox(
                              height: 21,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'CANCEL',
                                    style: blackRegulerTextStyle.copyWith(
                                        fontSize: 15, color: blackColor),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
              child: Container(
                width: 85,
                height: 100,
                decoration: BoxDecoration(
                  color: Color(0xffD9D9D9),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icons/upload-cam.png',
                      width: 31,
                      height: 25,
                      color: whiteColor,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Kamera',
                      style: whiteTextStyle.copyWith(
                          fontSize: 12, fontWeight: regular),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 42,
            ),
            Text(
              'Recents',
              style: blackTextStyle.copyWith(fontSize: 14),
            ),
            SizedBox(
              height: 11,
            ),
            Wrap(
              spacing: 3,
              runSpacing: 5,
              children: [
                RecentsCard(),
                RecentsCard(),
                RecentsCard(),
                RecentsCard(),
                RecentsCard(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RecentsCard extends StatelessWidget {
  const RecentsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 85,
      height: 100,
      decoration: BoxDecoration(
        color: Color(0xffD9D9D9),
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
