import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:heystetik_mobileapps/pages/stream_page/penerbit_info_page.dart';
import 'package:heystetik_mobileapps/pages/stream_page/view_detail_tags_page.dart';

import 'package:heystetik_mobileapps/widget/artikel_views_widgets.dart';
import 'package:heystetik_mobileapps/widget/tags.dart';

import '../../theme/theme.dart';
import '../../widget/pencarian_search_widget.dart';

class ViewDetailBeutyStreamPage extends StatelessWidget {
  const ViewDetailBeutyStreamPage({super.key});

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
              Expanded(
                child: Text(
                  'News',
                  style: blackTextStyle.copyWith(
                      fontSize: 20, overflow: TextOverflow.ellipsis),
                ),
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
                  builder: (context) => const PencarianPageWidget(),
                ),
              );
            },
            child: SvgPicture.asset(
              'assets/icons/search.svg',
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
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 19,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'BEAUTY / CONCERN',
                    style: grenTextStyle.copyWith(fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Berjemur Berlebihan Sebabkan Kerusakan Kulit?',
                  style: blackTextStyle.copyWith(
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 3,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const InfoPenerbitPage(),
                      ),
                    );
                  },
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                        text: 'By',
                        style: subTitleTextStyle.copyWith(fontSize: 12),
                        children: [
                          TextSpan(
                            text: ' Nadira Maurizka',
                            style: blackRegulerTextStyle.copyWith(
                              color: blackColor,
                              fontSize: 12,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: 'Medical Review by',
                      style: subTitleTextStyle.copyWith(fontSize: 12),
                      children: [
                        TextSpan(
                          text: ' dr. Reeza Edward, Sp.DV',
                          style: blackRegulerTextStyle.copyWith(
                            color: blackColor,
                            fontSize: 12,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '25 Januari 2022  | ',
                      style: subTitleTextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    Image.asset(
                      'assets/icons/book-menu.png',
                      width: 9.5,
                      height: 9.5,
                    ),
                    Text(
                      ' 2 Mins',
                      style: subTitleTextStyle.copyWith(
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 17,
                ),
                Image.asset(
                  'assets/images/Berjemur1-Stream.png',
                  height: 166.908,
                  width: 350,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 20,
                ),
                RichText(
                  text: TextSpan(
                    text:
                        'Hal yang tidak bisa kamu sangkal, bahwa berjemur dibawah sinar matahari pagi sebenarnya memiliki banyak manfaat. Terlebih saat ini kondisi pandemi covid-19 yang tidak kunjung reda sehingga dianjurkan untuk rutin berjemur di pagi hari. Manfaatnya sendiri karena mampu meningkatkan imun tubuh, mengurangi resiko terkena kanker, dan menghilangkan stress. Selain itu, manfaat vitamin D bekerja lebih optimal diserap tubuh saat berjemur di pagi hari, dan sekaligus sangat berguna untuk memperkuat tulang dan memiliki khasiat yang bagus untuk kulit.\n\n\n',
                    style: blackRegulerTextStyle.copyWith(
                        fontSize: 14,
                        letterSpacing: 0.5,
                        wordSpacing: 1,
                        height: 1.6,
                        color: blackColor),
                    children: [
                      TextSpan(
                        text:
                            'Berjemur yang aman bisa dilakukan sekitar 3 kali seminggu tiap pukul 9 pagi untuk durasi berjemur sekitar 5 - 15 menit. Dengan begitu, vitamin D bisa diproduksi secara efektif dengan bantuan sinar ultraviolet dari pancaran matahari. Namun jika dilakukan terlalu sering atau dengan durasi terlalu lama, tentu akan berakibat tidak baik untuk tubuh.\n\n\n',
                        style: blackRegulerTextStyle.copyWith(
                            fontSize: 14,
                            letterSpacing: 0.5,
                            wordSpacing: 1,
                            height: 1.6,
                            color: blackColor),
                        children: [
                          TextSpan(
                            text: 'Baca Juga:',
                            style: blackTextStyle.copyWith(fontSize: 14),
                            children: [
                              TextSpan(
                                text:
                                    ' Benarkah Skin Fasting Dapat Mendetoks Kulit?\n\n\n',
                                style: grenTextStyle.copyWith(
                                  fontSize: 14,
                                  fontStyle: FontStyle.italic,
                                ),
                              )
                            ],
                          ),
                          TextSpan(
                            text:
                                'Apa Akibat Berjemur Terlalu Lama Bagi Kulit?\n\n',
                            style: blackTextStyle.copyWith(fontSize: 15),
                            children: [
                              TextSpan(
                                text:
                                    'Sesuatu yang dilakukan secara berlebihan memang tidaklah baik, salah satunya berjemur dibawah sinar matahari secara berlebihan. Hal ini tentu mampu memicu kerusakan kulit yang disebabkan oleh sinar ultraviolet matahari pada siang hari menjadi tidak terkontrol. Selain itu kulit yang terpanggang dalam waktu yang lama akan mengakibatkan berbagai masalah dibawah ini, seperti:',
                                style: blackRegulerTextStyle.copyWith(
                                  fontSize: 14,
                                  letterSpacing: 0.5,
                                  wordSpacing: 1,
                                  height: 1.6,
                                  color: blackColor,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Tags',
                  style: blackHigtTextStyle.copyWith(fontSize: 15),
                ),
                const SizedBox(
                  height: 10,
                ),
                Wrap(
                  children: [
                    TagsNews(
                      title: 'Tanda Penuaan',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ViewDetailTags(),
                          ),
                        );
                      },
                    ),
                    const TagsNews(
                      title: 'Mengendur',
                    ),
                    const TagsNews(
                      title: 'Kusam',
                    ),
                    const TagsNews(
                      title: 'Keriput',
                    ),
                    const TagsNews(
                      title: 'Tabir Surya',
                    ),
                  ],
                ),
                const SizedBox(
                  height: 38,
                ),
                Center(
                  child: Image.asset(
                    'assets/icons/icons-cickel.png',
                    width: 30,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: 'Artikelnya Bermanfaat?',
                      style: blackTextStyle.copyWith(fontSize: 14),
                      children: [
                        TextSpan(
                          text: ' Share Yuk :)',
                          style: blackRegulerTextStyle.copyWith(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icons/ig-icons-cickerl.png',
                      width: 30,
                      height: 30,
                    ),
                    const SizedBox(
                      width: 6.83,
                    ),
                    Image.asset(
                      'assets/icons/facbook-icons-cickel.png',
                      width: 30,
                      height: 30,
                    ),
                    const SizedBox(
                      width: 6.83,
                    ),
                    Image.asset(
                      'assets/icons/mail-icons-cirkel.png',
                      width: 30,
                      height: 30,
                    ),
                    const SizedBox(
                      width: 6.83,
                    ),
                    Image.asset(
                      'assets/icons/wa-icons-Wassap.png',
                      width: 30,
                      height: 30,
                    ),
                    const SizedBox(
                      width: 6.83,
                    ),
                    Image.asset(
                      'assets/icons/share-icons-cickel.png',
                      width: 30,
                      height: 30,
                    ),
                    const SizedBox(
                      width: 6.83,
                    ),
                    Image.asset(
                      'assets/icons/salin_icons-cickel.png',
                      width: 30,
                      height: 30,
                    ),
                    const SizedBox(
                      width: 6.83,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          const Divider(
            thickness: 10,
            color: Color(0xFFECECEC),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 26, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Baca artikel lainnya juga, yuk!',
                  style: blackTextStyle.copyWith(fontSize: 16),
                ),
                const SizedBox(
                  height: 14,
                ),
                const ArtikelNews(
                  img: 'assets/icons/artikerl-panda.png',
                  category: 'BEAUTY / CONCERN',
                  judul: 'Cara Atasi Mata Panda dengan Tepat',
                  penerbit: '22 September 2022 | Nadira Maura',
                  menit: '2',
                ),
                const ArtikelNews(
                  img: 'assets/icons/artikerl-panda.png',
                  category: 'BEAUTY / CONCERN',
                  judul: 'Cara Atasi Mata Panda dengan Tepat',
                  penerbit: '22 September 2022 | Nadira Maura',
                  menit: '2',
                ),
                const ArtikelNews(
                  img: 'assets/icons/artikerl-panda.png',
                  category: 'BEAUTY / CONCERN',
                  judul: 'Cara Atasi Mata Panda dengan Tepat',
                  penerbit: '22 September 2022 | Nadira Maura',
                  menit: '2',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
