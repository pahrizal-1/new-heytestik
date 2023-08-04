import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/widget/shere_link_stream.dart';

import '../pages/stream_page/komentar_stream_page.dart';
import '../theme/theme.dart';
import 'appbar_widget.dart';

class PostPolling extends StatelessWidget {
  const PostPolling({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 17, top: 16, bottom: 18),
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
                        image: AssetImage('assets/images/profiledummy.png'),
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
                        'Laura Nabilah',
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
                  // InkWell(
                  //   onTap: () {
                  //     showModalBottomSheet(
                  //       context: context,
                  //       backgroundColor: Colors.white,
                  //       shape: const RoundedRectangleBorder(
                  //         borderRadius: BorderRadiusDirectional.only(
                  //           topEnd: Radius.circular(25),
                  //           topStart: Radius.circular(25),
                  //         ),
                  //       ),
                  //       builder: (context) => ShareLinkStream(
                  //         username: ,
                  //       ),
                  //     );
                  //   },
                  //   child: Icon(
                  //     Icons.more_horiz,
                  //     color: subgreyColor,
                  //     size: 24,
                  //   ),
                  // )
                ],
              ),
              const SizedBox(
                height: 14,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  border: Border.all(
                    color: borderColor,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/icons/poll.png',
                          width: 13.2,
                          height: 11,
                          color: greenColor,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Polling',
                          style: grenTextStyle.copyWith(
                              fontSize: 15, fontWeight: regular),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Text(
                      'Guyysss galau niiih, menurut kalian mending pilih treatment apa yang bagus buat anti-aging. Antara mau  Botox atau Threadlift. Pleasee votee yaaa.',
                      style: blackTextStyle.copyWith(fontSize: 14),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Container(
                      height: 38,
                      width: 304,
                      margin: EdgeInsets.only(
                        top: 11,
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 15,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: greenColor),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Text(
                        'Botox',
                        style: grenTextStyle.copyWith(
                            fontSize: 14, fontWeight: regular),
                      ),
                    ),
                    Container(
                      height: 38,
                      width: 304,
                      margin: EdgeInsets.only(
                        top: 11,
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 15,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: greenColor),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Text(
                        'Threadlift',
                        style: grenTextStyle.copyWith(
                            fontSize: 14, fontWeight: regular),
                      ),
                    ),
                    const SizedBox(
                      height: 11,
                    ),
                    Text(
                      '120 votes . Polling berakhir dalam 23 jam 59 menit',
                      style: subTitleTextStyle.copyWith(fontSize: 10),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 17,
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
                            image:
                                AssetImage('assets/icons/bookmark-icons.png'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const KomentarStreamPage(),
                      //   ),
                      // );
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
        const dividergreen(),
      ],
    );
  }
}
