// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/cart_controller.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/skincare_controller.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/ulasan_produk_controller.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/wishlist_produk_controller.dart';
import 'package:heystetik_mobileapps/core/currency_format.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/select_conditions_page.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/akun_home_page.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/ulasan_settings_page.dart';
import 'package:heystetik_mobileapps/pages/solution/produk_promo_page.dart';
import 'package:heystetik_mobileapps/pages/solution/skincare_search_page.dart';
import 'package:heystetik_mobileapps/pages/solution/pembayaran_produk_page.dart';
import 'package:heystetik_mobileapps/pages/solution/ulasan_produk_page.dart';
import 'package:heystetik_mobileapps/routes/create_dynamic_link.dart';
import 'package:heystetik_mobileapps/widget/icons_notifikasi.dart';
import 'package:heystetik_mobileapps/widget/ulasan_produk_widget.dart';
import 'package:social_share/social_share.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';
import 'package:heystetik_mobileapps/widget/skincare_widget.dart';
import '../../widget/Text_widget.dart';
import 'package:heystetik_mobileapps/models/customer/skincare_model.dart'
    as Skincare;
import 'package:heystetik_mobileapps/models/customer/product_review_model.dart'
    as ProductReviewModel;
import 'package:heystetik_mobileapps/models/customer/overview_product_model.dart'
    as Overview;

class DetailSkinCarePage extends StatefulWidget {
  int productId;

  DetailSkinCarePage({required this.productId, super.key});

  @override
  State<DetailSkinCarePage> createState() => _DetailSkinCarePageState();
}

