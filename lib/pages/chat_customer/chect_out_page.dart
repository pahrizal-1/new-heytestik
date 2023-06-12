import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:heystetik_mobileapps/widget/Text_widget.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';

import '../../theme/theme.dart';
import '../../widget/produk_widget.dart';

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
            const Spacer(),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: lsymetric.copyWith(top: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Alamat',
                        style: blackTextStyle.copyWith(fontSize: 18),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.keyboard_arrow_right,
                        color: greenColor,
                        size: 25,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 70,
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
                    onTap: () {},
                    width: 30,
                  ),
                  BoxPengriman(
                    urlIcons: 'assets/icons/cod-icons.png',
                    title: 'Pilih Pengiriman',
                    onTap: () {},
                    width: 30,
                  ),
                  BoxPengriman(
                    urlIcons: 'assets/icons/persen_icons.png',
                    title: 'Pilih Pengiriman',
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
                  TextBoldSpacebetwen(
                    title: 'Total Produk',
                    title1: '',
                    title2: 'Rp940.400',
                  ),
                  TextBoldSpacebetwen(
                    title: 'Biaya Pengiriman',
                    title1: '',
                    title2: '-',
                  ),
                  TextBoldSpacebetwen(
                    title: 'Biaya Pembayaran',
                    title1: '',
                    title2: 'Rp40.000',
                  ),
                  TextBoldSpacebetwen(
                    title: 'Diskon Promo',
                    title1: '',
                    title2: '-',
                  ),
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
    return Container(
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
          InkWell(
            onTap: onTap,
            child: Icon(
              Icons.keyboard_arrow_right,
              size: 25,
              color: greenColor,
            ),
          )
        ],
      ),
    );
  }
}
