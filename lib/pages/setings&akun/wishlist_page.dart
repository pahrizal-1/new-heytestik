import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/wishlist_controller.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/akun_home_page.dart';
import 'package:heystetik_mobileapps/pages/solution/view_detail_drug_page.dart';
import 'package:heystetik_mobileapps/pages/solution/view_detail_skincare_page.dart';
import 'package:heystetik_mobileapps/widget/icons_notifikasi.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import '../../theme/theme.dart';
import 'package:heystetik_mobileapps/models/customer/wishlist_model.dart';
import '../../widget/appbar_widget.dart';
import '../../widget/produk_wishlist_widgets.dart';

class WishListPage extends StatefulWidget {
  const WishListPage({super.key});

  @override
  State<WishListPage> createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> {
  final WishlistController state = Get.put(WishlistController());
  final ScrollController scrollController = ScrollController();

  int page = 1;
  List<Data2> wishlist = [];

  @override
  void initState() {
    state.searchController.clear();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      wishlist.addAll(await state.getWistlist(context, page));
      setState(() {});
    });

    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool isTop = scrollController.position.pixels == 0;
        if (!isTop) {
          page += 1;
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
            state.isLoadingMore.value = true;
            wishlist.addAll(await state.getWistlist(
              context,
              page,
            ));
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
      backgroundColor: whiteColor,
      appBar: AppBar(
        elevation: 0,
        titleSpacing: 0,
        iconTheme: iconthemeblack(),
        backgroundColor: Colors.transparent,
        title: Text(
          'Wishlist',
          style: blackTextStyle.copyWith(
              fontSize: 20, overflow: TextOverflow.ellipsis),
        ),
        actions: [
          Row(
            children: [
              TotalKeranjang(iconcolor: blackColor),
              const SizedBox(
                width: 14,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AkunHomePage(),
                    ),
                  );
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
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(56.0),
          child: Container(
            padding:
                const EdgeInsets.only(left: 25, right: 25, bottom: 10, top: 10),
            height: 56.0,
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                color: const Color(0xffF1F1F1),
                border: Border.all(
                  color: fromCssColor('#CCCCCC'),
                ),
                borderRadius: BorderRadius.circular(7),
              ),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 10,
                  ),
                  child: Image.asset(
                    'assets/icons/search1.png',
                    width: 10,
                  ),
                ),
                Expanded(
                  child: Container(
                    transform: Matrix4.translationValues(0, -3, 0),
                    constraints: const BoxConstraints(maxWidth: 300),
                    child: TextFormField(
                      controller: state.searchController,
                      onEditingComplete: () async {
                        page = 1;
                        wishlist.clear();
                        wishlist.addAll(
                          await state.getWistlist(
                            context,
                            page,
                            search: state.searchController.text,
                          ),
                        );
                        setState(() {});
                      },
                      style: const TextStyle(
                          fontSize: 15, fontFamily: 'ProximaNova'),
                      decoration: InputDecoration(
                        hintText: 'Cari Wishlist',
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          fontFamily: 'ProximaNova',
                          color: fromCssColor(
                            '#9B9B9B',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
      body: Obx(
        () => LoadingWidget(
          isLoading: state.isLoadingMore.value ? false : state.isLoading.value,
          child: ListView(
            controller: scrollController,
            children: [
              StickyHeader(
                header: Container(
                  padding: const EdgeInsets.only(top: 10, bottom: 9),
                  color: whiteColor,
                  child: Column(
                    children: [
                      Padding(
                        padding: lsymetric,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${wishlist.length} Produk',
                              style: blackTextStyle.copyWith(
                                  color: const Color(0xff6B6B6B), fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 13,
                      ),
                    ],
                  ),
                ),
                content: Padding(
                  padding: lsymetric,
                  child: wishlist.isEmpty
                      ? Center(
                          child: Text(
                            'Belum ada produk',
                            style: TextStyle(
                              fontWeight: bold,
                              fontFamily: 'ProximaNova',
                              fontSize: 18,
                            ),
                          ),
                        )
                      : GridView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical, // use it
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 20,
                            childAspectRatio: 0.5,
                          ),
                          itemCount: wishlist.length,
                          itemBuilder: (BuildContext context, int index) {
                            if (wishlist[index].product?.type == 'SKINCARE') {
                              return InkWell(
                                onTap: () {
                                  Get.to(
                                    () => DetailSkinCarePage(
                                      productId: wishlist[index].product!.id!,
                                    ),
                                  );
                                },
                                child: ProdukWishlistSkinCare(
                                  data: wishlist[index],
                                  onDelete: () async {
                                    page = 1;
                                    wishlist.clear();
                                    wishlist.addAll(
                                      await state.getWistlist(
                                        context,
                                        page,
                                        search: state.searchController.text,
                                      ),
                                    );
                                    setState(() {});
                                  },
                                ),
                              );
                            }
                            if (wishlist[index].product?.type == 'DRUGS') {
                              return InkWell(
                                onTap: () {
                                  Get.to(
                                    () => DetailDrugPage(
                                      drugId: wishlist[index].product!.id!,
                                    ),
                                  );
                                },
                                child: ProdukWishlistObat(
                                  data: wishlist[index],
                                  onDelete: () async {
                                    page = 1;
                                    wishlist.clear();
                                    wishlist.addAll(
                                      await state.getWistlist(
                                        context,
                                        page,
                                        search: state.searchController.text,
                                      ),
                                    );
                                    setState(() {});
                                  },
                                ),
                              );
                            }
                            return null;
                          },
                        ),
                ),
              ),
              Center(
                child: Obx(
                  () => state.isLoading.value
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: LoadingMore(),
                        )
                      : Container(),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
