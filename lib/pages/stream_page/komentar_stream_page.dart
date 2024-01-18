import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/account/profile_controller.dart';
import 'package:heystetik_mobileapps/controller/customer/stream/post_controller.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/routes/create_dynamic_link.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:social_share/social_share.dart';

import '../../models/stream_comment.dart';

import '../../models/stream_comment_reply.dart';
import '../../models/stream_home.dart';
import '../../widget/appbar_widget.dart';
import '../../widget/shere_link_stream.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../widget/text_with_mentions.dart';

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
  final ProfileController stateProfile = Get.put(ProfileController());
  final PostController postController = Get.put(PostController());
  final ScrollController commentScrollController = ScrollController();
  final TextEditingController commentController = TextEditingController();

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
  List<Map<String, dynamic>> streamPollOptions = [];
  int activeIndex = 0;
  int votesCount = 0;
  int allVotesCount = 0;
  int? indexVotes;
  List<String> dataRemainingTime = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      dataRemainingTime = widget.post.endTime
          .difference(DateTime.now())
          .toString()
          .split('.')[0]
          .split(":");
      allVotesCount = widget.post.pollCount;
      streamPollOptions = widget.post.streamPollOptions;

      comments.addAll(
          await postController.getComment(context, page, widget.post.id));
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
            comments.addAll(
                await postController.getComment(context, page, widget.post.id));
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
        controller: commentScrollController,
        child: Column(
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
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: widget.post.photoUser == "" ||
                                    widget.post.photoUser == "photo_profile"
                                ? AssetImage(
                                    'assets/images/profiledummy.png',
                                  )
                                : NetworkImage(
                                    '${Global.FILE}/${widget.post.photoUser}',
                                  ) as ImageProvider,
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
                              isMe: stateProfile.username.value ==
                                      widget.post.username
                                  ? true
                                  : false,
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
                  if (streamPollOptions.isEmpty)
                    buildRichTextWithMentions(
                      widget.post.content,
                    ),
                  if (streamPollOptions.isEmpty)
                    const SizedBox(
                      height: 16,
                    ),
                  if (widget.post.postImage.isNotEmpty)
                    CarouselSlider(
                      options: CarouselOptions(
                        padEnds: false,
                        enableInfiniteScroll: true,
                        height: 300,
                        onPageChanged: (index, reason) =>
                            setState(() => activeIndex = index),
                        viewportFraction: 1,
                      ),
                      items: widget.post.postImage.map((image) {
                        return Builder(
                          builder: (BuildContext context) {
                            return InkWell(
                              onTap: () {
                                // Get.to(
                                //     GalleryWidgets(urlImages: widget.post.postImage));
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      "${Global.FILE}/$image",
                                    ),
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                  if (widget.post.postImage.isNotEmpty)
                    SizedBox(
                      height: 20,
                    ),
                  if (widget.post.postImage.isNotEmpty)
                    Center(
                      child: AnimatedSmoothIndicator(
                        activeIndex: activeIndex,
                        count: widget.post.postImage.length,
                        effect: ScaleEffect(
                            activeDotColor: greenColor,
                            dotColor: const Color(0xffD9D9D9),
                            dotWidth: 6,
                            dotHeight: 6),
                      ),
                    ),
                  if (widget.post.postImage.isNotEmpty)
                    const SizedBox(
                      height: 16,
                    ),
                  if (streamPollOptions.isNotEmpty)
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
                            widget.post.content,
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                          ...streamPollOptions.asMap().entries.map((option) {
                            double pollPercentage = 0;
                            double pollColor = 0;

                            if (allVotesCount == 0 &&
                                option.value['count'] > 0) {
                              pollPercentage =
                                  (1 / option.value['count']) * 100;
                              pollColor = (1 / option.value['count']);
                            }

                            if (allVotesCount > 0 &&
                                option.value['count'] > 0) {
                              pollPercentage =
                                  (option.value['count'] / allVotesCount) * 100;
                              pollColor =
                                  (option.value['count'] / allVotesCount);
                            }

                            return Stack(
                              children: [
                                Container(
                                  width:
                                      (MediaQuery.of(context).size.width - 70) *
                                          pollColor,
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
                                InkWell(
                                  onTap: () {
                                    if (votesCount == 0) {
                                      votesCount = votesCount + 1;
                                      allVotesCount = allVotesCount + 1;

                                      if (indexVotes != null) {
                                        streamPollOptions[indexVotes!]
                                                ['count'] -
                                            1;
                                        postController.deletePolling(
                                            context,
                                            widget.post.id,
                                            streamPollOptions[indexVotes!]
                                                ['stream_poll_id'],
                                            streamPollOptions[indexVotes!]
                                                ['id']);
                                      }

                                      postController.pickPolling(
                                          context,
                                          widget.post.id,
                                          option.value['stream_poll_id'],
                                          option.value['id']);
                                      indexVotes = option.key;
                                      option.value['count'] =
                                          option.value['count'] + 1;
                                      setState(() {});
                                    }
                                  },
                                  child: Container(
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
                                          option.value['option'].toString(),
                                          style: TextStyle(
                                            color: option.value['count'] > 0
                                                ? Colors.white
                                                : Colors.black,
                                          ),
                                        ),
                                        Spacer(),
                                        Text(
                                          "${pollPercentage.toInt()}%",
                                          style: TextStyle(
                                            color: pollColor > 0.9
                                                ? Colors.white
                                                : Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
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
                                "$allVotesCount votes",
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
                  if (widget.post.hashtags.isNotEmpty) ...[
                    const SizedBox(
                      height: 16,
                    ),
                    Wrap(
                      children: widget.post.hashtags.map((hashtag) {
                        return Text(
                          "#$hashtag",
                          style: grenTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: regular,
                          ),
                        );
                      }).toList(),
                    ),
                  ],
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
                          InkWell(
                              onTap: () {
                                if (like ?? widget.post.liked) {
                                  postController.unlikePost(
                                      context, widget.post.id);
                                  setState(() {
                                    like = false;
                                    postLike = postLike - 1;
                                  });
                                } else {
                                  postController.likePost(
                                      context, widget.post.id);
                                  setState(() {
                                    like = true;
                                    postLike = postLike + 1;
                                  });
                                }
                              },
                              child: like ?? widget.post.liked
                                  ? Image.asset(
                                      'assets/icons/like.png',
                                      width: 19,
                                      height: 19,
                                      color: greenColor,
                                    )
                                  : Image.asset(
                                      'assets/icons/like.png',
                                      width: 19,
                                      height: 19,
                                      color: greyColor,
                                    )),
                          const SizedBox(
                            width: 15,
                          ),
                          InkWell(
                            onTap: () async {
                              Uri? url = await createDynamicLinkStream();
                              print("url $url");
                              await SocialShare.shareOptions(url.toString());
                              // showModalBottomSheet(
                              //   isDismissible: false,
                              //   context: context,
                              //   backgroundColor: Colors.white,
                              //   shape: const RoundedRectangleBorder(
                              //     borderRadius: BorderRadiusDirectional.only(
                              //       topEnd: Radius.circular(25),
                              //       topStart: Radius.circular(25),
                              //     ),
                              //   ),
                              //   builder: (context) => ShareShowWidget(),
                              // );
                            },
                            child: SvgPicture.asset(
                              'assets/icons/share-icons.svg',
                              color: greyColor,
                              width: 21,
                              height: 21,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          InkWell(
                            onTap: () {
                              if (saved ?? widget.post.saved) {
                                postController.unSavePost(
                                    context, widget.post.id);
                                setState(() {
                                  saved = false;
                                });
                              } else {
                                postController.savePost(
                                    context, widget.post.id);
                                setState(() {
                                  saved = true;
                                });
                              }
                            },
                            child: saved ?? widget.post.saved
                                ? Icon(
                                    Icons.bookmark,
                                    color: greenColor,
                                  )
                                : Icon(
                                    Icons.bookmark_border,
                                    color: greyColor,
                                  ),
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
              padding: const EdgeInsets.only(
                  left: 20, right: 17, top: 24, bottom: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: comments.map((comment) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: comment.photoUser == "" ||
                                    comment.photoUser == "photo_profile"
                                ? AssetImage(
                                    'assets/images/profiledummy.png',
                                  )
                                : NetworkImage(
                                        '${Global.FILE}/${comment.photoUser}')
                                    as ImageProvider,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 11,
                      ),
                      Expanded(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    comment.fullName,
                                    style:
                                        blackTextStyle.copyWith(fontSize: 14),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    timeago.format(
                                        DateTime.parse(comment.createdAt)),
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
                                  InkWell(
                                    onTap: () {
                                      if (comment.like +
                                              (commentLikes[
                                                      "${comment.commentID}"] ??
                                                  0) >
                                          0) {
                                        print("heheh");
                                        postController.unlikeComment(context,
                                            widget.post.id, comment.commentID);
                                        setState(() {
                                          commentLikes.update(
                                              "${comment.commentID}",
                                              (value) =>
                                                  (commentLikes[
                                                          "${comment.commentID}"] ??
                                                      0) -
                                                  1);
                                        });
                                      } else {
                                        print("hahah");
                                        postController.likeComment(context,
                                            widget.post.id, comment.commentID);
                                        setState(() {
                                          commentLikes.update(
                                              "${comment.commentID}",
                                              (value) =>
                                                  (commentLikes[
                                                          "${comment.commentID}"] ??
                                                      0) +
                                                  1);
                                        });
                                      }
                                    },
                                    child: comment.like +
                                                (commentLikes[
                                                        "${comment.commentID}"] ??
                                                    0) >
                                            0
                                        ? commentLike(comment.like +
                                            (commentLikes[
                                                    "${comment.commentID}"] ??
                                                0))
                                        : Text(
                                            'Suka',
                                            style:
                                                blackRegulerTextStyle.copyWith(
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
                              if (viewCommentReply["${comment.commentID}"] ==
                                  false)
                                InkWell(
                                  onTap: () async {
                                    viewCommentReply.update(
                                        "${comment.commentID}",
                                        (value) => true);
                                    List<StreamCommentReplyModel> replies =
                                        await postController.getCommentReplies(
                                            context,
                                            page,
                                            widget.post.id,
                                            comment.commentID);

                                    commentReplies.addAll({
                                      "${comment.commentID}": replies,
                                    });

                                    for (var i = 0; i < replies.length; i++) {
                                      commentReplyLikes.addAll({
                                        "${replies[i].replyID}": 0,
                                      });
                                    }
                                    setState(() {});
                                  },
                                  child: Text("View Comments",
                                      style: greyTextStyle),
                                ),
                              SizedBox(
                                height: 20.0,
                              ),
                              if (viewCommentReply["${comment.commentID}"] ==
                                  true)
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount:
                                      commentReplies["${comment.commentID}"]
                                              ?.length ??
                                          0,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      margin: const EdgeInsets.symmetric(
                                        vertical: 5.0,
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      decoration: BoxDecoration(
                                        color: const Color.fromRGBO(
                                            241, 241, 241, 0.95),
                                        borderRadius: BorderRadius.circular(7),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
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
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        commentReplies[
                                                                    "${comment.commentID}"]![
                                                                index]
                                                            .fullName,
                                                        style: blackTextStyle
                                                            .copyWith(
                                                                fontSize: 14),
                                                      ),
                                                      const SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(
                                                        timeago.format(DateTime
                                                            .parse(commentReplies[
                                                                        "${comment.commentID}"]![
                                                                    index]
                                                                .createdAt)),
                                                        style:
                                                            blackRegulerTextStyle
                                                                .copyWith(
                                                                    fontSize:
                                                                        12),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 6,
                                                  ),
                                                  Container(
                                                    constraints:
                                                        const BoxConstraints(
                                                            maxWidth: 220),
                                                    child: buildRichTextWithMentions(
                                                        commentReplies[
                                                                    "${comment.commentID}"]![
                                                                index]
                                                            .content),
                                                  ),
                                                  const SizedBox(
                                                    height: 11,
                                                  ),
                                                  Row(
                                                    children: [
                                                      (commentReplyLikes["${commentReplies["${comment.commentID}"]![index].replyID}"] ??
                                                                      0) +
                                                                  commentReplies[
                                                                              "${comment.commentID}"]![
                                                                          index]
                                                                      .like >
                                                              0
                                                          ? InkWell(
                                                              onTap: () {
                                                                postController.unlikeCommentReply(
                                                                    context,
                                                                    widget.post
                                                                        .id,
                                                                    comment
                                                                        .commentID,
                                                                    commentReplies["${comment.commentID}"]![
                                                                            index]
                                                                        .replyID);
                                                                setState(() {
                                                                  commentReplyLikes.update(
                                                                      "${commentReplies["${comment.commentID}"]![index].replyID}",
                                                                      (value) =>
                                                                          (commentReplyLikes["${commentReplies["${comment.commentID}"]![index].replyID}"] ??
                                                                              0) -
                                                                          1);
                                                                });
                                                              },
                                                              child: commentLike(commentReplies[
                                                                              "${comment.commentID}"]![
                                                                          index]
                                                                      .like +
                                                                  (commentReplyLikes[
                                                                          "${commentReplies["${comment.commentID}"]![index].replyID}"] ??
                                                                      0)),
                                                            )
                                                          : InkWell(
                                                              onTap: () {
                                                                postController.likeCommentReply(
                                                                    context,
                                                                    widget.post
                                                                        .id,
                                                                    comment
                                                                        .commentID,
                                                                    commentReplies["${comment.commentID}"]![
                                                                            index]
                                                                        .replyID);
                                                                setState(() {
                                                                  commentReplyLikes.update(
                                                                      "${commentReplies["${comment.commentID}"]![index].replyID}",
                                                                      (value) =>
                                                                          (commentReplyLikes["${commentReplies["${comment.commentID}"]![index].replyID}"] ??
                                                                              0) +
                                                                          1);
                                                                });
                                                              },
                                                              child: Text(
                                                                'Suka',
                                                                style:
                                                                    blackRegulerTextStyle
                                                                        .copyWith(
                                                                  fontSize: 10,
                                                                ),
                                                              ),
                                                            ),
                                                      const SizedBox(
                                                        width: 17,
                                                      ),
                                                      Text(
                                                        'Balas',
                                                        style:
                                                            blackRegulerTextStyle
                                                                .copyWith(
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
                                ),
                            ],
                          ),
                        ),
                      ),
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
                              username: comment.userName,
                              isMe: stateProfile.username.value ==
                                      comment.userName
                                  ? true
                                  : false,
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
                  controller: commentController,
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
                    // suffixIcon: Padding(
                    //   padding: const EdgeInsets.all(11.0),
                    //   child: PopupMenuButton(
                    //     icon: Image.asset(
                    //       'assets/icons/atement.png',
                    //       width: 20,
                    //     ),
                    //     itemBuilder: (context) => [
                    //       PopupMenuItem(
                    //         child: Container(
                    //           decoration: BoxDecoration(
                    //               borderRadius: BorderRadius.circular(15)),
                    //           height: 100,
                    //           child: Column(
                    //             children: [
                    //               InkWell(
                    //                 onTap: () {
                    //                   showDialog(
                    //                     context: context,
                    //                     builder: (context) => AlertDialog(
                    //                       backgroundColor: Colors.transparent,
                    //                       insetPadding:
                    //                           const EdgeInsets.all(0.1),
                    //                       content: Container(
                    //                         height: 225,
                    //                         width: MediaQuery.of(context)
                    //                             .size
                    //                             .width,
                    //                         decoration: BoxDecoration(
                    //                           color: whiteColor,
                    //                           borderRadius:
                    //                               BorderRadius.circular(20),
                    //                         ),
                    //                         child: Padding(
                    //                           padding:
                    //                               const EdgeInsets.symmetric(
                    //                                   horizontal: 35,
                    //                                   vertical: 32),
                    //                           child: Column(
                    //                             crossAxisAlignment:
                    //                                 CrossAxisAlignment.start,
                    //                             children: [
                    //                               Text(
                    //                                 'Tambahkan gambar',
                    //                                 style: blackRegulerTextStyle
                    //                                     .copyWith(
                    //                                         fontSize: 20,
                    //                                         color: blackColor),
                    //                               ),
                    //                               const SizedBox(
                    //                                 height: 21,
                    //                               ),
                    //                               //Tambah Gambar Di Kamera
                    //                               InkWell(
                    //                                 onTap: () {
                    //                                   _pickImageFromCamera();
                    //                                 },
                    //                                 child: Text(
                    //                                   'Kamera',
                    //                                   style: blackRegulerTextStyle
                    //                                       .copyWith(
                    //                                           fontSize: 15,
                    //                                           color:
                    //                                               blackColor),
                    //                                 ),
                    //                               ),
                    //                               const SizedBox(
                    //                                 height: 21,
                    //                               ),
                    //                               //Tambah Gambar Di Galeri
                    //                               InkWell(
                    //                                 onTap: () {
                    //                                   _pickImageFromGalery();
                    //                                 },
                    //                                 child: Text(
                    //                                   'Dari galeri',
                    //                                   style: blackRegulerTextStyle
                    //                                       .copyWith(
                    //                                           fontSize: 15,
                    //                                           color:
                    //                                               blackColor),
                    //                                 ),
                    //                               ),
                    //                               const SizedBox(
                    //                                 height: 21,
                    //                               ),
                    //                               Row(
                    //                                 mainAxisAlignment:
                    //                                     MainAxisAlignment.end,
                    //                                 children: [
                    //                                   InkWell(
                    //                                     onTap: () {
                    //                                       Navigator.pop(
                    //                                           context);
                    //                                     },
                    //                                     child: Text(
                    //                                       'CANCEL',
                    //                                       style: blackRegulerTextStyle
                    //                                           .copyWith(
                    //                                               fontSize: 15,
                    //                                               color:
                    //                                                   blackColor),
                    //                                     ),
                    //                                   ),
                    //                                 ],
                    //                               )
                    //                             ],
                    //                           ),
                    //                         ),
                    //                       ),
                    //                     ),
                    //                   );
                    //                 },
                    //                 child: Row(
                    //                   children: [
                    //                     Text(
                    //                       'Foto / Kamera',
                    //                       style: blackRegulerTextStyle.copyWith(
                    //                           fontSize: 13),
                    //                     ),
                    //                     const SizedBox(
                    //                       width: 10,
                    //                     ),
                    //                     const Spacer(),
                    //                     Container(
                    //                       height: 44,
                    //                       width: 44,
                    //                       padding: const EdgeInsets.symmetric(
                    //                           horizontal: 15),
                    //                       decoration: BoxDecoration(
                    //                           color: greenColor,
                    //                           shape: BoxShape.circle),
                    //                       child: Image.asset(
                    //                         'assets/icons/camera-new.png',
                    //                         height: 25,
                    //                         width: 25,
                    //                       ),
                    //                     )
                    //                   ],
                    //                 ),
                    //               ),
                    //               const SizedBox(
                    //                 height: 10,
                    //               ),
                    //               InkWell(
                    //                 onTap: () {},
                    //                 child: Row(
                    //                   children: [
                    //                     Text(
                    //                       'Poll',
                    //                       style: blackRegulerTextStyle.copyWith(
                    //                           fontSize: 13),
                    //                     ),
                    //                     const SizedBox(
                    //                       width: 10,
                    //                     ),
                    //                     const Spacer(),
                    //                     Container(
                    //                       height: 44,
                    //                       width: 44,
                    //                       padding: const EdgeInsets.symmetric(
                    //                           horizontal: 15),
                    //                       decoration: BoxDecoration(
                    //                           color: greenColor,
                    //                           shape: BoxShape.circle),
                    //                       child: Image.asset(
                    //                         'assets/icons/poll.png',
                    //                       ),
                    //                     )
                    //                   ],
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //       )
                    //     ],
                    //   ),
                    // ),
                    hintStyle: subGreyTextStyle,
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  postController.postComment(
                      context, widget.post.id, commentController.text);
                  page = 1;
                  comments.clear();
                  comments.addAll(await postController.getComment(
                      context, page, widget.post.id));
                  commentController.clear();
                  setState(() {});
                },
                child: Image.asset(
                  'assets/icons/Group 461.png',
                  width: 40,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future _pickImageFromCamera() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (returnedImage == null) return;
    imagePath = File(returnedImage.path);
  }

  Future _pickImageFromGalery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (returnedImage == null) return;
    imagePath = File(returnedImage.path);
  }
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
          fontSize: 12,
          fontWeight: FontWeight.normal,
        ),
      ),
      const SizedBox(
        width: 2,
      ),
      Text(
        "Suka",
        style: grenTextStyle.copyWith(
          fontSize: 12,
          fontWeight: FontWeight.normal,
        ),
      ),
    ],
  );
}
