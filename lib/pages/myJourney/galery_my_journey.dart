// ignore_for_file: use_build_context_synchronously, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/account/my_journey_controller.dart';
import 'package:heystetik_mobileapps/core/convert_date.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/pages/myJourney/detail_gallery_my_journey_page.dart';
import 'package:heystetik_mobileapps/pages/myJourney/zoom_image_detail.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';
import 'package:heystetik_mobileapps/models/customer/my_journey_model.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';
import 'package:heystetik_mobileapps/widget/snackbar_widget.dart';
import '../../theme/theme.dart';
import '../../widget/show_modal_dialog.dart';

class GaleryMyJourney extends StatefulWidget {
  const GaleryMyJourney({super.key});

  @override
  State<GaleryMyJourney> createState() => _GaleryMyJourneyState();
}

class _GaleryMyJourneyState extends State<GaleryMyJourney> {
  final MyJourneyController state = Get.put(MyJourneyController());
  final ScrollController scrollController = ScrollController();
  List<Data2> gallery = [];
  int page = 1;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      gallery.addAll(await state.getJourney(context, page));
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
                      fontFamily: 'ProximaNova',
                      fontSize: 20,
                    ),
                  ),
                )
              : SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 24),
                        child: ListView.builder(
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
                                                  InkWell(
                                                    onTap: () {
                                                      Get.to(
                                                        ZoomImageDetail(
                                                          concern:
                                                              gallery[index]
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
                                                                      .journey![
                                                                          i + 1]
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
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(7),
                                                        image: DecorationImage(
                                                          image: NetworkImage(
                                                              '${Global.FILE}/${gallery[index].journey![i].mediaMyJourney?[a].media?.path}'),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                              ]),
                                        ),
                                      ],
                                    ),
                                  const SizedBox(
                                    height: 14,
                                  ),
                                  const dividergreen(),
                                  const SizedBox(
                                    height: 14,
                                  ),
                                ],
                              );
                            }),
                      ),
                      Obx(
                        () =>
                            state.isLoading.value ? LoadingMore() : Container(),
                      ),
                    ],
                  ),
                ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          children: [ButtonGreenWidget(title: 'Pilih Foto')],
        ),
      ),
    );
  }

  bottomSheet(Data2 e) {
    return customeModal(
      context,
      Padding(
        padding: lsymetric.copyWith(
          top: 25,
        ),
        child: Wrap(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () async {
                    Get.back();
                    await state.deleteJourney(
                      context,
                      e.concernId!.toInt(),
                      doInPost: () async {
                        gallery.clear();
                        page = 1;
                        gallery.addAll(await state.getJourney(context, page));
                        setState(() {});
                        SnackbarWidget.getSuccessSnackbar(
                          context,
                          'Info',
                          'Journey berhasil dihapus',
                        );
                      },
                    );
                  },
                  child: Text(
                    'Delete',
                    style: blackHigtTextStyle.copyWith(
                      fontSize: 15,
                      color: redColor,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
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
                const SizedBox(
                  height: 30,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
