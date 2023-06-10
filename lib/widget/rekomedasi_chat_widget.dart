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
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            height: 43,
            width: 270,
            decoration: BoxDecoration(
                color: greenColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            child: Text(
              'Rekomendasi Dokter',
              style: whiteTextStyle.copyWith(fontSize: 15),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 11),
            height: 299,
            width: 270,
            color: whiteColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Skin Care',
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
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
                      SizedBox(
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
                      SizedBox(
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
                      SizedBox(
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
                      SizedBox(
                        height: 16,
                      ),
                      Divider(
                        thickness: 2,
                      ),
                    ],
                  ),
                ),
                Text(
                  'Treatment',
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Peeling',
                        style: grenTextStyle.copyWith(fontSize: 12),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Facial',
                        style: grenTextStyle.copyWith(fontSize: 12),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'IPL (Intense Pulsed Light)',
                        style: grenTextStyle.copyWith(fontSize: 12),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ButtonGreenWidget(title: 'Lihat Detail')
              ],
            ),
          ),
        ],
      ),
    );
  }
}
