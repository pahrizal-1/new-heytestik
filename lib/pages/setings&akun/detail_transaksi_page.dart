import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/invoic_hestetik.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/Text_widget.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';

import 'detail_status_page.dart';

class DetailTransaksiPage extends StatelessWidget {
  const DetailTransaksiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        automaticallyImplyLeading: false,
        backgroundColor: whiteColor,
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
                  'Detail Pesanan',
                  style: blackTextStyle.copyWith(
                    fontSize: 20,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 21),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Dikirim',
                          style: subGreyTextStyle.copyWith(
                              fontSize: 15,
                              color: const Color(0XFF323232),
                              fontWeight: bold),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        Get.to(DetailStatusPage());
                      },
                      child: Text(
                        'Lihat Detail',
                        style: grenTextStyle.copyWith(fontSize: 14),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
                dividergrey(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          'INV/20230513/KD',
                          style: subGreyTextStyle.copyWith(
                              fontSize: 15,
                              color: const Color(0XFF323232),
                              fontWeight: regular),
                        ),
                        SizedBox(
                          width: 9,
                        ),
                        Image.asset(
                          'assets/icons/salin_icons.png',
                          width: 12,
                          height: 12,
                          color: blackColor,
                        )
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        Get.to(InvoiceHeystetikPage());
                      },
                      child: Text(
                        'Lihat Invoice',
                        style: grenTextStyle.copyWith(fontSize: 14),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 9,
                ),
                TextSpaceBetween(
                  title: 'Tanggal Pembelian',
                  title2: '13 Mei 2023; 09:31 WIB',
                )
              ],
            ),
          ),
          dividergreen(),
          Padding(
            padding: lsymetric.copyWith(top: 21),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Detail Produk',
                  style: blackTextStyle.copyWith(fontSize: 18),
                ),
                SizedBox(
                  height: 20,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 9),
                      decoration: BoxDecoration(
                          border: Border.all(color: borderColor),
                          borderRadius: BorderRadius.circular(7)),
                      padding:
                          EdgeInsets.symmetric(vertical: 14, horizontal: 14),
                      child: Row(
                        children: [
                          Container(
                            width: 65,
                            height: 65,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/produk1.png'),
                                    fit: BoxFit.fill)),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Cefila® 200 Cefixime',
                                  style: grenTextStyle.copyWith(fontSize: 15),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  '1 items',
                                  style:
                                      subTitleTextStyle.copyWith(fontSize: 15),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Rp175.000',
                                      style:
                                          blackTextStyle.copyWith(fontSize: 15),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 7),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              border: Border.all(
                                color: greenColor,
                              ),
                            ),
                            child: Text(
                              'Beli Lagi',
                              style: grenTextStyle.copyWith(
                                fontSize: 13,
                                fontWeight: regular,
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Tampilkan Lebih Sedikit',
                        style: grenTextStyle.copyWith(fontSize: 15),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: greenColor,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          dividergreen(),
          Padding(
            padding: lsymetric.copyWith(top: 21, bottom: 21),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Info Pengiriman',
                  style: blackTextStyle.copyWith(fontSize: 18),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 12),
                  child: Column(
                    children: [
                      Table(
                        children: [
                          TableRow(
                            children: [
                              Text(
                                'Kurir',
                                style: blackRegulerTextStyle.copyWith(
                                    color: blackColor),
                              ),
                              Text(
                                'Instant - Gojek Instant',
                                style: grenTextStyle.copyWith(
                                    fontSize: 15,
                                    color: blackColor,
                                    fontWeight: regular),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 9,
                      ),
                      Table(
                        children: [
                          TableRow(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'No Resi',
                                    style: subGreyTextStyle.copyWith(
                                        fontSize: 15,
                                        color: const Color(0XFF323232),
                                        fontWeight: regular),
                                  ),
                                  SizedBox(
                                    width: 9,
                                  ),
                                  Image.asset(
                                    'assets/icons/salin_icons.png',
                                    width: 12,
                                    height: 12,
                                    color: blackColor,
                                  )
                                ],
                              ),
                              Text(
                                'INST000101010',
                                style: grenTextStyle.copyWith(
                                    fontSize: 15,
                                    color: blackColor,
                                    fontWeight: regular),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 9,
                      ),
                      Table(
                        children: [
                          TableRow(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Alamat',
                                    style: subGreyTextStyle.copyWith(
                                        fontSize: 15,
                                        color: const Color(0XFF323232),
                                        fontWeight: regular),
                                  ),
                                  SizedBox(
                                    width: 9,
                                  ),
                                  Image.asset(
                                    'assets/icons/salin_icons.png',
                                    width: 12,
                                    height: 12,
                                    color: blackColor,
                                  )
                                ],
                              ),
                              Text(
                                'Rina\n085211234567\nJalan Sultan Iskandar Muda, no 7A & 7B, RT.9/RW.9, South Kebayoran Lama, Kebayoran Lama, Jakarta 12240',
                                style: grenTextStyle.copyWith(
                                    fontSize: 15,
                                    color: blackColor,
                                    fontWeight: regular),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          dividergreen(),
          Padding(
            padding: lsymetric.copyWith(top: 21, bottom: 21),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Rincian Pembayarann',
                  style: blackTextStyle.copyWith(fontSize: 18),
                ),
                SizedBox(
                  height: 20,
                ),
                TextSpaceBetween(
                  title: 'Metode Pembayaran',
                  title2: 'BCA Virtual Account',
                ),
                SizedBox(
                  height: 9,
                ),
                TextSpaceBetween(
                  title: 'Total Harga (5 barang)',
                  title2: 'Rp940.400 ',
                ),
                SizedBox(
                  height: 9,
                ),
                TextSpaceBetween(
                  title: 'Total Ongkos Kirim (0.5kg)',
                  title2: 'Rp3.000',
                ),
                SizedBox(
                  height: 9,
                ),
                TextSpaceBetween(
                  title: 'Diskon Ongkos Kirim',
                  title2: '-',
                ),
                SizedBox(
                  height: 9,
                ),
                TextSpaceBetween(
                  title: 'Diskon Promo',
                  title2: '-Rp140.000',
                ),
                SizedBox(
                  height: 9,
                ),
                TextSpaceBetween(
                  title: 'PPN',
                  title2: '-',
                ),
                SizedBox(
                  height: 9,
                ),
                dividergrey(),
                TextBoldSpacebetwen(
                  title: 'Total Tagihan',
                  title2: 'Rp903.400',
                  title1: '',
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
