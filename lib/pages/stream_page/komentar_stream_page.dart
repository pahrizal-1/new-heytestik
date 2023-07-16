import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

import '../../widget/appbar_widget.dart';
import '../../widget/shere_link_stream.dart';

class KomentarStreamPage extends StatelessWidget {
  const KomentarStreamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: const EdgeInsets.only(left: 6),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: blackColor,
                ),
              ),
              const SizedBox(
                width: 11,
              ),
              Text(
                'Komentar',
                style: blackHigtTextStyle.copyWith(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 17, top: 16, bottom: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 30,
                        width: 30,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/profiledummy.png',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 11,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Kevin',
                            style: blackTextStyle.copyWith(fontSize: 14),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            '9 Mei 2023, 6 Jam yang lalu',
                            style: subTitleTextStyle.copyWith(fontSize: 10),
                          )
                        ],
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            backgroundColor: Colors.white,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadiusDirectional.only(
                                topEnd: Radius.circular(25),
                                topStart: Radius.circular(25),
                              ),
                            ),
                            builder: (context) => const ShareLinkStream(),
                          );
                        },
                        child: Icon(
                          Icons.more_horiz,
                          color: subgreyColor,
                          size: 24,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    constraints: const BoxConstraints(maxWidth: 320),
                    child: Text(
                      'Ada yang tau nggak guyss rekomendasi klinik yang ada perawatan Laser CO2-nya? Comment dong yaa dibawah',
                      style: blackRegulerTextStyle.copyWith(
                          fontSize: 14, color: blackColor),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    '132 menyukai',
                    style: subTitleTextStyle.copyWith(fontSize: 12),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 20,
                            width: 20,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/icons/like.png'),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Container(
                            height: 21,
                            width: 21,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/icons/share.png'),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Container(
                            height: 21,
                            width: 21,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/icons/bookmark-icons.png'),
                              ),
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const KomentarStreamPage(),
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            Text(
                              '13',
                              style: TextStyle(
                                  color: greyColor,
                                  fontSize: 14,
                                  fontWeight: bold,
                                  fontFamily: 'ProximaNova'),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                              height: 20,
                              width: 20,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/icons/komen1.png'),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            dividergrey(),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 17, top: 24, bottom: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 30,
                        width: 30,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/profiledummy.png',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 11,
                      ),
                      Container(
                        constraints: const BoxConstraints(maxWidth: 290),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Annisa',
                                  style: blackTextStyle.copyWith(fontSize: 14),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '3h',
                                  style: blackRegulerTextStyle.copyWith(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              'Hi Kevin, ada nih klinik kecantikan di daerah Senopati Jakarta Selatan yang nyediain laser CO2. Itu klinik kecantikan langgananku jugaa buat ngatasin bopeng hehhehe. Recommended 👍🏻',
                              style: blackRegulerTextStyle.copyWith(
                                color: blackColor,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(
                              height: 11,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Suka',
                                  style: blackRegulerTextStyle.copyWith(
                                      fontSize: 12),
                                ),
                                const SizedBox(
                                  width: 17,
                                ),
                                Text(
                                  'Balas',
                                  style: blackRegulerTextStyle.copyWith(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              decoration: BoxDecoration(
                                color:
                                    const Color.fromRGBO(241, 241, 241, 0.95),
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 30,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            image: AssetImage(
                                              'assets/images/profiledummy.png',
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 11,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Kevin',
                                                style: blackTextStyle.copyWith(
                                                    fontSize: 14),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                '3h',
                                                style: blackRegulerTextStyle
                                                    .copyWith(fontSize: 12),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 6,
                                          ),
                                          Container(
                                            constraints: const BoxConstraints(
                                                maxWidth: 220),
                                            child: Text.rich(
                                              TextSpan(
                                                text: 'Mantaaaaaps ',
                                                style: blackRegulerTextStyle
                                                    .copyWith(
                                                  fontSize: 14,
                                                  color: blackColor,
                                                ),
                                                children: [
                                                  TextSpan(
                                                    text: '@Ressy',
                                                    style:
                                                        grenTextStyle.copyWith(
                                                      fontSize: 14,
                                                      fontWeight: regular,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text:
                                                        ' makasiiihhh rekomennya, kayaknya gue bakalan kesanaa',
                                                    style: blackRegulerTextStyle
                                                        .copyWith(
                                                      fontSize: 14,
                                                      color: blackColor,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 11,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'Suka',
                                                style: blackRegulerTextStyle
                                                    .copyWith(fontSize: 12),
                                              ),
                                              const SizedBox(
                                                width: 17,
                                              ),
                                              Text(
                                                'Balas',
                                                style: blackRegulerTextStyle
                                                    .copyWith(
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.more_horiz,
                        size: 24,
                        color: greyColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
