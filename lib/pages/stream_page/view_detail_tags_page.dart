import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../theme/theme.dart';
import '../../widget/artikel_views_widgets.dart';
import '../../widget/pencarian_search_widget.dart';

class ViewDetailTags extends StatelessWidget {
  const ViewDetailTags({super.key});

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 19, right: 20, left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Tags',
                style: grenTextStyle.copyWith(fontSize: 10),
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                'TANDA PENUAAN',
                style: blackTextStyle.copyWith(fontSize: 20),
              ),
              const SizedBox(
                height: 44,
              ),
              ArtikelNews(
                img: 'assets/icons/artikerl-panda.png',
                category: 'BEAUTY / CONCERN',
                judul: 'Cara Atasi Mata Panda dengan Tepat',
                penerbit: '22 September 2022 | Nadira Maura',
                menit: '2',
              ),
              ArtikelNews(
                img: 'assets/icons/artikerl-panda.png',
                category: 'BEAUTY / CONCERN',
                judul: 'Cara Atasi Mata Panda dengan Tepat',
                penerbit: '22 September 2022 | Nadira Maura',
                menit: '2',
              ),
              ArtikelNews(
                img: 'assets/icons/artikerl-panda.png',
                category: 'BEAUTY / CONCERN',
                judul: 'Cara Atasi Mata Panda dengan Tepat',
                penerbit: '22 September 2022 | Nadira Maura',
                menit: '2',
              ),
              ArtikelNews(
                img: 'assets/icons/artikerl-panda.png',
                category: 'BEAUTY / CONCERN',
                judul: 'Cara Atasi Mata Panda dengan Tepat',
                penerbit: '22 September 2022 | Nadira Maura',
                menit: '2',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
