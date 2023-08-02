import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/card_treatment_widget.dart';
import 'package:heystetik_mobileapps/widget/pencarian_search_widget.dart';

import '../../controller/customer/treatment/treatment_controller.dart';
import '../../widget/fikter_card_solusions_widget.dart';

class PeelinngTraetmentPage extends StatefulWidget {
  const PeelinngTraetmentPage({super.key});

  @override
  State<PeelinngTraetmentPage> createState() => _PeelinngTraetmentPageState();
}

class _PeelinngTraetmentPageState extends State<PeelinngTraetmentPage> {
  final TreatmentController stateTreatment = Get.put(TreatmentController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
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
            Expanded(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PencarianPageWidget(),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.only(left: 13, right: 14),
                  height: 35,
                  decoration: BoxDecoration(
                    color: subwhiteColor,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Center(
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/icons/search1.png',
                          width: 10,
                          color: blackColor,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Search...',
                          style: blackRegulerTextStyle,
                        ),
                        const Spacer(),
                        Image.asset(
                          'assets/icons/x-circle.png',
                          width: 14,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: FilterTreatment(),
        ),
      ),
      body: ListView(
        children: const [
          CardTreatment(
            namaKlink: 'Klinik Utama Lithea, Jakarta Selatan',
            rating: '4.9 (120k)',
            km: '4,5',
            urlImg: 'assets/images/litheapoto.png',
            buttonTitle: 'Lihat semua cabang klinik',
          ),
          CardTreatment(
            namaKlink: 'Klinik Utama Lithea, Jakarta Selatan',
            rating: '4.9 (120k)',
            km: '4,5',
            urlImg: 'assets/images/litheapoto.png',
            buttonTitle: 'Lihat semua cabang klinik',
          ),
          CardTreatment(
            namaKlink: 'Klinik Utama Lithea, Jakarta Selatan',
            rating: '4.9 (120k)',
            km: '4,5',
            urlImg: 'assets/images/litheapoto.png',
            buttonTitle: 'Lihat semua cabang klinik',
          ),
          CardTreatment(
            namaKlink: 'Klinik Utama Lithea, Jakarta Selatan',
            rating: '4.9 (120k)',
            km: '4,5',
            urlImg: 'assets/images/litheapoto.png',
            buttonTitle: 'Lihat semua cabang klinik',
          ),
        ],
      ),
    );
  }
}
