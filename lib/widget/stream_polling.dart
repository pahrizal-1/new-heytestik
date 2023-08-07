import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/models/stream_home.dart';
import 'package:heystetik_mobileapps/widget/share_solusion_widget_page.dart';
import 'package:heystetik_mobileapps/widget/text_with_mentions.dart';
import 'package:intl/intl.dart';
import '../../widget/shere_link_stream.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../controller/customer/stream/post_controller.dart';
import '../pages/stream_page/komentar_stream_page.dart';
import '../theme/theme.dart';

class StreamPostPolling extends StatefulWidget {
  const StreamPostPolling({
    super.key,
    required this.stream,
  });

  final StreamHomeModel stream;

  @override
  State<StreamPostPolling> createState() => _StreamPostPollingState();
}

class _StreamPostPollingState extends State<StreamPostPolling> {
  final PostController postController = Get.put(PostController());
  bool? like;
  bool? saved;
  Map<String, int> postLike = {};
  List<String> dataRemainingTime = [];

  @override
  void initState() {
    dataRemainingTime = widget.stream.endTime.difference(DateTime.now()).toString().split('.')[0].split(":");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                    widget.stream.fullname,
                    style: blackTextStyle.copyWith(fontSize: 14),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    '${DateFormat('dd MMMM yyyy').format(DateTime.parse(widget.stream.createdAt))}, ${timeago.format(DateTime.parse(widget.stream.createdAt))}',
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
                      username: widget.stream.username,
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
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 16.0,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black.withOpacity(.2),
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset('assets/icons/poling_icon.png'),
                    SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      "Polling",
                      style: grenTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: regular,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.0,
                ),
                buildRichTextWithMentions(
                  widget.stream.content,
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                ...widget.stream.streamPollOptions.map((option) {
                  double pollPercentage = (widget.stream.pollCount == 0 || option['count'] == 0) ? 0 : widget.stream.pollCount / option['count'];
                  return Stack(
                    children: [
                      Container(
                        width: (MediaQuery.of(context).size.width - 70) * pollPercentage,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 16.0,
                        ),
                        margin: const EdgeInsets.symmetric(
                          vertical: 4.0,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black.withOpacity(.1),
                          ),
                          borderRadius: BorderRadius.circular(6),
                          color: greenColor,
                        ),
                        child: Text(""),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 16.0,
                        ),
                        margin: const EdgeInsets.symmetric(
                          vertical: 4.0,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black.withOpacity(.1),
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Row(
                          children: [
                            Text(
                              option['option'],
                              style: TextStyle(
                                color: option['count'] > 0 ? Colors.white : Colors.black,
                              ),
                            ),
                            Spacer(),
                            Text(
                              "${pollPercentage.toInt()}%",
                              style: TextStyle(
                                color: pollPercentage > 0.9 ? Colors.white : Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }).toList(),
                SizedBox(
                  height: 16.0,
                ),
                Row(
                  children: [
                    Text(
                      "${widget.stream.pollCount} votes",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                      ),
                      child: Text(
                        ".",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                    Text(
                      "Polling Berakhir dalam ${dataRemainingTime[0]} Jam ${dataRemainingTime[1]} Menit",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Wrap(
            children: widget.stream.hashtags.map((hashtag) {
              return Text(
                "#$hashtag",
                style: grenTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: regular,
                ),
              );
            }).toList(),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "${widget.stream.streamLikes + (postLike["${widget.stream.id}"] ?? 0)} Menyukai",
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
                  GestureDetector(
                    onTap: () {
                      if (like ?? widget.stream.liked) {
                        postController.unlikePost(context, widget.stream.id);
                        setState(() {
                          like = false;
                          postLike["${widget.stream.id}"] = (postLike["${widget.stream.id}"] ?? 0) - 1;
                        });
                      } else {
                        postController.likePost(context, widget.stream.id);
                        setState(() {
                          like = true;
                          postLike["${widget.stream.id}"] = (postLike["${widget.stream.id}"] ?? 0) + 1;
                        });
                      }
                    },
                    child: like ?? widget.stream.liked ? Icon(Icons.favorite) : Icon(Icons.favorite_outline_outlined),
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
                  GestureDetector(
                    onTap: () {
                      if (saved ?? widget.stream.saved) {
                        postController.unSavePost(context, widget.stream.id);
                        setState(() {
                          saved = false;
                        });
                      } else {
                        postController.savePost(context, widget.stream.id);
                        setState(() {
                          saved = true;
                        });
                      }
                    },
                    child: saved ?? widget.stream.saved ? Icon(Icons.bookmark) : Icon(Icons.bookmark_border),
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => KomentarStreamPage(post: widget.stream),
                    ),
                  );
                },
                child: Row(
                  children: [
                    Text(
                      widget.stream.streamComments.toString(),
                      style: TextStyle(
                        color: greyColor,
                        fontSize: 14,
                        fontWeight: bold,
                        fontFamily: 'ProximaNova',
                      ),
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
    );
  }
}
