import 'package:flutter/material.dart';

import '../theme/theme.dart';

Widget buildRichTextWithHashtags(String text) {
  final RegExp mentionRegex = RegExp(r'#\w+');

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
          style: TextStyle(color: Colors.black),
        ),
      );
    }

    // Add mention text with blue color
    textSpans.add(
      TextSpan(
        text: text.substring(start, end),
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
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  return RichText(
    text: TextSpan(children: textSpans),
  );
}
