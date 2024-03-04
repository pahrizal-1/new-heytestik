import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/treatment_controller.dart';
import 'package:heystetik_mobileapps/core/currency_format.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/pages/solution/reservasi2_page.dart';
import 'package:heystetik_mobileapps/widget/alert_dialog.dart';

import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';
import 'package:heystetik_mobileapps/models/customer/treatmet_model.dart';
import '../../theme/theme.dart';

class ReservasiPage extends StatefulWidget {
  final Data2 treatment;
  const ReservasiPage({required this.treatment, super.key});

  @override
  State<ReservasiPage> createState() => _ReservasiPageState();
}

class _ReservasiPageState extends State<ReservasiPage> {
  final TreatmentController stateTreatment = Get.put(TreatmentController());

  @override
  void initState() {
    super.initState();
    stateTreatment.pax.value = 1;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        stateTreatment.pax.value = 0;
        return true;
      },
      child: Scaffold(
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
                'Reservasi',
                style: whiteTextStyle.copyWith(fontSize: 20, fontWeight: bold),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 29),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 72,
                        height: 72,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            image: DecorationImage(
                                image: NetworkImage(
                              "${Global.FILE}/${widget.treatment.mediaTreatments![0].media!.path}",
                            ))),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 13,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: "${widget.treatment.name}",
                            style: blackHigtTextStyle.copyWith(
                              fontSize: 15,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "${widget.treatment.description}",
                          style: TextStyle(
                            color: Color(0Xff9B9B9B),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "${widget.treatment.clinic?.name}",
                          style: subGreyTextStyle.copyWith(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Divider(
                thickness: 1,
                color: Color(0XFFCCCCCC),
              ),
              const SizedBox(
                height: 21,
              ),
              Text(
                'Jumlah Pengguna',
                style: blackTextStyle.copyWith(fontSize: 15),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Pax',
                style: blackTextStyle.copyWith(fontSize: 15),
              ),
              Row(
                children: [
                  Text(
                    CurrencyFormat.convertToIdr(widget.treatment.price, 0),
                    style: grenTextStyle.copyWith(fontSize: 13),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      if (stateTreatment.pax.value > 1) {
                        stateTreatment.pax.value -= 1;
                      }
                    },
                    child: Obx(
                      () => Icon(
                        Icons.remove_circle_outline,
                        color: stateTreatment.pax.value <= 1
                            ? greyColor
                            : greenColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 14,
                  ),
                  Obx(
                    () => Text(
                      stateTreatment.pax.value.toString(),
                      style: blackTextStyle.copyWith(fontSize: 15),
                    ),
                  ),
                  const SizedBox(
                    width: 14,
                  ),
                  InkWell(
                    onTap: () {
                      stateTreatment.pax.value += 1;
                    },
                    child: Icon(
                      Icons.add_circle_outline,
                      color: greenColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 22,
              ),
              dividergrey(),
              const SizedBox(
                height: 21,
              ),
              Row(
                children: [
                  Text(
                    'Total Harga',
                    style: blackRegulerTextStyle.copyWith(color: blackColor),
                  ),
                  const Spacer(),
                  Obx(
                    () => Text(
                      CurrencyFormat.convertToIdr(
                          widget.treatment.price! * stateTreatment.pax.value,
                          0),
                      style: blackTextStyle.copyWith(fontSize: 13),
                    ),
                  ),
                  const Icon(Icons.keyboard_arrow_down)
                ],
              ),
              const SizedBox(
                height: 85,
              ),
              ButtonGreenWidget(
                title: 'Pesan',
                onPressed: () {
                  if (stateTreatment.pax.value > 0) {
                    Get.to(Reservasi2Page(
                      treatment: widget.treatment,
                    ));
                    return;
                  }
                  showDialog(
                    context: context,
                    builder: (context) =>
                        AlertWidget(subtitle: 'Minimal satu orang'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
