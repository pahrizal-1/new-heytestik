import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/cart_controller.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/medicine_controller.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/wishlist_controller.dart';
import 'package:heystetik_mobileapps/core/currency_format.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/widget/show_modal_dialog.dart';
import 'package:heystetik_mobileapps/models/customer/wishlist_model.dart';
import 'package:heystetik_mobileapps/widget/snackbar_widget.dart';
import '../theme/theme.dart';
import 'alert_dialog_ulasan.dart';

class ProdukWishlistSkinCare extends StatefulWidget {
  final Data2 data;
  final Function() onDelete;
  const ProdukWishlistSkinCare({
    super.key,
    required this.data,
    required this.onDelete,
  });

  @override
  State<ProdukWishlistSkinCare> createState() => _ProdukWishlistSkinCareState();
}

class _ProdukWishlistSkinCareState extends State<ProdukWishlistSkinCare> {
  final WishlistController state = Get.put(WishlistController());
  final CartController cart = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  '${Global.FILE}/${widget.data.product?.mediaProducts?[0].media?.path}',
                ),
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
                widget.data.product!.skincareDetail?.brand ?? '-',
                style: blackTextStyle.copyWith(
                  fontSize: 13,
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                widget.data.product?.name ?? '-',
                style: blackRegulerTextStyle.copyWith(
                  fontSize: 13,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  Container(
                    width: 28,
                    height: 13,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: const Color.fromRGBO(201, 42, 42, 0.2)),
                    child: Center(
                      child: Text(
                        '${CurrencyFormat.convertToIdr(widget.data.product?.price, 0)}%',
                        style: blackHigtTextStyle.copyWith(
                            color: redColor, fontSize: 11),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    CurrencyFormat.convertToIdr(widget.data.product?.price, 0),
                    style: subGreyTextStyle.copyWith(
                      fontSize: 12,
                      decoration: TextDecoration.lineThrough,
                      decorationThickness: 2,
                      color: const Color(0xff9B9B9B),
                    ),
                  ),
                ],
              ),
              Text(
                CurrencyFormat.convertToIdr(widget.data.product?.price, 0),
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
                    '${widget.data.product?.rating}',
                    style: subGreyTextStyle.copyWith(
                        fontSize: 11, color: const Color(0xff9B9B9B)),
                  )
                ],
              ),
              const SizedBox(
                height: 12,
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
                          customeshomodal(
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
                                            builder: (context) => AlertInfomasi(
                                                function: () async {
                                              Navigator.pop(context);
                                              Navigator.pop(context);
                                              await state.deleteWistlist(
                                                context,
                                                widget.data.productId!.toInt(),
                                              );
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
                          ).then((value) {
                            SnackbarWidget.getSuccessSnackbar(
                              context,
                              'Info',
                              'Produk berhasil dihapus dari Wishlist',
                            );
                          });
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
                      onTap: () async {
                        await cart.addCart(
                          context,
                          widget.data.productId!,
                          1,
                          '',
                        );
                      },
                      child: Container(
                        height: 30,
                        decoration: BoxDecoration(
                            border: Border.all(color: greenColor),
                            borderRadius: BorderRadius.circular(7)),
                        child: Center(
                          child: Text(
                            '+ Keranjang',
                            style: grenTextStyle.copyWith(fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

class ProdukWishlistObat extends StatefulWidget {
  final Data2 data;
  final Function() onDelete;
  const ProdukWishlistObat({
    super.key,
    required this.data,
    required this.onDelete,
  });

  @override
  State<ProdukWishlistObat> createState() => _ProdukWishlistObatState();
}

class _ProdukWishlistObatState extends State<ProdukWishlistObat> {
  final WishlistController state = Get.put(WishlistController());
  MedicineController medicineController = Get.put(MedicineController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            height: 100,
            width: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  '${Global.FILE}/${widget.data.product?.mediaProducts?[0].media?.path}',
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 11, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.data.product?.name ?? '-',
                style: blackHigtTextStyle.copyWith(
                  fontSize: 13,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                CurrencyFormat.convertToIdr(widget.data.product?.price, 0),
                style: blackHigtTextStyle.copyWith(fontSize: 15),
              ),
              const SizedBox(
                height: 3,
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
                    '${widget.data.product?.rating} (120k)',
                    style: subGreyTextStyle.copyWith(
                        fontSize: 11, color: const Color(0xff9B9B9B)),
                  )
                ],
              ),
              const SizedBox(
                height: 12,
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
                          customeshomodal(
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
                                            builder: (context) => AlertInfomasi(
                                                function: () async {
                                              Navigator.pop(context);
                                              Navigator.pop(context);
                                              await state.deleteWistlist(
                                                context,
                                                widget.data.productId!.toInt(),
                                              );
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
                          ).then((value) {
                            SnackbarWidget.getSuccessSnackbar(
                              context,
                              'Info',
                              'Produk berhasil dihapus dari Wishlist',
                            );
                          });
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
                  widget.data.product!.consultationRecipeDrugs!.isNotEmpty
                      ? Expanded(
                          child: InkWell(
                            onTap: () async {
                              medicineController.addMedicineToCart(
                                context,
                                widget.data.productId!,
                              );
                              SnackbarWidget.getSuccessSnackbar(
                                context,
                                'Info',
                                'Produk ditambahkan ke keranjang',
                              );
                            },
                            child: Container(
                              height: 30,
                              decoration: BoxDecoration(
                                  border: Border.all(color: greenColor),
                                  borderRadius: BorderRadius.circular(7)),
                              child: Center(
                                child: Text(
                                  '+ Keranjang',
                                  style: grenTextStyle.copyWith(fontSize: 12),
                                ),
                              ),
                            ),
                          ),
                        )
                      : Expanded(
                          child: Container(
                            height: 30,
                            decoration: BoxDecoration(
                              border: Border.all(color: greenColor),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Center(
                              child: Text(
                                'Harus Resep Dokter',
                                style: grenTextStyle.copyWith(fontSize: 12),
                              ),
                            ),
                          ),
                        ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
