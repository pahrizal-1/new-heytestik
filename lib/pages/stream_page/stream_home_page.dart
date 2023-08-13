import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/stream/post_controller.dart';
import 'package:heystetik_mobileapps/pages/stream_page/all_info_stream_page.dart';
import 'package:heystetik_mobileapps/pages/stream_page/news_home_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

import '../../widget/pencarian_search_widget.dart';
import '../home/notifikasion_page.dart';
import '../profile_costumer/profil_customer_page.dart';
import '../setings&akun/akun_home_page.dart';

class StreamHomePage extends StatefulWidget {
  const StreamHomePage({super.key});

  @override
  State<StreamHomePage> createState() => _StreamHomePageState();
}

class _StreamHomePageState extends State<StreamHomePage> with TickerProviderStateMixin {
  final TextEditingController searchController = TextEditingController();
  final PostController postController = Get.put(PostController());
  int index = 0;
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(vsync: this, length: 4);
    super.initState();
  }

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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfilCustomerPage(),
                    ),
                  );
                },
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    image: const DecorationImage(image: AssetImage('assets/images/profiledummy.png')),
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
              const SizedBox(
                width: 11,
              ),
              Text(
                'Stream',
                style: blackTextStyle.copyWith(fontSize: 20),
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
                  builder: (context) => PencarianPageWidget(
                    searchController: searchController,
                    onEditingComplete: () {
                      WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
                        postController.search.value = searchController.text;
                        postController.homeStreamIndex.value = 1;
                        postController.homeStreams.value = [];
                        await postController.getStreamHomeModel(context);
                      });

                      WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
                        postController.search.value = searchController.text;
                        postController.trendingStreamIndex.value = 1;
                        postController.trendingStreams.value = [];
                        await postController.getTrendingStream(context);
                      });

                      WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
                        postController.search.value = searchController.text;
                        postController.followedStreamIndex.value = 1;
                        postController.followedStreams.value = [];
                        await postController.getStreamFollowed(context);
                      });
                    },
                  ),
                ),
              );
            },
            child: SvgPicture.asset(
              'assets/icons/search.svg',
              color: blackColor,
            ),
          ),
          const SizedBox(
            width: 14,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotifikasionPage(),
                ),
              );
            },
            child: SvgPicture.asset(
              'assets/icons/notif-icons.svg',
              color: blackColor,
            ),
          ),
          const SizedBox(
            width: 14,
          ),
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
              color: blackColor,
            ),
          ),
          const SizedBox(
            width: 26,
          ),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 9),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 65, right: 72, top: 9, bottom: 8),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(7),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.15),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            index = 0;
                          });
                        },
                        child: Text(
                          'Stream',
                          style: index == 0 ? grenTextStyle.copyWith(fontSize: 15) : blackTextStyle.copyWith(fontSize: 15),
                        ),
                      ),
                      Container(
                        width: 0.5,
                        height: 17,
                        color: borderColor,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            index = 1;
                          });
                        },
                        child: Text(
                          'News',
                          style: index == 1 ? grenTextStyle.copyWith(fontSize: 15) : blackTextStyle.copyWith(fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 19,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 63),
            child: Center(
              child: index == 0
                  ? AllInfoStreamPage(
                      tabController: tabController,
                    )
                  : const NewsHomePage(),
            ),
          ),
        ],
      ),
    );
  }
}
