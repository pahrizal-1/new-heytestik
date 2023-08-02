import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../theme/theme.dart';

class ShareShowWidget extends StatelessWidget {
  const ShareShowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 36),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset(
                    'assets/icons/remove-icons.svg',
                    width: 30,
                  )),
              const SizedBox(
                width: 7,
              ),
              Text(
                'Bagikan ke teman kamu',
                style: blackTextStyle.copyWith(
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 39,
        ),
        Padding(
          padding: EdgeInsets.only(left: 40, top: 39, right: 40, bottom: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CardShere(
                    title: 'Whatsapp',
                    urlImg: 'assets/icons/wa-icons.png',
                    height: 65,
                    widht: 66,
                  ),
                  CardShere(
                    height: 65,
                    widht: 66,
                    title: 'FB Massager',
                    urlImg: 'assets/icons/meseger-icons.png',
                  ),
                  CardShere(
                    height: 65,
                    widht: 66,
                    title: 'Telegram',
                    urlImg: 'assets/icons/telegra-icons.png.png',
                  ),
                  CardShere(
                    height: 65,
                    widht: 66,
                    title: 'Instagram',
                    urlImg: 'assets/icons/ig-icons.png',
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CardShere(
                    height: 35,
                    widht: 35,
                    title: 'Salin Link',
                    urlImg: 'assets/icons/link.png',
                  ),
                  CardShere(
                    height: 35,
                    widht: 35,
                    title: 'SMS',
                    urlImg: 'assets/icons/message-square.png',
                  ),
                  CardShere(
                    height: 35,
                    widht: 35,
                    title: 'Email',
                    urlImg: 'assets/icons/mail.png',
                  ),
                  CardShere(
                    height: 35,
                    widht: 35,
                    title: 'Lainnya',
                    urlImg: 'assets/icons/more-horizontal.png',
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

class CardShere extends StatelessWidget {
  final double? height;
  final double? widht;
  final String urlImg;
  final String title;

  const CardShere({
    Key? key,
    required this.urlImg,
    required this.title,
    this.height,
    this.widht,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          urlImg,
          height: height,
          width: widht,
        ),
        const SizedBox(
          height: 7,
        ),
        Text(
          title,
          style:
              blackRegulerTextStyle.copyWith(color: blackColor, fontSize: 13),
        )
      ],
    );
  }
}
