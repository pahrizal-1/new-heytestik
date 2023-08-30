import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/chat/chat_controller.dart';
import 'package:heystetik_mobileapps/core/convert_date.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heystetik_mobileapps/widget/container_widget.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';

import '../../controller/doctor/consultation/consultation_controller.dart';
import '../../widget/button_widget.dart';

class RekomendasiPerawatan1Page extends StatefulWidget {
  final int? id;
  const RekomendasiPerawatan1Page({required this.id, super.key});

  @override
  State<RekomendasiPerawatan1Page> createState() =>
      _RekomendasiPerawatan1PageState();
}

class _RekomendasiPerawatan1PageState extends State<RekomendasiPerawatan1Page> {
  final CustomerChatController state = Get.put(CustomerChatController());
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      state.detailConsultation(context, widget.id!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => LoadingWidget(
          isLoading: state.isLoading.value,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 195,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/rekomendasi2.png'),
                        fit: BoxFit.fill),
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 25, top: 20, bottom: 20),
                        child: Container(
                          width: 180,
                          child: Column(
                            children: [
                              RichText(
                                text: const TextSpan(
                                  text:
                                      'Hai! Rekomendasi perawatan buat kamu sudah selesai :)',
                                  style: TextStyle(
                                    fontFamily: 'ProximaNova',
                                    color: Colors.white,
                                    height: 1.2,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 9,
                              ),
                              RichText(
                                text: const TextSpan(
                                  text:
                                      'Kamu bisa menebus skincare & obat, serta melakukan perawatan yang telah dokter rekomendasikan sekarang!',
                                  style: TextStyle(
                                    fontFamily: 'ProximaNova',
                                    color: Colors.white,
                                    height: 1.2,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          height: 160,
                          width: 150,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/dokter2.png'),
                                fit: BoxFit.fill),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 25, right: 25, bottom: 15),
                  child: Column(
                    children: [
                      Container(
                        height: 70,
                        decoration: BoxDecoration(
                          color: fromCssColor('#FF9F314D'),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 13, right: 13),
                          child: Row(
                            children: [
                              Container(
                                width: 46,
                                height: 38,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/icons/solutions.png'),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: RichText(
                                  text: TextSpan(
                                    text:
                                        'Kamu bisa tebus rekomendasi obat sebanyak 2 kali lagi.  Masa aktif rekomendasi dokter berlaku hingga ${ConvertDate.defaultDate(state.data.value.endDate ?? '')}',
                                    style: TextStyle(
                                      fontFamily: 'ProximaNova',
                                      color: fromCssColor('#323232'),
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Obx(
                        () => state.data.value.consultationRecipeDrug == null
                            ? Container()
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Rekomendasi obat',
                                    style: TextStyle(
                                      fontWeight: bold,
                                      fontSize: 18,
                                      fontFamily: 'ProximaNova',
                                      color: Colors.black,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                  Text(
                                    ConvertDate.defaultDate(
                                        state.data.value.createdAt ?? ''),
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'ProximaNova',
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                      ),
                      SizedBox(
                        height: state.data.value.consultationRecipeDrug == null
                            ? 0
                            : 20,
                      ),
                      Obx(
                        () => state.data.value.consultationRecipeDrug == null
                            ? Container()
                            : Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/cekbox.svg',
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    transform:
                                        Matrix4.translationValues(0, -3, 0),
                                    child: const Text(
                                      'Pilih semua',
                                      style: TextStyle(
                                          fontFamily: 'ProximaNova',
                                          fontSize: 15,
                                          letterSpacing: 0.5,
                                          color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Obx(
                        () => state.data.value.consultationRecipeDrug == null
                            ? Container()
                            : ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: state
                                    .data.value.consultationRecipeDrug?.length,
                                itemBuilder: (BuildContext context, index) {
                                  return ContainerProdukPenting(
                                    data: state.data.value
                                        .consultationRecipeDrug![index],
                                  );
                                },
                              ),
                      ),
                      Obx(
                        () => SizedBox(
                          height:
                              state.data.value.consultationRecipeDrug == null
                                  ? 0
                                  : 48,
                        ),
                      ),
                      Obx(
                        () => state.data.value
                                .consultationRecomendationSkincare!.isEmpty
                            ? Container()
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Rekomendasi Skincare',
                                    style: TextStyle(
                                      fontWeight: bold,
                                      fontSize: 18,
                                      fontFamily: 'ProximaNova',
                                      color: Colors.black,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                ],
                              ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Obx(
                        () => state.data.value
                                .consultationRecomendationSkincare!.isEmpty
                            ? Container()
                            : Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/cekbox.svg',
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    transform:
                                        Matrix4.translationValues(0, -3, 0),
                                    child: const Text(
                                      'Pilih semua',
                                      style: TextStyle(
                                          fontFamily: 'ProximaNova',
                                          fontSize: 15,
                                          letterSpacing: 0.5,
                                          color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                      ),
                      Obx(
                        () => SizedBox(
                          height: state.data.value
                                  .consultationRecomendationSkincare!.isEmpty
                              ? 0
                              : 15,
                        ),
                      ),
                      Obx(
                        () => state.data.value
                                .consultationRecomendationSkincare!.isEmpty
                            ? Container()
                            : ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: state.data.value
                                    .consultationRecomendationSkincare?.length,
                                itemBuilder: (BuildContext context, index) {
                                  return ContainerProduk(
                                    data: state.data.value
                                            .consultationRecomendationSkincare![
                                        index],
                                  );
                                },
                              ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Obx(
                        () => state.data.value
                                .consultationRecomendationTreatment!.isEmpty
                            ? Container()
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Rekomendasi Treatment',
                                    style: TextStyle(
                                      fontWeight: bold,
                                      fontSize: 18,
                                      fontFamily: 'ProximaNova',
                                      color: Colors.black,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                ],
                              ),
                      ),
                      Obx(
                        () => SizedBox(
                          height: state.data.value
                                  .consultationRecomendationTreatment!.isEmpty
                              ? 0
                              : 20,
                        ),
                      ),
                      Obx(
                        () => state.data.value
                                .consultationRecomendationTreatment!.isEmpty
                            ? Container()
                            : Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/cekbox.svg',
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    transform:
                                        Matrix4.translationValues(0, -3, 0),
                                    child: const Text(
                                      'Pilih semua',
                                      style: TextStyle(
                                          fontFamily: 'ProximaNova',
                                          fontSize: 15,
                                          letterSpacing: 0.5,
                                          color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                      ),
                      Obx(
                        () => SizedBox(
                          height: state.data.value
                                  .consultationRecomendationTreatment!.isEmpty
                              ? 0
                              : 15,
                        ),
                      ),
                      Obx(
                        () => state.data.value
                                .consultationRecomendationTreatment!.isEmpty
                            ? Container()
                            : ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: state.data.value
                                    .consultationRecomendationTreatment?.length,
                                itemBuilder: (BuildContext context, index) {
                                  return ContainerTreatment(
                                    data: state.data.value
                                            .consultationRecomendationTreatment![
                                        index],
                                  );
                                },
                              ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class ResepObatDoctor extends StatelessWidget {
  const ResepObatDoctor({
    super.key,
    required this.state,
  });

  final DoctorConsultationController state;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            height: 43,
            width: 270,
            decoration: BoxDecoration(
                color: greenColor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            child: Text(
              'Rekomendasi Dokter',
              style: whiteTextStyle.copyWith(fontSize: 15),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
            // height: 299,
            width: 270,
            color: whiteColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'Obat',
                  style: TextStyle(fontSize: 15),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount:
                          state.data.value.consultationRecipeDrug?.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    state
                                            .data
                                            .value
                                            .consultationRecipeDrug?[index]
                                            .product
                                            ?.name ??
                                        '-',
                                    style: grenTextStyle.copyWith(fontSize: 12),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    state
                                            .data
                                            .value
                                            .consultationRecipeDrug?[index]
                                            .product
                                            ?.drugDetail
                                            ?.specificationDose ??
                                        '-',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: greyTextStyle,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        );
                      }),
                ),
                Divider(
                  thickness: 2,
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'Skincare',
                  style: TextStyle(fontSize: 15),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: state
                          .data.value.consultationRecomendationSkincare?.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  state
                                          .data
                                          .value
                                          .consultationRecomendationSkincare![
                                              index]
                                          .product
                                          ?.name ??
                                      '-',
                                  style: grenTextStyle.copyWith(fontSize: 12),
                                ),
                                Text(
                                  state
                                          .data
                                          .value
                                          .consultationRecomendationSkincare?[
                                              index]
                                          .product
                                          ?.drugDetail
                                          ?.specificationDose ??
                                      '-',
                                  style: greyTextStyle,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        );
                      }),
                ),
                Divider(
                  thickness: 2,
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'Treatment',
                  style: TextStyle(fontSize: 15),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.data.value
                          .consultationRecomendationTreatment?.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  state
                                          .data
                                          .value
                                          .consultationRecomendationTreatment?[
                                              index]
                                          .name ??
                                      '-',
                                  style: grenTextStyle.copyWith(fontSize: 12),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        );
                      }),
                ),
                const SizedBox(
                  height: 5,
                ),
                const ButtonGreenWidget(title: 'Lihat Detail')
              ],
            ),
          ),
        ],
      ),
    );
  }
}
