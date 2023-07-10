import 'package:flutter/material.dart';

import '../../theme/theme.dart';
import '../../widget/Text_widget.dart';
import '../../widget/appbar_widget.dart';

import '../../widget/produk_widget.dart';
import 'alamat_page.dart';

class CheckOutSelesai extends StatefulWidget {
  const CheckOutSelesai({super.key});

  @override
  State<CheckOutSelesai> createState() => _CheckOutSelesaiState();
}

class _CheckOutSelesaiState extends State<CheckOutSelesai> {
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
                                  builder: (context) => Alamatpage()));
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
                          builder: (context) => const Alamatpage(),
                        ),
                      );
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
                            'Rina Rasmalina',
                            style: blackTextStyle,
                          ),
                          Text(
                            '085211341577',
                            style: blackTextStyle,
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Text(
                            'Jalan Sultan Iskandar Muda, no 7A & 7B, RT.9/RW.9, South Kebayoran Lama, Kebayoran Lama, Jakarta 12240',
                            style: subTitleTextStyle.copyWith(
                                fontSize: 13, overflow: TextOverflow.ellipsis),
                          ),
                          Text(
                            'Pagar hitam yaa',
                            style: subTitleTextStyle.copyWith(
                                fontSize: 13, overflow: TextOverflow.ellipsis),
                          ),
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
                    title: 'Instant (Rp22.500)',
                    onTap: () {},
                    width: 30,
                  ),
                  BoxPengriman(
                    urlIcons: 'assets/images/logo-bca.png',
                    title: 'BCA Virtual Account',
                    onTap: () {},
                    width: 50,
                  ),
                  BoxPengriman(
                    urlIcons: 'assets/icons/persen_icons.png',
                    title: 'Kamu bisa hemat Rp15.000',
                    title2: '1 promo dipakai',
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
                    title2: 'Rp0',
                  ),
                  const TextBoldSpacebetwen(
                    title: 'Biaya Pembayaran',
                    title1: '',
                    title2: 'Rp40.000',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const RedTextSpacebetwen(
                    title: 'Diskon Promo',
                    titleRed: '-Rp140.000',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const RedTextSpacebetwen(title: 'PPN', titleRed: 'Gratis'),
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
  final String? urlIcons;
  final String title;
  final String? title2;
  final double width;
  final VoidCallback? onTap;
  const BoxPengriman({
    Key? key,
    this.urlIcons = '',
    required this.title,
    this.onTap,
    required this.width,
    this.title2 = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 9),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(7),
        ),
        child: Row(
          children: [
            urlIcons != ''
                ? Image.asset(
                    urlIcons.toString(),
                    width: width,
                  )
                : Container(),
            const SizedBox(
              width: 17,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: blackTextStyle.copyWith(fontSize: 15),
                ),
                title2 != ''
                    ? Text(
                        title2.toString(),
                        style: subTitleTextStyle,
                      )
                    : Container(),
              ],
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
