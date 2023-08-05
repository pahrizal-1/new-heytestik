import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/pages/stream_page/buat_postingan_page.dart';
import 'package:heystetik_mobileapps/pages/stream_page/komentar_stream_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/share_solusion_widget_page.dart';
import 'package:intl/intl.dart';

import '../../controller/customer/stream/post_controller.dart';
import '../../models/stream_home.dart';
import '../../widget/appbar_widget.dart';
import '../../widget/shere_link_stream.dart';
import 'package:timeago/timeago.dart' as timeago;

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

  int page = 1;
  bool? like;
  bool? saved;
  List<StreamHomeModel> streams = [];
  Map<String, int> postLike = {};

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      streams.addAll(await postController.getStreamHomeModel(context, page));
      for(var i = 0; i < streams.length; i++) {
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
            streams.addAll(await postController.getStreamHomeModel(context, page));
            for(var i = 0; i < streams.length; i++) {
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
      body: ListView.builder(
        itemCount: streams.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 17,
                  top: 16,
                  bottom: 18,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/profiledummy.png',
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 11,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              streams[index].fullname,
                              style: blackTextStyle.copyWith(fontSize: 14),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              '${DateFormat('dd MMMM yyyy').format(DateTime.parse(streams[index].createdAt))}, ${timeago.format(DateTime.parse(streams[index].createdAt))}',
                              style: subTitleTextStyle.copyWith(fontSize: 10),
                            )
                          ],
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              backgroundColor: Colors.white,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadiusDirectional.only(
                                  topEnd: Radius.circular(25),
                                  topStart: Radius.circular(25),
                                ),
                              ),
                              builder: (context) => ShareLinkStream(
                                username: streams[index].username,
                              ),
                            );
                          },
                          child: Icon(
                            Icons.more_horiz,
                            color: subgreyColor,
                            size: 24,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      streams[index].content,
                      style: blackRegulerTextStyle.copyWith(fontSize: 14),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      "${streams[index].streamLikes + (postLike["${streams[index].id}"] ?? 0)} Menyukai",
                      style: subTitleTextStyle.copyWith(fontSize: 12),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            (like ?? streams[index].liked)
                                ? GestureDetector(
                                    onTap: () {
                                      postController.unlikePost(context, streams[index].id);
                                      setState(() {
                                        like = false;
                                        postLike["${streams[index].id}"] =  (postLike["${streams[index].id}"] ?? 0) - 1;
                                      });
                                    },
                                    child: Icon(Icons.favorite),
                                  )
                                : GestureDetector(
                                    onTap: () {
                                      postController.likePost(context, streams[index].id);
                                      setState(() {
                                        like = true;
                                        postLike["${streams[index].id}"] =  (postLike["${streams[index].id}"] ?? 0) + 1;
                                      });
                                    },
                                    child: Icon(Icons.favorite_outline_outlined),
                                  ),
                            const SizedBox(
                              width: 15,
                            ),
                            GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  isDismissible: false,
                                  context: context,
                                  backgroundColor: Colors.white,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadiusDirectional.only(
                                      topEnd: Radius.circular(25),
                                      topStart: Radius.circular(25),
                                    ),
                                  ),
                                  builder: (context) => ShareShowWidget(),
                                );
                              },
                              child: Icon(Icons.share),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            (saved ?? streams[index].saved) ? GestureDetector(
                              onTap: (){
                                postController.unSavePost(context, streams[index].id);
                                setState(() {
                                  saved = false;
                                });
                              },
                              child: Icon(Icons.bookmark),
                            ) : GestureDetector(
                              onTap: (){
                                postController.savePost(context, streams[index].id);
                                setState(() {
                                  saved = true;
                                });
                              },
                              child: Icon(Icons.bookmark_border),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => KomentarStreamPage(post: streams[index]),
                              ),
                            );
                          },
                          child: Row(
                            children: [
                              Text(
                                streams[index].streamComments.toString(),
                                style: TextStyle(color: greyColor, fontSize: 14, fontWeight: bold, fontFamily: 'ProximaNova'),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Container(
                                height: 20,
                                width: 20,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/icons/komen1.png'),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const dividergreen(),
            ],
          );
        },
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
