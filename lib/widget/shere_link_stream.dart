// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/stream/stream_controller.dart';
import 'package:heystetik_mobileapps/models/stream_home.dart';
import 'package:heystetik_mobileapps/pages/stream_page/laporkan_stream_page.dart';
import 'package:heystetik_mobileapps/routes/create_dynamic_link.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/snackbar_widget.dart';
import 'package:social_share/social_share.dart';

class ShareLinkStream extends StatefulWidget {
  const ShareLinkStream({
    super.key,
    required this.isMe,
    required this.follow,
    required this.post,
  });
  final bool isMe;
  final bool follow;
  final StreamHomeModel post;

  @override
  State<ShareLinkStream> createState() => _ShareLinkStreamState();
}

class _ShareLinkStreamState extends State<ShareLinkStream> {
  StreamController stateStream = Get.put(StreamController());
  bool? isFollow;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 30, right: 25, top: 43, bottom: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              text(
                'assets/icons/link.png',
                'Salin Link',
                () async {
                  Uri? url = await createDynamicLinkStream(widget.post.id);
                  print("url $url");
                  SocialShare.copyToClipboard(
                    text: url.toString(),
                  );
                  SnackbarWidget.getSuccessSnackbar(
                    context,
                    "Berhasil",
                    "Berhasil disalin",
                  );
                  Get.back();
                },
                blackColor,
              ),
              if (!widget.isMe)
                const SizedBox(
                  height: 33,
                ),
              if (!widget.isMe)
                text(
                  'assets/icons/notification-logo-blak.png',
                  (isFollow ?? widget.follow)
                      ? 'Berhenti mengikuti postingan ini'
                      : 'Ikuti postingan ini',
                  () async {
                    if (isFollow ?? widget.follow) {
                      stateStream.unFollowPost(
                        context,
                        widget.post.id,
                      );
                      setState(() {
                        isFollow = false;
                      });
                    } else {
                      stateStream.followPost(
                        context,
                        widget.post.id,
                      );
                      setState(() {
                        isFollow = true;
                      });
                    }
                  },
                  blackColor,
                ),
              if (!widget.isMe)
                const SizedBox(
                  height: 33,
                ),
              if (!widget.isMe)
                text(
                  'assets/icons/alert-new.png',
                  'Laporkan',
                  () {
                    Get.to(() => LaporkanStreamPage(
                          post: widget.post,
                        ));
                  },
                  blackColor,
                ),
              if (!widget.isMe)
                const SizedBox(
                  height: 33,
                ),
              if (!widget.isMe)
                text(
                  'assets/icons/slash-icons.png',
                  'Blokir @${widget.post.username}',
                  () async {
                    stateStream.blockUser(context, widget.post.username);
                    Get.back();
                    SnackbarWidget.getSuccessSnackbar(
                      context,
                      'Info',
                      'Block @${widget.post.username} berhasil',
                    );
                  },
                  redColor,
                ),
            ],
          ),
        ),
      ],
    );
  }

  Row text(String img, String title1, VoidCallback? onPressed, Color color) {
    return Row(
      children: [
        InkWell(
          onTap: onPressed,
          child: Row(
            children: [
              Image.asset(
                img,
                width: 22,
                height: 22,
                color: color,
              ),
              const SizedBox(
                width: 19,
              ),
              Text(
                title1,
                style: blackTextStyle.copyWith(fontSize: 12, color: color),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
