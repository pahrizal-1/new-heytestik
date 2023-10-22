// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/stream/news_controller.dart';
import 'package:heystetik_mobileapps/core/convert_date.dart';
import 'package:heystetik_mobileapps/models/customer/article_model.dart';
import 'package:heystetik_mobileapps/pages/stream_page/info_medical_review_page.dart';
import 'package:heystetik_mobileapps/pages/stream_page/news_search_page.dart';
import 'package:heystetik_mobileapps/pages/stream_page/penerbit_info_page.dart';
import 'package:heystetik_mobileapps/pages/stream_page/view_detail_category.dart';
import 'package:heystetik_mobileapps/pages/stream_page/view_detail_tags_page.dart';

import 'package:heystetik_mobileapps/widget/corcern_card_widgets.dart';
import 'package:heystetik_mobileapps/widget/shimmer_widget.dart';
import 'package:heystetik_mobileapps/widget/tags.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../theme/theme.dart';

class ViewDetailBeutyStreamPage extends StatefulWidget {
  String categoryId;
  String category;
  Record detailNews;
  ViewDetailBeutyStreamPage(
      {required this.categoryId,
      required this.category,
      required this.detailNews,
      super.key});

  @override
  State<ViewDetailBeutyStreamPage> createState() =>
      _ViewDetailBeutyStreamPageState();
}

