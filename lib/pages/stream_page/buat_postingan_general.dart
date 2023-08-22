import 'dart:io';

import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/local_storage.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:image_picker/image_picker.dart';
import '../../controller/customer/stream/post_controller.dart';
import '../../models/customer/stream_post.dart';
import '../../widget/alert_dialog.dart';
import '../../widget/show_modal_dialog.dart';

class BuatPostinganGeneral extends StatefulWidget {
  const BuatPostinganGeneral({super.key});

  @override
  State<BuatPostinganGeneral> createState() => _BuatPostinganGeneralState();
}

class _BuatPostinganGeneralState extends State<BuatPostinganGeneral> {
  final PostController streamController = Get.put(PostController());
  final TextEditingController hashTagController = TextEditingController();
  final TextEditingController postDescController = TextEditingController();
  String name = "-";
  int iSelected = 0;
  List<File> imagePath = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      name = await LocalStorage().getFullName();
      setState(() {});
    });
    super.initState();
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
                'Buat Postingan',
                style: blackHigtTextStyle.copyWith(fontSize: 20),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  RegExp hashtagRegExp = RegExp(r'\B#\w+');
                  Iterable<Match> matches = hashtagRegExp.allMatches(hashTagController.text);
                  List<String?> hashtags = matches.map((match) {
                    String? hashtagText = match.group(0)?.substring(1); // Remove the '#' symbol
                    return hashtagText?.replaceAll(' ', '');
                  }).toList();

                  if (postDescController.text == "") {
                    showDialog(
                      context: context,
                      builder: (context) => AlertWidget(subtitle: "Post Description Can't be Empty"),
                    );
                  } else {
                    StreamPostModel postModel = StreamPostModel(
                      content: postDescController.text,
                      type: 'GENERAL',
                      hashtags: hashtags,
                      endTime: DateTime.now(),
                      options: [],
                    );
                    streamController.postGeneral(context, postModel, files: imagePath, doInPost: () {
                      Navigator.of(context).pop();
                    });
                  }
                },
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
                    'Posting',
                    style: whiteTextStyle.copyWith(fontSize: 13),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/images/profiledummy.png'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: blackTextStyle.copyWith(fontSize: 14),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4.42),
                        decoration: BoxDecoration(border: Border.all(color: borderColor, width: 1.5), borderRadius: BorderRadius.circular(17)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/icons/network-icons.png',
                              width: 7.151,
                              height: 7.151,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Semua Orang',
                              style: subTitleTextStyle.copyWith(fontSize: 10),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 17,
              ),
              TextFormField(
                controller: postDescController,
                maxLines: 5,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Apa Yang kamu Post..',
                  contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelStyle: TextStyle(
                    color: fromCssColor('#A3A3A3'),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        customeshomodal(
                          context,
                          Wrap(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 32),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap: () async {
                                        final returnedImage = await ImagePicker().pickImage(source: ImageSource.camera);
                                        if (returnedImage == null) return;
                                        imagePath.add(File(returnedImage.path));
                                        setState(() {});
                                      },
                                      child: Text(
                                        'Kamera',
                                        style: blackRegulerTextStyle.copyWith(fontSize: 15, color: blackColor),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 21,
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        final returnedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
                                        if (returnedImage == null) return;
                                        imagePath.add(File(returnedImage.path));
                                        setState(() {});
                                      },
                                      child: Text(
                                        'Dari galeri',
                                        style: blackRegulerTextStyle.copyWith(fontSize: 15, color: blackColor),
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
                                            style: blackRegulerTextStyle.copyWith(fontSize: 15, color: blackColor),
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
                        width: MediaQuery.of(context).size.width - 100,
                        height: MediaQuery.of(context).size.width - 100,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black.withOpacity(.2)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.camera_alt_outlined,
                              size: 30.0,
                              color: Colors.black.withOpacity(.3),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Pilih Gambar Dari Galeri Atau Foto Dengan Kamera",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black.withOpacity(.3),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ...imagePath.map((image) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                        ),
                        width: MediaQuery.of(context).size.width - 100,
                        height: MediaQuery.of(context).size.width - 100,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black.withOpacity(.2)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.file(
                            image,
                            fit: BoxFit.fill,
                          ),
                        ),
                      );
                    }).toList(),
                  ],
                ),
              ),
              const SizedBox(
                height: 43,
              ),
              TextFormField(
                controller: hashTagController,
                maxLines: 2,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: borderColor,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: borderColor,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Tambahkan Hashtag concern. Contoh: #Jerawat',
                  hintStyle: subTitleTextStyle.copyWith(
                    fontStyle: FontStyle.italic,
                    fontSize: 13,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelStyle: TextStyle(
                    color: fromCssColor('#A3A3A3'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
