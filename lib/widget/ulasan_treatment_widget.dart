// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/ulasan_treatment_controller.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import 'package:heystetik_mobileapps/widget/show_image_fullscreen_ulasan.dart';
import '../../models/treatment_review_model.dart';
import 'package:timeago/timeago.dart' as timeago;

class UlasanTreatmentWidget extends StatefulWidget {
  Data2 element;
  bool isEnd;
  UlasanTreatmentWidget(
      {super.key, required this.element, required this.isEnd});

  @override
  State<UlasanTreatmentWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<UlasanTreatmentWidget> {
  final UlasanTreatmentController stateUlasan =
      Get.put(UlasanTreatmentController());
  bool isVisibility = false;
  bool? help;
  Map<String, int> helpReview = {};
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: widget.element.user?.mediaUserProfilePicture != null
                      ? NetworkImage(
                          '${Global.FILE}/${widget.element.user?.mediaUserProfilePicture?.media?.path}',
                        ) as ImageProvider
                      : AssetImage(
                          'assets/images/profiledummy.png',
                        ),
                ),
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.element.user?.fullname ?? '-',
                  style: blackHigtTextStyle.copyWith(fontSize: 15),
                ),
                Text(
                  widget.element.transactionTreatmentItem?.treatment?.name ??
                      '-',
                  style: blackHigtTextStyle.copyWith(
                      fontSize: 13, fontWeight: regular),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 13,
        ),
        Row(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(5, (index) {
                return Image.asset(
                  'assets/icons/stars-new.png',
                  width: 12,
                  color: widget.element.avgRating! > index
                      ? const Color(0xffFFC36A)
                      : Color.fromRGBO(155, 155, 155, 0.61),
                );
              }),
            ),
            const SizedBox(
              width: 13,
            ),
            Text(
              timeago
                  .format(DateTime.parse(widget.element.createdAt.toString())),
              style: blackHigtTextStyle.copyWith(
                  fontSize: 12, fontWeight: regular),
            )
          ],
        ),
        const SizedBox(
          height: 13,
        ),
        Text(
          widget.element.review ?? '-',
          style: blackRegulerTextStyle.copyWith(
            fontSize: 13,
          ),
        ),
        const SizedBox(
          height: 13,
        ),
        Wrap(
          spacing: 4,
          runSpacing: 4,
          children:
              widget.element.mediaTreatmentReviews!.asMap().entries.map((e) {
            return InkWell(
              onTap: () {
                Get.to(() => ShowImageFullScreenUlasan(
                      listImagesModel: widget.element.mediaTreatmentReviews!,
                      current: e.key,
                    ));
              },
              child: Container(
                  height: 72,
                  width: 82,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          '${Global.FILE}/${e.value.media!.path.toString()}'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(7),
                  )),
            );
          }).toList(),
        ),
        const SizedBox(
          height: 22,
        ),
        Row(
          children: [
            InkWell(
              onTap: () {
                if (help ?? widget.element.helped!) {
                  stateUlasan.unHelped(context, widget.element.id!);
                  setState(() {
                    help = false;
                    helpReview["${widget.element.id}"] =
                        (helpReview["${widget.element.id}"] ?? 0) - 1;
                  });
                } else {
                  stateUlasan.helped(context, widget.element.id!);
                  setState(() {
                    help = true;
                    helpReview["${widget.element.id}"] =
                        (helpReview["${widget.element.id}"] ?? 0) + 1;
                  });
                }
              },
              child: Row(
                children: [
                  Image.asset(
                    'assets/icons/like.png',
                    width: 15,
                    color:
                        help ?? widget.element.helped! ? greenColor : greyColor,
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  if (help ?? widget.element.helped!)
                    Text(
                      '${widget.element.cCount!.treatmentReviewHelpfuls! + (helpReview["${widget.element.id}"] ?? 0)} orang terbantu',
                      style: grenTextStyle.copyWith(
                        fontSize: 13,
                        fontWeight: regular,
                        color: help ?? widget.element.helped!
                            ? greenColor
                            : greyColor,
                      ),
                    )
                  else
                    Text(
                      'Membantu',
                      style: grenTextStyle.copyWith(
                        fontSize: 13,
                        fontWeight: regular,
                        color: greyColor,
                      ),
                    )
                ],
              ),
            ),
            const Spacer(),
            widget.element.replyReview == null
                ? Container()
                : InkWell(
                    onTap: () {
                      setState(() {
                        isVisibility = !isVisibility;
                      });
                    },
                    child: Row(
                      children: [
                        isVisibility
                            ? Text(
                                'Tutup Balasan',
                                style: blackRegulerTextStyle.copyWith(
                                    fontSize: 13),
                              )
                            : Text(
                                'Lihat Balasan',
                                style: blackRegulerTextStyle.copyWith(
                                    fontSize: 13),
                              ),
                        const SizedBox(
                          width: 4,
                        ),
                        const Icon(
                          Icons.keyboard_arrow_down,
                          color: Color(0xff6B6B6B),
                        )
                      ],
                    ),
                  ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Visibility(
          visible: isVisibility,
          child: Row(
            children: [
              Container(
                height: 60,
                width: 2,
                decoration: BoxDecoration(color: greenColor),
              ),
              const SizedBox(
                width: 7,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Penjual ',
                          style: blackHigtTextStyle.copyWith(
                              fontSize: 13, color: subTitleColor),
                        ),
                        Text(
                          timeago.format(DateTime.parse(
                              widget.element.createdAt.toString())),
                          style: blackRegulerTextStyle.copyWith(
                              color: subTitleColor, fontSize: 13),
                        )
                      ],
                    ),
                    Text(
                      widget.element.replyReview ?? '',
                      style: subTitleTextStyle,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        if (!widget.isEnd) const dividergreen(),
        if (!widget.isEnd)
          const SizedBox(
            height: 20,
          ),
      ],
    );
  }
}
