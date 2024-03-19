import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/cart_controller.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/wishlist_treatment_controller.dart';
import 'package:heystetik_mobileapps/core/currency_format.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/models/customer/wishlist_treatment_model.dart';
import 'package:heystetik_mobileapps/pages/solution/reservasi_page.dart';
import 'package:heystetik_mobileapps/pages/solution/view_detail_treatment_page.dart';
import 'package:heystetik_mobileapps/widget/alert_dialog_ulasan.dart';
import 'package:heystetik_mobileapps/widget/show_modal_dialog.dart';
import '../theme/theme.dart';
import 'package:heystetik_mobileapps/models/customer/treatmet_model.dart'
    as Treatment;

class TreatmentWishlistWidget extends StatefulWidget {
  final Data2 data;
  final Function() onDelete;
  const TreatmentWishlistWidget({
    super.key,
    required this.data,
    required this.onDelete,
  });

  @override
  State<TreatmentWishlistWidget> createState() =>
      _TreatmentWishlistWidgetState();
}

class _TreatmentWishlistWidgetState extends State<TreatmentWishlistWidget> {
  final WishlistTreatmentController state =
      Get.put(WishlistTreatmentController());
  final CartController cart = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 11),
      decoration: BoxDecoration(
        color: whiteColor,
        border: Border.all(color: borderColor, width: 0.2),
        borderRadius: BorderRadius.circular(7),
      ),
      margin: const EdgeInsets.only(right: 7),
      width: MediaQuery.of(context).size.width,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailTreatmentPage(
                treatmentId: widget.data.treatmentId!,
              ),
            ),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              constraints: const BoxConstraints(maxWidth: 250),
              height: 107,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(7),
                  topRight: Radius.circular(7),
                ),
                image: DecorationImage(
                  image: NetworkImage(
                      "${Global.FILE}/${widget.data.treatment?.mediaTreatments![0].media!.path!}"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            Container(
              padding: const EdgeInsets.only(left: 11, right: 11),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.data.treatment?.clinic?.name ?? '-',
                    style: blackHigtTextStyle.copyWith(
                        fontSize: 13, overflow: TextOverflow.ellipsis),
                  ),
                  Text(
                    widget.data.treatment?.name ?? '-',
                    style: blackHigtTextStyle.copyWith(
                        fontSize: 13,
                        fontWeight: regular,
                        overflow: TextOverflow.ellipsis),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  // if (int.parse('diskonProduk') > 0)
                  //   Row(
                  //     children: [
                  //       Container(
                  //         width: 28,
                  //         height: 13,
                  //         decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(3),
                  //             color: const Color.fromRGBO(201, 42, 42, 0.2)),
                  //         child: Center(
                  //           child: Text(
                  //             '$diskonProduk%',
                  //             style: blackHigtTextStyle.copyWith(
                  //                 color: redColor, fontSize: 11),
                  //           ),
                  //         ),
                  //       ),
                  //       const SizedBox(
                  //         height: 4,
                  //       ),
                  //       Text(
                  //         CurrencyFormat.convertToIdr(
                  //           int.parse(hargaDiskon),
                  //           0,
                  //         ),
                  //         style: subGreyTextStyle.copyWith(
                  //           fontSize: 12,
                  //           decoration: TextDecoration.lineThrough,
                  //           decorationThickness: 2,
                  //           color: const Color(0xff9B9B9B),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  Text(
                    CurrencyFormat.convertToIdr(
                      int.parse(widget.data.treatment?.price.toString() ?? "0"),
                      0,
                    ),
                    style: blackHigtTextStyle.copyWith(fontSize: 15),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    widget.data.treatment?.clinic?.city?.name ?? '-',
                    style: subGreyTextStyle.copyWith(
                      fontSize: 12,
                      color: const Color(0xff9B9B9B),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: yellowColor,
                        size: 9,
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Text(
                        '${widget.data.treatment?.rating ?? 0} (0k)',
                        style: subGreyTextStyle.copyWith(
                            fontSize: 11, color: const Color(0xff9B9B9B)),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Image.asset(
                        'assets/icons/mapgrey.png',
                        width: 9,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        widget.data.distance ?? "0 km",
                        style: subGreyTextStyle.copyWith(
                            fontSize: 11, color: const Color(0xff9B9B9B)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 30,
                        padding: const EdgeInsets.symmetric(horizontal: 9),
                        decoration: BoxDecoration(
                            border: Border.all(color: borderColor),
                            borderRadius: BorderRadius.circular(7)),
                        child: Center(
                          child: InkWell(
                            onTap: () async {
                              customeModal(
                                context,
                                Padding(
                                  padding: lsymetric.copyWith(top: 25),
                                  child: Wrap(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          InkWell(
                                            onTap: () async {
                                              await showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    AlertInfomasi(
                                                        function: () async {
                                                  await state.deleteWistlist(
                                                    context,
                                                    widget.data.treatmentId!
                                                        .toInt(),
                                                  );
                                                  Get.back();
                                                  Get.back();
                                                  widget.onDelete();
                                                }),
                                              );
                                            },
                                            child: Text(
                                              'Delete',
                                              style:
                                                  blackHigtTextStyle.copyWith(
                                                fontSize: 15,
                                                color: redColor,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                            child: Image.asset(
                              'assets/icons/more-horizontal.png',
                              width: 12,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ReservasiPage(
                                  treatment: Treatment.Data2.fromJson(
                                      jsonDecode(
                                          jsonEncode(widget.data.treatment))),
                                ),
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(8),
                            width: MediaQuery.of(context).size.width,
                            height: 30,
                            decoration: BoxDecoration(
                                color: greenColor,
                                borderRadius: BorderRadius.circular(3)),
                            child: Center(
                              child: Text(
                                'Reservasi',
                                style: whiteTextStyle.copyWith(
                                  fontWeight: bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
