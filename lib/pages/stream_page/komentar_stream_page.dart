// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/account/profile_controller.dart';
import 'package:heystetik_mobileapps/controller/customer/stream/stream_controller.dart';
import 'package:heystetik_mobileapps/core/convert_date.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/pages/profile_costumer/profil_customer_page.dart';
import 'package:heystetik_mobileapps/pages/stream_page/user_followed_stream_page.dart';
import 'package:heystetik_mobileapps/routes/create_dynamic_link.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';
import 'package:heystetik_mobileapps/widget/snackbar_widget.dart';
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
    required this.postId,
  });

  final int postId;

  @override
  State<KomentarStreamPage> createState() => _KomentarStreamPageState();
}

class _KomentarStreamPageState extends State<KomentarStreamPage> {
  File? imagePath;
  final ProfileController stateProfile = Get.put(ProfileController());
  final StreamController stateStream = Get.put(StreamController());
  final ScrollController commentScrollController = ScrollController();
  final TextEditingController commentController = TextEditingController();

  StreamHomeModel? post;
  int page = 1;
  int index = 1;
  bool? like;
  bool? follow;
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
  bool isTimeOver = false;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      stateStream.isLoading.value = true;
      post = await stateStream.getStreamById(context, widget.postId);
      print("res $post");
      dataRemainingTime = post!.endTime
          .difference(DateTime.now())
          .toString()
          .split('.')[0]
          .split(":");
      if (int.parse(dataRemainingTime[0]) < 0) {
        isTimeOver = true;
      }
      allVotesCount = post?.pollCount ?? 0;
      streamPollOptions = post?.streamPollOptions ?? [];

