import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/akun_home_page.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

import '../../theme/theme.dart';

import '../../widget/produk_wishlist._widgets.dart';
import '../solution/keranjang_page.dart';

class WishListPage extends StatefulWidget {
  const WishListPage({super.key});

  @override
  State<WishListPage> createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> {
  bool isSelecteTampilan = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
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
                  'Wishlist',
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AkunHomePage()));
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
      body: ListView(
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
                            '4 Produk',
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
              content: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 25,
                    ),
                    child: Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: [
                        ProdukWitlist(
                            namaBrand: 'ISISPHARMA',
                            namaProduk: 'Teenderm Gel',
                            diskonProduk: '20',
                            hargaDiskon: '250.000',
                            harga: '200.000',
                            urlImg: 'assets/images/edocare.png',
                            rating: '4.9 (120k)',
                            kota: 'Amerika Serikat'),
                        ProdukWitlist(
                            namaBrand: 'ISISPHARMA',
                            namaProduk: 'Teenderm Gel',
                            diskonProduk: '20',
                            hargaDiskon: '250.000',
                            harga: '200.000',
                            urlImg: 'assets/images/edocare.png',
                            rating: '4.9 (120k)',
                            kota: 'Amerika Serikat'),
                        ProdukWitlist(
                            namaBrand: 'ISISPHARMA',
                            namaProduk: 'Teenderm Gel',
                            diskonProduk: '20',
                            hargaDiskon: '250.000',
                            harga: '200.000',
                            urlImg: 'assets/images/edocare.png',
                            rating: '4.9 (120k)',
                            kota: 'Amerika Serikat'),
                        ProdukWitlist(
                            namaBrand: 'ISISPHARMA',
                            namaProduk: 'Teenderm Gel',
                            diskonProduk: '20',
                            hargaDiskon: '250.000',
                            harga: '200.000',
                            urlImg: 'assets/images/edocare.png',
                            rating: '4.9 (120k)',
                            kota: 'Amerika Serikat'),
                      ],
                    ),
                  )
                ],
              )),
          const SizedBox(
            height: 14,
          ),
        ],
      ),
    );
  }
}
