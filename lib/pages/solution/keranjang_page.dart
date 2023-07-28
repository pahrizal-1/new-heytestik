import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/cart_controller.dart';
import 'package:heystetik_mobileapps/core/currency_format.dart';
import 'package:heystetik_mobileapps/core/current_time.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/akun_home_page.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/wishlist_page.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';

import '../../theme/theme.dart';
import '../../widget/appbar_widget.dart';
import '../../widget/button_widget.dart';

import '../../widget/produk_card_widget.dart';
import '../../widget/produk_widget.dart';
import '../../widget/show_dialog_sousions_payment.dart';

class KeranjangPage extends StatefulWidget {
  const KeranjangPage({super.key});

  @override
  State<KeranjangPage> createState() => _KeranjangPageState();
}

class _KeranjangPageState extends State<KeranjangPage> {
  final CartController state = Get.put(CartController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      state.getCart(context);
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
                  padding: lsymetric,
                  child: Row(
                    children: [
                      const ProdukKeranjang(
                        namaBrand: 'ISISPHARMA',
                        namaProduk: 'Teenderm Gel',
                        diskonProduk: '20%',
                        hargaDiskon: 'Rp1,100,00',
                        harga: 'Rp900.000',
                        urlImg: 'assets/images/plasma.png',
                        rating: '4.9 (120k)',
                      ),
                      const ProdukKeranjang(
                        namaBrand: 'CANTABRIA',
                        namaProduk:
                            'Neoretin Discrom Control Pigment Neutralizer Serum',
                        diskonProduk: '20%',
                        hargaDiskon: 'Rp500.000',
                        harga: 'Rp200.000',
                        urlImg: 'assets/images/catabria.png',
                        rating: '4.9 (120k)',
                      ),
                      const ProdukKeranjang(
                        namaBrand: 'ISISPHARMA',
                        namaProduk: 'Teenderm Gel',
                        diskonProduk: '20%',
                        hargaDiskon: 'Rp250.000',
                        harga: 'Rp200.000',
                        urlImg: 'assets/images/view-bg-skincare.png',
                        rating: '4.9 (120k)',
                      ),
                      const ProdukKeranjang(
                        namaBrand: 'ISISPHARMA',
                        namaProduk: 'Endocare Tensage Cream',
                        diskonProduk: '20%',
                        hargaDiskon: 'Rp250.000',
                        harga: 'Rp200.000',
                        urlImg: 'assets/images/catabria.png',
                        rating: '4.9 (120k)',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 25,
        ),
        height: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total Perawatan',
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
            ButtonGreenWidget(
              title: 'Bayar',
              onPressed: () {
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
                  builder: (context) => PesananMoreDialog(),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
