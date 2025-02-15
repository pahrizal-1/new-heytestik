import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/pages/profile_costumer/profil_customer_page.dart';
import 'package:heystetik_mobileapps/pages/stream_page/user_followed_stream_page.dart';

import '../theme/theme.dart';

Widget buildRichTextWithMentions(BuildContext context, String text,
    {String? isMe, required String fullname, TextStyle? textStyle}) {
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
          style: textStyle ?? TextStyle(color: Colors.black),
        ),
      );
    }

    // Add mention text with blue color
    textSpans.add(
      TextSpan(
        text: text.substring(start, end),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            if (isMe == text.substring(start, end).replaceRange(0, 1, "")) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const ProfilCustomerPage()));
            } else {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => UserFollowedStreamPage(
                            username: text
                                .substring(start, end)
                                .replaceRange(0, 1, ""),
                            fullname: fullname.toString(),
                          )));
            }
          },
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
        style: textStyle ?? TextStyle(color: Colors.black),
      ),
    );
  }

  return RichText(
    text: TextSpan(children: textSpans),
  );
}
