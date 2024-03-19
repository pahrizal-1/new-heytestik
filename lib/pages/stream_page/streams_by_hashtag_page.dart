// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/appar_cutome.dart';
import '../../controller/customer/stream/stream_controller.dart';
import '../../widget/appbar_widget.dart';
import '../../widget/stream_post.dart';

class StreamsByHashtagPage extends StatefulWidget {
  String hashtag;
  StreamsByHashtagPage({
    super.key,
    required this.hashtag,
  });

  @override
  State<StreamsByHashtagPage> createState() => _StreamsByHashtagPageState();
}

class _StreamsByHashtagPageState extends State<StreamsByHashtagPage> {
  final ScrollController scrollController = ScrollController();
  final StreamController stateStream = Get.put(StreamController());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      stateStream.streamsByHashtagIndex.value = 1;
      stateStream.search.value = "";
      stateStream.streamsByHashtag.value = [];
      await stateStream.getStreamByHashtag(context, widget.hashtag);
    });

    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool isTop = scrollController.position.pixels == 0;
        if (!isTop) {
          stateStream.streamsByHashtagIndex.value =
              stateStream.streamsByHashtagIndex.value + 1;
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
            await stateStream.getStreamByHashtag(context, widget.hashtag);
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
      appBar: AppBarCustome(
        title: '#${widget.hashtag}',
        colorIcons: whiteColor,
        colorTitle: whiteColor,
        bgColor: greenColor,
      ),
      body: Obx(() {
        if (stateStream.streamsByHashtag.isEmpty) {
          return Center(child: Text("No Stream By Hashtag Post"));
        } else {
          return SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                Obx(
                  () => ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: stateStream.streamsByHashtag.length,
                    itemBuilder: (context, index) {
                      return StreamPostPage(
                        stream: stateStream.streamsByHashtag[index],
                      );
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
          );
        }
      }),
    );
  }
}
