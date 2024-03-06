// ignore_for_file: use_build_context_synchronously, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/cart_controller.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/drug_controller.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/ulasan_produk_controller.dart';
import 'package:heystetik_mobileapps/core/currency_format.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/pages/solution/drug_search_page.dart';
import 'package:heystetik_mobileapps/pages/solution/pembayaran_produk_page.dart';
import 'package:heystetik_mobileapps/pages/solution/ulasan_produk_page.dart';
import 'package:heystetik_mobileapps/routes/create_dynamic_link.dart';
import 'package:heystetik_mobileapps/widget/Text_widget.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import 'package:heystetik_mobileapps/widget/drug_widget.dart';
import 'package:heystetik_mobileapps/widget/icons_notifikasi.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';
import 'package:social_share/social_share.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../controller/customer/solution/wishlist_produk_controller.dart';
import '../../theme/theme.dart';
import '../setings&akun/akun_home_page.dart';
import 'package:heystetik_mobileapps/models/drug_model.dart' as Drug;
import 'package:heystetik_mobileapps/models/customer/product_review_model.dart'
    as ProductReviewModel;
import 'package:heystetik_mobileapps/models/customer/overview_product_model.dart'
    as Overview;

class DetailDrugPage extends StatefulWidget {
  int drugId;
  DetailDrugPage({
    super.key,
    required this.drugId,
  });

  @override
  State<DetailDrugPage> createState() => _DetailDrugPageState();
}

