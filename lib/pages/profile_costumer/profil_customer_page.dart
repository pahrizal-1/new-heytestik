import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import 'package:heystetik_mobileapps/widget/rating_dengan_ulasan_widgets.dart';
import 'package:heystetik_mobileapps/widget/topik_ulasan_widgets.dart';

import '../../theme/theme.dart';
import '../../widget/button_widget.dart';
import '../../widget/category_cirkel_widgets.dart';
import '../../widget/filter_tap_widget.dart';

import '../../widget/post_dengan_poto.dart';
import '../../widget/post_polling.dart';
import '../../widget/show_modal_dialog.dart';
import '../setings&akun/akun_home_page.dart';
import 'edit_profil_customer_page.dart';

class ProfilCustomerPage extends StatefulWidget {
  final double? height;
  final Color? color;
  const ProfilCustomerPage(
      {super.key, this.height = 1, this.color = Colors.white});

  @override
  State<ProfilCustomerPage> createState() => _ProfilCustomerPageState();
}

class _ProfilCustomerPageState extends State<ProfilCustomerPage> {
  int iSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: whiteColor,
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
                'Rina Rasmalina',
                style: blackHigtTextStyle.copyWith(fontSize: 20),
              )
            ],
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AkunHomePage(),
                ),
              );
            },
            child: SvgPicture.asset(
              'assets/icons/humberger-icons.svg',
            ),
          ),
          const SizedBox(
            width: 26,
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 23, left: 25, right: 25, bottom: 18),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/images/profiledummy.png'),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Rina Rasmalina',
                          style: blackTextStyle.copyWith(fontSize: 18),
                        ),
                        Text(
                          'Jakarta, 20 Tahun',
                          style: blackRegulerTextStyle.copyWith(fontSize: 13),
                        ),
                        Row(
                          children: [
                            Text(
                              'Kering',
                              style:
                                  blackRegulerTextStyle.copyWith(fontSize: 13),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: greenColor,
                            )
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              left: 13, right: 12, top: 7, bottom: 5),
                          decoration: BoxDecoration(
                            border: Border.all(color: borderColor),
                            borderRadius: BorderRadius.circular(
                              15,
                            ),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/icons/gelar.png',
                                height: 14,
                              ),
                              const SizedBox(
                                width: 6.4,
                              ),
                              Text(
                                'Bronze Member',
                                style: blackRegulerTextStyle.copyWith(
                                  fontSize: 13,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const EditProfilCostomer()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Image.asset(
                          'assets/icons/edit.png',
                          width: 20,
                          color: blackColor,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 26,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          'Followers',
                          style: subTitleTextStyle.copyWith(fontSize: 13),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          '0',
                          style: blackTextStyle.copyWith(fontSize: 13),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                    Container(
                      width: 0.4,
                      height: 30,
                      color: blackColor,
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                    Column(
                      children: [
                        Text(
                          'Following',
                          style: subTitleTextStyle.copyWith(fontSize: 13),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          '0',
                          style: blackTextStyle.copyWith(fontSize: 13),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                    Container(
                      width: 0.4,
                      height: 30,
                      color: blackColor,
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                    Column(
                      children: [
                        Text(
                          'Posts',
                          style: subTitleTextStyle.copyWith(fontSize: 13),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          '0',
                          style: blackTextStyle.copyWith(fontSize: 13),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                    Container(
                      width: 0.4,
                      height: 30,
                      color: blackColor,
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                    Column(
                      children: [
                        Text(
                          'Reviews',
                          style: subTitleTextStyle.copyWith(fontSize: 13),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          '0',
                          style: blackTextStyle.copyWith(fontSize: 13),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const dividergreen(),
          const SizedBox(
            height: 19,
          ),
          Padding(
            padding: lsymetric,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      iSelected = 0;
                    });
                  },
                  child: Column(
                    children: [
                      Text(
                        'Posts',
                        style: subTitleTextStyle.copyWith(
                            fontSize: 15,
                            color: iSelected == 0 ? greenColor : subTitleColor,
                            fontWeight: bold),
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      Container(
                        height: 2,
                        width: 170,
                        decoration: BoxDecoration(
                            color: iSelected == 0 ? greenColor : subTitleColor),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      iSelected = 1;
                    });
                  },
                  child: Column(
                    children: [
                      Text(
                        'Reviews',
                        style: subTitleTextStyle.copyWith(
                            fontSize: 15,
                            fontWeight: bold,
                            color: iSelected == 1 ? greenColor : subTitleColor),
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      Container(
                        height: 2,
                        width: 170,
                        decoration: BoxDecoration(
                          color: iSelected == 1 ? greenColor : subTitleColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 22),
            child: Column(
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/profiledummy.png'),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: fromCssColor('#CCCCCC'),
                          ),
                          borderRadius: BorderRadius.circular(35),
                        ),
                        child: Container(
                          padding: const EdgeInsets.only(left: 12),
                          transform: Matrix4.translationValues(0, -3, 0),
                          child: TextFormField(
                            style: const TextStyle(
                                fontSize: 15, fontFamily: 'ProximaNova'),
                            decoration: InputDecoration(
                                hintText:
                                    'Mau share apa hari ini? Tulis disini yuk :)',
                                border: InputBorder.none,
                                hintStyle:
                                    subTitleTextStyle.copyWith(fontSize: 13)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 13,
                ),
              ],
            ),
          ),
          dividergrey(),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 26, top: 9, right: 26),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 5),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 9,
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: borderColor,
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    child: Image.asset(
                      'assets/icons/search1.png',
                      height: 10,
                      width: 10,
                    ),
                  ),
                  const CategoryProfilAkun(
                    title: 'Semua',
                  ),
                  const CategoryProfilAkun(
                    title: 'Stream',
                  ),
                  CategoryProfilAkun(
                      title: 'My Journey',
                      onPressed: () {
                        customeshomodal(
                            context, const RatingDenganUlasanWidgets());
                      }),
                  CategoryProfilAkun(
                    title: 'Polling',
                    onPressed: () {
                      customeshomodal(
                        context,
                        Wrap(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 33, right: 33, top: 30, bottom: 40),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Image.asset(
                                          'assets/icons/danger-icons.png',
                                          width: 14,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 22,
                                      ),
                                      Text(
                                        'Rating dengan ulasan',
                                        style: blackHigtTextStyle.copyWith(
                                            fontSize: 20),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 39,
                                  ),
                                  const FilterTapRating(
                                    title: '1',
                                  ),
                                  const FilterTapRating(
                                    title: '2',
                                  ),
                                  const FilterTapRating(
                                    title: '3',
                                  ),
                                  const FilterTapRating(
                                    title: '4',
                                  ),
                                  const FilterTapRating(
                                    title: '5',
                                  ),
                                  const ButtonGreenWidget(title: 'Tampilkan')
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  CategoryProfilAkun(
                    title: 'Liked',
                    onPressed: () {
                      customeshomodal(context, const TopikUlasanWidgets());
                    },
                  ),
                  CategoryProfilAkun(
                    onPressed: () {
                      customeshomodal(context, const TopikUlasanWidgets());
                    },
                    title: 'Saved',
                  ),
                ],
              ),
            ),
          ),
          const PostDenganPoto(),
          const PostPolling(),
        ],
      ),
    );
  }
}
