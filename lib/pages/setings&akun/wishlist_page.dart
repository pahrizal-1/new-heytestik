import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/wishlist_controller.dart';
import 'package:heystetik_mobileapps/core/currency_format.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/akun_home_page.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

import '../../theme/theme.dart';

import '../../widget/appbar_widget.dart';
import '../../widget/produk_wishlist._widgets.dart';
import '../solution/keranjang_page.dart';

class WishListPage extends StatefulWidget {
  const WishListPage({super.key});

  @override
  State<WishListPage> createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> {
  final WishlistController state = Get.put(WishlistController());

  bool isSelecteTampilan = true;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await state.getWistlist(context);
    });
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
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const KeranjangPage(),
                ),
              );
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
                      onChanged: (value) {
                        state.onChangeFilterText(value);
                      },
                      onEditingComplete: () {
                        state.getWistlist(context,
                            search: state.searchController.text);
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
          isLoading: state.isLoading.value,
          child: ListView(
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
                              '${state.filterData.length} Produk',
                              style: blackTextStyle.copyWith(
                                  color: const Color(0xff6B6B6B), fontSize: 15),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isSelecteTampilan = !isSelecteTampilan;
                                });
                              },
                              child: Row(
                                children: [
                                  Text(
                                    'Tampilan',
                                    style: blackTextStyle.copyWith(
                                        color: const Color(0xff6B6B6B),
                                        fontSize: 15),
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  isSelecteTampilan
                                      ? SvgPicture.asset(
                                          'assets/icons/tampilan1.svg',
                                          width: 12,
                                          height: 12,
                                        )
                                      : SvgPicture.asset(
                                          'assets/icons/tampillan2.svg',
                                          width: 12,
                                          height: 12,
                                        )
                                ],
                              ),
                            )
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
                  child: state.filterData.isEmpty
                      ? Center(
                          child: Text(
                            'Belum ada wishlist',
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
                            mainAxisSpacing: 12,
                            childAspectRatio: 0.5,
                          ),
                          itemCount: state.filterData.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ProdukWitlist(
                              id: state.filterData[index].id!.toInt(),
                              namaBrand: state.filterData[index].product!
                                      .skincareDetail?.brand ??
                                  '-',
                              namaProduk:
                                  state.filterData[index].product?.name ?? '-',
                              diskonProduk: '20',
                              hargaDiskon: CurrencyFormat.convertToIdr(
                                state.filterData[index].product?.price,
                                0,
                              ),
                              harga: CurrencyFormat.convertToIdr(
                                state.filterData[index].product?.price,
                                0,
                              ),
                              urlImg:
                                  '${Global.FILE}/${state.filterData[index].product?.mediaProducts?[0].media?.path}',
                              rating:
                                  '${state.filterData[index].product?.rating} (120k)',
                              kota: 'Amerika Serikat',
                            );
                          },
                        ),
                ),
              ),
              const SizedBox(
                height: 14,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
