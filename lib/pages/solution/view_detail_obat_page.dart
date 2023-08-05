import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/medicine_controller.dart';
import 'package:heystetik_mobileapps/core/currency_format.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/widget/Text_widget.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import 'package:heystetik_mobileapps/widget/produk_widget.dart';

import '../../models/medicine.dart';
import '../../theme/theme.dart';
import '../../widget/pencarian_search_widget.dart';
import '../../widget/share_solusion_widget_page.dart';
import '../setings&akun/akun_home_page.dart';
import 'keranjang_page.dart';

class DetailObatPage extends StatelessWidget {
  const DetailObatPage({
    super.key,
    required this.medicine,
  });

  final MedicineModel medicine;

  @override
  Widget build(BuildContext context) {
    MedicineController medicineController = Get.put(MedicineController());

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
                child: Text(
                  "Detail Obat",
                  style: blackTextStyle.copyWith(fontSize: 20, overflow: TextOverflow.ellipsis),
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
              Navigator.push(context, MaterialPageRoute(builder: (context) => const KeranjangPage()));
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
              Navigator.push(context, MaterialPageRoute(builder: (context) => AkunHomePage()));
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
      body: ListView(
        children: [
          Container(
            height: 375,
            width: 390,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  '${Global.FILE}/${medicine.media[0]}',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12, left: 24, right: 24, bottom: 17),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      CurrencyFormat.convertToIdr(medicine.price, 2),
                      style: blackHigtTextStyle.copyWith(fontSize: 20),
                    ),
                    const Spacer(),
                    SvgPicture.asset(
                      'assets/icons/love-icons.svg',
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  medicine.name,
                  style: blackRegulerTextStyle.copyWith(color: blackColor),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Text(
                      'Terjual 3.002',
                      style: blackRegulerTextStyle.copyWith(color: blackColor),
                    ),
                    const SizedBox(
                      width: 9,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
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
                            '${medicine.rating}',
                            style: blackHigtTextStyle.copyWith(fontSize: 13),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                // Stack(
                //   children: [
                //     Image.asset(
                //       'assets/icons/coupon 2.png',
                //     ),
                //     Padding(
                //       padding: const EdgeInsets.only(
                //         top: 20,
                //         left: 20,
                //       ),
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.start,
                //         children: [
                //           SvgPicture.asset(
                //             'assets/icons/dicon1.svg',
                //           ),
                //           const SizedBox(
                //             width: 15,
                //           ),
                //           Column(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: [
                //               Text(
                //                 'Ada Promo Spesial',
                //                 style: blackHigtTextStyle.copyWith(fontSize: 15),
                //               ),
                //               Text(
                //                 'Masih ada 6 kupon promo buat kamu!',
                //                 style: subTitleTextStyle,
                //               ),
                //             ],
                //           ),
                //           const SizedBox(
                //             width: 20,
                //           ),
                //           SvgPicture.asset(
                //             'assets/icons/arrow-left.svg',
                //           ),
                //         ],
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
          const dividergreen(),
          Padding(
            padding: const EdgeInsets.only(top: 12, left: 24, right: 24, bottom: 17),
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
                  ontap: () {},
                  title1: 'Concern',
                  title2: 'Bekas Jerawat, Kulit Kering',
                  textColor: greenColor,
                ),
                TitleDetail(
                  title1: 'Bentuk Obat',
                  title2: medicine.form,
                  textColor: blackColor,
                  fontWeight: regular,
                ),
                TitleDetail(
                  title1: 'No. BPOM',
                  title2: medicine.BPOM,
                  textColor: blackColor,
                  fontWeight: regular,
                ),
                TitleDetail(
                  title1: 'Manufaktur',
                  title2: medicine.manufacture,
                  textColor: blackColor,
                  fontWeight: regular,
                ),
                const SizedBox(
                  height: 16,
                ),
                DescripsiText(
                  title1: 'Deskripsi',
                  subtitle2: medicine.description,
                ),
                DescripsiText(
                  title1: 'Indikasi',
                  subtitle2: medicine.indication,
                ),
                DescripsiText(
                  title1: 'Komposisi',
                  subtitle2: medicine.composition,
                ),
                DescripsiText(
                  title1: 'Dosis & Aturan Pakai',
                  subtitle2: medicine.doses
                ),
                DescripsiText(
                  title1: 'Perhatian',
                  subtitle2: medicine.attention,
                ),
                DescripsiText(
                  title1: 'Kontra indikasi',
                  subtitle2: medicine.contradiction,
                  isLast: true,
                ),
                // DescripsiText(
                //   title1: 'Efek Samping',
                //   subtitle2: 'Erupsi yang menyerupai jerawat, hipopigmentasi, atrofi kulit, striae. Iritasi atau sensitisasi (hentikan pemakaian).',
                // ),
              ],
            ),
          ),
          const dividergreen(),
          const SizedBox(
            height: 18,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Obat Rekomendasi lainnya',
                  style: blackHigtTextStyle.copyWith(fontSize: 18),
                ),
                const SizedBox(
                  height: 18,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: const [
                      ProdukObat(
                        namaBrand: 'Noroid Soothing Cream 200ml',
                        harga: 'Rp152.500',
                        urlImg: 'assets/images/noroid1.png',
                      ),
                      ProdukObat(
                        namaBrand: 'Noroid Soothing Cream 200ml',
                        harga: 'Rp152.500',
                        urlImg: 'assets/images/noroid1.png',
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 10),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      decoration: BoxDecoration(border: Border.all(color: greenColor), borderRadius: BorderRadius.circular(7)),
                      height: 40,
                      child: Center(
                        child: Text(
                          'Beli Langsung',
                          style: grenTextStyle.copyWith(fontSize: 15, fontWeight: bold),
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
                      medicineController.addMedicineToCart(context, medicine.id);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      width: 142,
                      decoration: BoxDecoration(color: greenColor, border: Border.all(color: greenColor), borderRadius: BorderRadius.circular(7)),
                      height: 40,
                      child: Center(
                        child: Text(
                          '+ Keranjang',
                          style: whiteTextStyle.copyWith(fontSize: 15, fontWeight: bold),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 6,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
