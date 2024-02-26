// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/stream/post_controller.dart';
import 'package:heystetik_mobileapps/models/stream_home.dart';
import 'package:heystetik_mobileapps/routes/create_dynamic_link.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/snackbar_widget.dart';
import 'package:social_share/social_share.dart';

class ShareLinkStream extends StatelessWidget {
  const ShareLinkStream({
    super.key,
    required this.isMe,
    required this.post,
  });
  final bool isMe;
  final StreamHomeModel post;

  @override
  Widget build(BuildContext context) {
    PostController postController = Get.put(PostController());
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
                  Uri? url = await createDynamicLinkStream(post.id);
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
              if (!isMe)
                const SizedBox(
                  height: 33,
                ),
              if (!isMe)
                text(
                  'assets/icons/notification-logo-blak.png',
                  'Ikuti postingan ini',
                  () {},
                  blackColor,
                ),
              if (!isMe)
                const SizedBox(
                  height: 33,
                ),
              if (!isMe)
                text(
                  'assets/icons/alert-new.png',
                  'Laporkan',
                  () {},
                  blackColor,
                ),
              if (!isMe)
                const SizedBox(
                  height: 33,
                ),
              if (!isMe)
                text(
                  'assets/icons/slash-icons.png',
                  'Blokir @${post.username}',
                  () {
                    postController.blockUser(context, post.username);
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
