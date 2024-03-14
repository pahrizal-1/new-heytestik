// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/pages/stream_page/buat_postingan_new.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import '../../controller/customer/stream/stream_controller.dart';
import '../../widget/appbar_widget.dart';
import '../../widget/stream_post.dart';

class SavedStreamPage extends StatefulWidget {
  const SavedStreamPage({
    super.key,
  });

  @override
  State<SavedStreamPage> createState() => _SavedStreamPageState();
}

class _SavedStreamPageState extends State<SavedStreamPage> {
  final ScrollController scrollController = ScrollController();
  final StreamController stateStream = Get.put(StreamController());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      stateStream.savedStreamIndex.value = 1;
      stateStream.search.value = "";
      stateStream.savedStreams.value = [];
      await stateStream.getSavedStream(context);
    });

    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool isTop = scrollController.position.pixels == 0;
        if (!isTop) {
          stateStream.savedStreamIndex.value =
              stateStream.savedStreamIndex.value + 1;
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
            await stateStream.getSavedStream(context);
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
        if (stateStream.savedStreams.isEmpty) {
          return Center(
            child: Text("No Post From Your Saved Account"),
          );
        } else {
          return SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: stateStream.savedStreams.length,
                  itemBuilder: (context, index) {
                    return StreamPostPage(
                        stream: stateStream.savedStreams[index]);
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
            stateStream.savedStreamIndex.value = 1;
            stateStream.search.value = "";
            stateStream.savedStreams.value = [];
            await stateStream.getSavedStream(context);
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
