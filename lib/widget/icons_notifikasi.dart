// ignore_for_file: deprecated_member_use, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/cart_controller.dart';
import 'package:heystetik_mobileapps/pages/home/notifikasion_page.dart';
import 'package:heystetik_mobileapps/pages/solution/keranjang_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

Widget notificasion(
  BuildContext context,
  String jumlah,
  Color iconsColor,
) {
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const NotifikasionPage(),
        ),
      );
    },
    child: Stack(
      children: [
        SvgPicture.asset(
          'assets/icons/notif-icons.svg',
          color: iconsColor,
        ),
        Container(
          height: 15,
          width: 15,
          transform: Matrix4.translationValues(
            9,
            -4,
            10,
          ),
          decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red),
          child: Center(
            child: Text(
              jumlah,
              style: whiteTextStyle.copyWith(
                  fontSize: 9, fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    ),
  );
}

class TotalKeranjang extends StatefulWidget {
  Color iconcolor;
  TotalKeranjang({
    required this.iconcolor,
    super.key,
  });

  @override
  State<TotalKeranjang> createState() => _TotalKeranjangState();
}

class _TotalKeranjangState extends State<TotalKeranjang> {
  final CartController state = Get.put(CartController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      state.totalCartFunc();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const KeranjangPage(),
            ),
          );
        },
        child: Obx(
          () => state.totalCart.value == 0
              ? SvgPicture.asset(
                  'assets/icons/trello-icons.svg',
                  color: widget.iconcolor,
                )
              : Stack(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/trello-icons.svg',
                      color: widget.iconcolor,
                    ),
                    Container(
                      height: 15,
                      width: 15,
                      transform: Matrix4.translationValues(
                        13,
                        -4,
                        10,
                      ),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.red),
                      child: Center(
                        child: Obx(
                          () => Text(
                            state.totalCart.value.toString(),
                            style: whiteTextStyle.copyWith(
                                fontSize: 9, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
