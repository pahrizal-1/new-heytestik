// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/stream/news_controller.dart';
import 'package:heystetik_mobileapps/core/convert_date.dart';
import 'package:heystetik_mobileapps/models/customer/article_model.dart';
import 'package:heystetik_mobileapps/pages/stream_page/view_detail_beauty_stream_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/corcern_card_widgets.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';

class NewsSearchPage extends StatefulWidget {
  const NewsSearchPage({
    super.key,
  });

  @override
  State<NewsSearchPage> createState() => _NewsSearchPageState();
}

class _NewsSearchPageState extends State<NewsSearchPage> {
  final NewsController state = Get.put(NewsController());
  final ScrollController scrollController = ScrollController();
  TextEditingController searchController = TextEditingController();
  int page = 1;
  List<Record?> article = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      article.addAll(
        await state.getArticle2(
          context,
          page: page,
          search: searchController.text,
          categoryId: '',
          tagId: '',
        ),
      );
      print("article article ${article.length}");
      setState(() {});
    });
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool isTop = scrollController.position.pixels == 0;
        if (!isTop) {
          page += 1;
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
            state.isLoadingMore.value = true;
            article.addAll(await state.getArticle2(
              context,
              page: page,
              search: searchController.text,
              categoryId: '',
              tagId: '',
            ));

            print("article 2 ${article.length}");
            setState(() {});
            state.isLoadingMore.value = false;
          });
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                size: 24,
                color: blackColor,
              ),
            ),
            const SizedBox(
              width: 7,
            ),
            Expanded(
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Color(0xffF1F1F1),
                  border: Border.all(
                    color: fromCssColor("#CCCCCC"),
                  ),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                      ),
                      child: Image.asset(
                        'assets/icons/search1.png',
                        width: 10,
                      ),
                    ),
                    Container(
                      transform: Matrix4.translationValues(0, -2, 0),
                      constraints: const BoxConstraints(maxWidth: 250),
                      child: TextFormField(
                        controller: searchController,
                        onEditingComplete: () async {
                          print("INI GW KLIK");
                          page = 1;
                          article.clear();

                          article.addAll(await state.getArticle2(
                            context,
                            page: page,
                            search: searchController.text,
                            categoryId: '',
                            tagId: '',
                          ));
                          print(article);
                          setState(() {});
                        },
                        style: const TextStyle(
                            fontSize: 15, fontFamily: "ProximaNova"),
                        decoration: InputDecoration(
                          hintText: "Cari Berita",
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            fontFamily: "ProximaNova",
                            color: fromCssColor(
                              '#9B9B9B',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
        child: Obx(
          () => LoadingShimmerWidget(
            isLoading:
                state.isLoadingMore.value ? false : state.isLoading.value,
            child: article.isEmpty
                ? const Center(
                    child: Text(
                      'Belum ada berita',
                      style: TextStyle(
                        fontFamily: 'ProximaNova',
                        fontSize: 20,
                      ),
                    ),
                  )
                : SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: article.length,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => ViewDetailBeutyStreamPage(
                                        categoryId: article[index]!
                                            .newscategoryId
                                            .toString(),
                                        category:
                                            article[index]!.newscategoryId ==
                                                    '1'
                                                ? 'Treatment'
                                                : article[index]!
                                                            .newscategoryId
                                                            .toString() ==
                                                        '2'
                                                    ? 'Skincare'
                                                    : article[index]!
                                                                .newscategoryId
                                                                .toString() ==
                                                            '3'
                                                        ? 'Concern'
                                                        : '-',
                                        detailNews: article[index]!,
                                      ),
                                    ),
                                  );
                                },
                                child: CorcernCardWidgets(
                                  img: article[index]!.thumbLink.toString(),
                                  category:
                                      article[index]!.newscategoryId == '1'
                                          ? 'Treatment'
                                          : article[index]!
                                                      .newscategoryId
                                                      .toString() ==
                                                  '2'
                                              ? 'Skincare'
                                              : article[index]!
                                                          .newscategoryId
                                                          .toString() ==
                                                      '3'
                                                  ? 'Concern'
                                                  : '-',
                                  judul: article[index]!.title.toString(),
                                  tanggal: ConvertDate.defaultDate(
                                    article[index]!.newsDate.toString(),
                                  ),
                                  pembuat: article[index]!.author.toString(),
                                  minute: '2 Mins',
                                ),
                              );
                            },
                          ),
                        ),
                        Obx(
                          () => state.isLoading.value
                              ? Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: LoadingMore(),
                                )
                              : Container(),
                        ),
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
