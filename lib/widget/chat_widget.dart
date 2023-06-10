import 'package:flutter/material.dart';

import '../theme/theme.dart';

class ChatLeft extends StatelessWidget {
  final String? imgDoctor;
  final String? nameDoctor;
  final String timetitle;
  final Color color;
  final String title;
  const ChatLeft({
    Key? key,
    required this.imgDoctor,
    required this.nameDoctor,
    required this.timetitle,
    required this.title,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                imgDoctor.toString(),
                width: 35,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                nameDoctor.toString(),
                style: blackTextStyle.copyWith(
                    fontSize: 15, color: const Color(0xFF616161)),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 40),
            padding:
                const EdgeInsets.only(left: 12, top: 11, right: 12, bottom: 7),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0),
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: greyTextStyle.copyWith(
                    fontSize: 15,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [Text(timetitle, style: subGreyTextStyle)],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatRight extends StatelessWidget {
  final String? imgUser;
  final String? nameUser;
  final String timetitle;
  final Color color;
  final String title;
  const ChatRight({
    Key? key,
    this.imgUser,
    this.nameUser,
    required this.timetitle,
    required this.title,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                nameUser.toString(),
                style: blackTextStyle.copyWith(
                    fontSize: 15, color: const Color(0xFF616161)),
              ),
              const SizedBox(
                width: 10,
              ),
              Image.asset(
                imgUser.toString(),
                width: 30,
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 40),
            padding:
                const EdgeInsets.only(left: 12, top: 11, right: 12, bottom: 7),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(0),
                bottomRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: greyTextStyle.copyWith(
                    fontSize: 15,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      'assets/images/logo_cheac_wa.png',
                      width: 14,
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    Text(timetitle, style: subGreyTextStyle)
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TextChat extends StatelessWidget {
  final String timetitle;
  final String title;
  final Color color;
  const TextChat({
    Key? key,
    required this.timetitle,
    required this.title,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 5,
      ),
      padding: const EdgeInsets.only(left: 12, top: 11, right: 12, bottom: 7),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: greyTextStyle.copyWith(
              fontSize: 15,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                'assets/images/logo_cheac_wa.png',
                width: 14,
              ),
              const SizedBox(
                width: 2,
              ),
              Text(timetitle, style: subGreyTextStyle)
            ],
          )
        ],
      ),
    );
  }
}
