import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/pages/stream_page/buat_postingan_new.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import '../../controller/customer/stream/post_controller.dart';
import '../../widget/appbar_widget.dart';
import '../../widget/stream_post.dart';

class InterestStreamPage extends StatefulWidget {
  const InterestStreamPage({
    super.key,
  });

  @override
  State<InterestStreamPage> createState() => _InterestStreamPageState();
}

class _InterestStreamPageState extends State<InterestStreamPage> {
  final ScrollController scrollController = ScrollController();
  final PostController postController = Get.put(PostController());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      postController.interestStreamIndex.value = 1;
      postController.search.value = "";
      postController.interestStreams.value = [];
      await postController.getStreamInterest(context);
    });

    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool isTop = scrollController.position.pixels == 0;
        if (!isTop) {
          postController.interestStreamIndex.value =
              postController.interestStreamIndex.value + 1;
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
            await postController.getStreamInterest(context);
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
      body: Obx(() {
        if (postController.interestStreams.isEmpty) {
          return Center(
            child: Text("No Post From Your Interest"),
          );
        } else {
          return SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: postController.interestStreams.length,
                  itemBuilder: (context, index) {
                    return StreamPostPage(
                        stream: postController.interestStreams[index]);
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
