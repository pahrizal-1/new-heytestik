// ignore_for_file: list_remove_unrelated_type

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/account/review_controller.dart';
import 'package:heystetik_mobileapps/core/convert_date.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/pages/myJourney/detail_gallery_my_journey_page.dart';
import 'package:heystetik_mobileapps/pages/myJourney/zoom_image_detail.dart';
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
  List<String> selectedImage = [];
  List data = [];

  @override
  void initState() {
    selectedImage.clear();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      gallery.addAll(await state.getJourney(context, page));
      for (int i = 0; i < gallery.length; i++) {
        List journeys = [];
        journeys.clear();
        for (int a = 0; a < gallery[i].journey!.length; a++) {
          List mediaMyJourneys = [];
          mediaMyJourneys.clear();
          for (int u = 0;
              u < gallery[i].journey![a].mediaMyJourney!.length;
              u++) {
            mediaMyJourneys.add({"imageSelected": false});
          }
          journeys.add({
            "concern": gallery[i].concern?.name,
            "mediaMyJourneys": mediaMyJourneys,
          });
        }
        data.add({"dataKe": i, "journey": journeys});
      }
      setState(() {});
      print("data $data");
    });

    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool isTop = scrollController.position.pixels == 0;
        if (!isTop) {
          page += 1;
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
            state.isLoadingMore.value = true;
            List<Data2> galleryScroll = [];
            galleryScroll.clear();
            galleryScroll.addAll(await state.getJourney(context, page));
            for (int i = 0; i < galleryScroll.length; i++) {
              List journeys = [];
              journeys.clear();
              for (int a = 0; a < galleryScroll[i].journey!.length; a++) {
                List mediaMyJourneys = [];
                mediaMyJourneys.clear();
                for (int u = 0;
                    u < galleryScroll[i].journey![a].mediaMyJourney!.length;
                    u++) {
                  mediaMyJourneys.add({"imageSelected": false});
                }
                journeys.add({
                  "concern": gallery[i].concern?.name,
                  "mediaMyJourneys": mediaMyJourneys,
                });
              }
              gallery.add(galleryScroll[i]);
              data.add({"dataKe": i, "journey": journeys});
            }
            setState(() {});
            state.isLoadingMore.value = false;
            print("data scroll $data");
            print("data scroll ${data.length}");
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
                                  for (int i = 0;
                                      i < gallery[index].journey!.length;
                                      i++)
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          ConvertDate.defaultDate(gallery[index]
                                              .journey![i]
                                              .mediaMyJourney![0]
                                              .createdAt
                                              .toString()),
                                          style: blackRegulerTextStyle.copyWith(
                                              fontSize: 13),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, bottom: 10),
                                          child: Wrap(
                                              spacing: 4,
                                              runSpacing: 4,
                                              children: [
                                                for (int a = 0;
                                                    a <
                                                        gallery[index]
                                                            .journey![i]
                                                            .mediaMyJourney!
                                                            .length;
                                                    a++)
                                                  Stack(
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          Get.to(
                                                            ZoomImageDetail(
                                                              concern: gallery[
                                                                          index]
                                                                      .concern!
                                                                      .name ??
                                                                  '-',
                                                              beforeImage:
                                                                  '${Global.FILE}/${gallery[index].journey![i].mediaMyJourney?[a].media?.path}',
                                                              dateBefore: gallery[
                                                                      index]
                                                                  .journey![i]
                                                                  .mediaMyJourney![
                                                                      a]
                                                                  .createdAt
                                                                  .toString(),
                                                              afterImage: gallery[
                                                                              index]
                                                                          .journey!
                                                                          .length ==
                                                                      (i + 1)
                                                                  ? ''
                                                                  : gallery[index]
                                                                              .journey!
                                                                              .length >
                                                                          1
                                                                      ? '${Global.FILE}/${gallery[index].journey![i + 1].mediaMyJourney?[a].media?.path}'
                                                                      : '',
                                                              dateAfter: gallery[
                                                                              index]
                                                                          .journey!
                                                                          .length ==
                                                                      (i + 1)
                                                                  ? ''
                                                                  : gallery[index]
                                                                              .journey!
                                                                              .length >
                                                                          1
                                                                      ? gallery[
                                                                              index]
                                                                          .journey![i +
                                                                              1]
                                                                          .mediaMyJourney![
                                                                              a]
                                                                          .createdAt
                                                                          .toString()
                                                                      : '',
                                                            ),
                                                          );
                                                        },
                                                        child: Container(
                                                          height: 72,
                                                          width: 82,
                                                          margin:
                                                              EdgeInsets.only(
                                                                  bottom: 5),
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        7),
                                                            image:
                                                                DecorationImage(
                                                              image: NetworkImage(
                                                                  '${Global.FILE}/${gallery[index].journey![i].mediaMyJourney?[a].media?.path}'),
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Positioned(
                                                        right: 0,
                                                        child: Checkbox(
                                                          value: data[index][
                                                                      'journey'][i]
                                                                  [
                                                                  'mediaMyJourneys']
                                                              [
                                                              a]['imageSelected'],
                                                          checkColor:
                                                              whiteColor,
                                                          activeColor:
                                                              greenColor,
                                                          onChanged: (value) {
                                                            setState(() {
                                                              data[index]['journey']
                                                                          [i][
                                                                      'mediaMyJourneys'][a]
                                                                  [
                                                                  'imageSelected'] = value!;
                                                            });
                                                            print(
                                                                "data ke ${index + 1} baris ke ${i + 1} gambar ke ${a + 1}");

                                                            if (data[index][
                                                                        'journey'][i]
                                                                    [
                                                                    'mediaMyJourneys'][a]
                                                                [
                                                                'imageSelected']) {
                                                              var img =
                                                                  '${Global.FILE}/${gallery[index].journey![i].mediaMyJourney![a].media?.path}';
                                                              selectedImage
                                                                  .add(img);
                                                              setState(() {});
                                                            } else {
                                                              selectedImage
                                                                  .removeWhere(
                                                                      (String
                                                                          item) {
                                                                return item ==
                                                                    '${Global.FILE}/${gallery[index].journey![i].mediaMyJourney![a].media?.path}';
                                                              });
                                                              setState(() {});
                                                            }
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                              ]),
                                        ),
                                      ],
                                    ),
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
            Navigator.pop(context, selectedImage);
          },
        ),
      ),
    );
  }

  bottomSheet(Data2 e) {
    return customeModal(
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
                      id: e.concernId!.toInt(),
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
