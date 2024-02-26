import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:heystetik_mobileapps/pages/stream_page/news_search_page.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import '../../theme/theme.dart';
import '../../widget/artikel_views_widgets.dart';

class InfoMedicalReviewPage extends StatefulWidget {
  const InfoMedicalReviewPage({super.key});

  @override
  State<InfoMedicalReviewPage> createState() => _InfoMedicalReviewPageState();
}

class _InfoMedicalReviewPageState extends State<InfoMedicalReviewPage> {
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
                  builder: (context) => const NewsSearchPage(),
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
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/doctor-img.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 18,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'MEDICAL REVIEWER',
                        style: grenTextStyle.copyWith(fontSize: 12),
                      ),
                      Text(
                        'dr. Lulu Dwiarty Ningtias, Sp.DV',
                        style: blackHigtTextStyle.copyWith(fontSize: 20),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 18,
            ),
            Text(
              'dr. Lulu Dwiarti Ningtias, Sp.DV telah menyelesaikan pendidikan Spesialis Dermatologi dan Venerologi di Universitas Padjadjaran. dr. Lulu Dwiarti Ningtias adalah seorang spesialis dermatovenereologi yang saat ini bekerja di Bekasi Skin Centre dan Luminka Clinic. Beliau juga bergabung dalam IDI & PERDOSKI.',
              style: blackRegulerTextStyle.copyWith(
                fontSize: 14,
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
            const ArtikelNews(
              img: 'assets/icons/artikerl-panda.png',
              category: 'Concern',
              judul: 'Cara Atasi Mata Panda dengan Tepat',
              penerbit: '22 September 2022 | Nadira Maura',
              menit: '2',
            ),
            const ArtikelNews(
              img: 'assets/images/Rahasia_Kulit_Sehat.png',
              category: 'Concern',
              judul: 'Rahasia Kulit Sehat Ala Artis Korea',
              penerbit: '22 September 2022 | Nadira Maura',
              menit: '2',
            ),
            const ArtikelNews(
              img: 'assets/icons/artikerl-panda.png',
              category: 'Treatment',
              judul: 'Rahasia Kulit Sehat Ala Artis Korea',
              penerbit: '11 Januari 2022  |  Nadira Maura',
              menit: '2',
            ),
            const ArtikelNews(
              img: 'assets/icons/artikerl-panda.png',
              category: 'Concern',
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
