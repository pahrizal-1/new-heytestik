import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/skincare_controller.dart';
import 'package:heystetik_mobileapps/core/currency_format.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/pages/solution/view_detail_skincare_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/produk_height_widget.dart';
import 'package:heystetik_mobileapps/models/customer/skincare_model.dart'
    as Skincare;

class SkincareSearch extends StatefulWidget {
  const SkincareSearch({
    super.key,
    required this.search,
  });

  final String search;

  @override
  State<SkincareSearch> createState() => _SkincareSearchState();
}

class _SkincareSearchState extends State<SkincareSearch> {
  final SkincareController state = Get.put(SkincareController());
  final ScrollController scrollController = ScrollController();
  late TextEditingController searchController = TextEditingController();

  int page = 1;
  late String localSearch;
  List<Skincare.Data2> skincare = [];

  @override
  void initState() {
    searchController = TextEditingController(text: widget.search);
    localSearch = widget.search;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      skincare.addAll(
        await state.getAllSkincare(context, page, search: localSearch),
      );
      setState(() {});
    });
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool isTop = scrollController.position.pixels == 0;
        if (!isTop) {
          page += 1;
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
            skincare.addAll(
                await state.getAllSkincare(context, page, search: localSearch));
            setState(() {});
          });
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  size: 24,
                  color: blackColor,
                ),
              ),
              Expanded(
                child: Container(
                  height: 35,
                  decoration: BoxDecoration(
                    color: Color(0xffF1F1F1),
                    border: Border.all(
                      color: fromCssColor("#CCCCCC"),
                    ),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 10,
                        ),
                        child: Image.asset(
                          'assets/icons/search1.png',
                          width: 10,
                        ),
                      ),
                      Container(
                        transform: Matrix4.translationValues(0, -2, 0),
                        constraints: const BoxConstraints(maxWidth: 250),
                        child: TextFormField(
                          controller: searchController,
                          onEditingComplete: () async {
                            print("INI GW KLIK");
                            page = 1;
                            skincare.clear();
                            localSearch = searchController.text;
                            skincare.addAll(await state.getAllSkincare(
                                context, page,
                                search: localSearch));
                            print(skincare);
                            setState(() {});
                          },
                          style: const TextStyle(
                              fontSize: 15, fontFamily: "ProximaNova"),
                          decoration: InputDecoration(
                            hintText: "Cari Skincare",
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              fontFamily: "ProximaNova",
                              color: fromCssColor(
                                '#9B9B9B',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: skincare.isEmpty
          ? Center(
              child: Text(
                'Tidak ada produk',
                style: TextStyle(
                  fontWeight: bold,
                  fontFamily: 'ProximaNova',
                  fontSize: 20,
                ),
              ),
            )
          : SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 12, left: 25, right: 25),
                    child: Wrap(
                      runSpacing: 12,
                      spacing: 12,
                      children: skincare
                          .map((e) => InkWell(
                                onTap: () {
                                  Get.to(DetailSkinCarePage(
                                    productId: e.id!.toInt(),
                                  ));
                                },
                                child: Produkheight(
                                  produkId: e.id!.toInt(),
                                  namaBrand: e.skincareDetail!.brand.toString(),
                                  namaProduk: e.name.toString(),
                                  diskonProduk: '20',
                                  hargaDiskon:
                                      CurrencyFormat.convertToIdr(e.price, 0),
                                  harga:
                                      CurrencyFormat.convertToIdr(e.price, 0),
                                  urlImg: e.mediaProducts!.isEmpty
                                      ? ''
                                      : '${Global.FILE}/${e.mediaProducts![0].media!.path}',
                                  rating: e.rating.toString(),
                                ),
                              ))
                          .toList(),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
