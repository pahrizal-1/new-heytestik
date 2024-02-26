import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';
import '../theme/theme.dart';

class BankMoreDialog extends StatelessWidget {
  BankMoreDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(0.1),
      content: Container(
        height: 370,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 200,
                    width: 240,
                    transform: Matrix4.translationValues(10, -60, 0),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/more-image.png',
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Container(
                    transform: Matrix4.translationValues(0, -50, 0),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 37, left: 37),
                      child: Column(
                        children: [
                          Text(
                            'Pembayaranmu Berhasil ',
                            style: blackHigtTextStyle.copyWith(
                                fontSize: 22, fontStyle: FontStyle.italic),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Langsung chat Dokter sekarang, yuk!',
                            style: greyTextStyle.copyWith(fontSize: 16),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          ButtonGreenWidget(
                            title: 'Kembali',
                            onPressed: () async {
                              Get.back();
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: InkWell(
                child: Container(
                  height: 45,
                  width: 45,
                  child: const Icon(
                    Icons.close,
                    color: Color(0xff323232),
                    size: 30,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AletTranSaksiProduct extends StatelessWidget {
  final String title1;
  final String title2;
  const AletTranSaksiProduct(
      {super.key, required this.title1, required this.title2});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(0.1),
      content: Container(
        height: 370,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 200,
                    width: 240,
                    transform: Matrix4.translationValues(10, -60, 0),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/more-image.png',
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Container(
                    transform: Matrix4.translationValues(0, -50, 0),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 37, left: 37),
                      child: Column(
                        children: [
                          Text(
                            title1,
                            style: blackHigtTextStyle.copyWith(
                                fontSize: 22, fontStyle: FontStyle.italic),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            title2,
                            style: greyTextStyle.copyWith(fontSize: 16),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          ButtonGreenWidget(
                            title: 'Kembali',
                            onPressed: () async {
                              Get.back();
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: InkWell(
                child: Container(
                  height: 45,
                  width: 45,
                  child: const Icon(
                    Icons.close,
                    color: Color(0xff323232),
                    size: 30,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AletTranSaksiTreatMent extends StatelessWidget {
  final String title1;
  final String title2;
  const AletTranSaksiTreatMent(
      {super.key, required this.title1, required this.title2});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(0.1),
      content: Container(
        height: 370,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 200,
                    width: 240,
                    transform: Matrix4.translationValues(10, -60, 0),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/more-image.png',
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Container(
                    transform: Matrix4.translationValues(0, -50, 0),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 37, left: 37),
                      child: Column(
                        children: [
                          Text(
                            title1,
                            style: blackHigtTextStyle.copyWith(
                                fontSize: 22, fontStyle: FontStyle.italic),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            title2,
                            style: greyTextStyle.copyWith(fontSize: 16),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          ButtonGreenWidget(
                            title: 'Kembali',
                            onPressed: () async {
                              Get.back();
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: InkWell(
                child: Container(
                  height: 45,
                  width: 45,
                  child: const Icon(
                    Icons.close,
                    color: Color(0xff323232),
                    size: 30,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
