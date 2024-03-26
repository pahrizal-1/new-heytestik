// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/account/my_journey_controller.dart';
import 'package:heystetik_mobileapps/core/convert_date.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/pages/myJourney/zoom_image_detail.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';

class DetailGalleryMyJourneyPage extends StatefulWidget {
  int id;
  DetailGalleryMyJourneyPage({required this.id, super.key});

  @override
  State<DetailGalleryMyJourneyPage> createState() => _DetailGalleryMyJourneyPageState();
}

class _DetailGalleryMyJourneyPageState extends State<DetailGalleryMyJourneyPage> {
  final MyJourneyController state = Get.put(MyJourneyController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      state.detailJourney(context, widget.id);
    });
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
                'Detil Journey',
                style: blackTextStyle.copyWith(
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Obx(
        () => LoadingWidget(
          isLoading: state.isLoading.value,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    state.myJourneyById.value.concern?.name ?? "-",
                    style: blackHigtTextStyle.copyWith(fontSize: 14),
                  ),
                  // const SizedBox(
                  //   height: 7,
                  // ),
                  // Text(
                  //   state.myJourneyById.value.createdAt == null
                  //       ? ''
                  //       : ConvertDate.defaultDate(
                  //           state.myJourneyById.value.createdAt.toString()),
                  //   style: blackRegulerTextStyle.copyWith(fontSize: 13),
                  // ),
                  const SizedBox(
                    height: 14,
                  ),
                  Obx(
                    () => state.totalMyJourneyById.value == 0
                        ? Container()
                        : ListView.builder(
                            shrinkWrap: true,
                            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: state.totalMyJourneyById.value,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    ConvertDate.defaultDate(
                                      state.myJourneyById.value.journey![index].createdAt.toString(),
                                    ),
                                    style: blackRegulerTextStyle.copyWith(fontSize: 13),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                                    child: Wrap(spacing: 4, runSpacing: 4, children: [
                                      for (int a = 0; a < state.myJourneyById.value.journey![index].mediaMyJourney!.length; a++)
                                        InkWell(
                                          onTap: () {
                                            Get.to(
                                              ZoomImageDetail(
                                                concern: state.myJourneyById.value.concern!.name ?? '-',
                                                beforeImage: '${Global.FILE}/${state.myJourneyById.value.journey![index].mediaMyJourney?[a].media?.path}',
                                                dateBefore: state.myJourneyById.value.journey![index].createdAt.toString(),
                                                afterImage: state.myJourneyById.value.journey!.length > 4 ? '${Global.FILE}/${state.myJourneyById.value.journey![index].mediaMyJourney?[a].media?.path}' : '',
                                                dateAfter: state.myJourneyById.value.journey![index].createdAt.toString(),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            height: 72,
                                            width: 82,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(7),
                                              image: DecorationImage(
                                                image: NetworkImage('${Global.FILE}/${state.myJourneyById.value.journey![index].mediaMyJourney?[a].media?.path}'),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                    ]),
                                  ),
                                ],
                              );
                            },
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
