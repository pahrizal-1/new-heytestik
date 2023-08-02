import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/cart_controller.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/skincare_controller.dart';
import 'package:heystetik_mobileapps/core/currency_format.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/akun_home_page.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/wishlist_page.dart';
import 'package:heystetik_mobileapps/pages/solution/view_detail_skincare_page.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';
import 'package:heystetik_mobileapps/widget/produk_height_widget.dart';

import '../../theme/theme.dart';
import '../../widget/appbar_widget.dart';

import '../../widget/produk_card_widget.dart';
import '../../widget/produk_widget.dart';

class KeranjangPage extends StatefulWidget {
  const KeranjangPage({super.key});

  @override
  State<KeranjangPage> createState() => _KeranjangPageState();
}

class _KeranjangPageState extends State<KeranjangPage> {
  final CartController state = Get.put(CartController());
  final SkincareController stateSkincare = Get.put(SkincareController());
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      state.getCart(context);
      stateSkincare.getSkincare(context);
    });
  }

  bool isSelected = false;
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
          preferredSize: const Size.fromHeight(39.0),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10, left: 25, top: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          isSelected = !isSelected;
                        });
                      },
                      child: Container(
                        width: 23,
                        padding: const EdgeInsets.all(4),
                        height: 23,
                        decoration: BoxDecoration(
                          color: isSelected ? greenColor : null,
                          borderRadius: BorderRadius.circular(7),
                          border: Border.all(
                              color: isSelected ? greenColor : borderColor),
                        ),
                        child: isSelected
                            ? Image.asset('assets/icons/chek_new.png')
                            : null,
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
          isLoading: state.isLoading.value,
          child: ListView(
            children: [
              state.filterData.isEmpty
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
                      shrinkWrap: true,
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.filterData.length,
                      itemBuilder: (BuildContext context, int i) {
                        return ProdukCardWidget(
                          cartId: state.filterData[i].id!.toInt(),
                          productId: state.filterData[i].productId!.toInt(),
                          qty: state.filterData[i].qty!.toInt(),
                          imageProduk:
                              '${Global.FILE}/${state.filterData[i].product!.mediaProducts?[0].media?.path}',
                          merkProduk: '${state.filterData[i].product?.name}',
                          penggunaanJadwal:
                              '${state.filterData[i].product?.skincareDetail?.specificationHowToUse}',
                          penggunaan: '2x sehari',
                          harga: CurrencyFormat.convertToIdr(
                              state.filterData[i].product?.price ?? 0, 0),
                          hintText: '${state.filterData[i].notes}',
                          namaProdik: '${state.filterData[i].product?.type}',
                          packagingType:
                              '${state.filterData[i].product?.skincareDetail?.specificationPackagingType}',
                          netto:
                              '${state.filterData[i].product?.skincareDetail?.specificationNetto}',
                          nettoType:
                              '${state.filterData[i].product?.skincareDetail?.specificationNettoType}',
                        );
                      },
                    ),
              const SizedBox(
                height: 18,
              ),
              Padding(
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
              const SizedBox(
                height: 17,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: Obx(
                    () => Center(
                      child: LoadingWidget(
                        isLoading: stateSkincare.isLoadingSkincare.value,
                        child: Wrap(
                          spacing: 23,
                          runSpacing: 12,
                          children: stateSkincare.skincare
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
              //         const ProdukKeranjang(
              //           namaBrand: 'ISISPHARMA',
              //           namaProduk: 'Teenderm Gel',
              //           diskonProduk: '20%',
              //           hargaDiskon: 'Rp1,100,00',
              //           harga: 'Rp900.000',
              //           urlImg: 'assets/images/plasma.png',
              //           rating: '4.9 (120k)',
              //         ),
              //         const ProdukKeranjang(
              //           namaBrand: 'CANTABRIA',
              //           namaProduk:
              //               'Neoretin Discrom Control Pigment Neutralizer Serum',
              //           diskonProduk: '20%',
              //           hargaDiskon: 'Rp500.000',
              //           harga: 'Rp200.000',
              //           urlImg: 'assets/images/catabria.png',
              //           rating: '4.9 (120k)',
              //         ),
              //         const ProdukKeranjang(
              //           namaBrand: 'ISISPHARMA',
              //           namaProduk: 'Teenderm Gel',
              //           diskonProduk: '20%',
              //           hargaDiskon: 'Rp250.000',
              //           harga: 'Rp200.000',
              //           urlImg: 'assets/images/view-bg-skincare.png',
              //           rating: '4.9 (120k)',
              //         ),
              //         const ProdukKeranjang(
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
                    Row(
                      children: [
                        Text(
                          'Rp0',
                          style: blackHigtTextStyle.copyWith(fontSize: 20),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        const Icon(Icons.keyboard_arrow_down)
                      ],
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
                      onPressed: () {},
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
                            'Bayar',
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
