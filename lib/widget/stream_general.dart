import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/models/stream_home.dart';
import 'package:heystetik_mobileapps/widget/share_solusion_widget_page.dart';
import 'package:heystetik_mobileapps/widget/text_with_mentions.dart';
import 'package:intl/intl.dart';
import '../../widget/shere_link_stream.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../controller/customer/stream/post_controller.dart';
import '../pages/stream_page/komentar_stream_page.dart';
import '../theme/theme.dart';

class StreamPostGeneral extends StatefulWidget {
  const StreamPostGeneral({
    super.key,
    required this.stream,
  });

  final StreamHomeModel stream;

  @override
  State<StreamPostGeneral> createState() => _StreamPostGeneralState();
}

class _StreamPostGeneralState extends State<StreamPostGeneral> {
  final PostController postController = Get.put(PostController());
  bool? like;
  bool? saved;
  Map<String, int> postLike = {};

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
          buildRichTextWithMentions(
            widget.stream.content,
          ),
          const SizedBox(
            height: 16,
          ),
          Wrap(
            children: widget.stream.postImage.map((image) {
              return Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                width: MediaQuery.of(context).size.width - 100,
                height: MediaQuery.of(context).size.width - 100,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black.withOpacity(.2)),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    "${Global.FILE}/$image",
                    fit: BoxFit.fill,
                  ),
                ),
              );
            }).toList(),
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
                          postLike["${widget.stream.id}"] =
                              (postLike["${widget.stream.id}"] ?? 0) - 1;
                        });
                      } else {
                        postController.likePost(context, widget.stream.id);
                        setState(() {
                          like = true;
                          postLike["${widget.stream.id}"] =
                              (postLike["${widget.stream.id}"] ?? 0) + 1;
                        });
                      }
                    },
                    child: like ?? widget.stream.liked
                        ? Icon(Icons.favorite)
                        : Icon(Icons.favorite_outline_outlined),
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
                    child: saved ?? widget.stream.saved
                        ? Icon(Icons.bookmark)
                        : Icon(Icons.bookmark_border),
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          KomentarStreamPage(post: widget.stream),
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
