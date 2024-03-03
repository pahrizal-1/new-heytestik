import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/cart_controller.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/wishlist_treatment_controller.dart';
import 'package:heystetik_mobileapps/core/currency_format.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/models/customer/wishlist_treatment_model.dart';
import 'package:heystetik_mobileapps/widget/alert_dialog_ulasan.dart';
import 'package:heystetik_mobileapps/widget/show_modal_dialog.dart';
import '../theme/theme.dart';

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
    return Column(
      children: [
        Container(
          constraints: const BoxConstraints(maxWidth: 250),
          height: 107,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                "${Global.FILE}/${widget.data.treatment?.mediaTreatments![0].media!.path!}",
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 11, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.data.treatment?.name ?? '-',
                style: blackTextStyle.copyWith(
                  fontSize: 13,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                CurrencyFormat.convertToIdr(widget.data.treatment?.price, 0),
                style: blackHigtTextStyle.copyWith(fontSize: 15),
              ),
              const SizedBox(
                height: 3,
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: yellowColor,
                    size: 18,
                  ),
                  Text(
                    '${widget.data.treatment?.rating}',
                    style: subGreyTextStyle.copyWith(
                        fontSize: 11, color: const Color(0xff9B9B9B)),
                  )
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              InkWell(
                onTap: () async {
                  customeModal(
                    context,
                    Padding(
                      padding: lsymetric.copyWith(top: 25),
                      child: Wrap(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () async {
                                  await showDialog(
                                    context: context,
                                    builder: (context) =>
                                        AlertInfomasi(function: () async {
                                      await state.deleteWistlist(
                                        context,
                                        widget.data.treatmentId!.toInt(),
                                      );
                                      Get.back();
                                      Get.back();
                                      widget.onDelete();
                                    }),
                                  );
                                },
                                child: Text(
                                  'Delete',
                                  style: blackHigtTextStyle.copyWith(
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
                child: Container(
                  height: 30,
                  decoration: BoxDecoration(
                      border: Border.all(color: greenColor),
                      borderRadius: BorderRadius.circular(7)),
                  child: Center(
                    child: Icon(
                      Icons.delete,
                      color: redColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
