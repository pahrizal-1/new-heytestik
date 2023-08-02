import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme/theme.dart';
import 'appbar_widget.dart';

class ComentUlasanaCustomer extends StatefulWidget {
  final String imgUser;
  final String namaUser;
  final String namaProduk;
  final String namaBalasan;
  final String bulan;
  final String like;
  final String comentUser;
  final String? comentImg;
  final String balasanComent;

  const ComentUlasanaCustomer({
    super.key,
    required this.namaUser,
    required this.namaProduk,
    required this.bulan,
    required this.comentUser,
    this.comentImg = '',
    required this.balasanComent,
    required this.imgUser,
    required this.like,
    required this.namaBalasan,
  });

  @override
  State<ComentUlasanaCustomer> createState() => _ComentUlasanaCustomerState();
}

class _ComentUlasanaCustomerState extends State<ComentUlasanaCustomer> {
  bool isVisibelity = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: lsymetric.copyWith(bottom: 10, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 11,
              ),
              Row(
                children: [
                  Image.asset(
                    widget.imgUser,
                    width: 40,
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.namaUser,
                        style: blackHigtTextStyle.copyWith(fontSize: 15),
                      ),
                      Text(
                        widget.namaProduk,
                        style: blackHigtTextStyle.copyWith(
                            fontSize: 13, fontWeight: regular),
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Icon(Icons.more_vert)
                ],
              ),
              const SizedBox(
                height: 13,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    size: 12,
                    color: Color(0xffFFC36A),
                  ),
                  const Icon(
                    Icons.star,
                    size: 12,
                    color: Color(0xffFFC36A),
                  ),
                  const Icon(
                    Icons.star,
                    size: 12,
                    color: Color(0xffFFC36A),
                  ),
                  const Icon(
                    Icons.star,
                    size: 12,
                    color: Color(0xffFFC36A),
                  ),
                  const Icon(
                    Icons.star,
                    size: 12,
                    color: Color(0xffFFC36A),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Text(
                    widget.bulan,
                    style: blackHigtTextStyle.copyWith(
                        fontSize: 12, fontWeight: regular),
                  )
                ],
              ),
              const SizedBox(
                height: 13,
              ),
              Text(
                widget.comentUser,
                style: greyTextStyle.copyWith(
                    fontSize: 13, color: const Color(0xff6B6B6B)),
              ),
              const SizedBox(
                height: 13,
              ),
              widget.comentImg != ''
                  ? Image.asset(
                      widget.comentImg.toString(),
                      width: 72,
                    )
                  : Container(),
              const SizedBox(
                height: 13,
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/icons/like.png',
                    width: 15,
                    color: greenColor,
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  Text(
                    '${widget.like} orang terbantu',
                    style: grenTextStyle.copyWith(
                        fontSize: 13, fontWeight: regular),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isVisibelity = !isVisibelity;
                      });
                    },
                    child: Row(
                      children: [
                        isVisibelity
                            ? Text(
                                'Liat Balesan',
                                style: blackRegulerTextStyle.copyWith(
                                    fontSize: 13),
                              )
                            : Text(
                                'Tutup Balasan',
                                style: blackRegulerTextStyle.copyWith(
                                    fontSize: 13),
                              ),
                        const SizedBox(
                          width: 4,
                        ),
                        const Icon(
                          Icons.keyboard_arrow_down,
                          color: Color(0xff6B6B6B),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Visibility(
                visible: isVisibelity,
                child: Row(
                  children: [
                    Container(
                      height: 60,
                      width: 2,
                      decoration: BoxDecoration(color: greenColor),
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                widget.namaBalasan,
                                style: blackHigtTextStyle.copyWith(
                                    fontSize: 13, color: subTitleColor),
                              ),
                              Text(
                                ' 1 bulan lalu',
                                style: blackRegulerTextStyle.copyWith(
                                    color: subTitleColor, fontSize: 13),
                              )
                            ],
                          ),
                          Text(
                            widget.balasanComent,
                            style: subTitleTextStyle,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        const dividergreen(),
      ],
    );
  }
}
