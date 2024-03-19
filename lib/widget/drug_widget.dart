// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/cart_controller.dart';
import 'package:heystetik_mobileapps/core/currency_format.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/pages/solution/view_detail_drug_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/models/drug_model.dart' as Drug;

class DrugWidget extends StatelessWidget {
  DrugWidget({Key? key, required this.drug}) : super(key: key);
  final Drug.Data2 drug;

  final CartController cart = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => DetailDrugPage(
            drugId: drug.id!,
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: whiteColor,
          border: Border.all(color: borderColor, width: 0.2),
          borderRadius: BorderRadius.circular(7),
        ),
        width: 164,
        height: 315,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                image: DecorationImage(
                  image: NetworkImage(
                      "${Global.FILE}/${drug.mediaProducts?[0].media?.path}"),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              padding: const EdgeInsets.only(left: 11, bottom: 11, right: 11),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    drug.name ?? '-',
                    style: subGreyTextStyle.copyWith(
                        fontSize: 13, color: const Color(0xFF323232)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    CurrencyFormat.convertToIdr(drug.price ?? 0, 0),
                    style: blackHigtTextStyle.copyWith(fontSize: 15),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    drug.drugDetail?.specificationPackaging ?? '-',
                    style: subGreyTextStyle.copyWith(
                        fontSize: 12, color: const Color(0xFF9B9B9B)),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Bisa dibeli apabila telah melakukan konsultasi',
                    style: subGreyTextStyle.copyWith(
                      color: const Color(0XFF9B9B9B),
                      fontSize: 11,
                      fontWeight: medium,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  if (drug.consultationRecipeDrugs?.isNotEmpty ??
                      drug.consultationRecipeDrugs != null)
                    Container(
                      height: 30,
                      child: TextButton(
                        onPressed: () async {
                          await cart.addCart(context, drug.id!, 1, '');
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: greenColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            '+ Keranjang',
                            style: whiteTextStyle.copyWith(fontSize: 12),
                          ),
                        ),
                      ),
                    )
                  else
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 6),
                      decoration: BoxDecoration(
                          border: Border.all(color: greenColor),
                          borderRadius: BorderRadius.circular(7)),
                      child: Text(
                        'Harus Dengan Resep Dokter',
                        style: grenTextStyle.copyWith(fontSize: 10),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
