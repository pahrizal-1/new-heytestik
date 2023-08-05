import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/stream/post_controller.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/galery_my_journey.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../models/stream_comment.dart';

import '../../models/stream_comment_reply.dart';
import '../../models/stream_home.dart';
import '../../widget/appbar_widget.dart';
import '../../widget/share_solusion_widget_page.dart';
import '../../widget/shere_link_stream.dart';
import 'package:timeago/timeago.dart' as timeago;

class KomentarStreamPage extends StatefulWidget {
  const KomentarStreamPage({
    super.key,
    required this.post,
  });

  final StreamHomeModel post;

  @override
  State<KomentarStreamPage> createState() => _KomentarStreamPageState();
}

class _KomentarStreamPageState extends State<KomentarStreamPage> {
  File? imagePath;
  final PostController postController = Get.put(PostController());
  final ScrollController commentScrollController = ScrollController();

  int page = 1;
  int index = 1;
  bool? like;
  bool? saved;
  int postLike = 0;
  Map<String, int> commentLikes = {};
  Map<String, int> commentReplyLikes = {};
  List<StreamCommentModel> comments = [];
  Map<String, List<StreamCommentReplyModel>> commentReplies = {};
  Map<String, bool> viewCommentReply = {};

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      comments.addAll(await postController.getComment(context, page, widget.post.id));
      for (var i = 0; i < comments.length; i++) {
        commentLikes.addAll({
          "${comments[i].commentID}": 0,
        });

        viewCommentReply.addAll({
          "${comments[i].commentID}": false,
        });
      }
      setState(() {});
    });

    commentScrollController.addListener(() {
      if (commentScrollController.position.atEdge) {
        bool isTop = commentScrollController.position.pixels == 0;
        if (!isTop) {
          page += 1;
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
            comments.addAll(await postController.getComment(context, page, widget.post.id));
            for (var i = 0; i < comments.length; i++) {
              commentLikes.addAll({
                "${comments[i].commentID}": 0,
              });

              viewCommentReply.addAll({
                "${comments[i].commentID}": false,
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
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: const EdgeInsets.only(left: 6),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: blackColor,
                ),
              ),
              const SizedBox(
                width: 11,
              ),
              Text(
                'Komentar',
                style: blackHigtTextStyle.copyWith(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 17, top: 16, bottom: 18),
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
                            widget.post.fullname,
                            style: blackTextStyle.copyWith(fontSize: 14),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            '${DateFormat('dd MMMM yyyy').format(DateTime.parse(widget.post.createdAt))}, ${timeago.format(DateTime.parse(widget.post.createdAt))}',
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
                              username: widget.post.username,
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
                    constraints: const BoxConstraints(maxWidth: 320),
                    child: Text(
                      widget.post.content,
                      style: blackRegulerTextStyle.copyWith(fontSize: 14, color: blackColor),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    '${widget.post.streamLikes + postLike} menyukai',
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
                          (like ?? widget.post.liked)
                              ? GestureDetector(
                            onTap: () {
                              postController.unlikePost(context, widget.post.id);
                              setState(() {
                                like = false;
                                postLike = postLike - 1;
                              });
                            },
                            child: Icon(Icons.favorite),
                          )
                              : GestureDetector(
                            onTap: () {
                              postController.likePost(context, widget.post.id);
                              setState(() {
                                like = true;
                                postLike = postLike + 1;
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
                          (saved ?? widget.post.saved)
                              ? GestureDetector(
                            onTap: () {
                              postController.unSavePost(context, widget.post.id);
                              setState(() {
                                saved = false;
                              });
                            },
                            child: Icon(Icons.bookmark),
                          )
                              : GestureDetector(
                            onTap: () {
                              postController.savePost(context, widget.post.id);
                              setState(() {
                                saved = true;
                              });
                            },
                            child: Icon(Icons.bookmark_border),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            dividergrey(),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 17, top: 24, bottom: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: comments.map((comment) {
                  return Row(
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
                      Container(
                        constraints: const BoxConstraints(maxWidth: 290),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  comment.fullName,
                                  style: blackTextStyle.copyWith(fontSize: 14),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  timeago.format(DateTime.parse(comment.createdAt)),
                                  style: blackRegulerTextStyle.copyWith(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            buildRichTextWithMentions(comment.content),
                            const SizedBox(
                              height: 11,
                            ),
                            Row(
                              children: [
                                comment.like + (commentLikes["${comment.commentID}"] ?? 0) > 0
                                    ? GestureDetector(
                                  onTap: () {
                                    postController.unlikeComment(context, widget.post.id, comment.commentID);
                                    setState(() {
                                      commentLikes.update("${comment.commentID}", (value) => (commentLikes["${comment.commentID}"] ?? 0) - 1);
                                    });
                                  },
                                  child: commentLike(comment.like + (commentLikes["${comment.commentID}"] ?? 0)),
                                )
                                    : GestureDetector(
                                  onTap: () {
                                    postController.likeComment(context, widget.post.id, comment.commentID);
                                    setState(() {
                                      commentLikes.update("${comment.commentID}", (value) => (commentLikes["${comment.commentID}"] ?? 0) + 1);
                                    });
                                  },
                                  child: Text(
                                    'Suka',
                                    style: blackRegulerTextStyle.copyWith(
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 17,
                                ),
                                Text(
                                  'Balas',
                                  style: blackRegulerTextStyle.copyWith(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            viewCommentReply["${comment.commentID}"] == false
                                ? GestureDetector(
                              onTap: () async {
                                viewCommentReply.update("${comment.commentID}", (value) => true);
                                List<StreamCommentReplyModel> replies = await postController.getCommentReplies(context, page, widget.post.id, comment.commentID);

                                commentReplies.addAll({
                                  "${comment.commentID}": replies,
                                });

                                for(var i = 0; i < replies.length; i++) {
                                  commentReplyLikes.addAll({
                                    "${replies[i].replyID}": 0,
                                  });
                                }
                                setState(() {});
                              },
                              child: Text("View Comments", style: greyTextStyle),
                            )
                                : Container(),
                            viewCommentReply["${comment.commentID}"] == true
                                ? ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: commentReplies["${comment.commentID}"]?.length ?? 0,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: const EdgeInsets.symmetric(
                                    vertical: 5.0,
                                  ),
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                  decoration: BoxDecoration(
                                    color: const Color.fromRGBO(241, 241, 241, 0.95),
                                    borderRadius: BorderRadius.circular(7),
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
                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    commentReplies["${comment.commentID}"]![index].fullName,
                                                    style: blackTextStyle.copyWith(fontSize: 14),
                                                  ),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    timeago.format(DateTime.parse(commentReplies["${comment.commentID}"]![index].createdAt)),
                                                    style: blackRegulerTextStyle.copyWith(fontSize: 12),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 6,
                                              ),
                                              Container(
                                                constraints: const BoxConstraints(maxWidth: 220),
                                                child: buildRichTextWithMentions(commentReplies["${comment.commentID}"]![index].content),
                                              ),
                                              const SizedBox(
                                                height: 11,
                                              ),
                                              Row(
                                                children: [
                                                  (commentReplyLikes["${commentReplies["${comment.commentID}"]![index].replyID}"] ?? 0) +  commentReplies["${comment.commentID}"]![index].like > 0
                                                      ? GestureDetector(
                                                    onTap: () {
                                                      postController.unlikeCommentReply(context, widget.post.id, comment.commentID, commentReplies["${comment.commentID}"]![index].replyID);
                                                      setState(() {
                                                        commentReplyLikes.update("${commentReplies["${comment.commentID}"]![index].replyID}", (value) => (commentReplyLikes["${commentReplies["${comment.commentID}"]![index].replyID}"] ?? 0) - 1);
                                                      });
                                                    },
                                                    child: commentLike(commentReplies["${comment.commentID}"]![index].like + (commentReplyLikes["${commentReplies["${comment.commentID}"]![index].replyID}"] ?? 0)),
                                                  )
                                                      : GestureDetector(
                                                    onTap: () {
                                                      postController.likeCommentReply(context, widget.post.id, comment.commentID, commentReplies["${comment.commentID}"]![index].replyID);
                                                      setState(() {
                                                        commentReplyLikes.update("${commentReplies["${comment.commentID}"]![index].replyID}", (value) => (commentReplyLikes["${commentReplies["${comment.commentID}"]![index].replyID}"] ?? 0) + 1);
                                                      });
                                                    },
                                                    child: Text(
                                                      'Suka',
                                                      style: blackRegulerTextStyle.copyWith(
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 17,
                                                  ),
                                                  Text(
                                                    'Balas',
                                                    style: blackRegulerTextStyle.copyWith(
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                            )
                                : Container()
                          ],
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.more_horiz,
                        size: 24,
                        color: greyColor,
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: TextFormField(
                  maxLines: 6,
                  minLines: 1,
                  decoration: InputDecoration(
                    filled: true,
                    isDense: true,
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10000)),
                      borderSide: BorderSide(
                        style: BorderStyle.none,
                        width: 0,
                      ),
                    ),
                    fillColor: whiteColor,
                    hintText: 'Tulis Komentar',
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(11.0),
                      child: PopupMenuButton(
                        icon: Image.asset(
                          'assets/icons/atement.png',
                          width: 20,
                        ),
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            child: Container(
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                              height: 100,
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          backgroundColor: Colors.transparent,
                                          insetPadding: const EdgeInsets.all(0.1),
                                          content: Container(
                                            height: 225,
                                            width: MediaQuery.of(context).size.width,
                                            decoration: BoxDecoration(
                                              color: whiteColor,
                                              borderRadius: BorderRadius.circular(20),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 32),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Tambahkan gambar',
                                                    style: blackRegulerTextStyle.copyWith(fontSize: 20, color: blackColor),
                                                  ),
                                                  const SizedBox(
                                                    height: 21,
                                                  ),
                                                  //Tambah Gambar Di Kamera
                                                  InkWell(
                                                    onTap: () {
                                                      _pickImageFromCamera();
                                                    },
                                                    child: Text(
                                                      'Kamera',
                                                      style: blackRegulerTextStyle.copyWith(fontSize: 15, color: blackColor),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 21,
                                                  ),
                                                  //Tambah Gambar Di Galeri
                                                  InkWell(
                                                    onTap: () {
                                                      _pickImageFromGalery();
                                                    },
                                                    child: Text(
                                                      'Dari galeri',
                                                      style: blackRegulerTextStyle.copyWith(fontSize: 15, color: blackColor),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 21,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          Navigator.pop(context);
                                                        },
                                                        child: Text(
                                                          'CANCEL',
                                                          style: blackRegulerTextStyle.copyWith(fontSize: 15, color: blackColor),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    child: Row(
                                      children: [
                                        Text(
                                          'Foto / Kamera',
                                          style: blackRegulerTextStyle.copyWith(fontSize: 13),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Spacer(),
                                        Container(
                                          height: 44,
                                          width: 44,
                                          padding: const EdgeInsets.symmetric(horizontal: 15),
                                          decoration: BoxDecoration(color: greenColor, shape: BoxShape.circle),
                                          child: Image.asset(
                                            'assets/icons/camera-new.png',
                                            height: 25,
                                            width: 25,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Row(
                                      children: [
                                        Text(
                                          'Poll',
                                          style: blackRegulerTextStyle.copyWith(fontSize: 13),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Spacer(),
                                        Container(
                                          height: 44,
                                          width: 44,
                                          padding: const EdgeInsets.symmetric(horizontal: 15),
                                          decoration: BoxDecoration(color: greenColor, shape: BoxShape.circle),
                                          child: Image.asset(
                                            'assets/icons/poll.png',
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    hintStyle: subGreyTextStyle,
                  ),
                ),
              ),
              Image.asset(
                'assets/icons/Group 461.png',
                width: 40,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future _pickImageFromCamera() async {
    final returnedImage = await ImagePicker().pickImage(source: ImageSource.camera);

    if (returnedImage == null) return;
    imagePath = File(returnedImage.path);
  }

  Future _pickImageFromGalery() async {
    final returnedImage = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (returnedImage == null) return;
    imagePath = File(returnedImage.path);
  }
}

Widget buildRichTextWithMentions(String text) {
  final RegExp mentionRegex = RegExp(r'@\w+');

  List<TextSpan> textSpans = [];
  int prevEnd = 0;

  for (RegExpMatch match in mentionRegex.allMatches(text)) {
    int start = match.start;
    int end = match.end;

    // Add non-mention text (before the mention)
    if (start > prevEnd) {
      textSpans.add(
        TextSpan(
          text: text.substring(prevEnd, start),
          style: TextStyle(color: Colors.black),
        ),
      );
    }

    // Add mention text with blue color
    textSpans.add(
      TextSpan(
        text: text.substring(start, end),
        style: grenTextStyle.copyWith(
          fontSize: 14,
          fontWeight: regular,
        ),
      ),
    );

    prevEnd = end;
  }

  // Add any remaining non-mention text
  if (prevEnd < text.length) {
    textSpans.add(
      TextSpan(
        text: text.substring(prevEnd),
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  return RichText(
    text: TextSpan(children: textSpans),
  );
}

Widget commentLike(int likes) {
  return Row(
    children: [
      Icon(
        Icons.thumb_up_alt_outlined,
        color: greenColor,
        size: 14,
      ),
      const SizedBox(
        width: 4,
      ),
      Text(
        "$likes",
        style: grenTextStyle.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
      ),
      const SizedBox(
        width: 2,
      ),
      Text(
        "Suka",
        style: grenTextStyle.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
      ),
    ],
  );
}
