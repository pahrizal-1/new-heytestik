import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/account/my_journey_controller.dart';
import 'package:heystetik_mobileapps/core/convert_date.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/pages/myJourney/zoom_image_detail.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/tulis_ulasan_skincare_page.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';
import 'package:heystetik_mobileapps/models/customer/my_journey_model.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';
import '../../theme/theme.dart';

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
            gallery.addAll(await state.getJourney(context, page));
            setState(() {});
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
          isLoading: state.isLoading.value,
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: gallery
                          .map(
                            (e) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${e.concern?.name}',
                                  style:
                                      blackHigtTextStyle.copyWith(fontSize: 14),
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
                                Wrap(
                                  spacing: 4,
                                  runSpacing: 4,
                                  children: e.mediaMyJourneys!.map((a) {
                                    if (a.category == "INITIAL_CONDITION") {
                                      return InkWell(
                                        onTap: () {
                                          Get.to(ZoomImageDetail(
                                            concern: e.concern!.name ?? '-',
                                            beforeImage:
                                                '${Global.FILE}/${a.media?.path}',
                                            dateBefore: e.createdAt.toString(),
                                            afterImage:
                                                '${Global.FILE}/${a.media?.path}',
                                            dateAfter: e.createdAt.toString(),
                                          ));
                                        },
                                        child: Container(
                                          height: 72,
                                          width: 82,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(7),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  '${Global.FILE}/${a.media?.path}'),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      );
                                    }

                                    return Container();
                                  }).toList(),
                                ),
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
                                        style: blackRegulerTextStyle.copyWith(
                                            fontSize: 13),
                                      )
                                    : Container(),
                                e.mediaMyJourneys!.length > 4
                                    ? const SizedBox(
                                        height: 14,
                                      )
                                    : Container(),
                                Wrap(
                                  spacing: 4,
                                  runSpacing: 4,
                                  children: e.mediaMyJourneys!.map((a) {
                                    if (a.category == "AFTER_CONDITION") {
                                      return InkWell(
                                        onTap: () {
                                          Get.to(ZoomImageDetail(
                                            concern: e.concern!.name ?? '-',
                                            beforeImage:
                                                '${Global.FILE}/${a.media?.path}',
                                            dateBefore: e.createdAt.toString(),
                                            afterImage:
                                                '${Global.FILE}/${a.media?.path}',
                                            dateAfter: e.createdAt.toString(),
                                          ));
                                        },
                                        child: Container(
                                          height: 72,
                                          width: 82,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(7),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  '${Global.FILE}/${a.media?.path}'),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      );
                                    }

                                    return Container();
                                  }).toList(),
                                ),
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
}
