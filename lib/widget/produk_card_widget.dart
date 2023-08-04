import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/cart_controller.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/wishlist_controller.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/alert_dialog_ulasan.dart';

import 'appbar_widget.dart';

class ProdukCardWidget extends StatefulWidget {
  final int cartId;
  final int productId;
  final int qty;
  final String imageProduk;
  final String namaProdik;
  final String merkProduk;
  final String penggunaanJadwal;
  final String penggunaan;
  final String harga;
  final String hintText;
  final String packagingType;
  final String netto;
  final String nettoType;
  const ProdukCardWidget({
    Key? key,
    required this.cartId,
    required this.productId,
    required this.imageProduk,
    required this.merkProduk,
    required this.penggunaanJadwal,
    required this.penggunaan,
    required this.harga,
    required this.hintText,
    required this.namaProdik,
    required this.packagingType,
    required this.netto,
    required this.nettoType,
    required this.qty,
  }) : super(key: key);

  @override
  State<ProdukCardWidget> createState() => _ProdukCardWidgetState();
}

class _ProdukCardWidgetState extends State<ProdukCardWidget> {
  final CartController state = Get.put(CartController());
  final WishlistController wishlist = Get.put(WishlistController());
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: lsymetric.copyWith(top: 22, bottom: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        isSelected = !isSelected;
                      });
                    },
                    child: Container(
                      width: 23,
                      padding: const EdgeInsets.all(4),
                      height: 23,
                      decoration: BoxDecoration(
                        color: isSelected ? greenColor : null,
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(
                            color: isSelected ? greenColor : borderColor),
                      ),
                      child: isSelected
                          ? Image.asset('assets/icons/chek_new.png')
                          : null,
                    ),
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  Text(
                    widget.namaProdik,
                    style: blackTextStyle.copyWith(fontSize: 15),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 17, right: 5, bottom: 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(
                                    () {
                                      isSelected = !isSelected;
                                    },
                                  );
                                },
                                child: Container(
                                  width: 23,
                                  padding: const EdgeInsets.all(4),
                                  height: 23,
                                  decoration: BoxDecoration(
                                    color: isSelected ? greenColor : null,
                                    borderRadius: BorderRadius.circular(7),
                                    border: Border.all(
                                        color: isSelected
                                            ? greenColor
                                            : borderColor),
                                  ),
                                  child: isSelected
                                      ? Image.asset('assets/icons/chek_new.png')
                                      : null,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 80,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: borderColor),
                                        image: DecorationImage(
                                          image:
                                              NetworkImage(widget.imageProduk),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          widget.merkProduk,
                                          style: grenTextStyle.copyWith(
                                              fontSize: 14,
                                              overflow: TextOverflow.ellipsis),
                                          maxLines: 2,
                                          softWrap: true,
                                        ),
                                        // RichText(
                                        //   text: TextSpan(
                                        //     text: widget.merkProduk,
                                        //     style: TextStyle(
                                        //       fontFamily: 'ProximaNova',
                                        //       color: greenColor,
                                        //       fontSize: 12,
                                        //       fontWeight: FontWeight.bold,
                                        //       height: 1.1,
                                        //     ),
                                        //   ),
                                        // ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Penggunaan',
                                              style: TextStyle(
                                                fontFamily: 'ProximaNova',
                                                fontSize: 12,
                                                height: 1.3,
                                                letterSpacing: 0.5,
                                                color: fromCssColor(
                                                  '#9B9B9B',
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  constraints:
                                                      const BoxConstraints(
                                                          maxWidth: 80),
                                                  child: Text(
                                                    widget.penggunaanJadwal,
                                                    style: TextStyle(
                                                      fontFamily: 'ProximaNova',
                                                      fontSize: 12,
                                                      height: 1.3,
                                                      letterSpacing: 0.5,
                                                      color: fromCssColor(
                                                        '#9B9B9B',
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  widget.penggunaan,
                                                  style: TextStyle(
                                                    fontFamily: 'ProximaNova',
                                                    fontSize: 12,
                                                    height: 1.3,
                                                    letterSpacing: 0.5,
                                                    color: fromCssColor(
                                                      '#9B9B9B',
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              widget.harga,
                                              style: TextStyle(
                                                fontFamily: 'ProximaNova',
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 0.5,
                                                color: fromCssColor(
                                                  '#323232',
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 15,
                                            ),
                                            Text(
                                              '1 ${widget.packagingType}\n(${widget.netto}\n${widget.nettoType})',
                                              style: TextStyle(
                                                fontFamily: 'ProximaNova',
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 0.5,
                                                color: fromCssColor(
                                                  '#323232',
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  TextFormField(
                    // controller: state.notes,
                    maxLines: 6,
                    minLines: 1,
                    maxLength: 114,
                    decoration: InputDecoration(
                      labelText: 'Catatan',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: greenColor,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: greenColor,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: widget.hintText,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelStyle: TextStyle(
                        color: fromCssColor('#A3A3A3'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () async {
                          await wishlist.addWishlist(context, widget.productId);
                        },
                        child: Text(
                          'Pindahkan ke Wishlist',
                          style: subTitleTextStyle,
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () async {
                          await showDialog(
                            context: context,
                            builder: (context) =>
                                AlertInfomasi(function: () async {
                              await state.deleteCart(context, widget.cartId);
                            }),
                          );
                        },
                        child: Image.asset(
                          'assets/icons/trash.png',
                          width: 20,
                        ),
                      ),
                      const SizedBox(
                        width: 21,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          border: Border.all(color: borderColor),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.remove,
                              size: 15,
                              color: greyColor,
                            ),
                            const SizedBox(
                              width: 21,
                            ),
                            Text('${widget.qty}'),
                            const SizedBox(
                              width: 21,
                            ),
                            Icon(
                              Icons.add,
                              size: 15,
                              color: greenColor,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        const dividergreen(),
      ],
    );
  }
}
