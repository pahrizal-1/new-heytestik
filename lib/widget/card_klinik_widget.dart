import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

class CardKlinik extends StatelessWidget {
  final String namaKlink;
  final String urlImg;
  final String rating;
  final String km;
  final String? buttonTitle;
  const CardKlinik({
    super.key,
    required this.namaKlink,
    required this.rating,
    required this.km,
    this.buttonTitle = '',
    required this.urlImg,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      child: Padding(
        padding: const EdgeInsets.only(top: 19, bottom: 20, left: 25),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 93,
              height: 93,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(urlImg),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 18,
            ),
            Container(
              constraints: const BoxConstraints(maxWidth: 250),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    namaKlink,
                    style: blackTextStyle.copyWith(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Image.asset('assets/icons/dolar.png'),
                  const SizedBox(
                    height: 6,
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
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Image.asset(
                        'assets/icons/mapgrey.png',
                        width: 9,
                      ),
                      Text(
                        ' $km KM',
                        style: subGreyTextStyle.copyWith(
                            fontSize: 11, color: const Color(0xff9B9B9B)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 11,
                  ),
                  buttonTitle != ''
                      ? Container(
                          height: 25,
                          width: 182,
                          padding: const EdgeInsets.only(
                              left: 16, right: 17, bottom: 5, top: 5),
                          decoration: BoxDecoration(
                            color: subgreenColor,
                            borderRadius: BorderRadius.circular(23),
                          ),
                          child: Text(
                            buttonTitle.toString(),
                            style: grenTextStyle.copyWith(fontSize: 12),
                          ),
                        )
                      : Container(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
