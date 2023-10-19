// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/stream/news_controller.dart';
import 'package:heystetik_mobileapps/core/convert_date.dart';
import 'package:heystetik_mobileapps/models/customer/article_model.dart';
import 'package:heystetik_mobileapps/pages/stream_page/news_search_page.dart';
import 'package:heystetik_mobileapps/widget/shimmer_widget.dart';

import '../../theme/theme.dart';
import '../../widget/artikel_views_widgets.dart';
import 'view_detail_beauty_stream_page.dart';

class ViewDetailCategoryNews extends StatelessWidget {
  String category;
  String categoryId;
  ViewDetailCategoryNews(
      {required this.category, required this.categoryId, super.key});
  final NewsController state = Get.put(NewsController());

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 20, left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Category',
                style: grenTextStyle.copyWith(fontSize: 20),
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                category,
                style: blackTextStyle.copyWith(fontSize: 15),
              ),
              const SizedBox(
                height: 10,
              ),
              FutureBuilder(
                future: state.getArticle(
                  context,
                  page: 1,
                  search: '',
                  categoryId: categoryId,
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
                          : ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: snapshot.data!.record!.length,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, index) {
                                return InkWell(
                                  onTap: () {
                                    Get.to(
                                      ViewDetailBeutyStreamPage(
                                        categoryId: '',
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
                                        detailNews:
                                            snapshot.data!.record![index],
                                      ),
                                    );
                                  },
                                  child: ArtikelNews(
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
                                    penerbit: '${ConvertDate.defaultDate(
                                      snapshot.data!.record![index].newsDate
                                          .toString(),
                                    )}| ${snapshot.data!.record![index].author.toString()}',
                                    menit: '2',
                                  ),
                                );
                              },
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
                    return Text(
                        'Connection State: ${snapshot.connectionState}');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
