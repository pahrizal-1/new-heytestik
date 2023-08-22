import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/wishlist_controller.dart';

import 'package:heystetik_mobileapps/widget/show_modal_dialog.dart';

import '../theme/theme.dart';
import 'alert_dialog_ulasan.dart';

class ProdukWitlistSkinCare extends StatelessWidget {
  final String namaBrand;
  final String namaProduk;
  final String diskonProduk;
  final String hargaDiskon;
  final String kota;
  final int id;
  final String harga;
  final String urlImg;
  final String rating;
  ProdukWitlistSkinCare(
      {super.key,
      required this.namaBrand,
      required this.namaProduk,
      required this.diskonProduk,
      required this.hargaDiskon,
      required this.kota,
      required this.id,
      required this.harga,
      required this.urlImg,
      required this.rating});

  final WishlistController state = Get.put(WishlistController());

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
                image: NetworkImage(urlImg),
                fit: BoxFit.cover,
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
                namaBrand,
                style: blackTextStyle.copyWith(
                  fontSize: 13,
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                namaProduk,
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
              Text(kota, style: subTitleTextStyle),
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
                                              await state.deleteWistlist(
                                                  context, id);
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
                                      InkWell(
                                        onTap: () {},
                                        child: Text(
                                          'Detail',
                                          style: blackTextStyle.copyWith(
                                            fontSize: 15,
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
                            ));
                      },
                      child: Image.asset(
                        'assets/icons/more-horizontal.png',
                        width: 12,
                      ),
                    )),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Expanded(
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
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

class ProdukWitlistObat extends StatelessWidget {
  final String namaBrand;
  final String namaProduk;

  final int id;
  final String harga;
  final String urlImg;
  final String rating;
  ProdukWitlistObat(
      {super.key,
      required this.namaBrand,
      required this.namaProduk,
      required this.id,
      required this.harga,
      required this.urlImg,
      required this.rating});

  final WishlistController state = Get.put(WishlistController());

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
                image: NetworkImage(urlImg),
                fit: BoxFit.cover,
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
                namaProduk,
                style: blackHigtTextStyle.copyWith(
                  fontSize: 13,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                harga,
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
                    rating,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap: () async {
                                        await showDialog(
                                          context: context,
                                          builder: (context) =>
                                              AlertInfomasi(function: () async {
                                            await state.deleteWistlist(
                                                context, id);
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
                                    InkWell(
                                      onTap: () {},
                                      child: Text(
                                        'Detail',
                                        style: blackTextStyle.copyWith(
                                          fontSize: 15,
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
                    )),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Expanded(
                    child: Container(
                      height: 30,
                      decoration: BoxDecoration(
                          border: Border.all(color: greenColor),
                          borderRadius: BorderRadius.circular(7)),
                      child: Center(
                        child: Text(
                          'Harus Resep Doctor',
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
