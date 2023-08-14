import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/account/my_journey_controller.dart';
import 'package:heystetik_mobileapps/core/convert_date.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/pages/myJourney/detail_gallery_my_journey_page.dart';
import 'package:heystetik_mobileapps/pages/myJourney/zoom_image_detail.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/tulis_ulasan_produk_page.dart';
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
                      fontWeight: bold,
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: gallery
                              .map(
                                (e) => Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '${e.concern?.name}',
                                          style: blackHigtTextStyle.copyWith(
                                              fontSize: 14),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            bottomSheet(e);
                                          },
                                          icon: Icon(Icons.more_horiz),
                                        )
                                      ],
                                    ),
                                    Text(
                                      ConvertDate.defaultDate(
                                          e.createdAt.toString()),
                                      style: blackRegulerTextStyle.copyWith(
                                          fontSize: 13),
                                    ),
                                    const SizedBox(
                                      height: 14,
                                    ),
                                    Wrap(spacing: 4, runSpacing: 4, children: [
                                      for (int i = 0;
                                          i < e.mediaMyJourneys!.length;
                                          i++)
                                        if (e.mediaMyJourneys![i].category ==
                                            "INITIAL_CONDITION")
                                          InkWell(
                                            onTap: () {
                                              print("iiiiiii $i");
                                              Get.to(
                                                ZoomImageDetail(
                                                    concern:
                                                        e.concern!.name ?? '-',
                                                    beforeImage:
                                                        '${Global.FILE}/${e.mediaMyJourneys![i].media?.path}',
                                                    dateBefore:
                                                        e.createdAt.toString(),
                                                    afterImage: e
                                                                .mediaMyJourneys!
                                                                .length >
                                                            4
                                                        ? '${Global.FILE}/${e.mediaMyJourneys![i == 0 ? 4 : i == 1 ? 5 : i == 2 ? 6 : i == 3 ? 7 : 0].media?.path}'
                                                        : '',
                                                    dateAfter: e.mediaMyJourneys!
                                                                .length >
                                                            4
                                                        ? e.mediaMyJourneys![4]
                                                            .createdAt
                                                            .toString()
                                                        : "-"),
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
                                                      '${Global.FILE}/${e.mediaMyJourneys![i].media?.path}'),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                    ]),
                                    e.mediaMyJourneys!.length > 4
                                        ? const SizedBox(
                                            height: 14,
                                          )
                                        : Container(),
                                    e.mediaMyJourneys!.length > 4
                                        ? Text(
                                            ConvertDate.defaultDate(e
                                                .mediaMyJourneys![4].createdAt
                                                .toString()),
                                            style: blackRegulerTextStyle
                                                .copyWith(fontSize: 13),
                                          )
                                        : Container(),
                                    e.mediaMyJourneys!.length > 4
                                        ? const SizedBox(
                                            height: 14,
                                          )
                                        : Container(),
                                    Wrap(spacing: 4, runSpacing: 4, children: [
                                      for (int i = 0;
                                          i < e.mediaMyJourneys!.length;
                                          i++)
                                        if (e.mediaMyJourneys![i].category ==
                                            "AFTER_CONDITION")
                                          InkWell(
                                            onTap: () {
                                              Get.to(
                                                ZoomImageDetail(
                                                  concern:
                                                      e.concern!.name ?? '-',
                                                  beforeImage:
                                                      '${Global.FILE}/${e.mediaMyJourneys![i == 4 ? 0 : i == 5 ? 1 : i == 6 ? 2 : i == 7 ? 3 : 0].media?.path}',
                                                  dateBefore:
                                                      e.createdAt.toString(),
                                                  afterImage:
                                                      '${Global.FILE}/${e.mediaMyJourneys![i].media?.path}',
                                                  dateAfter: e
                                                      .mediaMyJourneys![4]
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
                                                      '${Global.FILE}/${e.mediaMyJourneys![i].media?.path}'),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                    ]),
                                    const SizedBox(
                                      height: 14,
                                    ),
                                    const dividergreen(),
                                    const SizedBox(
                                      height: 14,
                                    ),
                                  ],
                                ),
                              )
                              .toList(),
                        ),
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
    return customeshomodal(
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
                    await state.deleteJourney(
                      context,
                      e.id!.toInt(),
                      doInPost: () async {
                        Get.back();
                        Get.back();
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
                const SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    'Post After',
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
