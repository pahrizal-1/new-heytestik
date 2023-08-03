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
  final PostController postController = Get.put(PostController());
  final ScrollController commentScrollController = ScrollController();

  File? imagePath;

  int page = 1;
  int index = 1;
  bool? like;
  bool? saved;
  int postLike = 0;
  List<StreamCommentModel> comments = [];
  Map<String, dynamic> commentReplies = {};

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      comments.addAll(
          await postController.getComment(context, page, widget.post.id));
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
              padding: const EdgeInsets.only(
                  left: 20, right: 17, top: 16, bottom: 18),
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
                            builder: (context) => const ShareLinkStream(),
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
                      style: blackRegulerTextStyle.copyWith(
                          fontSize: 14, color: blackColor),
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
                                    postController.unlikePost(
                                        context, widget.post.id);
                                    setState(() {
                                      like = false;
                                      postLike = postLike - 1;
                                    });
                                  },
                                  child: Icon(Icons.favorite),
                                )
                              : GestureDetector(
                                  onTap: () {
                                    postController.likePost(
                                        context, widget.post.id);
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
                                    postController.unSavePost(
                                        context, widget.post.id);
                                    setState(() {
                                      saved = false;
                                    });
                                  },
                                  child: Icon(Icons.bookmark),
                                )
                              : GestureDetector(
                                  onTap: () {
                                    postController.savePost(
                                        context, widget.post.id);
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
              padding: const EdgeInsets.only(
                  left: 20, right: 17, top: 24, bottom: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: comments
                    .map(
                      (comment) => Row(
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
                                Text(
                                  comment.content,
                                  style: blackRegulerTextStyle.copyWith(
                                    color: blackColor,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(
                                  height: 11,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Suka',
                                      style: blackRegulerTextStyle.copyWith(
                                          fontSize: 12),
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
                                Container(
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
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Kevin',
                                                    style: blackTextStyle
                                                        .copyWith(fontSize: 14),
                                                  ),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    '3h',
                                                    style: blackRegulerTextStyle
                                                        .copyWith(fontSize: 12),
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
                                                child: Text.rich(
                                                  TextSpan(
                                                    text: 'Mantaaaaaps ',
                                                    style: blackRegulerTextStyle
                                                        .copyWith(
                                                      fontSize: 14,
                                                      color: blackColor,
                                                    ),
                                                    children: [
                                                      TextSpan(
                                                        text: '@Ressy',
                                                        style: grenTextStyle
                                                            .copyWith(
                                                          fontSize: 14,
                                                          fontWeight: regular,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text:
                                                            ' makasiiihhh rekomennya, kayaknya gue bakalan kesanaa',
                                                        style:
                                                            blackRegulerTextStyle
                                                                .copyWith(
                                                          fontSize: 14,
                                                          color: blackColor,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 11,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'Suka',
                                                    style: blackRegulerTextStyle
                                                        .copyWith(fontSize: 12),
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
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
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
                      ),
                    )
                    .toList(),
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
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15)),
                              height: 100,
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                                backgroundColor:
                                                    Colors.transparent,
                                                insetPadding:
                                                    const EdgeInsets.all(0.1),
                                                content: Container(
                                                    height: 225,
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    decoration: BoxDecoration(
                                                      color: whiteColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 35,
                                                          vertical: 32),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Tambahkan gambar',
                                                            style: blackRegulerTextStyle
                                                                .copyWith(
                                                                    fontSize:
                                                                        20,
                                                                    color:
                                                                        blackColor),
                                                          ),
                                                          const SizedBox(
                                                            height: 21,
                                                          ),
                                                          //Tambah Gambar
                                                          InkWell(
                                                            onTap: () {
                                                              _pickImageFromCamera();
                                                            },
                                                            child: Text(
                                                              'Kamera',
                                                              style: blackRegulerTextStyle
                                                                  .copyWith(
                                                                      fontSize:
                                                                          15,
                                                                      color:
                                                                          blackColor),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 21,
                                                          ),
                                                          InkWell(
                                                            onTap: () {
                                                              Get.to(
                                                                  GaleryMyJourney());
                                                            },
                                                            child: Text(
                                                              'Dari galeri',
                                                              style: blackRegulerTextStyle
                                                                  .copyWith(
                                                                      fontSize:
                                                                          15,
                                                                      color:
                                                                          blackColor),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 21,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              InkWell(
                                                                onTap: () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child: Text(
                                                                  'CANCEL',
                                                                  style: blackRegulerTextStyle
                                                                      .copyWith(
                                                                          fontSize:
                                                                              15,
                                                                          color:
                                                                              blackColor),
                                                                ),
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    )),
                                              ));
                                    },
                                    child: Row(
                                      children: [
                                        Text(
                                          'Foto / Kamera',
                                          style: blackRegulerTextStyle.copyWith(
                                              fontSize: 13),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Spacer(),
                                        Container(
                                          height: 44,
                                          width: 44,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15),
                                          decoration: BoxDecoration(
                                              color: greenColor,
                                              shape: BoxShape.circle),
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
                                          style: blackRegulerTextStyle.copyWith(
                                              fontSize: 13),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Spacer(),
                                        Container(
                                          height: 44,
                                          width: 44,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15),
                                          decoration: BoxDecoration(
                                              color: greenColor,
                                              shape: BoxShape.circle),
                                          child: Image.asset(
                                            'assets/icons/poll.png',
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ))
                          ],
                        )),
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
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (returnedImage == null) return;
    imagePath = File(returnedImage.path);
  }
}
