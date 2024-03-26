import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class CabangKlinikPage extends StatelessWidget {
  const CabangKlinikPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  size: 24,
                  color: blackColor,
                ),
              ),
              const SizedBox(
                width: 11,
              ),
              Text(
                'Cabang Klinik',
                style: blackTextStyle.copyWith(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            padding: lsymetric.copyWith(top: 19, bottom: 19),
            margin: const EdgeInsets.only(top: 10),
            height: 131,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Container(
                  width: 93,
                  height: 93,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/litheapoto.png'),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 17,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/icons/clock-icons.png',
                          width: 15,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          'Tutup',
                          style: subTitleTextStyle,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      'SOZO Clinic, Arteri',
                      style: blackHigtTextStyle.copyWith(fontSize: 15),
                    ),
                    const SizedBox(
                      height: 4,
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
                          '4.9 (0k)',
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
                          '4,3 km',
                          style: subGreyTextStyle.copyWith(
                              fontSize: 11, color: const Color(0xff9B9B9B)),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: lsymetric.copyWith(top: 19, bottom: 19),
            margin: const EdgeInsets.only(top: 10),
            height: 131,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Container(
                  width: 93,
                  height: 93,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/litheapoto.png'),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 17,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      'SOZO Clinic, Arteri',
                      style: blackHigtTextStyle.copyWith(fontSize: 15),
                    ),
                    const SizedBox(
                      height: 4,
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
                          '4.9 (0k)',
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
                          '4,3 km',
                          style: subGreyTextStyle.copyWith(
                              fontSize: 11, color: const Color(0xff9B9B9B)),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
