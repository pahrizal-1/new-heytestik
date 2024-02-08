// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/account/review_controller.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import 'package:heystetik_mobileapps/models/customer/finished_review_model.dart';
import '../../widget/share_solusion_widget_page.dart';
import 'package:timeago/timeago.dart' as timeago;

class DetailPageUlasanKonsultasi extends StatelessWidget {
  Data2 data;
  DetailPageUlasanKonsultasi({required this.data, super.key});
  final ReviewController state = Get.put(ReviewController());

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
                'Detail Ulasan',
                style: blackTextStyle.copyWith(
                  fontSize: 20,
                ),
              )
            ],
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                isDismissible: false,
                context: context,
                backgroundColor: Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.only(
                    topEnd: Radius.circular(25),
                    topStart: Radius.circular(25),
                  ),
                ),
                builder: (context) => ShareShowWidget(),
              );
            },
            child: SvgPicture.asset(
              'assets/icons/share-icons.svg',
            ),
          ),
          SizedBox(
            width: 25,
          )
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: lsymetric.copyWith(top: 21, bottom: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(color: borderColor),
                      color:
                          Color.fromRGBO(204, 204, 204, 0.80).withOpacity(0.4)),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/icons/alert-new.png',
                        width: 20,
                        color: Color.fromARGB(255, 146, 146, 146),
                        height: 20,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          'Ulasan tidak bisa diubah karena kamu sudah mengubah 2 kali atau lebih dari 30 hari sejak ulasan terkirim.',
                          style: blackRegulerTextStyle.copyWith(fontSize: 11),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 12, bottom: 12),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  decoration: BoxDecoration(
                      border: Border.all(color: borderColor),
                      borderRadius: BorderRadius.circular(7)),
                  child: Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          image: DecorationImage(
                              image: NetworkImage(
                                data.detail?.consultation == null
                                    ? '-'
                                    : '${Global.FILE}/${data.detail?.consultation?.doctor!.mediaUserProfilePicture?.media?.path}',
                              ),
                              fit: BoxFit.cover),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.detail?.consultation!.doctor?.fullname ?? '-',
                            style: blackHigtTextStyle.copyWith(fontSize: 13),
                          ),
                          Text(
                            data.detail?.medicalHistory?.interestCondition
                                    ?.concern?.name ??
                                '-',
                            style: blackRegulerTextStyle.copyWith(
                                fontSize: 13, color: blackColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(5, (index) {
                        return Image.asset(
                          'assets/icons/stars-new.png',
                          width: 12,
                          color:
                              data.detail!.consultationReview!.rating! > index
                                  ? const Color(0xffFFC36A)
                                  : Color.fromRGBO(155, 155, 155, 0.61),
                        );
                      }),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      timeago.format(DateTime.parse(data.createdAt.toString())),
                      style: blackRegulerTextStyle.copyWith(fontSize: 13),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 9,
                ),
                Text(
                  data.detail?.consultationReview?.review ?? '-',
                  style: blackRegulerTextStyle.copyWith(fontSize: 13),
                ),
              ],
            ),
          ),
          const dividergreen(),
          Padding(
            padding: lsymetric.copyWith(top: 26, bottom: 27),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bagaimana penilaianmu terhadap konsultasi ini?',
                  style: blackTextStyle.copyWith(fontSize: 15),
                ),
                const SizedBox(
                  height: 26,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(5, (index) {
                    return Image.asset(
                      'assets/icons/stars-new.png',
                      width: 25,
                      color: data.detail!.consultationReview!.rating! > index
                          ? const Color(0xffFFC36A)
                          : Color.fromRGBO(155, 155, 155, 0.61),
                    );
                  }),
                ),
                const SizedBox(
                  height: 29,
                ),
                Text(
                  'Penilaianmu',
                  style: blackRegulerTextStyle.copyWith(
                      fontSize: 13, color: blackColor),
                ),
                const SizedBox(
                  height: 3,
                ),
                Row(
                  children: [
                    Text(
                      state.description[
                          (data.detail!.consultationReview!.rating!.toInt() -
                              1)],
                      style: grenTextStyle.copyWith(fontSize: 15),
                    ),
                    const Spacer(),
                    Image.asset(
                      'assets/icons/stars-new.png',
                      width: 19,
                      color: const Color(0xffFFC36A),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      '${data.detail!.consultationReview!.rating}',
                      style: blackHigtTextStyle.copyWith(fontSize: 20),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DetailPageUlasanTreatment extends StatelessWidget {
  Data2 data;
  DetailPageUlasanTreatment({required this.data, super.key});
  final ReviewController state = Get.put(ReviewController());
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
                'Detail Ulasan',
                style: blackTextStyle.copyWith(
                  fontSize: 20,
                ),
              )
            ],
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                isDismissible: false,
                context: context,
                backgroundColor: Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.only(
                    topEnd: Radius.circular(25),
                    topStart: Radius.circular(25),
                  ),
                ),
                builder: (context) => ShareShowWidget(),
              );
            },
            child: SvgPicture.asset(
              'assets/icons/share-icons.svg',
            ),
          ),
          SizedBox(
            width: 25,
          )
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: lsymetric.copyWith(top: 21, bottom: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(color: borderColor),
                      color:
                          Color.fromRGBO(204, 204, 204, 0.80).withOpacity(0.4)),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/icons/alert-new.png',
                        width: 20,
                        color: Color.fromARGB(255, 146, 146, 146),
                        height: 20,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          'Ulasan tidak bisa diubah karena kamu sudah mengubah 2 kali atau lebih dari 30 hari sejak ulasan terkirim.',
                          style: blackRegulerTextStyle.copyWith(fontSize: 11),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 12, bottom: 12),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  decoration: BoxDecoration(
                      border: Border.all(color: borderColor),
                      borderRadius: BorderRadius.circular(7)),
                  child: Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            image: DecorationImage(
                                image: NetworkImage(
                                  "${Global.FILE}/${data.detail?.treatment?.mediaTreatments![0].media?.path}",
                                ),
                                fit: BoxFit.cover)),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.detail?.treatment?.name ?? '-',
                            style: blackHigtTextStyle.copyWith(fontSize: 13),
                          ),
                          Text(
                            data.detail?.treatment?.clinic?.name ?? '-',
                            style: blackRegulerTextStyle.copyWith(
                                fontSize: 13, color: blackColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(5, (index) {
                        return Image.asset(
                          'assets/icons/stars-new.png',
                          width: 12,
                          color:
                              data.detail!.treatmentReview!.avgRating!.toInt() >
                                      index
                                  ? const Color(0xffFFC36A)
                                  : Color.fromRGBO(155, 155, 155, 0.61),
                        );
                      }),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      timeago.format(DateTime.parse(data.createdAt.toString())),
                      style: blackRegulerTextStyle.copyWith(fontSize: 13),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 9,
                ),
                Text(
                  data.detail?.treatmentReview?.review ?? '-',
                  style: blackRegulerTextStyle.copyWith(fontSize: 13),
                ),
                data.detail?.treatmentReview?.replyReview == null
                    ? Container()
                    : const SizedBox(
                        height: 13,
                      ),
                data.detail?.treatmentReview?.replyReview == null
                    ? Container()
                    : dividergrey(),
                data.detail?.treatmentReview?.replyReview == null
                    ? Container()
                    : const SizedBox(
                        height: 12,
                      ),
                data.detail?.treatmentReview?.replyReview == null
                    ? Container()
                    : Row(
                        children: [
                          Container(
                            width: 3,
                            height: 47,
                            decoration: BoxDecoration(
                              color: Color(0xffECECEC),
                            ),
                          ),
                          const SizedBox(
                            width: 14,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'oleh',
                                    style: blackRegulerTextStyle.copyWith(
                                        fontSize: 13),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    ' MinHey',
                                    style: blackTextStyle.copyWith(
                                        fontSize: 13,
                                        color: const Color(0xFF6B6B6B)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                data.detail?.treatmentReview?.replyReview ??
                                    '-',
                                style: blackRegulerTextStyle.copyWith(
                                    fontSize: 13),
                              )
                            ],
                          )
                        ],
                      )
              ],
            ),
          ),
          const dividergreen(),
          Padding(
            padding: lsymetric.copyWith(top: 26, bottom: 27),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bagaimana penilaianmu terhadap treatment ini?',
                  style: blackTextStyle.copyWith(fontSize: 15),
                ),
                const SizedBox(
                  height: 26,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'Care Rating',
                        style: blackRegulerTextStyle.copyWith(
                            fontSize: 13, color: blackColor),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(5, (index) {
                          return Image.asset(
                            'assets/icons/stars-new.png',
                            width: 20,
                            color: data.detail!.treatmentReview!.careRating!
                                        .toInt() >
                                    index
                                ? const Color(0xffFFC36A)
                                : Color.fromRGBO(155, 155, 155, 0.61),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
                dividergrey(),
                const SizedBox(
                  height: 19,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'Service Rating',
                        style: blackRegulerTextStyle.copyWith(
                            fontSize: 13, color: blackColor),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(5, (index) {
                          return Image.asset(
                            'assets/icons/stars-new.png',
                            width: 20,
                            color: data.detail!.treatmentReview!.serviceRating!
                                        .toInt() >
                                    index
                                ? const Color(0xffFFC36A)
                                : Color.fromRGBO(155, 155, 155, 0.61),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
                dividergrey(),
                const SizedBox(
                  height: 19,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'Management Rating',
                        style: blackRegulerTextStyle.copyWith(
                            fontSize: 13, color: blackColor),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(5, (index) {
                          return Image.asset(
                            'assets/icons/stars-new.png',
                            width: 20,
                            color: data.detail!.treatmentReview!
                                        .managementRating!
                                        .toInt() >
                                    index
                                ? const Color(0xffFFC36A)
                                : Color.fromRGBO(155, 155, 155, 0.61),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 29,
                ),
                Text(
                  'Penilaianmu',
                  style: blackRegulerTextStyle.copyWith(
                      fontSize: 13, color: blackColor),
                ),
                const SizedBox(
                  height: 3,
                ),
                Row(
                  children: [
                    Text(
                      state.description[
                          (data.detail!.treatmentReview!.avgRating!.toInt() -
                              1)],
                      style: grenTextStyle.copyWith(fontSize: 15),
                    ),
                    const Spacer(),
                    Image.asset(
                      'assets/icons/stars-new.png',
                      width: 19,
                      color: const Color(0xffFFC36A),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      '${data.detail!.treatmentReview!.avgRating}',
                      style: blackHigtTextStyle.copyWith(fontSize: 20),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
