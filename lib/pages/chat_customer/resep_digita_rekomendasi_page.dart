import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/resep_digital_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';

class ResepDigitalRekomendasiPage extends StatelessWidget {
  const ResepDigitalRekomendasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, top: 21),
        child: Column(
          children: [
            resepdigitalberlaku(),
            resepdigitaltidakberlaku(),
          ],
        ),
      ),
    );
  }

  Container resepdigitaltidakberlaku() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 19, horizontal: 15),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          border: Border.all(
            color: borderColor,
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                'assets/icons/solutions.png',
                width: 20,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                'Resep Digital',
                style: blackTextStyle.copyWith(fontWeight: bold),
              ),
              Spacer(),
              Text(
                '12 Juni 2023',
                style: blackRegulerTextStyle.copyWith(fontSize: 12),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            padding: EdgeInsets.only(
              left: 5,
              top: 3,
              bottom: 3,
            ),
            color: Color(0xffFFC1C1),
            child: Row(
              children: [
                Image.asset(
                  'assets/icons/-.png',
                  width: 20,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Resep digital ini sudah tidak berlaku.',
                  style: blackTextStyle.copyWith(fontSize: 10),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 14,
          ),
          Text(
            'Nama Produk',
            style: blackTextStyle.copyWith(fontSize: 10),
          ),
          SizedBox(
            height: 9,
          ),
          Text(
            'R/  Cefila 200 Cefixime',
            style: blackTextStyle,
          ),
          Text(
            'R/  Teenderm Gel Sensitive 150ml',
            style: blackTextStyle,
          ),
          SizedBox(
            height: 20,
          ),
          ButtonGreenWidget(
            title: 'Selengkapnya',
            onPressed: () {},
          )
        ],
      ),
    );
  }

  Container resepdigitalberlaku() {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.symmetric(vertical: 19, horizontal: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          border: Border.all(
            color: borderColor,
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                'assets/icons/solutions.png',
                width: 20,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                'Resep Digital',
                style: blackTextStyle.copyWith(fontWeight: bold),
              ),
              Spacer(),
              Text(
                '12 Juni 2023',
                style: blackRegulerTextStyle.copyWith(fontSize: 12),
              ),
            ],
          ),
          dividergrey(),
          SizedBox(
            height: 14,
          ),
          Text(
            'Nama Produk',
            style: blackTextStyle.copyWith(fontSize: 10),
          ),
          SizedBox(
            height: 9,
          ),
          Text(
            'R/  Cefila 200 Cefixime',
            style: blackTextStyle,
          ),
          Text(
            'R/  Teenderm Gel Sensitive 150ml',
            style: blackTextStyle,
          ),
          SizedBox(
            height: 20,
          ),
          ButtonGreenWidget(
            onPressed: () {
              Get.to(ResepDigitalPage());
            },
            title: 'Selengkapnya',
          )
        ],
      ),
    );
  }
}
