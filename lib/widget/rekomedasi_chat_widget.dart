import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';

class RekomendasiDokterWidget extends StatelessWidget {
  const RekomendasiDokterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            height: 43,
            width: 270,
            decoration: BoxDecoration(
                color: greenColor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            child: Text(
              'Rekomendasi Dokter',
              style: whiteTextStyle.copyWith(fontSize: 15),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
            height: 299,
            width: 270,
            color: whiteColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Skin Care',
                  style: TextStyle(fontSize: 15),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Teenderm gel sensitive 150 ml',
                            style: grenTextStyle.copyWith(fontSize: 12),
                          ),
                          Text(
                            '1X',
                            style: greyTextStyle,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Teenderm Aqua 200ml',
                            style: grenTextStyle.copyWith(fontSize: 12),
                          ),
                          Text(
                            '1X',
                            style: greyTextStyle,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Teenderm Hydra 40ml',
                            style: grenTextStyle.copyWith(fontSize: 12),
                          ),
                          Text(
                            '1X',
                            style: greyTextStyle,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Teenderm Alphapure 30ml',
                            style: grenTextStyle.copyWith(fontSize: 12),
                          ),
                          Text(
                            '1X',
                            style: greyTextStyle,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Divider(
                        thickness: 2,
                      ),
                    ],
                  ),
                ),
                const Text(
                  'Treatment',
                  style: TextStyle(fontSize: 15),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Peeling',
                        style: grenTextStyle.copyWith(fontSize: 12),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Facial',
                        style: grenTextStyle.copyWith(fontSize: 12),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        'IPL (Intense Pulsed Light)',
                        style: grenTextStyle.copyWith(fontSize: 12),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const ButtonGreenWidget(title: 'Lihat Detail')
              ],
            ),
          ),
        ],
      ),
    );
  }
}
