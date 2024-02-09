import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/cart_controller.dart';

import '../theme/theme.dart';

class SkincareWidget extends StatelessWidget {
  final int produkId;
  final String namaBrand;
  final String namaProduk;
  final String diskonProduk;
  final String hargaDiskon;
  final String? kota;

  final String harga;
  final String urlImg;
  final String rating;
  SkincareWidget({
    super.key,
    required this.produkId,
    required this.namaBrand,
    required this.namaProduk,
    required this.diskonProduk,
    required this.hargaDiskon,
    required this.harga,
    required this.urlImg,
    required this.rating,
    this.kota = '',
  });
  final CartController cart = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            border: Border.all(color: borderColor, width: 0.2),
            borderRadius: BorderRadius.circular(7),
          ),
          width: 150,
          child: Column(
            children: [
              Container(
                height: 135,
                width: 164,
                decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(urlImg))),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 11, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      namaBrand,
                      style: blackTextStyle.copyWith(
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      namaProduk,
                      style: blackRegulerTextStyle.copyWith(
                          fontSize: 13, overflow: TextOverflow.ellipsis),
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
                              '$diskonProduk%',
                              style: blackHigtTextStyle.copyWith(
                                  color: redColor, fontSize: 11),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          hargaDiskon,
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
                      harga,
                      style: blackHigtTextStyle.copyWith(fontSize: 15),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    kota != ''
                        ? Text(kota.toString(), style: subTitleTextStyle)
                        : Container(),
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
                          rating,
                          style: subGreyTextStyle.copyWith(
                              fontSize: 11, color: const Color(0xff9B9B9B)),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                      height: 30,
                      child: TextButton(
                        onPressed: () async {
                          await cart.addCart(context, produkId, 1, '');
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
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
