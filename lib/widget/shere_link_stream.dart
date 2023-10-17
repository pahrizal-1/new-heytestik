import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/stream/post_controller.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

class ShareLinkStream extends StatelessWidget {
  const ShareLinkStream({
    super.key,
    required this.username,
  });

  final String username;

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
                () {},
                blackColor,
              ),
              const SizedBox(
                height: 33,
              ),
              text(
                'assets/icons/notification-logo-blak.png',
                'Ikuti postingan ini',
                () {},
                blackColor,
              ),
              const SizedBox(
                height: 33,
              ),
              text(
                'assets/icons/alert-new.png',
                'Laporkan',
                () {},
                blackColor,
              ),
              const SizedBox(
                height: 33,
              ),
              text(
                'assets/icons/slash-icons.png',
                'Blokir @$username',
                () {
                  postController.blockUser(context, username);
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
