// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/pages/stream_page/buat_postingan_new.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import '../../controller/customer/stream/stream_controller.dart';
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
  final StreamController stateStream = Get.put(StreamController());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      stateStream.trendingStreamIndex.value = 1;
      stateStream.search.value = "";
      stateStream.trendingStreams.value = [];
      await stateStream.getTrendingStream(context);
    });

    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool isTop = scrollController.position.pixels == 0;
        if (!isTop) {
          stateStream.trendingStreamIndex.value =
              stateStream.trendingStreamIndex.value + 1;
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
            await stateStream.getTrendingStream(context);
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
        if (stateStream.trendingStreams.isEmpty) {
          return Center(child: Text("No Trending Post"));
        } else {
          return SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: stateStream.trendingStreams.length,
                  itemBuilder: (context, index) {
                    return StreamPostPage(
                        stream: stateStream.trendingStreams[index]);
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
        onPressed: () async {
          bool check = await Get.to(() => BuatPostinganStream());
          if (check) {
            stateStream.trendingStreamIndex.value = 1;
            stateStream.search.value = "";
            stateStream.trendingStreams.value = [];
            await stateStream.getTrendingStream(context);
          }
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
