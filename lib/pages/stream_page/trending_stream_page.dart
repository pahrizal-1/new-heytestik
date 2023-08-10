import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/pages/stream_page/buat_postingan_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import '../../controller/customer/stream/post_controller.dart';
import '../../models/stream_home.dart';
import '../../widget/appbar_widget.dart';
import '../../widget/stream_general.dart';
import '../../widget/stream_polling.dart';

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

  int page = 1;
  bool? like;
  bool? saved;
  List<StreamHomeModel> streams = [];
  Map<String, int> postLike = {};

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      streams.addAll(await postController.getTrendingStream(context, page));
      for (var i = 0; i < streams.length; i++) {
        postLike.addAll({
          "${streams[i].id}": 0,
        });
      }
      setState(() {});
    });

    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool isTop = scrollController.position.pixels == 0;
        if (!isTop) {
          page += 1;
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
            streams.addAll(await postController.getTrendingStream(context, page));
            for (var i = 0; i < streams.length; i++) {
              postLike.addAll({
                "${streams[i].id}": 0,
              });
            }
          });
          setState(() {});
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: streams.isEmpty ? Center(
        child: Text("No Trending Post"),
      ) : SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: streams.length,
              itemBuilder: (context, index) {
                if (streams[index].type.toLowerCase() == 'polling') {
                  return StreamPostPolling(stream: streams[index]);
                }
                return StreamPostGeneral(stream: streams[index]);
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const BuatPostinganPage(),
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
