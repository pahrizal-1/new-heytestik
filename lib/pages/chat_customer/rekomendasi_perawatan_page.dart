// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/chat/chat_controller.dart';
import 'package:heystetik_mobileapps/core/convert_date.dart';
import 'package:heystetik_mobileapps/core/currency_format.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/resep_digital_page.dart';
import 'package:heystetik_mobileapps/pages/solution/pembayaran_produk_page.dart';
import 'package:heystetik_mobileapps/pages/solution/view_detail_skincare_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/alert_dialog.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import 'package:heystetik_mobileapps/widget/container_widget.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';

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
  bool showDaftarRekomandasi = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      showDaftarRekomandasi = false;
      state.totalProductSelected.value = 0;
      state.detailConsultation(context, widget.id!);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: showDaftarRekomandasi
          ? state.data.value.consultationRecipeDrug!.isEmpty &&
                  state.data.value.consultationRecomendationSkincare!.isEmpty
              ? null
              : Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
                  child: Wrap(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Obx(
                                () => Text(
                                  'Total ${state.totalProductSelected.value} Produk',
                                  style: blackRegulerTextStyle,
                                ),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Obx(
                                () => Text(
                                  CurrencyFormat.convertToIdr(
                                    state.totalAmount.value,
                                    0,
                                  ),
                                  style:
                                      blackHigtTextStyle.copyWith(fontSize: 20),
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 65,
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 50,
                              child: TextButton(
                                onPressed: () {
                                  if (state.listObatSelected.isEmpty &&
                                          state.listSkincareSelected.isEmpty ||
                                      state.totalAmount.value <= 0) {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertWidget(
                                        subtitle:
                                            'Harap pilih produk terlebih dahulu',
                                      ),
                                    );
                                    return;
                                  }
                                  var list = [
                                    ...state.listObatSelected.value,
                                    ...state.listSkincareSelected.value
                                  ];

                                  Get.to(() => PembayaranProduk(
                                        pesan: list,
                                        isCart: false,
                                      ));
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: greenColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/icons/check_button.png',
                                      width: 17,
                                      height: 19,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Lanjut',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: whiteColor,
                                        fontWeight: bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )
          : null,
      body: Obx(
        () => LoadingWidget(
          isLoading: state.isLoading.value,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 16,
                ),
                Obx(
                  () => Padding(
                    padding: EdgeInsets.only(
                      top: state.data.value.consultationRecipeDrug!.isEmpty &&
                              state.data.value
                                  .consultationRecomendationSkincare!.isEmpty &&
                              state.data.value
                                  .consultationRecomendationTreatment!.isEmpty
                          ? 70
                          : 0,
                    ),
                    child: Column(
                      children: [
                        state.data.value.consultationRecipeDrug!.isEmpty &&
                                state
                                    .data
                                    .value
                                    .consultationRecomendationSkincare!
                                    .isEmpty &&
                                state.data.value
                                    .consultationRecomendationTreatment!.isEmpty
                            ? Column(
                                children: [
                                  Container(
                                    height: 239,
                                    width: 259,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/rekomendasi1.png'),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'Yuk, chat dengan Dokter sekarang untuk mendapatkan rekomendasi perawatan terbaik untukmu :)',
                                    style:
                                        blackTextStyle.copyWith(fontSize: 15),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(
                                    height: 39,
                                  ),
                                  Padding(
                                    padding: lsymetric,
                                    child: ButtonGreenWidget(
                                      title: 'Chat Dokter',
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                ],
                              )
                            : showDaftarRekomandasi
                                ? daftarRekomendasi()
                                : resepDigital(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container resepDigital() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 19, horizontal: 15),
      margin: EdgeInsets.only(bottom: 10, left: 25, right: 25),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          border: Border.all(
            color: borderColor,
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                'assets/icons/solutions.png',
                width: 20,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                'Resep Digital',
                style: blackTextStyle.copyWith(fontWeight: bold),
              ),
              Spacer(),
              Text(
                ConvertDate.defaultDate(state.data.value.createdAt ?? ''),
                style: blackRegulerTextStyle.copyWith(fontSize: 12),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          if (state.data.value.endDate != null)
            Container(
              padding: EdgeInsets.only(
                left: 5,
                top: 3,
                bottom: 3,
              ),
              color: Color(0xffFFC1C1),
              child: Row(
                children: [
                  Image.asset(
                    'assets/icons/-.png',
                    width: 20,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Resep digital ini sudah tidak berlaku.',
                    style: blackTextStyle.copyWith(fontSize: 10),
                  ),
                ],
              ),
            ),
          if (state.data.value.endDate != null)
            SizedBox(
              height: 14,
            ),
          if (state.data.value.consultationRecipeDrug!.isNotEmpty)
            Text(
              'Nama Obat',
              style: blackTextStyle.copyWith(fontSize: 10),
            ),
          if (state.data.value.consultationRecipeDrug!.isNotEmpty)
            SizedBox(
              height: 5,
            ),
          if (state.data.value.consultationRecipeDrug!.isNotEmpty)
            ...state.data.value.consultationRecipeDrug!.map((e) {
              return Text(
                e.product?.name ?? '-',
                style: blackTextStyle,
              );
            }),
          if (state.data.value.consultationRecipeDrug!.isNotEmpty)
            SizedBox(
              height: 9,
            ),
          if (state.data.value.consultationRecomendationSkincare!.isNotEmpty)
            Text(
              'Nama Skincare',
              style: blackTextStyle.copyWith(fontSize: 10),
            ),
          if (state.data.value.consultationRecomendationSkincare!.isNotEmpty)
            SizedBox(
              height: 9,
            ),
          if (state.data.value.consultationRecomendationSkincare!.isNotEmpty)
            ...state.data.value.consultationRecomendationSkincare!.map((e) {
              return Text(
                e.product?.name ?? '-',
                style: blackTextStyle,
              );
            }),
          if (state.data.value.consultationRecomendationSkincare!.isNotEmpty)
            SizedBox(
              height: 9,
            ),
          if (state.data.value.consultationRecomendationTreatment!.isNotEmpty)
            Text(
              'Nama Treatment',
              style: blackTextStyle.copyWith(fontSize: 10),
            ),
          if (state.data.value.consultationRecomendationTreatment!.isNotEmpty)
            SizedBox(
              height: 9,
            ),
          if (state.data.value.consultationRecomendationTreatment!.isNotEmpty)
            ...state.data.value.consultationRecomendationTreatment!.map((e) {
              return Text(
                e.name ?? '-',
                style: blackTextStyle,
              );
            }),
          SizedBox(
            height: 20,
          ),
          ButtonGreenWidget(
            title: 'Selengkapnya',
            onPressed: () {
              showDaftarRekomandasi = !showDaftarRekomandasi;
              setState(() {});
            },
          )
        ],
      ),
    );
  }

  Widget daftarRekomendasi() {
    return Column(
      children: [
        Container(
          height: 195,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/rekomendasi2.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25, top: 20, bottom: 20),
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
        Container(
          margin: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: fromCssColor('#FF9F314D'),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 13, right: 13),
            child: Row(
              children: [
                Container(
                  width: 46,
                  height: 38,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/icons/solutions.png'),
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
          height: 5,
        ),
        if (state.data.value.consultationRecipeDrug!.isNotEmpty)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Resep obat',
                  style: TextStyle(
                    fontWeight: bold,
                    fontSize: 18,
                    fontFamily: 'ProximaNova',
                    color: Colors.black,
                    letterSpacing: 1,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(ResepDigitalPage());
                    debugPrint("UNDUH RESEP");
                  },
                  child: Icon(
                    Icons.file_download_rounded,
                  ),
                )
              ],
            ),
          ),
        if (state.data.value.consultationRecipeDrug!.isNotEmpty)
          SizedBox(
            height: 20,
          ),
        if (state.data.value.consultationRecipeDrug!.isNotEmpty)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    state.onChecklistObat(state.listObat.value.length, true);
                    setState(() {});
                  },
                  child: Obx(
                    () => Container(
                      width: 23,
                      padding: const EdgeInsets.all(4),
                      height: 23,
                      decoration: BoxDecoration(
                        color:
                            state.isAllObatSelected.value ? greenColor : null,
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(
                          color: state.isAllObatSelected.value
                              ? greenColor
                              : greyColor,
                        ),
                      ),
                      child: state.isAllObatSelected.value
                          ? Image.asset('assets/icons/chek_new.png')
                          : null,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  transform: Matrix4.translationValues(0, -3, 0),
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
        if (state.data.value.consultationRecipeDrug!.isNotEmpty)
          const SizedBox(
            height: 20,
          ),
        if (state.data.value.consultationRecipeDrug!.isNotEmpty)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.data.value.consultationRecipeDrug?.length,
              itemBuilder: (BuildContext context, index) {
                return ContainerProdukObat(
                  index: index,
                  data: state.data.value.consultationRecipeDrug![index],
                );
              },
            ),
          ),
        if (state.data.value.consultationRecipeDrug!.isNotEmpty) dividergreen(),
        SizedBox(
          height: 15,
        ),
        if (state.data.value.consultationRecomendationSkincare!.isNotEmpty)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Row(
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
        if (state.data.value.consultationRecomendationSkincare!.isNotEmpty)
          const SizedBox(
            height: 20,
          ),
        if (state.data.value.consultationRecomendationSkincare!.isNotEmpty)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    state.onChecklistSkincare(
                        state.listSkincare.value.length, true);
                    setState(() {});
                  },
                  child: Obx(
                    () => Container(
                      width: 23,
                      padding: const EdgeInsets.all(4),
                      height: 23,
                      decoration: BoxDecoration(
                        color: state.isAllSkincareSelected.value
                            ? greenColor
                            : null,
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(
                          color: state.isAllSkincareSelected.value
                              ? greenColor
                              : greyColor,
                        ),
                      ),
                      child: state.isAllSkincareSelected.value
                          ? Image.asset('assets/icons/chek_new.png')
                          : null,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  transform: Matrix4.translationValues(0, -3, 0),
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
        if (state.data.value.consultationRecomendationSkincare!.isNotEmpty)
          SizedBox(
            height: 15,
          ),
        if (state.data.value.consultationRecomendationSkincare!.isNotEmpty)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount:
                  state.data.value.consultationRecomendationSkincare?.length,
              itemBuilder: (BuildContext context, index) {
                return InkWell(
                  onTap: () {
                    Get.to(
                      () => DetailSkinCarePage(
                        productId: state
                            .data
                            .value
                            .consultationRecomendationSkincare![index]
                            .productId!,
                      ),
                    );
                  },
                  child: ContainerProdukSkicare(
                    index: index,
                    data: state
                        .data.value.consultationRecomendationSkincare![index],
                  ),
                );
              },
            ),
          ),
        if (state.data.value.consultationRecomendationSkincare!.isNotEmpty)
          dividergreen(),
        SizedBox(
          height: 15,
        ),
        if (state.data.value.consultationRecomendationTreatment!.isNotEmpty)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
        if (state.data.value.consultationRecomendationTreatment!.isNotEmpty)
          SizedBox(
            height: 15,
          ),
        if (state.data.value.consultationRecomendationTreatment!.isNotEmpty)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount:
                  state.data.value.consultationRecomendationTreatment?.length,
              itemBuilder: (BuildContext context, index) {
                return ContainerTreatment(
                  data: state
                      .data.value.consultationRecomendationTreatment![index],
                );
              },
            ),
          ),
        if (state.data.value.consultationRecomendationTreatment!.isNotEmpty)
          SizedBox(
            height: 15,
          ),
      ],
    );
  }
}

// GAK KEPAKE
// class ResepObatDoctor extends StatelessWidget {
//   const ResepObatDoctor({
//     super.key,
//     required this.state,
//   });

//   final DoctorConsultationController state;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 10),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
//             height: 43,
//             width: 270,
//             decoration: BoxDecoration(
//                 color: greenColor,
//                 borderRadius: const BorderRadius.only(
//                     topLeft: Radius.circular(10),
//                     topRight: Radius.circular(10))),
//             child: Text(
//               'Rekomendasi Dokter',
//               style: whiteTextStyle.copyWith(fontSize: 15),
//             ),
//           ),
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
//             // height: 299,
//             width: 270,
//             color: whiteColor,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 const Text(
//                   'Obat',
//                   style: TextStyle(fontSize: 15),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(top: 10),
//                   child: ListView.builder(
//                       shrinkWrap: true,
//                       itemCount:
//                           state.data.value.consultationRecipeDrug?.length,
//                       itemBuilder: (context, index) {
//                         return Column(
//                           children: [
//                             Row(
//                               // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Expanded(
//                                   child: Text(
//                                     state
//                                             .data
//                                             .value
//                                             .consultationRecipeDrug?[index]
//                                             .product
//                                             ?.name ??
//                                         '-',
//                                     style: grenTextStyle.copyWith(fontSize: 12),
//                                   ),
//                                 ),
//                                 Expanded(
//                                   child: Text(
//                                     state
//                                             .data
//                                             .value
//                                             .consultationRecipeDrug?[index]
//                                             .product
//                                             ?.drugDetail
//                                             ?.specificationDose ??
//                                         '-',
//                                     maxLines: 1,
//                                     overflow: TextOverflow.ellipsis,
//                                     style: greyTextStyle,
//                                   ),
//                                 )
//                               ],
//                             ),
//                             SizedBox(
//                               height: 5,
//                             ),
//                           ],
//                         );
//                       }),
//                 ),
//                 Divider(
//                   thickness: 2,
//                 ),
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 const Text(
//                   'Skincare',
//                   style: TextStyle(fontSize: 15),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(top: 10),
//                   child: ListView.builder(
//                       shrinkWrap: true,
//                       itemCount: state
//                           .data.value.consultationRecomendationSkincare?.length,
//                       itemBuilder: (context, index) {
//                         return Column(
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   state
//                                           .data
//                                           .value
//                                           .consultationRecomendationSkincare![
//                                               index]
//                                           .product
//                                           ?.name ??
//                                       '-',
//                                   style: grenTextStyle.copyWith(fontSize: 12),
//                                 ),
//                                 Text(
//                                   state
//                                           .data
//                                           .value
//                                           .consultationRecomendationSkincare?[
//                                               index]
//                                           .product
//                                           ?.drugDetail
//                                           ?.specificationDose ??
//                                       '-',
//                                   style: greyTextStyle,
//                                 )
//                               ],
//                             ),
//                             SizedBox(
//                               height: 5,
//                             ),
//                           ],
//                         );
//                       }),
//                 ),
//                 Divider(
//                   thickness: 2,
//                 ),
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 const Text(
//                   'Treatment',
//                   style: TextStyle(fontSize: 15),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(top: 10),
//                   child: ListView.builder(
//                       shrinkWrap: true,
//                       itemCount: state.data.value
//                           .consultationRecomendationTreatment?.length,
//                       itemBuilder: (context, index) {
//                         return Column(
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   state
//                                           .data
//                                           .value
//                                           .consultationRecomendationTreatment?[
//                                               index]
//                                           .name ??
//                                       '-',
//                                   style: grenTextStyle.copyWith(fontSize: 12),
//                                 ),
//                               ],
//                             ),
//                             SizedBox(
//                               height: 5,
//                             ),
//                           ],
//                         );
//                       }),
//                 ),
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 const ButtonGreenWidget(title: 'Lihat Detail')
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
