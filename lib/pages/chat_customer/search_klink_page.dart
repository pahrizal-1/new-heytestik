import 'package:flutter/material.dart';

import '../../theme/theme.dart';
import '../../widget/card_widget.dart';
import '../../widget/more_dialog_filter_widget.dart';
import '../../widget/produk_searct_widget.dart';

class SearchKlinkPage extends StatefulWidget {
  const SearchKlinkPage({super.key});

  @override
  State<SearchKlinkPage> createState() => _SearchKlinkPageState();
}

class _SearchKlinkPageState extends State<SearchKlinkPage> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back)),
        backgroundColor: greenColor,
        title: Row(
          children: [
            Text(
              'Cari & Pilih Klinik',
              style: whiteTextStyle.copyWith(fontSize: 20),
            ),
          ],
        ),
        actions: const [
          Padding(
            padding: lsymetric,
            child: Icon(
              Icons.search,
              size: 30,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, bottom: 15, top: 15),
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          isSelected = !isSelected;
                          showDialog(
                            context: context,
                            builder: (context) => const MoreDialogFilter(),
                          );
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 6),
                        height: 30,
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color.fromRGBO(36, 167, 160, 0.2)
                              : whiteColor,
                          borderRadius: BorderRadius.circular(7),
                          border: Border.all(
                            color: isSelected
                                ? greenColor
                                : const Color(0xffCCCCCC),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'filter',
                            style: subGreyTextStyle.copyWith(
                                fontSize: 15,
                                color: isSelected
                                    ? greenColor
                                    : const Color(0Xff9B9B9B)),
                          ),
                        ),
                      ),
                    ),
                    const CardSearch(
                      title: 'Rekomendasi',
                    ),
                    const CardSearch(
                      title: 'Harga Terendah',
                    ),
                    const CardSearch(
                      title: 'Rating Tertinggi',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 33,
              ),
              const ProdukSearcWidget(
                  grenTitle: 'Rinanda Skin Care Center Pasar Minggu',
                  blackTitle: 'Paket Diamond Peel + Brightening Peeling + Mask',
                  diskonsTitle: 'Rp500.000',
                  persenDiskonTitle: '70%',
                  hargaTitle: ' Rp 150.500',
                  img: 'assets/images/Paket-imaages.png'),
              const SizedBox(
                height: 9,
              ),
              const Divider(
                thickness: 2,
              ),
              const ProdukSearcWidget(
                  grenTitle: 'Natura Derma Clinic PIK',
                  blackTitle:
                      'Brightening Lifting Gold & Wellness Peeling (PIK)',
                  diskonsTitle: 'Rp616.000',
                  persenDiskonTitle: '58%',
                  hargaTitle: ' Rp 349.500',
                  img: 'assets/images/paket-images2.png'),
              const SizedBox(
                height: 9,
              ),
              const Divider(
                thickness: 2,
              ),
              const ProdukSearcWidget(
                  grenTitle: 'Natura Derma Clinic PIK',
                  blackTitle: 'Wellness Peeling Treatment',
                  diskonsTitle: 'Rp616.000',
                  persenDiskonTitle: '60%',
                  hargaTitle: ' Rp 249.500',
                  img: 'assets/images/paket-images3.png'),
              const SizedBox(
                height: 9,
              ),
              const Divider(
                thickness: 2,
              ),
              const ProdukSearcWidget(
                  grenTitle: 'Klinik Utama Lithea',
                  blackTitle: 'Peeling TCA Ringan',
                  diskonsTitle: 'Rp825.000',
                  persenDiskonTitle: '20%',
                  hargaTitle: ' Rp 249.500',
                  img: 'assets/images/paket-images4.png'),
            ],
          ),
        ),
      ),
    );
  }
}
