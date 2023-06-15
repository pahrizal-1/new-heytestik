import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/card_klinik_widget.dart';
import 'package:heystetik_mobileapps/widget/fikter_card_solusions_widget.dart';

class TreatmentKlink extends StatelessWidget {
  const TreatmentKlink({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
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
              const SizedBox(
                width: 11,
              ),
              Text(
                'Klinik',
                style: blackTextStyle.copyWith(fontSize: 20),
              ),
              const Spacer(),
              Image.asset(
                'assets/icons/search1.png',
                width: 18,
                color: blackColor,
              )
            ],
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: FilterTreatmen(),
        ),
      ),
      body: ListView(
        children: const [
          CardKlinik(
            namaKlink: 'Klinik Utama Lithea, Jakarta Selatan',
            rating: '4.9 (120k)',
            km: '4,5',
            urlImg: 'assets/images/litheapoto.png',
            buttonTitle: 'Lihat semua cabang klinik',
          ),
          CardKlinik(
            namaKlink: 'ZAP, Plaza Senayan',
            rating: '4.9 (120k)',
            km: '4,5',
            urlImg: 'assets/images/zapklinik.png',
          ),
          CardKlinik(
            namaKlink: 'SOZO Clinic, Bekasi',
            rating: '4.9 (120k)',
            km: '4,5',
            urlImg: 'assets/images/sozoklink.png',
            buttonTitle: 'Lihat semua cabang klinik',
          ),
          CardKlinik(
            namaKlink: 'MS Glow Clinic, Jakarta Selatan',
            rating: '4.9 (120k)',
            km: '4,5',
            urlImg: 'assets/images/msglowklik.png',
          ),
          CardKlinik(
            namaKlink: 'Bening’s Clinic, Kebayoran Lama',
            rating: '4.9 (120k)',
            km: '4,5',
            urlImg: 'assets/images/bennigklink.png',
            buttonTitle: 'Lihat semua cabang klinik',
          ),
          CardKlinik(
            namaKlink: 'eMGlow Clinic, Bekasi',
            rating: '4.9 (120k)',
            km: '4,5',
            urlImg: 'assets/images/emglowklinil.png',
            buttonTitle: 'Lihat semua cabang klinik',
          ),
        ],
      ),
    );
  }
}