      comments.addAll(
        await stateStream.getComment(context, page, widget.postId),
      );
      print("comments $comments");
      for (var i = 0; i < comments.length; i++) {
        commentLikes.addAll({
          "${comments[i].commentID}": 0,
        });

        viewCommentReply.addAll({
          "${comments[i].commentID}":
              comments[i].commentReplies <= 0 ? false : true,
        });
      }
      stateStream.isLoading.value = false;
      setState(() {});
      print("commentLikes $commentLikes");
      print("viewCommentReply $viewCommentReply");
    });

    commentScrollController.addListener(() {
      if (commentScrollController.position.atEdge) {
        bool isTop = commentScrollController.position.pixels == 0;
        if (!isTop) {
          page += 1;
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
            comments.addAll(
                await stateStream.getComment(context, page, widget.postId));
            for (var i = 0; i < comments.length; i++) {
              commentLikes.addAll({
                "${comments[i].commentID}": 0,
              });

              viewCommentReply.addAll({
                "${comments[i].commentID}":
                    comments[i].commentReplies <= 0 ? false : true,
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
      body: Obx(
        () => LoadingWidget(
          isLoading: stateStream.isLoading.value,
          child: SingleChildScrollView(
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
                          InkWell(
                            onTap: () {
                              if (stateProfile.username.value ==
                                  post?.username) {
                                Get.to(() => const ProfilCustomerPage());
                              } else {
                                Get.to(
                                  () => UserFollowedStreamPage(
                                    username: post!.username,
                                    fullname: post!.fullname,
                                  ),
                                );
                              }
                            },
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: post?.photoUser == "" ||
                                          post?.photoUser == "photo_profile"
                                      ? AssetImage(
                                          'assets/images/profiledummy.png',
                                        )
                                      : NetworkImage(
                                          '${Global.FILE}/${post?.photoUser}',
                                        ) as ImageProvider,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 11,
                          ),
                          InkWell(
                            onTap: () {
                              if (stateProfile.username.value ==
                                  post?.username) {
                                Get.to(() => const ProfilCustomerPage());
                              } else {
                                Get.to(() => UserFollowedStreamPage(
                                      username: post!.username,
                                      fullname: post!.fullname,
                                    ));
                              }
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  post?.fullname ?? "",
                                  style: blackTextStyle.copyWith(fontSize: 14),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  '${DateFormat('dd MMMM yyyy').format(DateTime.parse(post?.createdAt ?? DateTime.now().toString()))}, ${timeago.format(DateTime.parse(post?.createdAt ?? DateTime.now().toString()))}',
                                  style:
                                      subTitleTextStyle.copyWith(fontSize: 10),
                                )
                              ],
                            ),
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
                                  post: post!,
                                  isMe: stateProfile.username.value ==
                                          post?.username
                                      ? true
                                      : false,
                                  follow: (follow ?? (post?.follow ?? false)),
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
                          context,
                          post?.content ?? "",
                          isMe: stateProfile.username.value,
                          fullname: post?.fullname ?? "",
                        ),
                      if (streamPollOptions.isEmpty)
                        const SizedBox(
                          height: 16,
                        ),
                      if (int.parse(post?.postImage.length.toString() ?? "0") >
                          0)
                        CarouselSlider(
                          options: CarouselOptions(
                            padEnds: false,
                            enableInfiniteScroll: true,
                            height: 400,
                            onPageChanged: (index, reason) =>
                                setState(() => activeIndex = index),
                            viewportFraction: 1,
                          ),
                          items: post?.postImage.map((image) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.fitHeight,
                                      image: NetworkImage(
                                        "${Global.FILE}/$image",
                                      ),
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        ),
                      if (int.parse(post?.postImage.length.toString() ?? "0") >
                          0)
                        SizedBox(
                          height: 20,
                        ),
                      if (int.parse(post?.postImage.length.toString() ?? "0") >
                          0)
                        Center(
                          child: AnimatedSmoothIndicator(
                            activeIndex: activeIndex,
                            count: post?.postImage.length ?? 0,
                            effect: ScaleEffect(
                                activeDotColor: greenColor,
                                dotColor: const Color(0xffD9D9D9),
                                dotWidth: 6,
                                dotHeight: 6),
                          ),
                        ),
                      if (int.parse(post?.postImage.length.toString() ?? "0") >
                          0)
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
                                context,
                                post?.content ?? "",
                                fullname: post?.fullname ?? "",
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 16.0,
                              ),
                              ...streamPollOptions
                                  .asMap()
                                  .entries
                                  .map((option) {
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
                                      (option.value['count'] / allVotesCount) *
                                          100;
                                  pollColor =
                                      (option.value['count'] / allVotesCount);
                                }

                                return Stack(
                                  children: [
                                    Container(
                                      width:
                                          (MediaQuery.of(context).size.width -
                                                  70) *
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
                                        if (!isTimeOver) {
                                          if (votesCount == 0) {
                                            votesCount = votesCount + 1;
                                            allVotesCount = allVotesCount + 1;

                                            if (indexVotes != null) {
                                              streamPollOptions[indexVotes!]
                                                      ['count'] -
                                                  1;
                                              stateStream.deletePolling(
                                                  context,
                                                  widget.postId,
                                                  streamPollOptions[indexVotes!]
                                                      ['stream_poll_id'],
                                                  streamPollOptions[indexVotes!]
                                                      ['id']);
                                            }

                                            stateStream.pickPolling(
                                                context,
                                                widget.postId,
                                                option.value['stream_poll_id'],
                                                option.value['id']);
                                            indexVotes = option.key;
                                            option.value['count'] =
                                                option.value['count'] + 1;
                                            setState(() {});
                                          }
                                        }
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
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
                                          borderRadius:
                                              BorderRadius.circular(6),
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
                                  Text(
                                    " . ",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      isTimeOver
                                          ? "Polling telah berakhir ${ConvertDate.streamDate(post!.endTime.toString())}"
                                          : "Polling berakhir dalam ${dataRemainingTime[0]} Jam ${dataRemainingTime[1]} Menit",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      if (int.parse(post?.hashtags.length.toString() ?? "0") >
                          0) ...[
                        const SizedBox(
                          height: 16,
                        ),
                        Wrap(
                          children: post!.hashtags.map((hashtag) {
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
                        '${(post?.streamLikes ?? 0) + postLike} Menyukai',
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
                                    if (like ?? (post?.liked ?? false)) {
                                      stateStream.unlikePost(
                                        context,
                                        widget.postId,
                                      );
                                      setState(() {
                                        like = false;
                                        postLike = postLike - 1;
                                      });
                                    } else {
                                      stateStream.likePost(
                                        context,
                                        widget.postId,
                                      );
                                      setState(() {
                                        like = true;
                                        postLike = postLike + 1;
                                      });
                                    }
                                  },
                                  child: like ?? (post?.liked ?? false)
                                      ? Image.asset(
                                          'assets/icons/like.png',
                                          width: 19,
                                          height: 19,
                                          color: greenColor,
                                        )
                                      : Image.asset(
                                          'assets/icons/unlike.png',
                                          width: 19,
                                          height: 19,
                                          color: greyColor,
                                        )),
                              const SizedBox(
                                width: 15,
                              ),
                              InkWell(
                                onTap: () async {
                                  Uri? url = await createDynamicLinkStream(
                                      widget.postId);
                                  print("url $url");
                                  await SocialShare.shareOptions(
                                      url.toString());
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
                                  if (saved ?? (post?.saved ?? false)) {
                                    stateStream.unSavePost(
                                      context,
                                      widget.postId,
                                    );
                                    setState(() {
                                      saved = false;
                                    });
                                  } else {
                                    stateStream.savePost(
                                      context,
                                      widget.postId,
                                    );
                                    setState(() {
                                      saved = true;
                                    });
                                  }
                                },
                                child: saved ?? (post?.saved ?? false)
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
                    left: 20,
                    right: 17,
                    top: 24,
                    bottom: 24,
                  ),
                  child: (comments.isEmpty)
                      ? Center(
                          child: Text(
                            'Belum ada komentar',
                            style: TextStyle(
                              fontFamily: 'ProximaNova',
                              fontSize: 20,
                            ),
                          ),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: comments.map((comment) {
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    if (stateProfile.username.value ==
                                        comment.userName) {
                                      Get.to(() => const ProfilCustomerPage());
                                    } else {
                                      Get.to(
                                        () => UserFollowedStreamPage(
                                          username: comment.userName,
                                          fullname: comment.fullName,
                                        ),
                                      );
                                    }
                                  },
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: comment.photoUser == "" ||
                                                comment.photoUser ==
                                                    "photo_profile"
                                            ? AssetImage(
                                                'assets/images/profiledummy.png',
                                              )
                                            : NetworkImage(
                                                    '${Global.FILE}/${comment.photoUser}')
                                                as ImageProvider,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 11,
                                ),
                                Expanded(
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            if (stateProfile.username.value ==
                                                comment.userName) {
                                              Get.to(() =>
                                                  const ProfilCustomerPage());
                                            } else {
                                              Get.to(
                                                () => UserFollowedStreamPage(
                                                  username: comment.userName,
                                                  fullname: comment.fullName,
                                                ),
                                              );
                                            }
                                          },
                                          child: Row(
                                            children: [
                                              Text(
                                                comment.fullName,
                                                style: blackTextStyle.copyWith(
                                                    fontSize: 14),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                timeago.format(DateTime.parse(
                                                    comment.createdAt)),
                                                style: blackRegulerTextStyle
                                                    .copyWith(
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 6,
                                        ),
                                        buildRichTextWithMentions(
                                          context,
                                          comment.content,
                                          fullname: comment.fullName,
                                        ),
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
                                                  print("TIDAK SUKA KOMEN");
                                                  stateStream.unlikeComment(
                                                    context,
                                                    widget.postId,
                                                    comment.commentID,
                                                  );
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
                                                  print("SUKA KOMEN");
                                                  stateStream.likeComment(
                                                    context,
                                                    widget.postId,
                                                    comment.commentID,
                                                  );
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
                                                          blackRegulerTextStyle
                                                              .copyWith(
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                            ),
                                            const SizedBox(
                                              width: 17,
                                            ),
                                            Text(
                                              'Balas',
                                              style: blackRegulerTextStyle
                                                  .copyWith(
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 8.0,
                                        ),
                                        if (viewCommentReply[
                                                "${comment.commentID}"] ==
                                            true)
                                          InkWell(
                                            onTap: () async {
                                              viewCommentReply.update(
                                                "${comment.commentID}",
                                                (value) => true,
                                              );
                                              List<StreamCommentReplyModel>
                                                  replies = await stateStream
                                                      .getCommentReplies(
                                                context,
                                                page,
                                                widget.postId,
                                                comment.commentID,
                                              );

                                              commentReplies.addAll({
                                                "${comment.commentID}": replies,
                                              });

                                              for (var i = 0;
                                                  i < replies.length;
                                                  i++) {
                                                commentReplyLikes.addAll({
                                                  "${replies[i].replyID}": 0,
                                                });
                                              }
                                              setState(() {});
                                            },
                                            child: Text(
                                              "View Comments",
                                              style: greyTextStyle,
                                            ),
                                          ),
                                        SizedBox(
                                          height: 8.0,
                                        ),
                                        if (viewCommentReply[
                                                "${comment.commentID}"] ==
                                            true)
                                          ListView.builder(
                                            shrinkWrap: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemCount: commentReplies[
                                                        "${comment.commentID}"]
                                                    ?.length ??
                                                0,
                                            itemBuilder: (context, index) {
                                              return Container(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                  vertical: 5.0,
                                                ),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 10,
                                                  vertical: 10,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: const Color.fromRGBO(
                                                      241, 241, 241, 0.95),
                                                  borderRadius:
                                                      BorderRadius.circular(7),
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        InkWell(
                                                          onTap: () {
                                                            if (stateProfile
                                                                    .username
                                                                    .value ==
                                                                commentReplies[
                                                                            "${comment.commentID}"]![
                                                                        index]
                                                                    .userName) {
                                                              Get.to(() =>
                                                                  const ProfilCustomerPage());
                                                            } else {
                                                              Get.to(
                                                                () =>
                                                                    UserFollowedStreamPage(
                                                                  username: commentReplies[
                                                                              "${comment.commentID}"]![
                                                                          index]
                                                                      .userName,
                                                                  fullname: commentReplies[
                                                                              "${comment.commentID}"]![
                                                                          index]
                                                                      .fullName,
                                                                ),
                                                              );
                                                            }
                                                          },
                                                          child: Container(
                                                            height: 30,
                                                            width: 30,
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              image:
                                                                  DecorationImage(
                                                                image: commentReplies["${comment.commentID}"]![index].photoUser ==
                                                                            "" ||
                                                                        commentReplies["${comment.commentID}"]![index].photoUser ==
                                                                            "photo_profile"
                                                                    ? AssetImage(
                                                                        'assets/images/profiledummy.png',
                                                                      )
                                                                    : NetworkImage(
                                                                        '${Global.FILE}/${commentReplies["${comment.commentID}"]![index].photoUser}',
                                                                      ) as ImageProvider,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 11,
                                                        ),
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            InkWell(
                                                              onTap: () {
                                                                if (stateProfile
                                                                        .username
                                                                        .value ==
                                                                    commentReplies["${comment.commentID}"]![
                                                                            index]
                                                                        .userName) {
                                                                  Get.to(() =>
                                                                      const ProfilCustomerPage());
                                                                } else {
                                                                  Get.to(
                                                                    () =>
                                                                        UserFollowedStreamPage(
                                                                      username:
                                                                          commentReplies["${comment.commentID}"]![index]
                                                                              .userName,
                                                                      fullname:
                                                                          commentReplies["${comment.commentID}"]![index]
                                                                              .fullName,
                                                                    ),
                                                                  );
                                                                }
                                                              },
                                                              child: Row(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    commentReplies["${comment.commentID}"]![
                                                                            index]
                                                                        .fullName,
                                                                    style: blackTextStyle.copyWith(
                                                                        fontSize:
                                                                            14),
                                                                  ),
                                                                  const SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                  Text(
                                                                    timeago.format(
                                                                        DateTime.parse(
                                                                            commentReplies["${comment.commentID}"]![index].createdAt)),
                                                                    style: blackRegulerTextStyle.copyWith(
                                                                        fontSize:
                                                                            12),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              height: 6,
                                                            ),
                                                            Container(
                                                              constraints:
                                                                  const BoxConstraints(
                                                                      maxWidth:
                                                                          220),
                                                              child:
                                                                  buildRichTextWithMentions(
                                                                context,
                                                                commentReplies[
                                                                            "${comment.commentID}"]![
                                                                        index]
                                                                    .content,
                                                                fullname: commentReplies[
                                                                            "${comment.commentID}"]![
                                                                        index]
                                                                    .fullName,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              height: 11,
                                                            ),
                                                            Row(
                                                              children: [
                                                                (commentReplyLikes["${commentReplies["${comment.commentID}"]![index].replyID}"] ??
                                                                                0) +
                                                                            commentReplies["${comment.commentID}"]![index].like >
                                                                        0
                                                                    ? InkWell(
                                                                        onTap:
                                                                            () {
                                                                          stateStream
                                                                              .unlikeCommentReply(
                                                                            context,
                                                                            widget.postId,
                                                                            comment.commentID,
                                                                            commentReplies["${comment.commentID}"]![index].replyID,
                                                                          );
                                                                          setState(
                                                                              () {
                                                                            commentReplyLikes.update("${commentReplies["${comment.commentID}"]![index].replyID}",
                                                                                (value) => (commentReplyLikes["${commentReplies["${comment.commentID}"]![index].replyID}"] ?? 0) - 1);
                                                                          });
                                                                        },
                                                                        child: commentLike(commentReplies["${comment.commentID}"]![index].like +
                                                                            (commentReplyLikes["${commentReplies["${comment.commentID}"]![index].replyID}"] ??
                                                                                0)),
                                                                      )
                                                                    : InkWell(
                                                                        onTap:
                                                                            () {
                                                                          stateStream
                                                                              .likeCommentReply(
                                                                            context,
                                                                            widget.postId,
                                                                            comment.commentID,
                                                                            commentReplies["${comment.commentID}"]![index].replyID,
                                                                          );
                                                                          setState(
                                                                              () {
                                                                            commentReplyLikes.update("${commentReplies["${comment.commentID}"]![index].replyID}",
                                                                                (value) => (commentReplyLikes["${commentReplies["${comment.commentID}"]![index].replyID}"] ?? 0) + 1);
                                                                          });
                                                                        },
                                                                        child:
                                                                            Text(
                                                                          'Suka',
                                                                          style:
                                                                              blackRegulerTextStyle.copyWith(
                                                                            fontSize:
                                                                                10,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                const SizedBox(
                                                                  width: 17,
                                                                ),
                                                                Text(
                                                                  'Balas',
                                                                  style: blackRegulerTextStyle
                                                                      .copyWith(
                                                                    fontSize:
                                                                        12,
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
                                // InkWell(
                                //   onTap: () {
                                //     showModalBottomSheet(
                                //       context: context,
                                //       backgroundColor: Colors.white,
                                //       shape: const RoundedRectangleBorder(
                                //         borderRadius:
                                //             BorderRadiusDirectional.only(
                                //           topEnd: Radius.circular(25),
                                //           topStart: Radius.circular(25),
                                //         ),
                                //       ),
                                //       builder: (context) => ShareLinkStream(
                                //         post: post!,
                                //         isMe: stateProfile.username.value ==
                                //                 comment.userName
                                //             ? true
                                //             : false,
                                //         follow:
                                //             (follow ?? (post?.follow ?? false)),
                                //       ),
                                //     );
                                //   },
                                //   child: Icon(
                                //     Icons.more_horiz,
                                //     color: subgreyColor,
                                //     size: 24,
                                //   ),
                                // )
                              ],
                            );
                          }).toList(),
                        ),
                ),
              ],
            ),
          ),
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
                  if (commentController.text.isEmpty) {
                    SnackbarWidget.getSuccessSnackbar(
                      context,
                      "Info",
                      "Komentar tidak boleh kosong",
                    );
                    return;
                  }
                  stateStream.postComment(
                    context,
                    widget.postId,
                    commentController.text,
                  );
                  page = 1;
                  comments.clear();
                  comments.addAll(
                    await stateStream.getComment(
                      context,
                      page,
                      widget.postId,
                    ),
                  );
                  for (var i = 0; i < comments.length; i++) {
                    commentLikes.addAll({
                      "${comments[i].commentID}": 0,
                    });

                    viewCommentReply.addAll({
                      "${comments[i].commentID}":
                          comments[i].commentReplies <= 0 ? false : true,
                    });
                  }
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

  // Future _pickImageFromCamera() async {
  //   final returnedImage =
  //       await ImagePicker().pickImage(source: ImageSource.camera);

  //   if (returnedImage == null) return;
  //   imagePath = File(returnedImage.path);
  // }

  // Future _pickImageFromGalery() async {
  //   final returnedImage =
  //       await ImagePicker().pickImage(source: ImageSource.gallery);

  //   if (returnedImage == null) return;
  //   imagePath = File(returnedImage.path);
  // }
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
