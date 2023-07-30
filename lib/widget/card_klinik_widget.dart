import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/pages/solution/cabang_klinik_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

class CardKlinik extends StatelessWidget {
  final String namaKlink;
  final String urlImg;
  final String rating;
  final String km;
  final String? buttonTitle;
  final int price;
  const CardKlinik({
    super.key,
    required this.namaKlink,
    required this.rating,
    required this.km,
    this.buttonTitle = '',
    required this.urlImg,
    required this.price,
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
                  image: NetworkImage(urlImg),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 18,
            ),
            Expanded(
              child: Container(
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
                    SizedBox(
                      height: 15,
                      child: ListView.builder(
                        itemCount: 5,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Icon(
                            Icons.attach_money,
                            size: 13,
                            color: price > (100000 * (index + 1)) ? Colors.black : Colors.grey,
                          );
                        },
                      ),
                    ),
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
                          style: subGreyTextStyle.copyWith(fontSize: 11, color: const Color(0xff9B9B9B)),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Image.asset(
                          'assets/icons/mapgrey.png',
                          width: 9,
                        ),
                        Text(
                          ' $km',
                          style: subGreyTextStyle.copyWith(fontSize: 11, color: const Color(0xff9B9B9B)),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 11,
                    ),
                    buttonTitle != ''
                        ? InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const CabangKlinikPage(),
                                ),
                              );
                            },
                            child: Container(
                              width: 182,
                              height: 25,
                              decoration: BoxDecoration(
                                color: subgreenColor,
                                borderRadius: BorderRadius.circular(23),
                              ),
                              child: Center(
                                child: Text(
                                  buttonTitle.toString(),
                                  style: grenTextStyle.copyWith(fontSize: 12),
                                ),
                              ),
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
