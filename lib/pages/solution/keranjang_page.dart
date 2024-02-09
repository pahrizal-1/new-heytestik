import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/cart_controller.dart';
import 'package:heystetik_mobileapps/core/currency_format.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/akun_home_page.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/wishlist_page.dart';
import 'package:heystetik_mobileapps/pages/solution/pembayaran_produk_page.dart';
import 'package:heystetik_mobileapps/pages/solution/view_detail_drug_page.dart';
import 'package:heystetik_mobileapps/pages/solution/view_detail_skincare_page.dart';
import 'package:heystetik_mobileapps/widget/alert_dialog.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';
import 'package:heystetik_mobileapps/widget/skincare_widget.dart';
import 'package:heystetik_mobileapps/models/customer/cart_model.dart';
import '../../theme/theme.dart';
import '../../widget/appbar_widget.dart';

import '../../widget/produk_card_widget.dart';

class KeranjangPage extends StatefulWidget {
  const KeranjangPage({super.key});

  @override
  State<KeranjangPage> createState() => _KeranjangPageState();
}

class _KeranjangPageState extends State<KeranjangPage> {
  final CartController state = Get.put(CartController());
  final ScrollController scrollController = ScrollController();
  final TextEditingController searchController = TextEditingController();

  int page = 1;
  String? search;
  List<Data2> cart = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      state.recentlyProductViewed(context);
      cart.addAll(await state.getCart(context, page, search: search));
      setState(() {});
    });

    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool isTop = scrollController.position.pixels == 0;
        if (!isTop) {
          page += 1;
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
            state.isLoadingMore.value = true;
            cart.addAll(await state.getCart(context, page, search: search));
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
        titleSpacing: 0,
        iconTheme: iconthemeblack(),
        backgroundColor: whiteColor,
        title: Padding(
          padding: const EdgeInsets.only(left: 6),
          child: Text(
            'Keranjang',
            style: blackHigtTextStyle.copyWith(fontSize: 20),
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const WishListPage(),
                ),
              );
            },
            child: SvgPicture.asset(
              'assets/icons/love-icons.svg',
              color: blackColor,
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
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(cart.isEmpty ? 0.0 : 39.0),
          child: cart.isEmpty
              ? Container()
              : Padding(
                  padding: const EdgeInsets.only(bottom: 10, left: 25, top: 10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              state.onChecklist(state.checklist.length, true);
                              setState(() {});
                            },
                            child: Obx(
                              () => Container(
                                width: 23,
                                padding: const EdgeInsets.all(4),
                                height: 23,
                                decoration: BoxDecoration(
                                  color: state.isAllSelected.value
                                      ? greenColor
                                      : null,
                                  borderRadius: BorderRadius.circular(7),
                                  border: Border.all(
                                      color: state.isAllSelected.value
                                          ? greenColor
                                          : borderColor),
                                ),
                                child: state.isAllSelected.value
                                    ? Image.asset('assets/icons/chek_new.png')
                                    : null,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          Text(
                            'Pilih semua',
                            style: blackRegulerTextStyle,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
        ),
      ),
      body: Obx(
        () => LoadingWidget(
          isLoading: state.isLoadingMore.value ? false : state.isLoading.value,
          child: ListView(
            children: [
              cart.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.only(top: 50, bottom: 20),
                      child: Center(
                        child: Text(
                          'Keranjang masih kosong nih',
                          style: TextStyle(
                            fontWeight: bold,
                            fontFamily: 'ProximaNova',
                            fontSize: 18,
                          ),
                        ),
                      ),
                    )
                  : ListView.builder(
                      controller: scrollController,
                      shrinkWrap: true,
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: cart.length,
                      itemBuilder: (BuildContext context, int i) {
                        return InkWell(
                          onTap: () {
                            if (cart[i].product?.type == 'SKINCARE') {
                              Get.to(() => DetailSkinCarePage(
                                    productId: cart[i].productId!.toInt(),
                                  ));
                            }

                            if (cart[i].product?.type == 'DRUGS') {
                              Get.to(
                                () => DetailDrugPage(
                                  drugId: cart[i].product!.id!,
                                ),
                              );
                            }
                          },
                          child: ProdukCardWidget(
                            index: i,
                            data: cart[i],
                          ),
                        );
                      },
                    ),
              Obx(
                () => state.isLoading.value ? LoadingMore() : Container(),
              ),
              SizedBox(
                height: state.recentlyProduct.isEmpty ? 0 : 17,
              ),
              state.recentlyProduct.isEmpty
                  ? Container()
                  : Padding(
                      padding: lsymetric,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Kamu sempat lihat-lihat ini',
                            style: blackHigtTextStyle.copyWith(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
              SizedBox(
                height: state.recentlyProduct.isEmpty ? 0 : 17,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: Obx(
                    () => Center(
                      child: LoadingWidget(
                        isLoading: state.isLoadingMore.value,
                        child: Wrap(
                          spacing: 23,
                          runSpacing: 12,
                          children: state.recentlyProduct.map((e) {
                            return InkWell(
                              onTap: () {
                                Get.to(
                                  () => DetailSkinCarePage(
                                    productId: e.id!.toInt(),
                                  ),
                                );
                              },
                              child: SkincareWidget(
                                produkId: e.id!.toInt(),
                                namaBrand: e.skincareDetail!.brand.toString(),
                                namaProduk: ' e.name.toString()',
                                diskonProduk: '20',
                                hargaDiskon:
                                    CurrencyFormat.convertToIdr(e.price, 0),
                                harga: CurrencyFormat.convertToIdr(e.price, 0),
                                urlImg:
                                    '${Global.FILE}/${e.mediaProducts![0].media!.path}',
                                // rating: '4.9 (120k)',
                                rating: e.rating.toString(),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
        child: Wrap(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Tagihan',
                      style: blackRegulerTextStyle,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Obx(
                      () => Text(
                        CurrencyFormat.convertToIdr(
                            state.totalAmountSelected.value, 0),
                        style: blackHigtTextStyle.copyWith(fontSize: 20),
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
                        if (cart.isEmpty ||
                            state.totalAmountSelected.value <= 0) {
                          showDialog(
                            context: context,
                            builder: (context) => AlertWidget(
                              subtitle: 'Harap pilih produk terlebih dahulu',
                            ),
                          );
                          return;
                        }

                        // redirect
                        Get.to(() => PembayaranProduk(
                              pesan: state.checkedList,
                              isCart: true,
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
      ),
    );
  }
}
