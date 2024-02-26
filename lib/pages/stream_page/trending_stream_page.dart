import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/pages/stream_page/buat_postingan_new.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import '../../controller/customer/stream/post_controller.dart';
import '../../widget/appbar_widget.dart';
import '../../widget/stream_post.dart';

class TrendingStreamPage extends StatefulWidget {
  const TrendingStreamPage({
    super.key,
  });

  @override
  State<TrendingStreamPage> createState() => _TrendingStreamPageState();
}

class _TrendingStreamPageState extends State<TrendingStreamPage> {
  final ScrollController scrollController = ScrollController();
  final PostController postController = Get.put(PostController());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      postController.trendingStreamIndex.value = 1;
      postController.search.value = "";
      postController.trendingStreams.value = [];
      await postController.getTrendingStream(context);
    });

    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool isTop = scrollController.position.pixels == 0;
        if (!isTop) {
          postController.trendingStreamIndex.value =
              postController.trendingStreamIndex.value + 1;
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
            await postController.getTrendingStream(context);
          });
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (postController.trendingStreams.isEmpty) {
          return Center(child: Text("No Trending Post"));
        } else {
          return SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: postController.trendingStreams.length,
                  itemBuilder: (context, index) {
                    return StreamPostPage(
                        stream: postController.trendingStreams[index]);
                  },
                  separatorBuilder: (context, index) {
                    return dividergreen();
                  },
                ),
                SizedBox(
                  height: 80,
                ),
              ],
            ),
          );
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const BuatPostinganStream(),
            ),
          );
        },
        elevation: 0,
        backgroundColor: greenColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 28,
                width: 28,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/icons/edit-Post-icons.png'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
