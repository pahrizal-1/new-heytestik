import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:heystetik_mobileapps/widget/appbar_widget.dart';

import '../../theme/theme.dart';
import '../../widget/artikel_views_widgets.dart';
import '../../widget/pencarian_search_widget.dart';

class InfoPenerbitPage extends StatefulWidget {
  const InfoPenerbitPage({super.key});

  @override
  State<InfoPenerbitPage> createState() => _InfoPenerbitPageState();
}

class _InfoPenerbitPageState extends State<InfoPenerbitPage> {
  String dropdownValue = 'Dog';
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
      body: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
        child: ListView(
          children: [
            Row(
              children: [
                Container(
                  height: 110,
                  width: 110,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/icons/penerbit1.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 18,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'WRITER',
                      style: grenTextStyle.copyWith(fontSize: 12),
                    ),
                    Text(
                      'Nadira Maurizka',
                      style: blackHigtTextStyle.copyWith(fontSize: 20),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 18,
            ),
            Text(
              'Nadira Maurizka merupakan lulusan Magister Kajian Budaya dan Media yang memiliki pengalaman menulis artikel ilmiah selama 2 tahun. Nadira saat ini menjadi kontributor dalam penulisan artikel mengenai kandungan skincare, masalah kulit, hingga news di Heystetik.',
              style: blackRegulerTextStyle.copyWith(
                fontSize: 13,
                color: blackColor,
                letterSpacing: 0.5,
                wordSpacing: 0.9,
                height: 1.3,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            dividergrey(),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Filter by',
                  style: blackTextStyle.copyWith(
                    fontSize: 12,
                  ),
                ),
                DropdownButton<String>(
                  underline: const SizedBox(),
                  value: dropdownValue,
                  items: <String>['Dog', 'Cat', 'Tiger', 'Lion']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: blackTextStyle.copyWith(fontSize: 12),
                      ),
                    );
                  }).toList(),
                  // Step 5.
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                ),
              ],
            ),
            ArtikelNews(
              img: 'assets/icons/artikerl-panda.png',
              category: 'BEAUTY / CONCERN',
              judul: 'Cara Atasi Mata Panda dengan Tepat',
              penerbit: '22 September 2022 | Nadira Maura',
              menit: '2',
            ),
            ArtikelNews(
              img: 'assets/images/Rahasia_Kulit_Sehat.png',
              category: 'BEAUTY / CONCERN',
              judul: 'Rahasia Kulit Sehat Ala Artis Korea',
              penerbit: '22 September 2022 | Nadira Maura',
              menit: '2',
            ),
            ArtikelNews(
              img: 'assets/icons/artikerl-panda.png',
              category: 'BEAUTY / TREATMENT',
              judul: 'Rahasia Kulit Sehat Ala Artis Korea',
              penerbit: '11 Januari 2022  |  Nadira Maura',
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
    );
  }
}