class _DetailSkinCarePageState extends State<DetailSkinCarePage> {
  final SkincareController stateSkincare = Get.put(SkincareController());
  final WishlistProdukController stateWishlist =
      Get.put(WishlistProdukController());
  final CartController stateCart = Get.put(CartController());
  final UlasanProdukController stateUlasan = Get.put(UlasanProdukController());
  final TextEditingController searchController = TextEditingController();
  bool isVisibility = false;
  bool? isWishlist;
  Overview.Data? productOverview;
  List<Skincare.Data2> skincareRecomendation = [];
  List<Skincare.Data2> relatedSkincare = [];
  List<ProductReviewModel.Data2> reviews = [];
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      stateSkincare.detailSkincare(context, widget.productId);
      productOverview =
          await stateUlasan.getOverviewProduct(context, widget.productId);
      reviews.addAll(
        await stateUlasan.getReviewProduct(context, 1, 3, widget.productId),
      );
      relatedSkincare.addAll(
        await stateSkincare.relatedProductSkincare(context, widget.productId),
      );
      skincareRecomendation.addAll(
        await stateSkincare.skincareRecomendation(context, widget.productId),
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
                child: Obx(
                  () => Text(
                    stateSkincare.skincareDetail.value.skincareDetail?.brand ??
                        '',
                    style: blackTextStyle.copyWith(
                      fontSize: 20,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
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
                      builder: (context) => SkincareSearchPage(
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
                  Uri? url = await createDynamicLinkSkincare(widget.productId);
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
          isLoading: stateSkincare.isLoadingDetailSkincare.value,
          child: ListView(
            children: [
              Container(
                height: 375,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      '${Global.FILE}/${stateSkincare.skincareDetail.value.mediaProducts?[0].media?.path}',
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
                    // Row(
                    //   children: [
                    //     Container(
                    //       padding: EdgeInsets.all(1),
                    //       decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(4),
                    //           color: const Color.fromRGBO(201, 42, 42, 0.2)),
                    //       child: Center(
                    //         child: Text(
                    //           '20%',
                    //           style: blackHigtTextStyle.copyWith(
                    //               color: redColor, fontSize: 15),
                    //         ),
                    //       ),
                    //     ),
                    //     const SizedBox(
                    //       width: 4,
                    //     ),
                    //     Text(
                    //       CurrencyFormat.convertToIdr(
                    //         stateSkincare.skincareDetail.value.price ?? 0,
                    //         0,
                    //       ),
                    //       style: subGreyTextStyle.copyWith(
                    //         fontSize: 15,
                    //         decoration: TextDecoration.lineThrough,
                    //         decorationThickness: 2,
                    //         color: const Color(0xff9B9B9B),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    Row(
                      children: [
                        Text(
                          CurrencyFormat.convertToIdr(
                            stateSkincare.skincareDetail.value.price ?? 0,
                            0,
                          ),
                          style: blackHigtTextStyle.copyWith(fontSize: 20),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () async {
                            if ((isWishlist ??
                                    stateSkincare
                                        .skincareDetail.value.wishlist) ==
                                true) {
                              isWishlist = false;
                              await stateWishlist.deleteWistlist(
                                  context, widget.productId);
                              setState(() {});
                            } else {
                              isWishlist = true;
                              await stateWishlist.addWishlist(
                                  context, widget.productId);
                              setState(() {});
                            }
                          },
                          child: isWishlist ??
                                  stateSkincare.skincareDetail.value.wishlist ==
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
                      '${stateSkincare.skincareDetail.value.skincareDetail?.brand}',
                      style: blackTextStyle.copyWith(fontSize: 20),
                    ),
                    Text(
                      '${stateSkincare.skincareDetail.value.name}',
                      style: blackRegulerTextStyle.copyWith(color: blackColor),
                    ),
                    Text(
                      '${stateSkincare.skincareDetail.value.skincareDetail?.specificationNetto}${stateSkincare.skincareDetail.value.skincareDetail?.specificationNettoType}',
                      style: blackRegulerTextStyle.copyWith(color: blackColor),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Text(
                          'Terjual 0',
                          style:
                              blackRegulerTextStyle.copyWith(color: blackColor),
                        ),
                        const SizedBox(
                          width: 9,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 6),
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
                                '${stateSkincare.skincareDetail.value.rating}',
                                style:
                                    blackHigtTextStyle.copyWith(fontSize: 13),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                '(0)',
                                style: blackRegulerTextStyle.copyWith(
                                    fontSize: 13),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => ProdukPromoPage(
                              isDetail: true,
                            ));
                      },
                      child: Stack(
                        children: [
                          Image.asset(
                            'assets/icons/coupon 2.png',
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 20,
                              left: 20,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/dicon1.svg',
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Cek Promo Spesial',
                                      style: blackHigtTextStyle.copyWith(
                                          fontSize: 15),
                                    ),
                                    Text(
                                      'Masih ada kupon promo buat kamu!',
                                      style: subTitleTextStyle,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                SvgPicture.asset(
                                  'assets/icons/arrow-left.svg',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
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
                      height: 10,
                    ),
                    TitleDetail(
                      ontap: () {
                        Get.to(
                          () => SkincareSearchPage(
                            category: stateSkincare
                                .skincareDetail.value.category
                                .toString(),
                          ),
                        );
                      },
                      title1: 'Kategori',
                      title2: '${stateSkincare.skincareDetail.value.category}',
                      textColor: greenColor,
                    ),
                    TitleDetail(
                      ontap: () {
                        Get.to(
                          () => SkincareSearchPage(
                            display: stateSkincare.skincareDetail.value.display
                                .toString(),
                          ),
                        );
                      },
                      title1: 'Etalase Skincare',
                      title2: '${stateSkincare.skincareDetail.value.display}',
                      textColor: greenColor,
                    ),
                    TitleDetail(
                      title1: 'Tekstur',
                      title2:
                          '${stateSkincare.skincareDetail.value.skincareDetail?.specificationTexture}',
                      textColor: blackColor,
                      fontWeight: regular,
                    ),
                    TitleDetail(
                      title1: 'Kemasan',
                      title2:
                          '${stateSkincare.skincareDetail.value.skincareDetail?.specificationPackagingType} ${stateSkincare.skincareDetail.value.skincareDetail?.specificationNetto}${stateSkincare.skincareDetail.value.skincareDetail?.specificationNettoType}',
                      textColor: blackColor,
                      fontWeight: regular,
                    ),
                    TitleDetail(
                      title1: 'No. BPOM',
                      title2:
                          '${stateSkincare.skincareDetail.value.skincareDetail?.specificationBpom}',
                      textColor: blackColor,
                      fontWeight: regular,
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    DescripsiText(
                      title1: 'Deskripsi',
                      subtitle2:
                          '${stateSkincare.skincareDetail.value.skincareDetail?.description}',
                    ),
                    DescripsiText(
                      title1: 'Petunjuk Penggunaan',
                      subtitle2:
                          '${stateSkincare.skincareDetail.value.skincareDetail?.specificationHowToUse}',
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isVisibility = !isVisibility;
                        });
                      },
                      child: Row(
                        children: [
                          Text(
                            'Kandungan Skincare',
                            style: blackHigtTextStyle.copyWith(
                              fontSize: 18,
                            ),
                          ),
                          const Spacer(),
                          Icon(
                            isVisibility
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down,
                            color: greenColor,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Visibility(
                      visible: isVisibility,
                      child: Text(
                        '${stateSkincare.skincareDetail.value.skincareDetail?.specificationIngredients}',
                        style: blackRegulerTextStyle.copyWith(fontSize: 15),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
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
                                    fontStyle: FontStyle.italic,
                                  ),
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
                                  '${productOverview?.avgEffectivenessRating ?? 0.0}',
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
                                  '${productOverview?.avgTextureRating ?? 0.0}',
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
                                  '${productOverview?.avgPackagingRating ?? 0.0}',
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
                                    productId: widget.productId,
                                    isDrug: false,
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
                        children: reviews.asMap().entries.map((element) {
                          return UlasanProdukWidget(
                            element: element.value,
                            isEnd: reviews.length == (element.key + 1),
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
              if (reviews.isNotEmpty)
                const Divider(
                  thickness: 6,
                  color: Color(0xffF1F1F1),
                ),
              if (reviews.isNotEmpty)
                const SizedBox(
                  height: 19,
                ),
              if (reviews.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Puas dengan produk yang kamu beli?',
                            style: blackRegulerTextStyle.copyWith(fontSize: 13),
                          ),
                          Text(
                            'Bagikan ulasanmu, yuk Sobat Hey :)',
                            style: blackHigtTextStyle.copyWith(
                                fontSize: 13, color: const Color(0XFF6B6B6B)),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 11,
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Get.to(() => UlasanSetingsPage());
                          },
                          child: Container(
                            height: 29,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: greenColor, width: 1.5),
                                borderRadius: BorderRadius.circular(3)),
                            padding: const EdgeInsets.only(
                                top: 6, bottom: 6, left: 10, right: 10),
                            child: Center(
                              child: Text(
                                'Beri Ulasan',
                                style: grenTextStyle.copyWith(
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              if (reviews.isNotEmpty)
                const SizedBox(
                  height: 19,
                ),
              if (relatedSkincare.isNotEmpty) const dividergreen(),
              if (relatedSkincare.isNotEmpty)
                const SizedBox(
                  height: 19,
                ),
              if (relatedSkincare.isNotEmpty)
                Padding(
                  padding: lsymetric,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Sobat Hey',
                            style: blackHigtTextStyle.copyWith(
                                fontSize: 18, fontStyle: FontStyle.italic),
                          ),
                          Text(
                            ' juga membeli ini',
                            style: blackHigtTextStyle.copyWith(fontSize: 18),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                ),
              if (relatedSkincare.isNotEmpty)
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: Wrap(
                      spacing: 23,
                      runSpacing: 12,
                      children: relatedSkincare
                          .map(
                            (e) => InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => DetailSkinCarePage(
                                      productId: e.id!.toInt(),
                                    ),
                                  ),
                                );
                              },
                              child: SkincareWidget(
                                produkId: e.id!.toInt(),
                                namaBrand: e.skincareDetail!.brand.toString(),
                                namaProduk: e.name.toString(),
                                diskonProduk: '',
                                hargaDiskon: '',
                                harga: CurrencyFormat.convertToIdr(e.price, 0),
                                urlImg:
                                    '${Global.FILE}/${e.mediaProducts![0].media!.path}',
                                rating: '${e.rating} (0k)',
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
              if (skincareRecomendation.isNotEmpty)
                const SizedBox(
                  height: 27,
                ),
              if (skincareRecomendation.isNotEmpty)
                Divider(
                  thickness: 2,
                  color: borderColor,
                ),
              if (skincareRecomendation.isNotEmpty)
                const SizedBox(
                  height: 17,
                ),
              if (skincareRecomendation.isNotEmpty)
                Padding(
                  padding: lsymetric,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Skincare Pilihan Untukmu',
                        style: blackHigtTextStyle.copyWith(fontSize: 18),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                ),
              if (skincareRecomendation.isNotEmpty)
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: Wrap(
                      spacing: 23,
                      runSpacing: 12,
                      children: skincareRecomendation
                          .map(
                            (e) => InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => DetailSkinCarePage(
                                      productId: e.id!.toInt(),
                                    ),
                                  ),
                                );
                              },
                              child: SkincareWidget(
                                produkId: e.id!.toInt(),
                                namaBrand: e.skincareDetail!.brand.toString(),
                                namaProduk: e.name.toString(),
                                diskonProduk: '',
                                hargaDiskon: '',
                                harga: CurrencyFormat.convertToIdr(e.price, 0),
                                urlImg:
                                    '${Global.FILE}/${e.mediaProducts![0].media!.path}',
                                rating: '${e.rating} (0k)',
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Wrap(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 25, right: 25, bottom: 11, top: 11),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Get.to(() => SelectConditionsPage());
                    },
                    child: Container(
                      width: 142,
                      decoration: BoxDecoration(
                          color: greenColor,
                          border: Border.all(color: greenColor),
                          borderRadius: BorderRadius.circular(7)),
                      height: 40,
                      child: Center(
                        child: Text(
                          'Konsultasi Dulu',
                          style: whiteTextStyle.copyWith(
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
                    onTap: () {
                      List product = [
                        {
                          "type": 'SKINCARE',
                          "productId": stateSkincare.skincareDetail.value.id,
                          "productName":
                              stateSkincare.skincareDetail.value.name,
                          "img": stateSkincare.skincareDetail.value
                              .mediaProducts?[0].media?.path,
                          "qty": 1,
                          "notes": '',
                          "isSelected": true,
                          "price": stateSkincare.skincareDetail.value.price,
                          "totalPrice":
                              stateSkincare.skincareDetail.value.price! * 1,
                        }
                      ];

                      Get.to(() => PembayaranProduk(
                            pesan: product,
                            isCart: false,
                          ));
                    },
                    child: Container(
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
                  width: 6,
                ),
                InkWell(
                  onTap: () async {
                    await stateCart.addCart(context, widget.productId, 1, '');
                  },
                  child: Container(
                    height: 40,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(color: borderColor),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: greenColor,
                          size: 17,
                        ),
                        SvgPicture.asset(
                          'assets/icons/trello-icons.svg',
                          width: 17,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
