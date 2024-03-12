import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/account/profile_controller.dart';
import 'package:heystetik_mobileapps/core/convert_date.dart';
import 'package:heystetik_mobileapps/models/stream_home.dart';
import 'package:heystetik_mobileapps/pages/profile_costumer/profil_customer_page.dart';
import 'package:heystetik_mobileapps/pages/stream_page/followed_stream_page.dart';
import 'package:heystetik_mobileapps/pages/stream_page/streams_by_hashtag_page.dart';
import 'package:heystetik_mobileapps/routes/create_dynamic_link.dart';
import 'package:heystetik_mobileapps/widget/text_with_mentions.dart';
import 'package:intl/intl.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:social_share/social_share.dart';
import '../../widget/shere_link_stream.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../controller/customer/stream/stream_controller.dart';
import '../core/global.dart';
import '../pages/stream_page/komentar_stream_page.dart';
import '../theme/theme.dart';

class StreamPostPage extends StatefulWidget {
  const StreamPostPage({
    super.key,
    required this.stream,
  });

  final StreamHomeModel stream;

  @override
  State<StreamPostPage> createState() => _StreamPostPageState();
}

class _StreamPostPageState extends State<StreamPostPage> {
  final ProfileController stateProfile = Get.put(ProfileController());
  final StreamController stateStream = Get.put(StreamController());
  bool? like;
  bool? follow;
  bool? saved;
  Map<String, int> postLike = {};
  bool isTimeOver = false;
  List<String> dataRemainingTime = [];
  Map<String, int> votes = {};
  int votesCount = 0;
  int allVotesCount = 0;
  int? indexVotes;
  List<Map<String, dynamic>> streamPollOptions = [];
  int activeIndex = 0;
  @override
  void initState() {
    dataRemainingTime = widget.stream.endTime
        .difference(DateTime.now())
        .toString()
        .split('.')[0]
        .split(":");

    if (int.parse(dataRemainingTime[0]) < 0) {
      isTimeOver = true;
    }
    allVotesCount = widget.stream.pollCount;
    streamPollOptions = widget.stream.streamPollOptions;
    super.initState();
    setState(() {});
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
              InkWell(
                onTap: () {
                  if (stateProfile.username.value == widget.stream.username) {
                    Get.to(() => const ProfilCustomerPage());
                  } else {
                    Get.to(() => FolowedStreamPage(
                          username: widget.stream.username,
                          fullname: widget.stream.fullname,
                        ));
                  }
                },
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: widget.stream.photoUser == "" ||
                              widget.stream.photoUser == "photo_profile"
                          ? AssetImage(
                              'assets/images/profiledummy.png',
                            )
                          : NetworkImage(
                              '${Global.FILE}/${widget.stream.photoUser}',
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
                  if (stateProfile.username.value == widget.stream.username) {
                    Get.to(() => const ProfilCustomerPage());
                  } else {
                    Get.to(() => FolowedStreamPage(
                          username: widget.stream.username,
                          fullname: widget.stream.fullname,
                        ));
                  }
                },
                child: Column(
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
                      post: widget.stream,
                      isMe:
                          stateProfile.username.value == widget.stream.username
                              ? true
                              : false,
                      follow: (follow ?? widget.stream.follow),
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
              widget.stream.content,
              isMe: stateProfile.username.value,
              fullname: widget.stream.fullname,
            ),
          if (streamPollOptions.isEmpty)
            const SizedBox(
              height: 16,
            ),
          if (widget.stream.postImage.isNotEmpty)
            CarouselSlider(
              options: CarouselOptions(
                pauseAutoPlayInFiniteScroll: false,
                padEnds: false,
                enableInfiniteScroll: true,
                height: 300,
                onPageChanged: (index, reason) =>
                    setState(() => activeIndex = index),
                viewportFraction: 1,
              ),
              items: widget.stream.postImage.map((image) {
                return Builder(
                  builder: (BuildContext context) {
                    return InkWell(
                      onTap: () {
                        // Get.to(
                        //     GalleryWidgets(urlImages: widget.stream.postImage));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
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
          if (widget.stream.postImage.isNotEmpty)
            SizedBox(
              height: 20,
            ),
          if (widget.stream.postImage.isNotEmpty)
            Center(
              child: AnimatedSmoothIndicator(
                activeIndex: activeIndex,
                count: widget.stream.postImage.length,
                effect: ScaleEffect(
                    activeDotColor: greenColor,
                    dotColor: const Color(0xffD9D9D9),
                    dotWidth: 6,
                    dotHeight: 6),
              ),
            ),
          if (widget.stream.postImage.isNotEmpty)
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
                    widget.stream.content,
                    fullname: widget.stream.fullname,
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

                    if (allVotesCount == 0 && option.value['count'] > 0) {
                      pollPercentage = (1 / option.value['count']) * 100;
                      pollColor = (1 / option.value['count']);
                    }

                    if (allVotesCount > 0 && option.value['count'] > 0) {
                      pollPercentage =
                          (option.value['count'] / allVotesCount) * 100;
                      pollColor = (option.value['count'] / allVotesCount);
                    }

                    return Stack(
                      children: [
                        Container(
                          width: (MediaQuery.of(context).size.width - 70) *
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
                                  streamPollOptions[indexVotes!]['count'] - 1;
                                  stateStream.deletePolling(
                                      context,
                                      widget.stream.id,
                                      streamPollOptions[indexVotes!]
                                          ['stream_poll_id'],
                                      streamPollOptions[indexVotes!]['id']);
                                }

                                stateStream.pickPolling(
                                    context,
                                    widget.stream.id,
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
                              ? "Polling telah berakhir ${ConvertDate.streamDate(widget.stream.endTime.toString())}"
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
          if (widget.stream.hashtags.isNotEmpty) ...[
            const SizedBox(
              height: 16,
            ),
            Wrap(
              children: widget.stream.hashtags.map((hashtag) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => StreamsByHashtagPage(
                                  hashtag: hashtag,
                                )));
                  },
                  child: Text(
                    "#$hashtag",
                    style: grenTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: regular,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
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
                  InkWell(
                    onTap: () {
                      if (like ?? widget.stream.liked) {
                        stateStream.unlikePost(context, widget.stream.id);
                        setState(() {
                          like = false;
                          postLike["${widget.stream.id}"] =
                              (postLike["${widget.stream.id}"] ?? 0) - 1;
                        });
                      } else {
                        stateStream.likePost(context, widget.stream.id);
                        setState(() {
                          like = true;
                          postLike["${widget.stream.id}"] =
                              (postLike["${widget.stream.id}"] ?? 0) + 1;
                        });
                      }
                    },
                    child: like ?? widget.stream.liked
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
                          ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  InkWell(
                    onTap: () async {
                      Uri? url =
                          await createDynamicLinkStream(widget.stream.id);
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
                      if (saved ?? widget.stream.saved) {
                        stateStream.unSavePost(context, widget.stream.id);
                        setState(() {
                          saved = false;
                        });
                      } else {
                        stateStream.savePost(context, widget.stream.id);
                        setState(() {
                          saved = true;
                        });
                      }
                    },
                    child: saved ?? widget.stream.saved
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
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          KomentarStreamPage(postId: widget.stream.id),
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
