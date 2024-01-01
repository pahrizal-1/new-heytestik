import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/cart_controller.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/wishlist_controller.dart';
import 'package:heystetik_mobileapps/core/currency_format.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/alert_dialog_ulasan.dart';
import 'package:heystetik_mobileapps/models/customer/cart_model.dart';
import 'appbar_widget.dart';

class ProdukCardWidget extends StatefulWidget {
  final int index;
  final Data2 data;

  const ProdukCardWidget({Key? key, required this.index, required this.data})
      : super(key: key);

  @override
  State<ProdukCardWidget> createState() => _ProdukCardWidgetState();
}

class _ProdukCardWidgetState extends State<ProdukCardWidget> {
  final CartController state = Get.put(CartController());
  final WishlistController wishlist = Get.put(WishlistController());

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
                      state.onChecklist(widget.index, false);
                      setState(() {});
                    },
                    child: Container(
                      width: 23,
                      padding: const EdgeInsets.all(4),
                      height: 23,
                      decoration: BoxDecoration(
                        color: state.checklist[widget.index]['isSelected']
                            ? greenColor
                            : null,
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(
                            color: state.checklist[widget.index]['isSelected']
                                ? greenColor
                                : borderColor),
                      ),
                      child: state.checklist[widget.index]['isSelected']
                          ? Image.asset('assets/icons/chek_new.png')
                          : null,
                    ),
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  Text(
                    widget.data.product?.type ?? '-',
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
                                  state.onChecklist(widget.index, false);
                                  setState(() {});
                                },
                                child: Container(
                                  width: 23,
                                  padding: const EdgeInsets.all(4),
                                  height: 23,
                                  decoration: BoxDecoration(
                                    color: state.checklist[widget.index]
                                            ['isSelected']
                                        ? greenColor
                                        : null,
                                    borderRadius: BorderRadius.circular(7),
                                    border: Border.all(
                                        color: state.checklist[widget.index]
                                                ['isSelected']
                                            ? greenColor
                                            : borderColor),
                                  ),
                                  child: state.checklist[widget.index]
                                          ['isSelected']
                                      ? Image.asset('assets/icons/chek_new.png')
                                      : null,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                  border: Border.all(color: borderColor),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      '${Global.FILE}/${widget.data.product!.mediaProducts?[0].media?.path}',
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    constraints: BoxConstraints(maxWidth: 100),
                                    child: Text(
                                      widget.data.product?.name ?? '-',
                                      style: grenTextStyle.copyWith(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
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
                                          // letterSpacing: 0.5,
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
                                            constraints: const BoxConstraints(
                                                maxWidth: 70),
                                            child: Text(
                                              "${widget.data.product!.skincareDetail?.specificationHowToUse ?? widget.data.product!.drugDetail!.specificationDose}",
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
                                            '0x sehari',
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
                                  Container(
                                    constraints:
                                        const BoxConstraints(maxWidth: 200),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          CurrencyFormat.convertToIdr(
                                              widget.data.product?.price ?? 0,
                                              0),
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
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Column(
                                          children: [
                                            const SizedBox(
                                              width: 4,
                                            ),
                                            Text(
                                              '${widget.data.qty} ${widget.data.product?.skincareDetail?.specificationPackagingType ?? widget.data.product?.drugDetail?.specificationPackaging}',
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
                                            if (widget.data.product?.type ==
                                                'SKINCARE')
                                              Text(
                                                '(${widget.data.product?.skincareDetail?.specificationNetto}${widget.data.product?.skincareDetail?.specificationNettoType}) ',
                                                style: TextStyle(
                                                  fontFamily: 'ProximaNova',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold,
                                                  letterSpacing: 0.5,
                                                  color: fromCssColor(
                                                    '#323232',
                                                  ),
                                                ),
                                              ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  TextFormField(
                    maxLines: 6,
                    minLines: 1,
                    maxLength: 114,
                    onChanged: (value) {
                      state.checklist[widget.index]['notes'] = value;
                    },
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
                      hintText: widget.data.notes ?? '',
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
                          await wishlist.addWishlist(
                              context, widget.data.productId!);
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
                              await state.deleteCart(context, widget.data.id!);
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
                            InkWell(
                              onTap: () {
                                if (state.checklist[widget.index]['qty'] > 1) {
                                  state.decrement(widget.index);
                                  setState(() {});
                                }
                              },
                              child: Icon(
                                Icons.remove,
                                size: 15,
                                color: state.checklist[widget.index]['qty'] <= 1
                                    ? greyColor
                                    : greenColor,
                              ),
                            ),
                            const SizedBox(
                              width: 21,
                            ),
                            Text(state.checklist[widget.index]['qty']
                                .toString()),
                            const SizedBox(
                              width: 21,
                            ),
                            InkWell(
                              onTap: () {
                                state.increment(widget.index);
                                setState(() {});
                              },
                              child: Icon(
                                Icons.add,
                                size: 15,
                                color: greenColor,
                              ),
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
