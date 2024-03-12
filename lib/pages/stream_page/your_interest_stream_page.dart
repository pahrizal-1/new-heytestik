import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/pages/stream_page/buat_postingan_new.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import '../../controller/customer/stream/stream_controller.dart';
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
  final StreamController stateStream = Get.put(StreamController());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      stateStream.interestStreamIndex.value = 1;
      stateStream.search.value = "";
      stateStream.interestStreams.value = [];
      await stateStream.getStreamInterest(context);
    });

    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool isTop = scrollController.position.pixels == 0;
        if (!isTop) {
          stateStream.interestStreamIndex.value =
              stateStream.interestStreamIndex.value + 1;
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
            await stateStream.getStreamInterest(context);
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
        if (stateStream.interestStreams.isEmpty) {
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
                  itemCount: stateStream.interestStreams.length,
                  itemBuilder: (context, index) {
                    return StreamPostPage(
                        stream: stateStream.interestStreams[index]);
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
              builder: (context) => BuatPostinganStream(),
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
