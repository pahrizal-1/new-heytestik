import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/pages/stream_page/buat_postingan_page.dart';
import 'package:heystetik_mobileapps/pages/stream_page/komentar_stream_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

import '../../widget/appbar_widget.dart';
import '../../widget/shere_link_stream.dart';

class TabbarStreamHomePage extends StatelessWidget {
  const TabbarStreamHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return Column(
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
                              image:
                                  AssetImage('assets/images/profiledummy.png'),
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
                              builder: (context) => ShareLinkStream(),
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
                    Text(
                      '2 minggu lalu abis peeling wajah di salah satu klinik di Jaksel. Awalnya muka aku agak memerah dikit sih, tpi so farrr suka bgtt sama hasilnya setelah 2 minggu iniii. Yang penting jgn lupa sunscreen guyssss',
                      style: blackRegulerTextStyle.copyWith(fontSize: 14),
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
                                builder: (context) =>
                                    const KomentarStreamPage(),
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
                                    image:
                                        AssetImage('assets/icons/komen1.png'),
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
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const BuatPostinganPage(),
            ),
          );
        },
        elevation: 0,
        backgroundColor: greenColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 28,
                width: 28,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/icons/edit-Post-icons.png'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
