// ignore_for_file: use_build_context_synchronously, must_be_immutable

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/account/profile_controller.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/etalase_controller.dart';
import 'package:heystetik_mobileapps/controller/customer/stream/post_controller.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/core/local_storage.dart';
import 'package:heystetik_mobileapps/models/customer/stream_post_model.dart';
import 'package:heystetik_mobileapps/pages/stream_page/upload_poto_stream.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/alert_dialog.dart';
import 'package:heystetik_mobileapps/widget/filter_publish_widgets.dart';
import 'package:heystetik_mobileapps/widget/show_modal_dialog.dart';
import 'package:heystetik_mobileapps/widget/text_form_widget.dart';
import 'package:heystetik_mobileapps/models/customer/concern_model.dart'
    as Concern;

class BuatPostinganStream extends StatefulWidget {
  const BuatPostinganStream({super.key});

  @override
  State<BuatPostinganStream> createState() => _BuatPostinganStreamState();
}

class _BuatPostinganStreamState extends State<BuatPostinganStream> {
  final zoomTransformationController = TransformationController();

  void _resetZoom() {
    zoomTransformationController.value = Matrix4.identity();
    print('reset zoom');
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final ProfileController stateProfile = Get.put(ProfileController());
  final EtalaseController etalaseController = Get.put(EtalaseController());
  bool isSelectedHastag = true;
  bool isSelectedPoling = true;
  final TextEditingController postDescController = TextEditingController();
  final TextEditingController hashTagController = TextEditingController();
  List imagePath = [];
  final PostController streamController = Get.put(PostController());
  String name = '-';
  final List<TextEditingController> optionController = [];
  final DateTime endDate = DateTime.now();
  int days = 1;
  Map visibility = {'visibility': 'PUBLIC', 'title': 'Semua Orang'};
  bool isSuggestion = false;
  // List suggest = ['Jerawat', 'Kulit Kering'];
  List<Concern.Data2> concern1 = [];
  List<Concern.Data2> concern = [];
  List<Concern.Data2> suggestConcern = [];
  List selectedImage = [];
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      name = await LocalStorage().getFullName();
      stateProfile.getProfile(context);
      concern1.addAll(await etalaseController.getConcern(context));

      for (int i = 0; i < concern1.length; i++) {
        concern.add(concern1[i]);
        concern[i].name = "#${concern[i].name}";
      }
      setState(() {});
    });
    super.initState();
  }

  onChangeFilterText(String value) {
    print("value $value");
    if (value.isEmpty || value == '') {
      print("kosong kosong");
      setState(() {
        suggestConcern.clear();
        isSuggestion = false;
      });
    } else {
      String str = value.substring(value.lastIndexOf(" ") + 1);

      suggestConcern = concern
          .where((element) =>
              element.name!.toLowerCase().contains(str.toLowerCase()))
          .toList();

      if (suggestConcern.isNotEmpty) {
        setState(() {
          isSuggestion = true;
        });
      } else {
        setState(() {
          isSuggestion = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
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
                  Get.back();
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
                onTap: () async {
                  RegExp hashtagRegExp = RegExp(r'\B#\w+');
                  Iterable<Match> matches =
                      hashtagRegExp.allMatches(hashTagController.text);

                  List<String?> hashtags = matches.map((match) {
                    String? hashtagText =
                        match.group(0)?.substring(1); // Remove the '#' symbol

                    return hashtagText?.replaceAll(' ', '');
                  }).toList();

                  if (postDescController.text == "") {
                    showDialog(
                      context: context,
                      builder: (context) => AlertWidget(
                          subtitle: "Post Description Can't be Empty"),
                    );
                  } else {
                    StreamPostModel postModel = StreamPostModel(
                      content: postDescController.text,
                      hashtags: hashtags,
                      endTime: DateTime.now().add(Duration(days: days)),
                      options: optionController.map((e) => e.text).toList(),
                      visibility: visibility['visibility'].toString(),
                    );
                    streamController.postStream(context, postModel,
                        files: imagePath, doInPost: () {
                      Get.back();
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
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: stateProfile.imgNetwork.value != ""
                            ? NetworkImage(
                                    '${Global.FILE}/${stateProfile.imgNetwork.value}')
                                as ImageProvider
                            : AssetImage('assets/images/profiledummy.png'),
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
                      InkWell(
                        onTap: () {
                          customeshomodal(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Siapa Yang Bisa Melihat Postingan Ini?',
                                        style: blackTextStyle.copyWith(
                                            fontSize: 17),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      FilterPublis(),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ).then((value) async {
                            setState(() {
                              visibility = value;
                            });
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 4.42),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: borderColor, width: 1.5),
                              borderRadius: BorderRadius.circular(17)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/icons/network-icons.png',
                                width: 11.151,
                                height: 11.151,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                visibility['title'].toString(),
                                style: subTitleTextStyle.copyWith(fontSize: 12),
                              ),
                              Icon(
                                Icons.keyboard_arrow_down,
                                color: greenColor,
                                size: 15,
                              )
                            ],
                          ),
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
                maxLines: 4,
                controller: postDescController,
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
                  hintText: 'Mau share apa hari ini? Tulis disini yuk :)',
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelStyle: TextStyle(
                    color: fromCssColor('#A3A3A3'),
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: imagePath
                      .asMap()
                      .map((i, element) => MapEntry(i, fotoStream(element, i)))
                      .values
                      .toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 11),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          isSelectedHastag = !isSelectedHastag;
                        });
                      },
                      child: Image.asset(
                        'assets/icons/hashtag-stream.png',
                        width: 25,
                        height: 25,
                        color: isSelectedHastag ? borderColor : greenColor,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    isSelectedHastag
                        ? Text(
                            'Tambahkan Hashtag',
                            style: blackRegulerTextStyle.copyWith(
                                fontSize: 14, color: blackColor),
                          )
                        : Expanded(
                            child: TextFormField(
                              controller: hashTagController,
                              onChanged: (value) {
                                onChangeFilterText(value);
                                scaffoldKey.currentState!.showBottomSheet(
                                  (context) => Visibility(
                                    visible: isSuggestion,
                                    child: Container(
                                      height: 150,
                                      width: 420,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                      ),
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: suggestConcern.length,
                                          itemBuilder: ((context, index) {
                                            return InkWell(
                                              onTap: () async {
                                                hashTagController
                                                    .text = hashTagController
                                                        .text +
                                                    " ${suggestConcern[index].name.toString().removeAllWhitespace}";

                                                setState(() {});
                                                Get.back();
                                              },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  suggestConcern[index]
                                                      .name
                                                      .toString(),
                                                ),
                                              ),
                                            );
                                          })),
                                    ),
                                  ),
                                );
                              },
                              style: grenTextStyle.copyWith(
                                  fontSize: 14, fontWeight: regular),
                              maxLines: 2,
                              // readOnly: true,
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
                                hintText:
                                    'Tambahkan Hashtag concern.\nContoh: #Jerawat',
                                hintStyle: subTitleTextStyle.copyWith(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 13,
                                ),
                                labelText: 'Tambahkan Hashtag',
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 15),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                labelStyle: TextStyle(
                                  color: blackColor,
                                ),
                              ),
                            ),
                          ),
                    // Expanded(
                    //     child: InkWell(
                    //       onTap: () {
                    //         showSearch(
                    //             context: context,
                    //             delegate: CustomeSearchDelected());
                    //       },
                    //       child: Container(
                    //           padding: EdgeInsets.only(
                    //               left: 13, top: 11, bottom: 11),
                    //           decoration: BoxDecoration(
                    //               border: Border.all(color: borderColor),
                    //               borderRadius: BorderRadius.circular(7)),
                    //           child: Align(
                    //             alignment: Alignment.topLeft,
                    //             child: Text(
                    //               'Tambahkan Hashtag concern.\nContoh: #Jerawat',
                    //               style: subGreyTextStyle.copyWith(
                    //                   color: Color(0xffA3A3A3),
                    //                   fontSize: 12),
                    //             ),
                    //           )),
                    //     ),
                    //   ),
                  ],
                ),
              ),
              Divider(height: 0.2),
              Padding(
                padding: const EdgeInsets.only(top: 11, bottom: 11),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          isSelectedPoling = !isSelectedPoling;
                        });
                        if (isSelectedPoling) {
                          optionController.clear();
                          setState(() {});
                        } else {
                          optionController.add(TextEditingController());
                          setState(() {});
                        }
                      },
                      child: Image.asset(
                        'assets/icons/poll-stream.png',
                        width: 25,
                        height: 25,
                        color: isSelectedPoling ? borderColor : greenColor,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    isSelectedPoling
                        ? Text(
                            'Buat Polling',
                            style: blackRegulerTextStyle.copyWith(
                                fontSize: 14, color: blackColor),
                          )
                        : Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 13, horizontal: 13),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: borderColor),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (optionController.isEmpty)
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            optionController
                                                .add(TextEditingController());
                                            setState(() {});
                                          },
                                          child: Container(
                                            width: 24,
                                            height: 24,
                                            margin: EdgeInsets.only(bottom: 14),
                                            decoration: BoxDecoration(
                                                color: greenColor,
                                                shape: BoxShape.circle),
                                            child: Icon(
                                              Icons.add,
                                              color: whiteColor,
                                              size: 20,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ...optionController
                                      .asMap()
                                      .map(
                                        (i, element) => MapEntry(
                                          i,
                                          Row(
                                            children: [
                                              Expanded(
                                                child: TextFormPollPosition(
                                                  title: 'Pilihan ${i + 1}',
                                                  controller:
                                                      optionController[i],
                                                  isLastElement: i ==
                                                      optionController.length -
                                                          1,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 8,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  optionController.add(
                                                      TextEditingController());
                                                  setState(() {});
                                                },
                                                child: Container(
                                                  width: 24,
                                                  height: 24,
                                                  margin: EdgeInsets.only(
                                                      bottom: 14),
                                                  decoration: BoxDecoration(
                                                      color: greenColor,
                                                      shape: BoxShape.circle),
                                                  child: Icon(
                                                    Icons.add,
                                                    color: whiteColor,
                                                    size: 20,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                      .values
                                      .toList(),
                                  Row(
                                    children: [
                                      Text(
                                        'Berakhir',
                                        style: subTitleTextStyle.copyWith(
                                          fontSize: 14,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 11,
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(
                                            left: 11, right: 11, top: 0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                            color: borderColor,
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.access_time,
                                              color: subTitleColor,
                                              size: 20,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            DropdownButtonHideUnderline(
                                              child: DropdownButton<int>(
                                                value: days,
                                                icon: Icon(
                                                  Icons.keyboard_arrow_down,
                                                  color: subTitleColor,
                                                ),
                                                onChanged: (int? value) {
                                                  setState(() {
                                                    days = value!;
                                                  });
                                                },
                                                items: [1, 2, 3, 4, 5, 6, 7]
                                                    .map<DropdownMenuItem<int>>(
                                                        (int value) {
                                                  return DropdownMenuItem<int>(
                                                    value: value,
                                                    child: Text(
                                                      "$value Hari",
                                                      style: subTitleTextStyle
                                                          .copyWith(
                                                              fontSize: 14),
                                                    ),
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Spacer(),
                                      GestureDetector(
                                        onTap: () {
                                          optionController.removeLast();
                                          setState(() {});
                                        },
                                        child: Text(
                                          'Hapus',
                                          style: subTitleTextStyle.copyWith(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                  ],
                ),
              ),
              Divider(height: 0.2),
              InkWell(
                onTap: () async {
                  imagePath.addAll(await Get.to(UploadPotoStream()));
                  setState(() {});
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 11, bottom: 11),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/icons/upload-cam.png',
                        width: 25,
                        height: 25,
                        color: subTitleColor,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Upload Foto',
                        style: blackRegulerTextStyle.copyWith(
                            fontSize: 14, color: blackColor),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(height: 0.2),
            ],
          ),
        ),
      ),
    );
  }

  Widget fotoStream(String image, int index) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      width: 200,
      child: Stack(
        children: [
          Image.file(
            File(image),
            fit: BoxFit.fill,
          ),
          Positioned(
            top: 10,
            left: 170,
            child: InkWell(
              onTap: () {
                imagePath.removeWhere((item) {
                  return item == image;
                });
                setState(() {});
              },
              child: Container(
                padding: EdgeInsets.all(6),
                height: 21,
                width: 21,
                decoration: BoxDecoration(
                  color: blackColor.withOpacity(0.8),
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/icons/remove.png',
                  width: 1,
                  height: 1,
                ),
              ),
            ),
          ),
          // Positioned(
          //   top: 290.2,
          //   child: Container(
          //     decoration: BoxDecoration(
          //       color: Colors.white.withOpacity(1),
          //       borderRadius: const BorderRadius.only(
          //         topRight: Radius.circular(86),
          //         bottomRight: Radius.circular(86),
          //       ),
          //     ),
          //     padding: const EdgeInsets.only(left: 6, top: 7),
          //     height: 40,
          //     width: 150,
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Text(
          //           'My Journey - Jerawat',
          //           style: blackTextStyle.copyWith(fontSize: 8.67),
          //         ),
          //         Text(
          //           'My Journey - Jerawat 12 Mar 2023 12:30 WIB',
          //           style: blackRegulerTextStyle.copyWith(fontSize: 8.67),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class CustomeSearchDelected extends SearchDelegate {
  List<String> searchTerms = [
    'ada',
    'ada',
    'neon',
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(
            result,
            style: blackRegulerTextStyle,
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}
