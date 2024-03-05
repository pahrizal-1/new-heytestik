// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/drug_controller.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/skincare_controller.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/ulasan_produk_controller.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/wishlist_produk_controller.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/routes/create_dynamic_link.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import 'package:heystetik_mobileapps/widget/filter_ontap_widget.dart';
import 'package:heystetik_mobileapps/widget/filter_rating_ulasan_produk_widget.dart';
import 'package:heystetik_mobileapps/widget/filter_topik_ulasan_produk_widget.dart';
import 'package:heystetik_mobileapps/widget/filter_urutan_ulasan_produk_widget.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';
import 'package:heystetik_mobileapps/widget/show_modal_dialog.dart';
import 'package:heystetik_mobileapps/models/customer/product_review_model.dart'
    as ProductReviewModel;
import 'package:social_share/social_share.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:heystetik_mobileapps/models/customer/overview_product_model.dart'
    as Overview;

class UlasanProdukPage extends StatefulWidget {
  int productId;
  bool isDrug = false;
  UlasanProdukPage({required this.productId, required this.isDrug, super.key});

  @override
  State<UlasanProdukPage> createState() => _UlasanProdukPageState();
}

class _UlasanProdukPageState extends State<UlasanProdukPage> {
  ScrollController scrollController = ScrollController();
  final UlasanProdukController state = Get.put(UlasanProdukController());
  final DrugController stateDrug = Get.put(DrugController());
  final SkincareController stateSkincare = Get.put(SkincareController());
  final WishlistProdukController stateWishlist =
      Get.put(WishlistProdukController());
  List<ProductReviewModel.Data2> reviews = [];
  bool isVisibelity = false;
  int page = 1;
  int take = 10;
  bool? isWishlist;
  bool? help;
  Overview.Data? productOverview;
  Map<String, int> helpReview = {};
  Map<String, dynamic> filter = {};
  int? filterRating;
  String? filterTopik;
  String? filterUrutan;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if (widget.isDrug) {
        stateDrug.detailDrug(context, widget.productId);
      } else {
        stateSkincare.detailSkincare(context, widget.productId);
      }
      productOverview =
          await state.getOverviewProduct(context, widget.productId);
      reviews.addAll(
        await state.getReviewProduct(
          context,
          page,
          take,
          widget.productId,
          filter: filter,
        ),
      );
      setState(() {});
    });

    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool isTop = scrollController.position.pixels == 0;
        if (!isTop) {
          page += 1;
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
            state.isLoadingMore.value = true;
            reviews.addAll(await state.getReviewProduct(
                context, page, take, widget.productId,
                filter: filter));
            setState(() {});
            state.isLoadingMore.value = false;
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
        elevation: 0,
        automaticallyImplyLeading: false,
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
                  color: whiteColor,
                ),
              ),
              SizedBox(
                width: 11,
              ),
              Row(
                children: [
                  Text(
                    'Ulasan',
                    style:
                        whiteTextStyle.copyWith(fontSize: 20, fontWeight: bold),
                  ),
                  Text(
                    ' Sobat Hey',
                    style: whiteTextStyle.copyWith(
                        fontSize: 20,
                        fontWeight: bold,
                        fontStyle: FontStyle.italic),
                  ),
                ],
              ),
              const SizedBox(
                width: 11,
              ),
            ],
          ),
        ),
        backgroundColor: greenColor,
        actions: [
          if (widget.isDrug)
            InkWell(
              onTap: () async {
                if ((isWishlist ?? stateDrug.drugDetail.value.wishlist) ==
                    true) {
                  isWishlist = false;
                  await stateWishlist.deleteWistlist(context, widget.productId);
                  setState(() {});
                } else {
                  isWishlist = true;
                  await stateWishlist.addWishlist(context, widget.productId);
                  setState(() {});
                }
              },
              child: (isWishlist ?? stateDrug.drugDetail.value.wishlist == true)
                  ? Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )
                  : Icon(Icons.favorite_outline),
            )
          else
            InkWell(
              onTap: () async {
                if ((isWishlist ??
                        stateSkincare.skincareDetail.value.wishlist) ==
                    true) {
                  isWishlist = false;
                  await stateWishlist.deleteWistlist(context, widget.productId);
                  setState(() {});
                } else {
                  isWishlist = true;
                  await stateWishlist.addWishlist(context, widget.productId);
                  setState(() {});
                }
              },
              child: (isWishlist ??
                      stateSkincare.skincareDetail.value.wishlist == true)
                  ? Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )
                  : Icon(Icons.favorite_outline),
            ),
          const SizedBox(
            width: 21,
          ),
          InkWell(
            onTap: () async {
              Uri? url;
              if (widget.isDrug) {
                url = await createDynamicLinkDrug(widget.productId);
              } else {
                url = await createDynamicLinkSkincare(widget.productId);
              }
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
              color: whiteColor,
            ),
          ),
          const SizedBox(
            width: 21,
          ),
        ],
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
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
                                    fontSize: 12, fontStyle: FontStyle.italic),
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
                            border: Border.all(color: const Color(0xffCCCCCC)),
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
                            border: Border.all(color: const Color(0xffCCCCCC)),
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
                            border: Border.all(color: const Color(0xffCCCCCC)),
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
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            dividergrey(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
                child: Row(
                  children: [
                    if (filter.isNotEmpty)
                      InkWell(
                        onTap: () async {
                          filterRating = null;
                          filterTopik = null;
                          filterUrutan = null;
                          filter.clear();
                          page = 1;
                          reviews.clear();
                          setState(() {});
                          reviews.addAll(
                            await state.getReviewProduct(
                              context,
                              page,
                              10,
                              widget.productId,
                              filter: filter,
                            ),
                          );
                          setState(() {});
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 5),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: greenColor,
                            ),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Icon(
                            Icons.close,
                            color: greenColor,
                          ),
                        ),
                      ),
                    filterOnTapWidget(
                      title: 'Dengan Foto',
                      isSelected: filter['has_photo'] == true,
                      onTap: () async {
                        if (filter['has_photo'] == true) {
                          filter.remove('has_photo');
                          page = 1;
                          reviews.clear();
                          setState(() {});
                          reviews.addAll(
                            await state.getReviewProduct(
                              context,
                              page,
                              10,
                              widget.productId,
                              filter: filter,
                            ),
                          );
                          setState(() {});
                        } else {
                          filter['has_photo'] = true;
                          page = 1;
                          reviews.clear();
                          setState(() {});
                          reviews.addAll(
                            await state.getReviewProduct(
                              context,
                              page,
                              10,
                              widget.productId,
                              filter: filter,
                            ),
                          );
                          setState(() {});
                        }
                      },
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    InkWell(
                      onTap: () {
                        customeModal(
                                context,
                                FilterRatingUlasanProdukWidget(
                                    val: filterRating))
                            .then((value) async {
                          if (value == null) return;
                          filterRating = value;
                          filter['rating[]'] = value.toString();
                          page = 1;
                          reviews.clear();
                          setState(() {});
                          reviews.addAll(
                            await state.getReviewProduct(
                              context,
                              page,
                              10,
                              widget.productId,
                              filter: filter,
                            ),
                          );
                          setState(() {});
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 5),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: (filterRating is int)
                                  ? greenColor
                                  : borderColor,
                            ),
                            borderRadius: BorderRadius.circular(7)),
                        child: Row(
                          children: [
                            if ((filterRating is int))
                              SvgPicture.asset('assets/icons/stars.svg'),
                            if ((filterRating is int))
                              const SizedBox(
                                width: 10,
                              ),
                            Center(
                              child: Text(
                                (filterRating is int)
                                    ? filterRating.toString()
                                    : 'Rating',
                                style: blackRegulerTextStyle.copyWith(
                                  fontSize: 15,
                                  color:
                                      (filterRating is int) ? greenColor : null,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: (filterRating is int) ? greenColor : null,
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        customeModal(context,
                                FilterTopikUlasanProdukWidget(val: filterTopik))
                            .then((value) async {
                          if (value == null) return;
                          filterTopik = value;
                          filter['topic[]'] = value.toString().toUpperCase();
                          page = 1;
                          reviews.clear();
                          setState(() {});
                          reviews.addAll(
                            await state.getReviewProduct(
                              context,
                              page,
                              10,
                              widget.productId,
                              filter: filter,
                            ),
                          );
                          setState(() {});
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 5),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: (filterTopik is String)
                                  ? greenColor
                                  : borderColor,
                            ),
                            borderRadius: BorderRadius.circular(7)),
                        child: Row(
                          children: [
                            Center(
                              child: Text(
                                filterTopik ?? 'Topik Ulasan',
                                style: blackRegulerTextStyle.copyWith(
                                  fontSize: 15,
                                  color: (filterTopik is String)
                                      ? greenColor
                                      : null,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color:
                                  (filterTopik is String) ? greenColor : null,
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        customeModal(
                                context,
                                FilterUrutanUlasanProdukWidget(
                                    val: filterUrutan))
                            .then((value) async {
                          if (value == null) return;
                          filterUrutan = value;
                          filter['sorting_type'] = value
                              .toString()
                              .toUpperCase()
                              .replaceAll(' ', '_');
                          page = 1;
                          reviews.clear();
                          setState(() {});
                          reviews.addAll(
                            await state.getReviewProduct(
                              context,
                              page,
                              10,
                              widget.productId,
                              filter: filter,
                            ),
                          );
                          setState(() {});
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 5),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: (filterUrutan is String)
                                  ? greenColor
                                  : borderColor,
                            ),
                            borderRadius: BorderRadius.circular(7)),
                        child: Row(
                          children: [
                            Center(
                              child: Text(
                                filterUrutan ?? 'Urutan',
                                style: blackRegulerTextStyle.copyWith(
                                  fontSize: 15,
                                  color: (filterUrutan is String)
                                      ? greenColor
                                      : null,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color:
                                  (filterUrutan is String) ? greenColor : null,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Obx(
              () => LoadingWidget(
                isLoading:
                    state.isLoadingMore.value ? false : state.isLoading.value,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 26, right: 26),
                      child: reviews.isEmpty
                          ? Center(
                              child: Text(
                                'Belum ada ulasan',
                                style: TextStyle(
                                  fontFamily: 'ProximaNova',
                                  fontSize: 20,
                                ),
                              ),
                            )
                          : Column(
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
                                            borderRadius:
                                                BorderRadius.circular(25),
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
                                              style: blackHigtTextStyle
                                                  .copyWith(fontSize: 15),
                                            ),
                                            Text(
                                              element.transactionProductItem
                                                      ?.product?.type ??
                                                  '-',
                                              style:
                                                  blackHigtTextStyle.copyWith(
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
                                              fontSize: 12,
                                              fontWeight: regular),
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
                                      style: blackHigtTextStyle.copyWith(
                                          fontSize: 12),
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
                                            borderRadius:
                                                BorderRadius.circular(7),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                    const SizedBox(
                                      height: 13,
                                    ),
                                    Text(
                                      'After',
                                      style: blackHigtTextStyle.copyWith(
                                          fontSize: 12),
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
                                            borderRadius:
                                                BorderRadius.circular(7),
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
                                              state.unHelped(
                                                  context, element.id!);
                                              setState(() {
                                                help = false;
                                                helpReview["${element.id}"] =
                                                    (helpReview["${element.id}"] ??
                                                            0) -
                                                        1;
                                              });
                                            } else {
                                              state.helped(
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
                                                    isVisibelity =
                                                        !isVisibelity;
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
                                            decoration: BoxDecoration(
                                                color: greenColor),
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
                                                              color:
                                                                  subTitleColor),
                                                    ),
                                                    Text(
                                                      timeago.format(
                                                          DateTime.parse(element
                                                              .createdAt
                                                              .toString())),
                                                      style: blackRegulerTextStyle
                                                          .copyWith(
                                                              color:
                                                                  subTitleColor,
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
                    ),
                    Obx(
                      () => state.isLoading.value
                          ? Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: LoadingMore(),
                            )
                          : Container(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Container(
          height: 50,
          width: 50,
          child: FloatingActionButton(
            onPressed: () {
              if (scrollController.hasClients) {
                final position = scrollController.position.minScrollExtent;
                scrollController.animateTo(
                  position,
                  duration: Duration(seconds: 1),
                  curve: Curves.easeOut,
                );
              }
            },
            isExtended: true,
            child: Image.asset('assets/icons/dowload.png'),
          ),
        ),
      ),
    );
  }
}