class _DetailDrugPageState extends State<DetailDrugPage> {
  final DrugController stateDrug = Get.put(DrugController());
  final WishlistProdukController stateWishlist =
      Get.put(WishlistProdukController());
  final CartController stateCart = Get.put(CartController());
  final UlasanProdukController stateUlasan = Get.put(UlasanProdukController());
  final TextEditingController searchController = TextEditingController();
  bool isVisibility = false;
  bool? help;
  bool? isWishlist;
  Map<String, int> helpReview = {};
  Overview.Data? productOverview;
  List<Drug.Data2> drugRecomendation = [];
  List<ProductReviewModel.Data2> reviews = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      stateDrug.detailDrug(context, widget.drugId);
      productOverview =
          await stateUlasan.getOverviewProduct(context, widget.drugId);
      reviews.addAll(
        await stateUlasan.getReviewProduct(context, 1, 3, widget.drugId),
      );
      drugRecomendation.addAll(
        await stateDrug.drugRecomendation(context, 1, widget.drugId),
      );
      setState(() {});
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
          Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DrugSearchPage(
                        searchParam: searchController.text,
                      ),
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
                onTap: () async {
                  Uri? url = await createDynamicLinkDrug(widget.drugId);
                  print("url $url");
                  await SocialShare.shareOptions(url.toString());
                  // showModalBottomSheet(
                  //   isDismissible: false,
                  //   context: context,
                  //   backgroundColor: Colors.white,
                  //   shape: const RoundedRectangleBorder(
                  //     borderRadius: BorderRadiusDirectional.only(
                  //       topEnd: Radius.circular(25),
                  //       topStart: Radius.circular(25),
                  //     ),
                  //   ),
                  //   builder: (context) => const ShareShowWidget(),
                  // );
                },
                child: SvgPicture.asset(
                  'assets/icons/share-icons.svg',
                ),
              ),
              const SizedBox(
                width: 14,
              ),
              TotalKeranjang(iconcolor: blackColor),
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
          )
        ],
      ),
      body: Obx(
        () => LoadingWidget(
          isLoading: stateDrug.isLoadingDetailDrug.value,
          child: ListView(
            children: [
              Container(
                height: 375,
                width: 390,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      '${Global.FILE}/${stateDrug.drugDetail.value.mediaProducts?[0].media?.path}',
                    ),
                  ),
                ),
              ),
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
                    Row(
                      children: [
                        Text(
                          CurrencyFormat.convertToIdr(
                              stateDrug.drugDetail.value.price ?? 0, 2),
                          style: blackHigtTextStyle.copyWith(fontSize: 20),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () async {
                            if ((isWishlist ??
                                    stateDrug.drugDetail.value.wishlist) ==
                                true) {
                              isWishlist = false;
                              await stateWishlist.deleteWistlist(
                                  context, stateDrug.drugDetail.value.id ?? 0);
                              setState(() {});
                            } else {
                              isWishlist = true;
                              await stateWishlist.addWishlist(
                                  context, stateDrug.drugDetail.value.id ?? 0);
                              setState(() {});
                            }
                          },
                          child: (isWishlist ??
                                      stateDrug.drugDetail.value.wishlist) ==
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
                      stateDrug.drugDetail.value.name ?? '-',
                      style: blackRegulerTextStyle.copyWith(color: blackColor),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Text(
                          'Terjual 3.002',
                          style:
                              blackRegulerTextStyle.copyWith(color: blackColor),
                        ),
                        const SizedBox(
                          width: 9,
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 6),
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
                                '${stateDrug.drugDetail.value.rating}',
                                style:
                                    blackHigtTextStyle.copyWith(fontSize: 13),
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
                    Padding(
                      padding: const EdgeInsets.only(top: 4, bottom: 5),
                      child: Column(
                        children: [
                          Table(
                            children: [
                              TableRow(
                                children: [
                                  Text(
                                    'Concern',
                                    style: blackRegulerTextStyle.copyWith(
                                        color: blackColor),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ...?stateDrug
                                          .drugDetail.value.productConcerns
                                          ?.asMap()
                                          .entries
                                          .map((item) {
                                        return InkWell(
                                          onTap: () {
                                            Get.to(
                                              () => DrugSearchPage(
                                                idConcern:
                                                    item.value.concernId!,
                                              ),
                                            );
                                          },
                                          child: Container(
                                            child: Text(
                                              item.key == 0
                                                  ? '${item.value.concern?.name}'
                                                  : ', ${item.value.concern?.name}',
                                              style: grenTextStyle.copyWith(
                                                fontSize: 15,
                                                color: greenColor,
                                              ),
                                            ),
                                          ),
                                        );
                                      }).toList()
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          const Divider(
                            thickness: 2,
                          )
                        ],
                      ),
                    ),
                    TitleDetail(
                      title1: 'Bentuk Obat',
                      title2: stateDrug
                              .drugDetail.value.drugDetail?.specificationForm ??
                          '-',
                      textColor: blackColor,
                      fontWeight: regular,
                    ),
                    TitleDetail(
                      title1: 'No. BPOM',
                      title2: stateDrug
                              .drugDetail.value.drugDetail?.specificationBpom ??
                          '-',
                      textColor: blackColor,
                      fontWeight: regular,
                    ),
                    TitleDetail(
                      title1: 'Manufaktur',
                      title2:
                          stateDrug.drugDetail.value.drugDetail?.manufacture ??
                              '-',
                      textColor: blackColor,
                      fontWeight: regular,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    DescripsiText(
                        title1: 'Deskripsi',
                        subtitle2: stateDrug
                                .drugDetail.value.drugDetail?.description ??
                            '-'),
                    DescripsiText(
                      title1: 'Indikasi',
                      subtitle2:
                          stateDrug.drugDetail.value.drugDetail?.indication ??
                              '-',
                    ),
                    DescripsiText(
                      title1: 'Komposisi',
                      subtitle2: stateDrug.drugDetail.value.drugDetail
                              ?.specificationIngredients ??
                          '-',
                    ),
                    DescripsiText(
                        title1: 'Dosis & Aturan Pakai',
                        subtitle2: stateDrug.drugDetail.value.drugDetail
                                ?.specificationDose ??
                            '-'),
                    DescripsiText(
                      title1: 'Perhatian',
                      subtitle2: stateDrug.drugDetail.value.drugDetail
                              ?.specificationSpecialAttention ??
                          '-',
                    ),
                    DescripsiText(
                      title1: 'Kontra indikasi',
                      subtitle2: stateDrug
                              .drugDetail.value.drugDetail?.contradiction ??
                          '-',
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
              Padding(
                padding: const EdgeInsets.only(
                  top: 12,
                  left: 20,
                  right: 20,
                  bottom: 12,
                ),
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
                        Text(
                          '${productOverview?.avgRating ?? 0.0}',
                          style: blackHigtTextStyle.copyWith(fontSize: 30),
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
                                Text(
                                  '${productOverview?.satisfiedPercentage ?? 0}% Sobat Hey',
                                  style: blackHigtTextStyle.copyWith(
                                      fontSize: 12,
                                      fontStyle: FontStyle.italic),
                                ),
                                Text(
                                  ' merasa puas',
                                  style:
                                      blackHigtTextStyle.copyWith(fontSize: 12),
                                ),
                                const Icon(Icons.keyboard_arrow_right)
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  '${productOverview?.totalRating ?? 0} rating',
                                  style: blackTextStyle.copyWith(
                                      fontSize: 12, fontWeight: regular),
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
                                Text(
                                  '${productOverview?.totalReview ?? 0} ulasan',
                                  style: blackTextStyle.copyWith(
                                      fontSize: 12, fontWeight: regular),
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
                              border:
                                  Border.all(color: const Color(0xffCCCCCC)),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  '${productOverview?.avgEffectivenessRating ?? 0}',
                                  style:
                                      blackHigtTextStyle.copyWith(fontSize: 18),
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
                                    Text(
                                      '${productOverview?.countEffectivenessRating ?? 0} ulasan',
                                      style: subTitleTextStyle.copyWith(
                                          fontSize: 12, fontWeight: regular),
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
                              border:
                                  Border.all(color: const Color(0xffCCCCCC)),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  '${productOverview?.avgTextureRating ?? 0}',
                                  style:
                                      blackHigtTextStyle.copyWith(fontSize: 18),
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
                                    Text(
                                      '${productOverview?.countTextureRating ?? 0} ulasan',
                                      style: subTitleTextStyle.copyWith(
                                          fontSize: 12, fontWeight: regular),
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
                              border:
                                  Border.all(color: const Color(0xffCCCCCC)),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  '${productOverview?.avgPackagingRating ?? 0}',
                                  style:
                                      blackHigtTextStyle.copyWith(fontSize: 18),
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
                                    Text(
                                      '${productOverview?.countPackagingRating ?? 0} ulasan',
                                      style: subTitleTextStyle.copyWith(
                                          fontSize: 12, fontWeight: regular),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (reviews.isNotEmpty)
                      const SizedBox(
                        height: 8,
                      ),
                    if (reviews.isNotEmpty)
                      Row(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Ulasan',
                                style:
                                    blackHigtTextStyle.copyWith(fontSize: 18),
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
                                    productId: widget.drugId,
                                    isDrug: true,
                                  ),
                                ),
                              );
                            },
                            child: Text(
                              'Lihat Semua',
                              style: grenTextStyle.copyWith(fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    if (reviews.isNotEmpty)
                      const SizedBox(
                        height: 11,
                      ),
                    if (reviews.isNotEmpty)
                      Column(
                        children: reviews.map((element) {
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
                                        image: element.user
                                                    ?.mediaUserProfilePicture !=
                                                null
                                            ? NetworkImage(
                                                '${Global.FILE}/${element.user?.mediaUserProfilePicture?.media?.path}',
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        element.user?.fullname ?? '-',
                                        style: blackHigtTextStyle.copyWith(
                                            fontSize: 15),
                                      ),
                                      Text(
                                        element.transactionProductItem?.product
                                                ?.type ??
                                            '-',
                                        style: blackHigtTextStyle.copyWith(
                                            fontSize: 13, fontWeight: regular),
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
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            '${Global.FILE}/${e.media!.path.toString()}'),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(7),
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
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            '${Global.FILE}/${e.media!.path.toString()}'),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(7),
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
                                    onTap: () {
                                      if (help ?? element.helped!) {
                                        stateUlasan.unHelped(
                                            context, element.id!);
                                        setState(() {
                                          help = false;
                                          helpReview["${element.id}"] =
                                              (helpReview["${element.id}"] ??
                                                      0) -
                                                  1;
                                        });
                                      } else {
                                        stateUlasan.helped(
                                            context, element.id!);
                                        setState(() {
                                          help = true;
                                          helpReview["${element.id}"] =
                                              (helpReview["${element.id}"] ??
                                                      0) +
                                                  1;
                                        });
                                      }
                                    },
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          'assets/icons/like.png',
                                          width: 15,
                                          color: help ?? element.helped!
                                              ? greenColor
                                              : greyColor,
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
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  element.replyReview == null
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
                                                      style:
                                                          blackRegulerTextStyle
                                                              .copyWith(
                                                                  fontSize: 13),
                                                    )
                                                  : Text(
                                                      'Lihat Balasan',
                                                      style:
                                                          blackRegulerTextStyle
                                                              .copyWith(
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
                                                style:
                                                    blackHigtTextStyle.copyWith(
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
                            ],
                          );
                        }).toList(),
                      ),
                  ],
                ),
              ),
              if (reviews.isEmpty)
                const SizedBox(
                  height: 18,
                ),
              if (drugRecomendation.isNotEmpty)
                const Divider(
                  thickness: 6,
                  color: Color(0xffF1F1F1),
                ),
              if (drugRecomendation.isNotEmpty)
                const SizedBox(
                  height: 19,
                ),
              if (drugRecomendation.isNotEmpty)
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
                          children: drugRecomendation.map((drug) {
                            return DrugWidget(
                              drug: drug,
                            );
                          }).toList(),
                        ),
                      )
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Wrap(
        children: [
          Obx(
            () => Padding(
              padding: const EdgeInsets.only(
                  left: 25, right: 25, top: 10, bottom: 10),
              child: (stateDrug.drugDetail.value.consultationRecipeDrugs
                          ?.isNotEmpty ??
                      stateDrug.drugDetail.value.consultationRecipeDrugs !=
                          null)
                  ? Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              List product = [
                                {
                                  "productId": stateDrug.drugDetail.value.id,
                                  "productName":
                                      stateDrug.drugDetail.value.name,
                                  "img": stateDrug.drugDetail.value
                                      .mediaProducts?[0].media?.path,
                                  "qty": 1,
                                  "notes": '',
                                  "isSelected": true,
                                  "price": stateDrug.drugDetail.value.price,
                                  "totalPrice":
                                      stateDrug.drugDetail.value.price,
                                }
                              ];

                              Get.to(() => PembayaranProduk(
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
                              await stateCart.addCart(
                                  context, widget.drugId, 1, '');
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 6),
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
            ),
          )
        ],
      ),
    );
  }
}
