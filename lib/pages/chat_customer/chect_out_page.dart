import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/alamat_page.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/chect_out_selesai_page.dart';
import 'package:heystetik_mobileapps/widget/Text_widget.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import 'package:heystetik_mobileapps/widget/card_widget.dart';
import 'package:heystetik_mobileapps/widget/more_dialog_transaksi_widget.dart';

import '../../theme/theme.dart';
import '../../widget/produk_widget.dart';
import '../../widget/text_form_widget.dart';
import '../doctorpage/account_page/tambah_bank_page.dart';

class CheckOutPage extends StatelessWidget {
  const CheckOutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: greenColor,
        title: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back),
            ),
            const SizedBox(
              width: 11,
            ),
            Text(
              'Checkout',
              style: whiteTextStyle.copyWith(fontSize: 20, fontWeight: bold),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 26, right: 25, top: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Alamat',
                        style: blackTextStyle.copyWith(fontSize: 18),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CheckOutSelesai()));
                        },
                        child: Icon(
                          Icons.keyboard_arrow_right,
                          color: greenColor,
                          size: 26,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Alamatpage()));
                    },
                    child: Container(
                      width: 340,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 19, vertical: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(
                          color: const Color(0xffD9D9D9),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Belum ada alamat',
                            style: subTitleTextStyle,
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Text('+ Tambah Alamat Baru',
                              style: grenTextStyle.copyWith(fontSize: 15))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const dividergreen(),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: lsymetric,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Detail Produk',
                    style: blackHigtTextStyle.copyWith(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const DetailProduk(
                    price: '29,000',
                    nameProduk: 'Cefila® 200 Cefixime ',
                    item: '2',
                    urlImg: 'assets/images/produk1.png',
                  ),
                  const DetailProduk(
                    price: '529,000',
                    nameProduk: 'Teenderm gel sensitive 150 ml',
                    item: '2',
                    urlImg: 'assets/images/produk.png',
                  ),
                  const DetailProduk(
                    price: '29,000',
                    nameProduk: 'Teenderm Hydra 40ml',
                    item: '2',
                    urlImg: 'assets/images/produk2.png',
                  ),
                  const DetailProduk(
                    discon: '20%',
                    priceDiscon: 'Rp.800.000',
                    price: '29,000',
                    nameProduk: 'Teenderm Alpha Pure 30ml',
                    item: '2',
                    urlImg: 'assets/images/produk.png',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const dividergreen(),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: lsymetric,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pilih Pengiriman & Pembayaran',
                    style: blackHigtTextStyle.copyWith(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  BoxPengriman(
                    urlIcons: 'assets/icons/delivery-icons.png',
                    title: 'Pilih Pengiriman',
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                        ),
                        builder: (context) => const PlihPengirimMoreDialog(),
                      );
                    },
                    width: 30,
                  ),
                  BoxPengriman(
                    urlIcons: 'assets/icons/cod-icons.png',
                    title: 'Pilih Metode Pembayaran',
                    onTap: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        backgroundColor: Colors.white,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.only(
                            topEnd: Radius.circular(25),
                            topStart: Radius.circular(25),
                          ),
                        ),
                        builder: (context) => SingleChildScrollView(
                          child: Wrap(
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 60, left: 33, right: 33),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Row(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: Image.asset(
                                                'assets/icons/danger-icons.png',
                                                width: 20,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 17,
                                            ),
                                            Text(
                                              'Pilih Metode Pembayaran',
                                              style: blackHigtTextStyle
                                                  .copyWith(fontSize: 20),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 40,
                                        ),
                                        Text(
                                          'Pembayaran Instan',
                                          style: blackHigtTextStyle.copyWith(
                                              fontSize: 18),
                                        ),
                                        const SizedBox(
                                          height: 17,
                                        ),
                                        Row(
                                          children: [
                                            Image.asset(
                                              'assets/icons/gopay.png',
                                              width: 47,
                                            ),
                                            const SizedBox(
                                              width: 23,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Gopay',
                                                  style: blackHigtTextStyle
                                                      .copyWith(fontSize: 15),
                                                ),
                                                const SizedBox(
                                                  height: 3,
                                                ),
                                                Text(
                                                  'Tidak tersedia untuk transaksi ini',
                                                  style: subTitleTextStyle,
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 23,
                                  ),
                                  const dividergreen(),
                                  const SizedBox(
                                    height: 21,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 33, right: 33),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Pembayaran Instan',
                                          style: blackHigtTextStyle.copyWith(
                                              fontSize: 18),
                                        ),
                                        const SizedBox(
                                          height: 12,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const CardBankPengriman()
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    width: 30,
                  ),
                  BoxPengriman(
                    urlIcons: 'assets/icons/persen_icons.png',
                    title: 'Lebih Hemat Pake Promo',
                    onTap: () {},
                    width: 30,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const dividergreen(),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: lsymetric,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Rincian Pembayaran',
                    style: blackHigtTextStyle.copyWith(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  const TextBoldSpacebetwen(
                    title: 'Total Produk',
                    title1: '',
                    title2: 'Rp940.400',
                  ),
                  const TextBoldSpacebetwen(
                    title: 'Biaya Pengiriman',
                    title1: '',
                    title2: '-',
                  ),
                  const TextBoldSpacebetwen(
                    title: 'Biaya Pembayaran',
                    title1: '',
                    title2: 'Rp40.000',
                  ),
                  const TextBoldSpacebetwen(
                    title: 'Diskon Promo',
                    title1: '',
                    title2: '-',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'PPN',
                        style: subGreyTextStyle.copyWith(
                            fontSize: 15,
                            color: Color(0XFF323232),
                            fontWeight: regular),
                      ),
                      Text(
                        'Gratis',
                        style: blackHigtTextStyle.copyWith(
                            fontSize: 15, color: redColor),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 11,
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                  const TextBoldSpacebetwen(
                    title: 'Total Tagihan',
                    title1: '',
                    title2: 'Rp903.400',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total 5 Produk',
                  style: blackRegulerTextStyle,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Rp293.400',
                      style: blackHigtTextStyle.copyWith(fontSize: 20),
                    ),
                    const Icon(Icons.keyboard_arrow_up)
                  ],
                ),
              ],
            ),
            const Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 38, vertical: 16),
              height: 51,
              decoration: BoxDecoration(
                color: greenColor,
                borderRadius: BorderRadius.circular(7),
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/icons/check_button.png',
                    width: 17,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Bayar',
                    style: whiteTextStyle.copyWith(fontSize: 16),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BoxPengriman extends StatelessWidget {
  final String urlIcons;
  final String title;
  final double width;
  final VoidCallback? onTap;
  const BoxPengriman({
    Key? key,
    required this.urlIcons,
    required this.title,
    this.onTap,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 9),
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(7),
        ),
        child: Row(
          children: [
            Image.asset(
              urlIcons,
              width: width,
            ),
            const SizedBox(
              width: 17,
            ),
            Text(
              title,
              style: blackRegulerTextStyle,
            ),
            const Spacer(),
            Icon(
              Icons.keyboard_arrow_right,
              size: 25,
              color: greenColor,
            )
          ],
        ),
      ),
    );
  }
}
