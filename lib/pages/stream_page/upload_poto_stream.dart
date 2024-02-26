// ignore_for_file: must_be_immutable

import 'dart:io';
import 'package:heystetik_mobileapps/core/download_file.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/models/stream_image_recent_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/stream/post_controller.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';
import 'package:heystetik_mobileapps/widget/show_modal_dialog.dart';
import 'package:image_picker/image_picker.dart';

class UploadPotoStream extends StatefulWidget {
  const UploadPotoStream({super.key});

  @override
  State<UploadPotoStream> createState() => _UploadPotoStreamState();
}

class _UploadPotoStreamState extends State<UploadPotoStream> {
  final PostController streamController = Get.put(PostController());
  final ScrollController scrollController = ScrollController();
  List<File> selectedImagePath = [];
  int page = 1;
  List<Data2> recentImage = [];
  List data = [];
  List<String> selectedRecentImage = [];
  List selectedImage = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      recentImage.addAll(await streamController.getRecentImage(context, page));
      for (int i = 0; i < recentImage.length; i++) {
        data.add({
          "image": '',
          "imageSelected": false,
        });
      }
      setState(() {});
    });
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool isTop = scrollController.position.pixels == 0;
        if (!isTop) {
          page += 1;
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
            recentImage
                .addAll(await streamController.getRecentImage(context, page));
            data.add({
              "image": '',
              "imageSelected": false,
            });
            setState(() {});
          });
        }
      }
    });
  }

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
                onTap: () async {
                  streamController.isMinorLoading.value = true;
                  selectedImage.clear();
                  for (int i = 0; i < selectedImagePath.length; i++) {
                    selectedImage.add(File(selectedImagePath[i].path).path);
                  }
                  for (int i = 0; i < selectedRecentImage.length; i++) {
                    selectedImage
                        .add(await downloadFileFromUrl(selectedRecentImage[i]));
                  }
                  setState(() {});
                  streamController.isMinorLoading.value = false;
                  Get.back(result: selectedImage);
                },
                child: Obx(
                  () => LoadingWidget(
                    isLoading: streamController.isMinorLoading.value,
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
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () {
                  customeModal(
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
                                  selectedImagePath
                                      .add(File(returnedImage.path));
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
                                  selectedImagePath
                                      .add(File(returnedImage.path));
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
                height: 10,
              ),
              Wrap(
                spacing: 3,
                runSpacing: 5,
                children: selectedImagePath
                    .map(
                      (element) => Stack(
                        children: [
                          Container(
                            height: 72,
                            width: 82,
                            decoration: BoxDecoration(
                              color: Color(0xffD9D9D9),
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: FileImage(element),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            child: InkWell(
                              onTap: () {
                                selectedImagePath.removeWhere((File item) {
                                  return item == element;
                                });
                                setState(() {});
                              },
                              child: Icon(
                                Icons.delete,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                    .toList(),
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
              Wrap(spacing: 3, runSpacing: 5, children: [
                ...List.generate(
                  recentImage.length,
                  (index) => recentsCard(
                      recentImage[index].media!.path.toString(), index),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget recentsCard(String image, int index) {
    return Stack(
      children: [
        Container(
          width: 85,
          height: 100,
          decoration: BoxDecoration(
            color: Color(0xffD9D9D9),
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: NetworkImage('${Global.FILE}/$image'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          right: 0,
          child: Checkbox(
            value: data[index]['imageSelected'],
            checkColor: whiteColor,
            activeColor: greenColor,
            onChanged: (value) {
              setState(() {
                data[index]['imageSelected'] = value!;
              });

              if (data[index]['imageSelected']) {
                var img = '${Global.FILE}/${recentImage[index].media?.path}';
                selectedRecentImage.add(img);
                setState(() {});
              } else {
                selectedRecentImage.removeWhere((String item) {
                  return item ==
                      '${Global.FILE}/${recentImage[index].media?.path}';
                });
                setState(() {});
              }
            },
          ),
        ),
      ],
    );
  }
}