class _ViewDetailBeutyStreamPageState extends State<ViewDetailBeutyStreamPage> {
  final NewsController state = Get.put(NewsController());
  _launchURL(String url) async {
    final Uri urlParse = Uri.parse(url);
    if (!await launchUrl(urlParse)) {
      throw Exception('Could not launch $urlParse');
    }
  }

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
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 15,
              right: 10,
              top: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    switch (widget.category) {
                      case 'Treatment':
                        Get.to(
                          ViewDetailCategoryNews(
                            categoryId: '1',
                            category: 'Treatment',
                          ),
                        );
                        break;
                      case 'Skincare':
                        Get.to(
                          ViewDetailCategoryNews(
                            categoryId: '2',
                            category: 'Skincare',
                          ),
                        );
                        break;
                      default:
                        Get.to(
                          ViewDetailCategoryNews(
                            categoryId: '3',
                            category: 'Concern',
                          ),
                        );
                    }
                  },
                  child: Center(
                    child: Text(
                      'Beauty / ${widget.category}',
                      style: grenTextStyle.copyWith(fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  '${widget.detailNews.title}',
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
                        builder: (context) => InfoPenerbitPage(
                            writer: widget.detailNews.author ?? '-'),
                      ),
                    );
                  },
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                        text: 'By ',
                        style: subTitleTextStyle.copyWith(fontSize: 12),
                        children: [
                          TextSpan(
                            text: '${widget.detailNews.author}',
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
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const InfoMedicalReviewPage(),
                      ),
                    );
                  },
                  child: Center(
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
                ),
                const SizedBox(
                  height: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${ConvertDate.defaultDate(
                        '${widget.detailNews.newsDate}',
                      )} | ',
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
                Image.network(
                  '${widget.detailNews.thumbLink}',
                  height: 200,
                  width: 350,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 20,
                ),
                Html(
                  data: '${widget.detailNews.description}',
                  style: {
                    "table": Style(
                      backgroundColor: Color.fromARGB(0x50, 0xee, 0xee, 0xee),
                    ),
                    "tr": Style(
                      border: Border(bottom: BorderSide(color: Colors.grey)),
                    ),
                    "th": Style(
                      backgroundColor: Colors.grey,
                    ),
                    "td": Style(
                      alignment: Alignment.topLeft,
                    ),
                    'h5':
                        Style(maxLines: 2, textOverflow: TextOverflow.ellipsis),
                  },
                  onAnchorTap: (url, attributes, element) {
                    _launchURL(url.toString());
                  },
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
                  children: widget.detailNews.tag!
                      .map(
                        (e) => InkWell(
                          onTap: () {
                            Get.to(
                              ViewDetailTags(
                                tagName: e.tagName.toString(),
                                tagId: e.id.toString(),
                              ),
                            );
                          },
                          child: TagsNews(
                            title: e.tagName.toString(),
                          ),
                        ),
                      )
                      .toList(),
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
            child: FutureBuilder(
              future: state.getArticle(
                context,
                page: 1,
                search: '',
                categoryId: widget.categoryId,
                tagId: '',
              ),
              builder: (context, AsyncSnapshot<ArticleModel?> snapshot) {
                print(snapshot.connectionState);
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      shimmerWidget(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.only(right: 5),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 24),
                          decoration: BoxDecoration(
                            color: whiteColor,
                            border: Border.all(color: borderColor),
                            borderRadius: BorderRadius.circular(7),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: spaceHeigt,
                      ),
                      shimmerWidget(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.only(right: 5),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 24),
                          decoration: BoxDecoration(
                            color: whiteColor,
                            border: Border.all(color: borderColor),
                            borderRadius: BorderRadius.circular(7),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: spaceHeigt,
                      ),
                      shimmerWidget(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.only(right: 5),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 24),
                          decoration: BoxDecoration(
                            color: whiteColor,
                            border: Border.all(color: borderColor),
                            borderRadius: BorderRadius.circular(7),
                          ),
                        ),
                      ),
                    ],
                  );
                }
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    return snapshot.data!.record!.isEmpty
                        ? Center(
                            child: Text(
                              'Belum ada berita',
                              style: TextStyle(
                                fontWeight: bold,
                                fontFamily: 'ProximaNova',
                                fontSize: 15,
                              ),
                            ),
                          )
                        : SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: snapshot.data!.record!.length,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, index) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) =>
                                            ViewDetailBeutyStreamPage(
                                          categoryId: widget.categoryId,
                                          category: snapshot
                                                      .data!
                                                      .record![index]
                                                      .newscategoryId ==
                                                  '1'
                                              ? 'Treatment'
                                              : snapshot.data!.record![index]
                                                          .newscategoryId
                                                          .toString() ==
                                                      '2'
                                                  ? 'Skincare'
                                                  : snapshot
                                                              .data!
                                                              .record![index]
                                                              .newscategoryId
                                                              .toString() ==
                                                          '3'
                                                      ? 'Concern'
                                                      : '-',
                                          detailNews:
                                              snapshot.data!.record![index],
                                        ),
                                      ),
                                    );
                                  },
                                  child: CorcernCardWidgets(
                                    img: snapshot.data!.record![index].thumbLink
                                        .toString(),
                                    category: snapshot.data!.record![index]
                                                .newscategoryId ==
                                            '1'
                                        ? 'Treatment'
                                        : snapshot.data!.record![index]
                                                    .newscategoryId
                                                    .toString() ==
                                                '2'
                                            ? 'Skincare'
                                            : snapshot.data!.record![index]
                                                        .newscategoryId
                                                        .toString() ==
                                                    '3'
                                                ? 'Concern'
                                                : '-',
                                    judul: snapshot.data!.record![index].title
                                        .toString(),
                                    tanggal: ConvertDate.defaultDate(
                                      snapshot.data!.record![index].newsDate
                                          .toString(),
                                    ),
                                    pembuat: snapshot
                                        .data!.record![index].author
                                        .toString(),
                                    minute: '2 Mins',
                                  ),
                                );
                              },
                            ),
                          );
                  } else {
                    return Center(
                      child: Text(
                        'Belum ada berita',
                        style: TextStyle(
                          fontWeight: bold,
                          fontFamily: 'ProximaNova',
                          fontSize: 15,
                        ),
                      ),
                    );
                  }
                } else {
                  return Text('Connection State: ${snapshot.connectionState}');
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
