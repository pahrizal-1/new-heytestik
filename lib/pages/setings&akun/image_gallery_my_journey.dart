import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/account/review_controller.dart';
import 'package:heystetik_mobileapps/core/convert_date.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/pages/myJourney/detail_gallery_my_journey_page.dart';
import 'package:heystetik_mobileapps/pages/myJourney/zoom_image_detail.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';
import 'package:heystetik_mobileapps/models/customer/my_journey_model.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';
import '../../theme/theme.dart';
import '../../widget/show_modal_dialog.dart';

class ImageGalleryMyJourney extends StatefulWidget {
  const ImageGalleryMyJourney({super.key});

  @override
  State<ImageGalleryMyJourney> createState() => _ImageGalleryMyJourneyState();
}

class _ImageGalleryMyJourneyState extends State<ImageGalleryMyJourney> {
  final ReviewController state = Get.put(ReviewController());
  final ScrollController scrollController = ScrollController();
  List<Data2> gallery = [];
  int page = 1;

  List selectedImage = [];

  List data = [];

  @override
  void initState() {
    selectedImage.clear();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      gallery.addAll(await state.getJourney(context, page));
      for (int i = 0; i < gallery.length; i++) {
        List mediaMyJourneys = [];
        mediaMyJourneys.clear();
        for (int a = 0; a < gallery[i].journey!.length; a++) {
          for (int u = 0;
              u < gallery[i].journey![a].mediaMyJourney!.length;
              u++) {
            mediaMyJourneys.add({"imageSelected": false});
          }
        }

        data.add({
          "concern": gallery[i].concern?.name,
          "mediaMyJourneys": mediaMyJourneys,
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
            state.isLoadingMore.value = true;
            gallery.addAll(await state.getJourney(context, page));
            for (int i = 0; i < gallery.length; i++) {
              List mediaMyJourneys = [];
              mediaMyJourneys.clear();
              for (int a = 0; a < gallery[i].journey!.length; a++) {
                for (int u = 0;
                    u < gallery[i].journey![a].mediaMyJourney!.length;
                    u++) {
                  mediaMyJourneys.add({"imageSelected": false});
                }
              }
              data.add({
                "concern": gallery[i].concern?.name,
                "mediaMyJourneys": mediaMyJourneys,
              });
            }
            setState(() {});
            state.isLoadingMore.value = false;
          });
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        automaticallyImplyLeading: false,
        backgroundColor: whiteColor,
        title: Padding(
          padding: const EdgeInsets.only(left: 6),
          child: Row(
            children: [
              InkWell(
                onTap: () {
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
                'Galeri My Journey',
                style: blackTextStyle.copyWith(
                  fontSize: 20,
                ),
              )
            ],
          ),
        ),
      ),
      body: Obx(
        () => LoadingWidget(
          isLoading: state.isLoadingMore.value ? false : state.isLoading.value,
          child: gallery.isEmpty
              ? Center(
                  child: Text(
                    'Belum ada data',
                    style: TextStyle(
                      fontWeight: bold,
                      fontFamily: 'ProximaNova',
                      fontSize: 20,
                    ),
                  ),
                )
              : SingleChildScrollView(
                  controller: scrollController,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 24),
                    child: Column(
                      children: [
                        ListView.builder(
                            shrinkWrap: true,
                            keyboardDismissBehavior:
                                ScrollViewKeyboardDismissBehavior.onDrag,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: gallery.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${gallery[index].concern?.name}',
                                        style: blackHigtTextStyle.copyWith(
                                            fontSize: 14),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          bottomSheet(gallery[index]);
                                        },
                                        icon: Icon(Icons.more_horiz),
                                      )
                                    ],
                                  ),
                                  Text(
                                    ConvertDate.defaultDate(
                                        gallery[index].createdAt.toString()),
                                    style: blackRegulerTextStyle.copyWith(
                                        fontSize: 13),
                                  ),
                                  const SizedBox(
                                    height: 14,
                                  ),
                                  for (int i = 0;
                                      i < gallery[index].journey!.length;
                                      i++)
                                    Wrap(spacing: 4, runSpacing: 4, children: [
                                      for (int a = 0;
                                          a <
                                              gallery[index]
                                                  .journey![i]
                                                  .mediaMyJourney!
                                                  .length;
                                          a++)
                                        InkWell(
                                          onTap: () {
                                            Get.to(
                                              ZoomImageDetail(
                                                concern: gallery[index]
                                                        .concern!
                                                        .name ??
                                                    '-',
                                                beforeImage:
                                                    '${Global.FILE}/${gallery[index].journey![i].mediaMyJourney?[a].media?.path}',
                                                dateBefore: gallery[index]
                                                    .journey![i]
                                                    .createdAt
                                                    .toString(),
                                                afterImage: gallery[index]
                                                            .journey!
                                                            .length >
                                                        4
                                                    ? '${Global.FILE}/${gallery[index].journey![i].mediaMyJourney?[a].media?.path}'
                                                    : '',
                                                dateAfter: gallery[index]
                                                    .journey![i]
                                                    .createdAt
                                                    .toString(),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            height: 72,
                                            width: 82,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(7),
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    '${Global.FILE}/${gallery[index].journey![i].mediaMyJourney?[a].media?.path}'),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                    ]),
                                  // Wrap(spacing: 4, runSpacing: 4, children: [
                                  //   for (int i = 0;
                                  //       i <
                                  //           gallery[index]
                                  //               .mediaMyJourneys!
                                  //               .length;
                                  //       i++)
                                  //     if (gallery[index]
                                  //             .mediaMyJourneys![i]
                                  //             .category ==
                                  //         "INITIAL_CONDITION")
                                  //       Stack(
                                  //         children: [
                                  //           InkWell(
                                  //             onTap: () {
                                  //               Get.to(
                                  //                 ZoomImageDetail(
                                  //                     concern: gallery[index]
                                  //                             .concern!
                                  //                             .name ??
                                  //                         '-',
                                  //                     beforeImage:
                                  //                         '${Global.FILE}/${gallery[index].mediaMyJourneys![i].media?.path}',
                                  //                     dateBefore: gallery[index]
                                  //                         .createdAt
                                  //                         .toString(),
                                  //                     afterImage: gallery[index]
                                  //                                 .mediaMyJourneys!
                                  //                                 .length >
                                  //                             4
                                  //                         ? '${Global.FILE}/${gallery[index].mediaMyJourneys![i == 0 ? 4 : i == 1 ? 5 : i == 2 ? 6 : i == 3 ? 7 : 0].media?.path}'
                                  //                         : '',
                                  //                     dateAfter: gallery[index]
                                  //                                 .mediaMyJourneys!
                                  //                                 .length >
                                  //                             4
                                  //                         ? gallery[index]
                                  //                             .mediaMyJourneys![
                                  //                                 4]
                                  //                             .createdAt
                                  //                             .toString()
                                  //                         : "-"),
                                  //               );
                                  //             },
                                  //             child: Container(
                                  //               height: 72,
                                  //               width: 82,
                                  //               decoration: BoxDecoration(
                                  //                 borderRadius:
                                  //                     BorderRadius.circular(7),
                                  //                 image: DecorationImage(
                                  //                   image: NetworkImage(
                                  //                       '${Global.FILE}/${gallery[index].mediaMyJourneys![i].media?.path}'),
                                  //                   fit: BoxFit.cover,
                                  //                 ),
                                  //               ),
                                  //             ),
                                  //           ),
                                  //           Positioned(
                                  //             right: 0,
                                  //             child: Checkbox(
                                  //               value: data[index]
                                  //                       ['mediaMyJourneys'][i]
                                  //                   ['imageSelected'],
                                  //               checkColor: whiteColor,
                                  //               activeColor: greenColor,
                                  //               onChanged: (value) {
                                  //                 setState(() {
                                  //                   data[index]['mediaMyJourneys']
                                  //                               [i]
                                  //                           ['imageSelected'] =
                                  //                       value!;
                                  //                 });
                                  //                 print(
                                  //                     "data ke ${index + 1} gambar ke ${i + 1}");

                                  //                 if (data[index]
                                  //                         ['mediaMyJourneys'][i]
                                  //                     ['imageSelected']) {
                                  //                   var img =
                                  //                       '${Global.FILE}/${gallery[index].mediaMyJourneys![i].media?.path}';
                                  //                   selectedImage.add(img);
                                  //                   print(
                                  //                       "selectedImage $selectedImage");
                                  //                 } else {
                                  //                   setState(() {
                                  //                     selectedImage.removeWhere(
                                  //                         (item) =>
                                  //                             item ==
                                  //                             '${gallery[index].mediaMyJourneys![i].media?.path}');
                                  //                   });
                                  //                 }
                                  //               },
                                  //             ),
                                  //           ),
                                  //         ],
                                  //       )
                                  // else if (gallery[index]
                                  //         .mediaMyJourneys![i]
                                  //         .category ==
                                  //     "AFTER_CONDITION")
                                  //   Column(
                                  //     children: [
                                  //       if (gallery[index]
                                  //               .mediaMyJourneys!
                                  //               .length >
                                  //           4)
                                  //         if (i == 4)
                                  //           Text(
                                  //             ConvertDate.defaultDate(
                                  //                 gallery[index]
                                  //                     .mediaMyJourneys![4]
                                  //                     .createdAt
                                  //                     .toString()),
                                  //             style: blackRegulerTextStyle
                                  //                 .copyWith(fontSize: 13),
                                  //           ),
                                  //       if (gallery[index]
                                  //               .mediaMyJourneys!
                                  //               .length >
                                  //           4)
                                  //         const SizedBox(
                                  //           width: 11,
                                  //         ),
                                  //       Stack(
                                  //         children: [
                                  //           InkWell(
                                  //             onTap: () {
                                  //               Get.to(
                                  //                 ZoomImageDetail(
                                  //                   concern: gallery[index]
                                  //                           .concern!
                                  //                           .name ??
                                  //                       '-',
                                  //                   beforeImage:
                                  //                       '${Global.FILE}/${gallery[index].mediaMyJourneys![i == 4 ? 0 : i == 5 ? 1 : i == 6 ? 2 : i == 7 ? 3 : 0].media?.path}',
                                  //                   dateBefore:
                                  //                       gallery[index]
                                  //                           .createdAt
                                  //                           .toString(),
                                  //                   afterImage:
                                  //                       '${Global.FILE}/${gallery[index].mediaMyJourneys![i].media?.path}',
                                  //                   dateAfter: gallery[
                                  //                           index]
                                  //                       .mediaMyJourneys![4]
                                  //                       .createdAt
                                  //                       .toString(),
                                  //                 ),
                                  //               );
                                  //             },
                                  //             child: Container(
                                  //               height: 72,
                                  //               width: 82,
                                  //               decoration: BoxDecoration(
                                  //                 borderRadius:
                                  //                     BorderRadius.circular(
                                  //                         7),
                                  //                 image: DecorationImage(
                                  //                   image: NetworkImage(
                                  //                       '${Global.FILE}/${gallery[index].mediaMyJourneys![i].media?.path}'),
                                  //                   fit: BoxFit.cover,
                                  //                 ),
                                  //               ),
                                  //             ),
                                  //           ),
                                  //           Positioned(
                                  //             right: 0,
                                  //             child: Checkbox(
                                  //               value: data[index]
                                  //                   ['imageSelected'],
                                  //               checkColor: whiteColor,
                                  //               activeColor: greenColor,
                                  //               onChanged: (value) {
                                  //                 setState(() {
                                  //                   data[index][
                                  //                           'imageSelected'] =
                                  //                       value!;
                                  //                 });

                                  //                 print(
                                  //                     "data ke ${index + 1} gambar ke ${i + 1}");

                                  //                 if (data[index]
                                  //                     ['imageSelected']) {
                                  //                   var img =
                                  //                       '${gallery[index].mediaMyJourneys![i].media?.path}';
                                  //                   print("img $img");

                                  //                   selectedImage.add(img);
                                  //                   print(
                                  //                       "selectedImage $selectedImage");
                                  //                 } else {
                                  //                   setState(() {
                                  //                     selectedImage.removeWhere(
                                  //                         (item) =>
                                  //                             item ==
                                  //                             '${gallery[index].mediaMyJourneys![i].media?.path}');
                                  //                   });
                                  //                 }
                                  //               },
                                  //             ),
                                  //           ),
                                  //         ],
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ]),
                                ],
                              );
                            }),
                        Obx(
                          () => state.isLoading.value
                              ? LoadingMore()
                              : Container(),
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ButtonGreenWidget(
          title: 'Pilih Foto',
          onPressed: () {
            print("imageee $selectedImage");
            print("selectedImage ${selectedImage.length}");

            // print("data $data");
            // print("data ${data.length}");

            // for (int i = 0; i < data.length; i++) {
            //   print("data ke ${i + 1} ${data[i]['concern']}");
            //   for (int a = 0; a < data[i]['mediaMyJourneys'].length; a++) {
            //     print("data mediaMyJourneys ${data[i]['mediaMyJourneys'][a]}");
            //   }
            // }

            Navigator.pop(context, selectedImage);
          },
        ),
      ),
    );
  }

  bottomSheet(Data2 e) {
    return customeshomodal(
      context,
      Padding(
        padding: lsymetric.copyWith(top: 25, bottom: 25),
        child: Wrap(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                    Get.to(DetailGalleryMyJourneyPage(
                      id: e.id!.toInt(),
                    ));
                  },
                  child: Text(
                    'Detail',
                    style: blackTextStyle.copyWith(
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
