import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/pages/stream_page/buat_postingan_new.dart';
import 'package:heystetik_mobileapps/pages/stream_page/buat_postingan_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import '../../controller/customer/stream/post_controller.dart';
import '../../widget/appbar_widget.dart';
import '../../widget/stream_general.dart';
import '../../widget/stream_polling.dart';

class HomeStreamPage extends StatefulWidget {
  const HomeStreamPage({
    super.key,
  });

  @override
  State<HomeStreamPage> createState() => _HomeStreamPageState();
}

class _HomeStreamPageState extends State<HomeStreamPage> {
  final ScrollController scrollController = ScrollController();
  final PostController postController = Get.put(PostController());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      postController.homeStreamIndex.value = 1;
      postController.search.value = "";
      postController.homeStreams.value = [];
      await postController.getStreamHomeModel(context);
    });

    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool isTop = scrollController.position.pixels == 0;
        if (!isTop) {
          postController.homeStreamIndex.value =
              postController.homeStreamIndex.value + 1;
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
            await postController.getStreamHomeModel(context);
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
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            Obx(
              () => ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: postController.homeStreams.length,
                itemBuilder: (context, index) {
                  if (postController.homeStreams[index].type.toLowerCase() ==
                      'polling') {
                    return StreamPostPolling(
                        stream: postController.homeStreams[index]);
                  }
                  return StreamPostGeneral(
                      stream: postController.homeStreams[index]);
                },
                separatorBuilder: (context, index) {
                  return dividergreen();
                },
              ),
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
