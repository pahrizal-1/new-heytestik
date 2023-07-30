import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/card_klinik_widget.dart';
import 'package:heystetik_mobileapps/widget/fikter_card_solusions_widget.dart';

import '../../controller/customer/treatment/treatment_controller.dart';
import '../../models/clinic.dart';

class TreatmentKlink extends StatefulWidget {
  const TreatmentKlink({super.key});

  @override
  State<TreatmentKlink> createState() => _TreatmentKlinkState();
}

class _TreatmentKlinkState extends State<TreatmentKlink> {
  final TreatmentController stateTreatment = Get.put(TreatmentController());
  final ScrollController scrollController = ScrollController();
  int page = 1;
  List<ClinicDataModel> clinics = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      clinics.addAll(await stateTreatment.getClinic(context, page));
      setState(() {});
    });
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool isTop = scrollController.position.pixels == 0;
        if (!isTop) {
          page += 1;
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
            clinics.addAll(await stateTreatment.getClinic(context, page));
            setState(() {});
          });
        }
      }
    });
  }

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
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: FilterTreatment(),
        ),
      ),
      body: ListView.builder(
        itemCount: stateTreatment.dataClinic.length,
        itemBuilder: (context, index) {
          return CardKlinik(
            namaKlink:
                '${stateTreatment.dataClinic[index].name}, ${stateTreatment.dataClinic[index].city}',
            rating: '${stateTreatment.dataClinic[index].rating} (120k)',
            km: stateTreatment.dataClinic[index].distance,
            urlImg: "${Global.FILE}/${stateTreatment.dataClinic[index].logo}",
            price: stateTreatment.dataClinic[index].price,
          );
        },
      ),
    );
  }
}
