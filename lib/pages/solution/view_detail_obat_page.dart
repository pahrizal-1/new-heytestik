import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/medicine_controller.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/skincare_controller.dart';
import 'package:heystetik_mobileapps/core/currency_format.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/models/customer/intiate_chat_model.dart';
import 'package:heystetik_mobileapps/pages/solution/pembayaran_produk_page.dart';
import 'package:heystetik_mobileapps/pages/solution/ulasan_produk_page.dart';
import 'package:heystetik_mobileapps/widget/Text_widget.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../controller/customer/solution/wishlist_controller.dart';
import '../../theme/theme.dart';
import 'package:heystetik_mobileapps/models/medicine.dart' as Medicine;
import '../../widget/pencarian_search_widget.dart';
import '../../widget/share_solusion_widget_page.dart';
import '../../widget/snackbar_widget.dart';
import '../setings&akun/akun_home_page.dart';
import 'keranjang_page.dart';

class DetailObatPage extends StatefulWidget {
  const DetailObatPage({
    super.key,
    required this.medicine,
  });

  final Medicine.Data2 medicine;

  @override
  State<DetailObatPage> createState() => _DetailObatPageState();
}

class _DetailObatPageState extends State<DetailObatPage> {
  MedicineController medicineController = Get.put(MedicineController());
  final SkincareController state = Get.put(SkincareController());
  final WishlistController wishlist = Get.put(WishlistController());
  bool isVisibelity = false;
  bool? help;
  bool? isWishlist;
  Map<String, int> helpReview = {};
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      medicineController.getOverviewProduct(context, widget.medicine.id!);
      medicineController.getReviewProduct(context, 1, 3, widget.medicine.id!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XffFFFFFF),
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
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
              Expanded(
                child: Text(
                  "Detail Obat",
                  style: blackTextStyle.copyWith(
                      fontSize: 20, overflow: TextOverflow.ellipsis),
                ),
              )
            ],
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PencarianPageWidget(),
                ),
              );
            },
            child: SvgPicture.asset(
              'assets/icons/search.svg',
            ),
          ),
          const SizedBox(
            width: 14,
          ),
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
                builder: (context) => const ShareShowWidget(),
              );
            },
            child: SvgPicture.asset(
              'assets/icons/share-icons.svg',
            ),
          ),
          const SizedBox(
            width: 14,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const KeranjangPage()));
            },
            child: SvgPicture.asset(
              'assets/icons/trello-icons.svg',
            ),
          ),
          const SizedBox(
            width: 14,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AkunHomePage()));
            },
            child: SvgPicture.asset(
              'assets/icons/humberger-icons.svg',
            ),
          ),
          const SizedBox(
            width: 26,
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            height: 375,
            width: 390,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  '${Global.FILE}/${widget.medicine.mediaProducts?[0].media?.path}',
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 12, left: 24, right: 24, bottom: 17),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      CurrencyFormat.convertToIdr(widget.medicine.price, 2),
                      style: blackHigtTextStyle.copyWith(fontSize: 20),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () async {
                        if ((isWishlist ??
                                state.skincareDetail.value.wishlist) ==
                            true) {
                          isWishlist = false;
                          await wishlist.deleteWistlist(
                              context, widget.medicine.id ?? 0);
                          setState(() {});
                        } else {
                          isWishlist = true;
                          await wishlist.addWishlist(
                              context, widget.medicine.id ?? 0);
                          setState(() {});
                        }
                      },
                      child:
                          (isWishlist ?? state.skincareDetail.value.wishlist) ==
                                  true
                              ? Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                )
                              : Icon(Icons.favorite_outline),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  widget.medicine.name ?? '-',
                  style: blackRegulerTextStyle.copyWith(color: blackColor),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Text(
                      'Terjual 3.002',
                      style: blackRegulerTextStyle.copyWith(color: blackColor),
                    ),
                    const SizedBox(
                      width: 9,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                      decoration: BoxDecoration(
                        border: Border.all(color: borderColor),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/stars.svg',
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            '${widget.medicine.rating}',
                            style: blackHigtTextStyle.copyWith(fontSize: 13),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                // Stack(
                //   children: [
                //     Image.asset(
                //       'assets/icons/coupon 2.png',
                //     ),
                //     Padding(
                //       padding: const EdgeInsets.only(
                //         top: 20,
                //         left: 20,
                //       ),
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.start,
                //         children: [
                //           SvgPicture.asset(
                //             'assets/icons/dicon1.svg',
                //           ),
                //           const SizedBox(
                //             width: 15,
                //           ),
                //           Column(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: [
                //               Text(
                //                 'Ada Promo Spesial',
                //                 style: blackHigtTextStyle.copyWith(fontSize: 15),
                //               ),
                //               Text(
                //                 'Masih ada 6 kupon promo buat kamu!',
                //                 style: subTitleTextStyle,
                //               ),
                //             ],
                //           ),
                //           const SizedBox(
                //             width: 20,
                //           ),
                //           SvgPicture.asset(
                //             'assets/icons/arrow-left.svg',
                //           ),
                //         ],
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
          const dividergreen(),
          Padding(
            padding: const EdgeInsets.only(
              top: 12,
              left: 24,
              right: 24,
              bottom: 17,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Detail Produk',
                  style: blackHigtTextStyle.copyWith(fontSize: 18),
                ),
                const SizedBox(
                  height: 12,
                ),
                TitleDetail(
                  ontap: () {},
                  title1: 'Concern',
                  title2: widget.medicine.display ?? '-',
                  textColor: greenColor,
                ),
                TitleDetail(
                  title1: 'Bentuk Obat',
                  title2: widget.medicine.drugDetail?.specificationForm ?? '-',
                  textColor: blackColor,
                  fontWeight: regular,
                ),
                TitleDetail(
                  title1: 'No. BPOM',
                  title2: widget.medicine.drugDetail!.specificationBpom ?? '-',
                  textColor: blackColor,
                  fontWeight: regular,
                ),
                TitleDetail(
                  title1: 'Manufaktur',
                  title2: widget.medicine.drugDetail?.manufacture ?? '-',
                  textColor: blackColor,
                  fontWeight: regular,
                ),
                const SizedBox(
                  height: 16,
                ),
                DescripsiText(
                    title1: 'Deskripsi',
                    subtitle2: widget.medicine.drugDetail?.description ?? '-'),
                DescripsiText(
                  title1: 'Indikasi',
                  subtitle2: widget.medicine.drugDetail?.indication ?? '-',
                ),
                DescripsiText(
                  title1: 'Komposisi',
                  subtitle2:
                      widget.medicine.drugDetail?.specificationIngredients ??
                          '-',
                ),
                DescripsiText(
                    title1: 'Dosis & Aturan Pakai',
                    subtitle2:
                        widget.medicine.drugDetail?.specificationDose ?? '-'),
                DescripsiText(
                  title1: 'Perhatian',
                  subtitle2: widget
                          .medicine.drugDetail?.specificationSpecialAttention ??
                      '-',
                ),
                DescripsiText(
                  title1: 'Kontra indikasi',
                  subtitle2: widget.medicine.drugDetail?.contradiction ?? '-',
                  isLast: true,
                ),
                // DescripsiText(
                //   title1: 'Efek Samping',
                //   subtitle2: 'Erupsi yang menyerupai jerawat, hipopigmentasi, atrofi kulit, striae. Iritasi atau sensitisasi (hentikan pemakaian).',
                // ),
              ],
            ),
          ),
          const dividergreen(),
          const SizedBox(
            height: 18,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      size: 24,
                      color: Color(0xffFFC36A),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Obx(
                      () => Text(
                        '${medicineController.overviewMedicine.value.avgRating ?? 0.0}',
                        style: blackHigtTextStyle.copyWith(fontSize: 30),
                      ),
                    ),
                    Text(
                      '/5.0',
                      style: subGreyTextStyle.copyWith(
                          fontSize: 12, color: const Color(0XffCCCCCC)),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Obx(
                              () => Text(
                                '${medicineController.overviewMedicine.value.satisfiedPercentage ?? 0}% Sobat Hey',
                                style: blackHigtTextStyle.copyWith(
                                    fontSize: 12, fontStyle: FontStyle.italic),
                              ),
                            ),
                            Text(
                              ' merasa puas',
                              style: blackHigtTextStyle.copyWith(fontSize: 12),
                            ),
                            const Icon(Icons.keyboard_arrow_right)
                          ],
                        ),
                        Row(
                          children: [
                            Obx(
                              () => Text(
                                '${medicineController.overviewMedicine.value.totalRating ?? 0} rating',
                                style: blackTextStyle.copyWith(
                                    fontSize: 12, fontWeight: regular),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Icon(
                              Icons.circle,
                              size: 6,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Obx(
                              () => Text(
                                '${medicineController.overviewMedicine.value.totalReview ?? 0} ulasan',
                                style: blackTextStyle.copyWith(
                                    fontSize: 12, fontWeight: regular),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 10),
                        margin: const EdgeInsets.only(right: 3),
                        height: 50,
                        decoration: BoxDecoration(
                          color: whiteColor,
                          border: Border.all(color: const Color(0xffCCCCCC)),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Row(
                          children: [
                            Obx(
                              () => Text(
                                '${medicineController.overviewMedicine.value.avgEffectivenessRating ?? 0}',
                                style:
                                    blackHigtTextStyle.copyWith(fontSize: 18),
                              ),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Effectiveness',
                                  style: blackTextStyle.copyWith(
                                      fontSize: 10, fontWeight: regular),
                                ),
                                Obx(
                                  () => Text(
                                    '${medicineController.overviewMedicine.value.countEffectivenessRating ?? 0} ulasan',
                                    style: subTitleTextStyle.copyWith(
                                        fontSize: 12, fontWeight: regular),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 10),
                        margin: const EdgeInsets.only(right: 3),
                        height: 50,
                        decoration: BoxDecoration(
                          color: whiteColor,
                          border: Border.all(color: const Color(0xffCCCCCC)),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Row(
                          children: [
                            Obx(
                              () => Text(
                                '${medicineController.overviewMedicine.value.avgTextureRating ?? 0}',
                                style:
                                    blackHigtTextStyle.copyWith(fontSize: 18),
                              ),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Texture',
                                  style: blackTextStyle.copyWith(
                                      fontSize: 10, fontWeight: regular),
                                ),
                                Obx(
                                  () => Text(
                                    '${medicineController.overviewMedicine.value.countTextureRating ?? 0} ulasan',
                                    style: subTitleTextStyle.copyWith(
                                        fontSize: 12, fontWeight: regular),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 10),
                        margin: const EdgeInsets.only(right: 3),
                        height: 50,
                        decoration: BoxDecoration(
                          color: whiteColor,
                          border: Border.all(color: const Color(0xffCCCCCC)),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Row(
                          children: [
                            Obx(
                              () => Text(
                                '${medicineController.overviewMedicine.value.avgPackagingRating ?? 0}',
                                style:
                                    blackHigtTextStyle.copyWith(fontSize: 18),
                              ),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Packaging',
                                  style: blackTextStyle.copyWith(
                                      fontSize: 10, fontWeight: regular),
                                ),
                                Obx(
                                  () => Text(
                                    '${medicineController.overviewMedicine.value.countPackagingRating ?? 0} ulasan',
                                    style: subTitleTextStyle.copyWith(
                                        fontSize: 12, fontWeight: regular),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Ulasan',
                          style: blackHigtTextStyle.copyWith(fontSize: 18),
                        ),
                        Text(
                          ' Sobat Hey',
                          style: blackHigtTextStyle.copyWith(
                              fontSize: 18, fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UlasanProdukPage(
                              productId: widget.medicine.id!,
                            ),
                          ),
                        );
                      },
                      child: Text(
                        '  Lihat Semua',
                        style: grenTextStyle.copyWith(fontSize: 12),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 11,
                ),
                Obx(
                  () => medicineController.productReview.isEmpty
                      ? Center(
                          child: Text(
                            'Belum ada ulasan',
                            style: TextStyle(
                              fontWeight: bold,
                              fontFamily: 'ProximaNova',
                              fontSize: 15,
                            ),
                          ),
                        )
                      : Column(
                          children:
                              medicineController.productReview.map((element) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/doctor1.png',
                                      width: 40,
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          element.user?.fullname ?? '-',
                                          style: blackHigtTextStyle.copyWith(
                                              fontSize: 15),
                                        ),
                                        Text(
                                          element.transactionProductItem
                                                  ?.product?.type ??
                                              '-',
                                          style: blackHigtTextStyle.copyWith(
                                              fontSize: 13,
                                              fontWeight: regular),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    const Icon(Icons.more_vert)
                                  ],
                                ),
                                const SizedBox(
                                  height: 13,
                                ),
                                Row(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: List.generate(5, (index) {
                                        return Image.asset(
                                          'assets/icons/stars-new.png',
                                          width: 12,
                                          color: element.avgRating! > index
                                              ? const Color(0xffFFC36A)
                                              : Color.fromRGBO(
                                                  155, 155, 155, 0.61),
                                        );
                                      }),
                                    ),
                                    const SizedBox(
                                      width: 13,
                                    ),
                                    Text(
                                      timeago.format(DateTime.parse(
                                          element.createdAt.toString())),
                                      style: blackHigtTextStyle.copyWith(
                                          fontSize: 12, fontWeight: regular),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 13,
                                ),
                                Text(
                                  element.review ?? '-',
                                  style: greyTextStyle.copyWith(
                                      fontSize: 13,
                                      color: const Color(0xff6B6B6B)),
                                ),
                                const SizedBox(
                                  height: 13,
                                ),
                                Text(
                                  'Before',
                                  style:
                                      blackHigtTextStyle.copyWith(fontSize: 12),
                                ),
                                const SizedBox(
                                  height: 13,
                                ),
                                Wrap(
                                  spacing: 4,
                                  runSpacing: 4,
                                  children: element
                                      .mediaBeforeConditionProductReviews!
                                      .map((e) {
                                    return Container(
                                      height: 72,
                                      width: 82,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(7),
                                      ),
                                      child: Image.network(
                                        '${Global.FILE}/${e.media!.path.toString()}',
                                        width: 72,
                                      ),
                                    );
                                  }).toList(),
                                ),
                                const SizedBox(
                                  height: 13,
                                ),
                                Text(
                                  'After',
                                  style:
                                      blackHigtTextStyle.copyWith(fontSize: 12),
                                ),
                                const SizedBox(
                                  height: 13,
                                ),
                                Wrap(
                                  spacing: 4,
                                  runSpacing: 4,
                                  children: element
                                      .mediaAfterConditionProductReviews!
                                      .map((e) {
                                    return Container(
                                      height: 72,
                                      width: 82,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(7),
                                      ),
                                      child: Image.network(
                                        '${Global.FILE}/${e.media!.path.toString()}',
                                        width: 72,
                                      ),
                                    );
                                  }).toList(),
                                ),
                                const SizedBox(
                                  height: 22,
                                ),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () async {
                                        print("help");

                                        if (help ?? element.helped!) {
                                          state.unHelped(context, element.id!);
                                          setState(() {
                                            help = false;
                                            helpReview["${element.id}"] =
                                                (helpReview["${element.id}"] ??
                                                        0) -
                                                    1;
                                          });
                                        } else {
                                          state.helped(context, element.id!);
                                          setState(() {
                                            help = true;
                                            helpReview["${element.id}"] =
                                                (helpReview["${element.id}"] ??
                                                        0) +
                                                    1;
                                          });
                                        }
                                      },
                                      child: Image.asset(
                                        'assets/icons/like.png',
                                        width: 15,
                                        color: help ?? element.helped!
                                            ? greenColor
                                            : greyColor,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 7,
                                    ),
                                    Text(
                                      '${element.cCount!.productReviewHelpfuls! + (helpReview["${element.id}"] ?? 0)} orang terbantu',
                                      style: grenTextStyle.copyWith(
                                        fontSize: 13,
                                        fontWeight: regular,
                                        color: help ?? element.helped!
                                            ? greenColor
                                            : greyColor,
                                      ),
                                    ),
                                    const Spacer(),
                                    element.replyReview == null
                                        ? Container()
                                        : InkWell(
                                            onTap: () {
                                              setState(() {
                                                isVisibelity = !isVisibelity;
                                              });
                                            },
                                            child: Row(
                                              children: [
                                                isVisibelity
                                                    ? Text(
                                                        'Lihat Balasan',
                                                        style:
                                                            blackRegulerTextStyle
                                                                .copyWith(
                                                                    fontSize:
                                                                        13),
                                                      )
                                                    : Text(
                                                        'Tutup Balasan',
                                                        style:
                                                            blackRegulerTextStyle
                                                                .copyWith(
                                                                    fontSize:
                                                                        13),
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
                                  visible: isVisibelity,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 60,
                                        width: 2,
                                        decoration:
                                            BoxDecoration(color: greenColor),
                                      ),
                                      const SizedBox(
                                        width: 7,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  'Penjual ',
                                                  style: blackHigtTextStyle
                                                      .copyWith(
                                                          fontSize: 13,
                                                          color: subTitleColor),
                                                ),
                                                Text(
                                                  timeago.format(DateTime.parse(
                                                      element.createdAt
                                                          .toString())),
                                                  style: blackRegulerTextStyle
                                                      .copyWith(
                                                          color: subTitleColor,
                                                          fontSize: 13),
                                                )
                                              ],
                                            ),
                                            Text(
                                              element.replyReview ?? '',
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
                              ],
                            );
                          }).toList(),
                        ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Obat Rekomendasi lainnya',
                  style: blackHigtTextStyle.copyWith(fontSize: 18),
                ),
                const SizedBox(
                  height: 18,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      // ProdukObat(
                      //   namaBrand: 'Noroid Soothing Cream 200ml',
                      //   harga: 'Rp152.500',
                      //   urlImg: 'assets/images/noroid1.png',
                      // ),
                      // ProdukObat(
                      //   namaBrand: 'Noroid Soothing Cream 200ml',
                      //   harga: 'Rp152.500',
                      //   urlImg: 'assets/images/noroid1.png',,
                      // ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Wrap(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 10),
            child: widget.medicine.consultationRecipeDrugs!.isNotEmpty
                ? Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            List product = [
                              {
                                "product_id": widget.medicine.id,
                                "productName": widget.medicine.name,
                                "img": widget
                                    .medicine.mediaProducts?[0].media?.path,
                                "qty": 1,
                                "notes": '-',
                                "isSelected": true,
                                "price": widget.medicine.price,
                                "totalPrice": widget.medicine.price! * 1,
                              }
                            ];

                            Get.to(PembayaranProduk(
                              pesan: product,
                              isCart: false,
                            ));
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            decoration: BoxDecoration(
                                border: Border.all(color: greenColor),
                                borderRadius: BorderRadius.circular(7)),
                            height: 40,
                            child: Center(
                              child: Text(
                                'Beli Langsung',
                                style: grenTextStyle.copyWith(
                                    fontSize: 15, fontWeight: bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () async {
                            medicineController.addMedicineToCart(
                                context, widget.medicine.id!);
                            SnackbarWidget.getSuccessSnackbar(
                              context,
                              'Info',
                              'Produk ditambahkan ke keranjang',
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            width: 142,
                            decoration: BoxDecoration(
                                color: greenColor,
                                border: Border.all(color: greenColor),
                                borderRadius: BorderRadius.circular(7)),
                            height: 40,
                            child: Center(
                              child: Text(
                                '+ Keranjang',
                                style: whiteTextStyle.copyWith(
                                    fontSize: 15, fontWeight: bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                    ],
                  )
                : Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      border: Border.all(color: greenColor),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Text(
                      'Harus Dengan Resep Dokter',
                      textAlign: TextAlign.center,
                      style: grenTextStyle.copyWith(
                        fontSize: 18,
                      ),
                    ),
                  ),
          )
        ],
      ),
    );
  }
}
