// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/convert_date.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/tulis_ulasan_skincare_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

import '../models/customer/waiting_review_model.dart';

class UlasanKonsultasi extends StatelessWidget {
  final String nameProduk;
  final String tanggal;
  final VoidCallback? onPressed;
  final String img;
  final String namabrand;
  // final String titleButton;
  const UlasanKonsultasi({
    super.key,
    required this.nameProduk,
    required this.tanggal,
    required this.namabrand,
    // required this.titleButton,
    required this.img,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(7),
          border: Border.all(color: borderColor)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                tanggal,
                style: blackRegulerTextStyle.copyWith(
                    fontSize: 12, color: blackColor),
              ),
              const Spacer(),
              Image.asset(
                'assets/icons/check-green.png',
                width: 13,
                height: 13,
              )
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              img == '-' || img == ''
                  ? Container()
                  : Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          image: DecorationImage(
                              image: NetworkImage(img), fit: BoxFit.cover)),
                    ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nameProduk,
                    style: blackHigtTextStyle.copyWith(fontSize: 13),
                  ),
                  Text(
                    namabrand,
                    style: blackRegulerTextStyle.copyWith(
                        fontSize: 13, color: blackColor),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          InkWell(
            onTap: onPressed,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 5),
              decoration: BoxDecoration(
                color: whiteColor,
                border: Border.all(color: greenColor),
                borderRadius: BorderRadius.circular(7),
              ),
              child: Center(
                child: Text(
                  'Tulis Ulasan',
                  style: grenTextStyle.copyWith(fontSize: 13),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class UlasanTreatment extends StatelessWidget {
  List<MediaTreatments>? item;
  final String nameProduk;
  final String tanggal;
  final VoidCallback? onPressed;
  // final String img;
  final String klinik;
  // final String titleButton;
  UlasanTreatment({
    super.key,
    this.item,
    required this.nameProduk,
    required this.tanggal,
    required this.klinik,
    // required this.titleButton,
    // required this.img,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(7),
          border: Border.all(color: borderColor)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                tanggal,
                style: blackRegulerTextStyle.copyWith(
                    fontSize: 12, color: blackColor),
              ),
              const Spacer(),
              Image.asset(
                'assets/icons/check-green.png',
                width: 13,
                height: 13,
              )
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          // for (int i = 0; i < item!.length; i++)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    image: DecorationImage(
                        image: NetworkImage(
                          '${Global.FILE}/${item?[0].media?.path}',
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
                    nameProduk,
                    style: blackHigtTextStyle.copyWith(fontSize: 13),
                  ),
                  Text(
                    klinik,
                    style: blackRegulerTextStyle.copyWith(
                        fontSize: 13, color: blackColor),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          InkWell(
            onTap: onPressed,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 5),
              decoration: BoxDecoration(
                color: whiteColor,
                border: Border.all(color: greenColor),
                borderRadius: BorderRadius.circular(7),
              ),
              child: Center(
                child: Text(
                  'Tulis Ulasan',
                  style: grenTextStyle.copyWith(fontSize: 13),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class UlasanProduk extends StatelessWidget {
  Detail? data;
  UlasanProduk({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(7),
          border: Border.all(color: borderColor)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                ConvertDate.defaultDate(data?.createdAt ?? '-'),
                style: blackRegulerTextStyle.copyWith(
                    fontSize: 12, color: blackColor),
              ),
              const Spacer(),
              Image.asset(
                'assets/icons/check-green.png',
                width: 13,
                height: 13,
              )
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    image: DecorationImage(
                        image: NetworkImage(
                          '${Global.FILE}/${data!.product!.mediaProducts![0].media?.path}',
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
                    data!.product!.name ?? '-',
                    style: blackHigtTextStyle.copyWith(fontSize: 13),
                  ),
                  Text(
                    data!.product!.type ?? '-',
                    style: blackRegulerTextStyle.copyWith(
                        fontSize: 13, color: blackColor),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          InkWell(
            onTap: () {
              Get.to(TulisUlasanSkincarePage());
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 5),
              decoration: BoxDecoration(
                color: whiteColor,
                border: Border.all(color: greenColor),
                borderRadius: BorderRadius.circular(7),
              ),
              child: Center(
                child: Text(
                  'Tulis Ulasan',
                  style: grenTextStyle.copyWith(fontSize: 13),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
