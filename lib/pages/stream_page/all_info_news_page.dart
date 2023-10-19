import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/stream/news_controller.dart';
import 'package:heystetik_mobileapps/core/convert_date.dart';
import 'package:heystetik_mobileapps/models/customer/article_model.dart';
import 'package:heystetik_mobileapps/pages/stream_page/view_detail_beauty_stream_page.dart';
import 'package:heystetik_mobileapps/pages/stream_page/view_detail_category.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/corcern_card_widgets.dart';
import 'package:heystetik_mobileapps/widget/shimmer_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AllInfoNewsPage extends StatefulWidget {
  const AllInfoNewsPage({super.key});

  @override
  State<AllInfoNewsPage> createState() => _AllInfoNewsPageState();
}

class _AllInfoNewsPageState extends State<AllInfoNewsPage> {
  final NewsController state = Get.put(NewsController());
  Future<ArticleModel?>? data;
  int activeIndex = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      data = state.getArticle(
        context,
        page: 1,
        search: '',
        categoryId: '',
        tagId: '',
      );
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          Obx(
            () => state.totalArticel.value == 0
                ? Container()
                : CarouselSlider.builder(
                    itemCount: 3,
                    itemBuilder: (context, index, realIndex) {
                      String cat =
                          state.article.value!.record?[index].newscategoryId ==
                                  '1'
                              ? 'Treatment'
                              : state.article.value!.record?[index]
                                          .newscategoryId ==
                                      '2'
                                  ? 'Skincare'
                                  : state.article.value!.record?[index]
                                              .newscategoryId ==
                                          '3'
                                      ? 'Concern'
                                      : '-';
                      final image =
                          state.article.value!.record?[index].thumbLink;
                      return InkWell(
                        onTap: () {
                          Get.to(
                            ViewDetailBeutyStreamPage(
                              categoryId: state
                                  .article.value!.record![index].newscategoryId
                                  .toString(),
                              category: state.article.value!.record![index]
                                          .newscategoryId ==
                                      '1'
                                  ? 'Treatment'
                                  : state.article.value!.record![index]
                                              .newscategoryId
                                              .toString() ==
                                          '2'
                                      ? 'Skincare'
                                      : state.article.value!.record![index]
                                                  .newscategoryId
                                                  .toString() ==
                                              '3'
                                          ? 'Concern'
                                          : '-',
                              detailNews: state.article.value!.record![index],
                            ),
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 35.48,
                                right: 39.51,
                              ),
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      switch (cat) {
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
                                    child: Text(
                                      'Beauty / $cat',
                                      style:
                                          grenTextStyle.copyWith(fontSize: 10),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '${state.article.value!.record?[index].title}',
                                    style:
                                        blackTextStyle.copyWith(fontSize: 19),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${ConvertDate.defaultDate(
                                    state.article.value!.record![index].newsDate
                                        .toString(),
                                  )} | by ${state.article.value!.record?[index].author} | ',
                                  style: subTitleTextStyle.copyWith(
                                    fontSize: 10,
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
                              height: 10,
                            ),
                            Container(
                              width: 350,
                              height: 181,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    image.toString(),
                                  ),
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      );
                    },
                    options: CarouselOptions(
                      height: 320,
                      viewportFraction: 1,
                      onPageChanged: (index, reason) =>
                          setState(() => activeIndex = index),
                    ),
                  ),
          ),
          const SizedBox(
            height: 7,
          ),
          Center(
            child: AnimatedSmoothIndicator(
              activeIndex: activeIndex,
              count: 3,
              effect: ScaleEffect(
                activeDotColor: greenColor,
                dotColor: const Color(0xffD9D9D9),
                dotWidth: 4,
                dotHeight: 4,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: FutureBuilder(
              future: data,
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
                                    Get.to(
                                      ViewDetailBeutyStreamPage(
                                        categoryId: snapshot
                                            .data!.record![index].newscategoryId
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
                                        detailNews:
                                            snapshot.data!.record![index],
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
          )
        ],
      ),
    );
  }
}
