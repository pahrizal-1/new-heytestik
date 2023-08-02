// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/cart_controller.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/skincare_controller.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/wishlist_controller.dart';
import 'package:heystetik_mobileapps/core/currency_format.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/akun_home_page.dart';
import 'package:heystetik_mobileapps/pages/solution/category_skincare.dart';
import 'package:heystetik_mobileapps/pages/solution/keranjang_page.dart';

import 'package:heystetik_mobileapps/pages/solution/ulasan_solution_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';
import 'package:heystetik_mobileapps/widget/pencarian_search_widget.dart';
import 'package:heystetik_mobileapps/widget/produk_height_widget.dart';
import 'package:heystetik_mobileapps/widget/share_solusion_widget_page.dart';

import '../../widget/Text_widget.dart';
import '../../widget/produk_widget.dart';

class DetailSkinCarePage extends StatefulWidget {
  int productId;
  int id;
  DetailSkinCarePage({required this.productId, required this.id, super.key});

  @override
  State<DetailSkinCarePage> createState() => _DetailSkinCarePageState();
}

class _DetailSkinCarePageState extends State<DetailSkinCarePage> {
  final SkincareController state = Get.put(SkincareController());
  final WishlistController wishlist = Get.put(WishlistController());
  final CartController cart = Get.put(CartController());
  bool isVisibelity = true;
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      state.detailSkincare(context, widget.id);
      state.getSkincare(context);
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
                    state.skincareDetail.value.skincareDetail?.brand ?? '',
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
      body: Obx(
        () => LoadingWidget(
          isLoading: state.isLoadingDetailSkincare.value,
          child: ListView(
            children: [
              Container(
                height: 375,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                        '${Global.FILE}/${state.skincareDetail.value.mediaProducts?[0].media?.path}',
                      ),
                      fit: BoxFit.cover),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 12, left: 24, right: 24, bottom: 17),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 28,
                          height: 13,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: const Color.fromRGBO(201, 42, 42, 0.2)),
                          child: Center(
                            child: Text(
                              '20%',
                              style: blackHigtTextStyle.copyWith(
                                  color: redColor, fontSize: 11),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          CurrencyFormat.convertToIdr(
                            state.skincareDetail.value.price ?? 0,
                            0,
                          ),
                          style: subGreyTextStyle.copyWith(
                            fontSize: 12,
                            decoration: TextDecoration.lineThrough,
                            decorationThickness: 2,
                            color: const Color(0xff9B9B9B),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          CurrencyFormat.convertToIdr(
                            state.skincareDetail.value.price ?? 0,
                            0,
                          ),
                          style: blackHigtTextStyle.copyWith(fontSize: 20),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () async {
                            await wishlist.addWishlist(
                                context, widget.productId);
                          },
                          child: SvgPicture.asset(
                            'assets/icons/love-icons.svg',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      '${state.skincareDetail.value.skincareDetail?.brand}',
                      style: blackTextStyle.copyWith(fontSize: 20),
                    ),
                    Text(
                      '${state.skincareDetail.value.name}',
                      style: blackRegulerTextStyle.copyWith(color: blackColor),
                    ),
                    Text(
                      '${state.skincareDetail.value.skincareDetail?.specificationNetto}${state.skincareDetail.value.skincareDetail?.specificationNettoType}',
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
                                '${state.skincareDetail.value.rating}',
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
                    Stack(
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
                                    'Ada Promo Spesial',
                                    style: blackHigtTextStyle.copyWith(
                                        fontSize: 15),
                                  ),
                                  Text(
                                    'Masih ada 6 kupon promo buat kamu!',
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
                  ],
                ),
              ),
              const dividergreen(),
              Padding(
                padding: const EdgeInsets.only(
                    top: 12, left: 24, right: 24, bottom: 17),
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
                      ontap: () {
                        Get.to(
                          CategorySkinCare(
                            category:
                                state.skincareDetail.value.category.toString(),
                          ),
                        );
                      },
                      title1: 'Kategori',
                      title2: '${state.skincareDetail.value.category}',
                      textColor: greenColor,
                    ),
                    TitleDetail(
                      ontap: () {
                        Get.to(
                          CategorySkinCare(
                            category:
                                state.skincareDetail.value.display.toString(),
                          ),
                        );
                      },
                      title1: 'Etalase Skincare',
                      title2: '${state.skincareDetail.value.display}',
                      textColor: greenColor,
                    ),
                    TitleDetail(
                      title1: 'Tekstur',
                      title2:
                          '${state.skincareDetail.value.skincareDetail?.specificationTexture}',
                      textColor: blackColor,
                      fontWeight: regular,
                    ),
                    TitleDetail(
                      title1: 'Kemasan',
                      title2:
                          '${state.skincareDetail.value.skincareDetail?.specificationPackagingType} ${state.skincareDetail.value.skincareDetail?.specificationNetto}${state.skincareDetail.value.skincareDetail?.specificationNettoType}',
                      textColor: blackColor,
                      fontWeight: regular,
                    ),
                    TitleDetail(
                      title1: 'No. BPOM',
                      title2:
                          '${state.skincareDetail.value.skincareDetail?.specificationBpom}',
                      textColor: blackColor,
                      fontWeight: regular,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    DescripsiText(
                      title1: 'Deskripsi',
                      subtitle2:
                          '${state.skincareDetail.value.skincareDetail?.description}',
                    ),
                    DescripsiText(
                      title1: 'Petunjuk Penggunaan',
                      subtitle2:
                          '${state.skincareDetail.value.skincareDetail?.specificationHowToUse}',
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isVisibelity = !isVisibelity;
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
                            isVisibelity
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
                      visible: isVisibelity,
                      child: Text(
                        '${state.skincareDetail.value.skincareDetail?.specificationIngredients}',
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
              const SizedBox(
                height: 25,
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
                        Text(
                          '5.0',
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
                                  '99% Sobat Hey',
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
                                  '110 rating',
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
                                  '100 ulasan',
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
                                  '5.0',
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
                                      'Perawatan',
                                      style: blackTextStyle.copyWith(
                                          fontSize: 10, fontWeight: regular),
                                    ),
                                    Text(
                                      '54 ulasan',
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
                                  '5.0',
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
                                      'Pelayanan',
                                      style: blackTextStyle.copyWith(
                                          fontSize: 10, fontWeight: regular),
                                    ),
                                    Text(
                                      '16 ulasan',
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
                                  '5.0',
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
                                      'Manajemen',
                                      style: blackTextStyle.copyWith(
                                          fontSize: 10, fontWeight: regular),
                                    ),
                                    Text(
                                      '54 ulasan',
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
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => const UlasanPage()));
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Jessy',
                              style: blackHigtTextStyle.copyWith(fontSize: 15),
                            ),
                            Text(
                              'Perawatan Peeling TCA Ringan',
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
                        const Icon(
                          Icons.star,
                          size: 12,
                          color: Color(0xffFFC36A),
                        ),
                        const Icon(
                          Icons.star,
                          size: 12,
                          color: Color(0xffFFC36A),
                        ),
                        const Icon(
                          Icons.star,
                          size: 12,
                          color: Color(0xffFFC36A),
                        ),
                        const Icon(
                          Icons.star,
                          size: 12,
                          color: Color(0xffFFC36A),
                        ),
                        const Icon(
                          Icons.star,
                          size: 12,
                          color: Color(0xffFFC36A),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Text(
                          '1 Bulan Yang lalu',
                          style: blackHigtTextStyle.copyWith(
                              fontSize: 12, fontWeight: regular),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    Text(
                      'Makasih buat dokter dan beautician nya yang ramah. Puas banget perawatan disini, jerawatku makin sirnaaaa.',
                      style: greyTextStyle.copyWith(
                          fontSize: 13, color: const Color(0xff6B6B6B)),
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    Image.asset(
                      'assets/images/review-wajah.png',
                      width: 72,
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 6,
                color: Color(0xffF1F1F1),
              ),
              const SizedBox(
                height: 19,
              ),
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
                      child: Container(
                        height: 29,
                        decoration: BoxDecoration(
                            border: Border.all(color: greenColor, width: 1.5),
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
                  ],
                ),
              ),
              const SizedBox(
                height: 19,
              ),
              const dividergreen(),
              const SizedBox(
                height: 19,
              ),
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: Obx(
                    () => Center(
                      child: LoadingWidget(
                        isLoading: state.isLoadingSkincare.value,
                        child: Wrap(
                          spacing: 23,
                          runSpacing: 12,
                          children: state.skincare
                              .map(
                                (e) => InkWell(
                                  onTap: () {
                                    Get.to(DetailSkinCarePage(
                                      id: e.id!.toInt(),
                                      productId: e.mediaProducts![0].productId!
                                          .toInt(),
                                    ));
                                  },
                                  child: Produkheight(
                                    produkId: e.id!.toInt(),
                                    namaBrand:
                                        e.skincareDetail!.brand.toString(),
                                    namaProduk: e.name.toString(),
                                    diskonProduk: '20',
                                    hargaDiskon:
                                        CurrencyFormat.convertToIdr(e.price, 0),
                                    harga:
                                        CurrencyFormat.convertToIdr(e.price, 0),
                                    urlImg:
                                        '${Global.FILE}/${e.mediaProducts![0].media!.path}',
                                    // rating: '4.9 (120k)',
                                    rating: e.rating.toString(),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // SingleChildScrollView(
              //   scrollDirection: Axis.horizontal,
              //   child: Padding(
              //     padding: lsymetric,
              //     child: Row(
              //       children: [
              //         ProdukKeranjang(
              //           namaBrand: 'ISISPHARMA',
              //           namaProduk: 'Teenderm Gel',
              //           diskonProduk: '20%',
              //           hargaDiskon: 'Rp1,100,00',
              //           harga: 'Rp900.000',
              //           urlImg: 'assets/images/plasma.png',
              //           rating: '4.9 (120k)',
              //         ),
              //         ProdukKeranjang(
              //           namaBrand: 'CANTABRIA',
              //           namaProduk:
              //               'Neoretin Discrom Control Pigment Neutralizer Serum',
              //           diskonProduk: '20%',
              //           hargaDiskon: 'Rp500.000',
              //           harga: 'Rp200.000',
              //           urlImg: 'assets/images/catabria.png',
              //           rating: '4.9 (120k)',
              //         ),
              //         ProdukKeranjang(
              //           namaBrand: 'ISISPHARMA',
              //           namaProduk: 'Teenderm Gel',
              //           diskonProduk: '20%',
              //           hargaDiskon: 'Rp250.000',
              //           harga: 'Rp200.000',
              //           urlImg: 'assets/images/view-bg-skincare.png',
              //           rating: '4.9 (120k)',
              //         ),
              //         ProdukKeranjang(
              //           namaBrand: 'ISISPHARMA',
              //           namaProduk: 'Endocare Tensage Cream',
              //           diskonProduk: '20%',
              //           hargaDiskon: 'Rp250.000',
              //           harga: 'Rp200.000',
              //           urlImg: 'assets/images/catabria.png',
              //           rating: '4.9 (120k)',
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              const SizedBox(
                height: 27,
              ),
              Divider(
                thickness: 2,
                color: borderColor,
              ),
              const SizedBox(
                height: 17,
              ),
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: Obx(
                    () => Center(
                      child: LoadingWidget(
                        isLoading: state.isLoadingSkincare.value,
                        child: Wrap(
                          spacing: 23,
                          runSpacing: 12,
                          children: state.skincare
                              .map(
                                (e) => InkWell(
                                  onTap: () {
                                    Get.to(DetailSkinCarePage(
                                      id: e.id!.toInt(),
                                      productId: e.mediaProducts![0].productId!
                                          .toInt(),
                                    ));
                                  },
                                  child: Produkheight(
                                    produkId: e.id!.toInt(),
                                    namaBrand:
                                        e.skincareDetail!.brand.toString(),
                                    namaProduk: e.name.toString(),
                                    diskonProduk: '20',
                                    hargaDiskon:
                                        CurrencyFormat.convertToIdr(e.price, 0),
                                    harga:
                                        CurrencyFormat.convertToIdr(e.price, 0),
                                    urlImg:
                                        '${Global.FILE}/${e.mediaProducts![0].media!.path}',
                                    // rating: '4.9 (120k)',
                                    rating: e.rating.toString(),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // SingleChildScrollView(
              //   scrollDirection: Axis.horizontal,
              //   child: Padding(
              //     padding: lsymetric,
              //     child: Row(
              //       children: [
              //         ProdukKeranjang(
              //           namaBrand: 'ISISPHARMA',
              //           namaProduk: 'Teenderm Gel',
              //           diskonProduk: '20%',
              //           hargaDiskon: 'Rp1,100,00',
              //           harga: 'Rp900.000',
              //           urlImg: 'assets/images/plasma.png',
              //           rating: '4.9 (120k)',
              //         ),
              //         ProdukKeranjang(
              //           namaBrand: 'CANTABRIA',
              //           namaProduk:
              //               'Neoretin Discrom Control Pigment Neutralizer Serum',
              //           diskonProduk: '20%',
              //           hargaDiskon: 'Rp500.000',
              //           harga: 'Rp200.000',
              //           urlImg: 'assets/images/catabria.png',
              //           rating: '4.9 (120k)',
              //         ),
              //         ProdukKeranjang(
              //           namaBrand: 'ISISPHARMA',
              //           namaProduk: 'Teenderm Gel',
              //           diskonProduk: '20%',
              //           hargaDiskon: 'Rp250.000',
              //           harga: 'Rp200.000',
              //           urlImg: 'assets/images/view-bg-skincare.png',
              //           rating: '4.9 (120k)',
              //         ),
              //         ProdukKeranjang(
              //           namaBrand: 'ISISPHARMA',
              //           namaProduk: 'Endocare Tensage Cream',
              //           diskonProduk: '20%',
              //           hargaDiskon: 'Rp250.000',
              //           harga: 'Rp200.000',
              //           urlImg: 'assets/images/catabria.png',
              //           rating: '4.9 (120k)',
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
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
                    onTap: () {},
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
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => ReservasiPage(),
                      //     ));
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
                    await cart.addCart(context, widget.productId, 1, '');
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
                      // ignore: prefer_const_constructors
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
