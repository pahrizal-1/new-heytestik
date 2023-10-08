// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:heystetik_mobileapps/widget/button_widget.dart';

import '../../theme/theme.dart';
import '../../widget/promo_kupon_widget.dart';

class PromoPage extends StatelessWidget {
  const PromoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        elevation: 0,
        backgroundColor: greenColor,
        title: Text(
          'Pakai Promo',
          style: whiteTextStyle.copyWith(fontSize: 20, fontWeight: bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: lsymetric.copyWith(top: 24, bottom: 47),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Masukkan kode Voucher yang kamu dapatkan.',
                style: blackTextStyle.copyWith(fontSize: 15),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 230,
                    height: 40,
                    padding: EdgeInsets.only(left: 10),
                    // width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      border: Border.all(color: borderColor),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(7),
                          bottomLeft: Radius.circular(7)),
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                          focusedBorder: InputBorder.none,
                          hintText: 'Masukkan kode voucher'),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: greenColor,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(7),
                            bottomRight: Radius.circular(7)),
                      ),
                      child: Center(
                        child: Text(
                          'Pakai',
                          style: whiteTextStyle.copyWith(fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Divider(
                thickness: 1,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Voucher yang bisa kamu pakai',
                style: blackTextStyle.copyWith(fontSize: 15),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(
                    left: 10, right: 87, top: 18, bottom: 18),
                margin: const EdgeInsets.only(top: 13, bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  border: Border.all(
                    color: const Color(0xffcccccc),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'HEY25K',
                      style: blackTextStyle.copyWith(fontSize: 15),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text.rich(
                      TextSpan(
                        text: 'Khusus untuk konsultasi pertamamu',
                        style: greyTextStyle.copyWith(
                            fontSize: 13, color: Color(0xff9B9B9B)),
                        children: [
                          TextSpan(
                              text: ' \nLihat detail',
                              style: grenTextStyle.copyWith(fontSize: 13))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              PromoVocer(
                title: 'VOUCHER 15K',
                bgColor: whiteColor,
                subTitle: 'Berakhir 2 hari lagi!',
              ),
              Divider(),
              Text(
                'Voucher yang bisa kamu pakai',
                style: blackTextStyle.copyWith(fontSize: 15),
              ),
              PromoVocer(
                title: 'VOUCHER 15K',
                bgColor: Color(0xffF1F1F1),
                subTitle: 'Berakhir 2 hari lagi! ',
                textTitle: borderColor,
              ),
              PromoVocer(
                title: 'VOUCHER 15K',
                bgColor: Color(0xffF1F1F1),
                subTitle: 'Berakhir 4 hari lagi! ',
              ),
              ButtonGreenWidget(
                title: 'Pakai Voucher',
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
