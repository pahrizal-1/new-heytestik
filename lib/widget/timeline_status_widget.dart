import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimeLineStatusWidgets extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  const TimeLineStatusWidgets(
      {super.key,
      required this.isFirst,
      required this.isLast,
      required this.isPast});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 29,
        width: 300,
        child: TimelineTile(
          axis: TimelineAxis.horizontal,
          isFirst: isFirst,
          isLast: isLast,
          beforeLineStyle:
              LineStyle(color: isPast ? subTitleColor : greenColor),
          indicatorStyle: IndicatorStyle(
            width: 20,
            height: 20,
            color: isPast ? subTitleColor : greenColor,
            iconStyle: IconStyle(
              iconData: isPast ? Icons.circle : Icons.done,
              color: isPast ? whiteColor : whiteColor,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}

class TimeLineStatusPengrimanWidgets extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final String title1;
  final String title2;
  final String jam;
  final Color colortitle1;
  const TimeLineStatusPengrimanWidgets(
      {super.key,
      required this.isFirst,
      required this.isLast,
      required this.isPast,
      required this.title1,
      required this.title2,
      required this.colortitle1,
      required this.jam});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: TimelineTile(
        isFirst: isFirst,
        isLast: isLast,
        beforeLineStyle: LineStyle(color: isPast ? subTitleColor : greenColor),
        indicatorStyle: IndicatorStyle(
          width: 15,
          height: 15,
          color: isPast ? subTitleColor : greenColor,
        ),
        endChild: Padding(
          padding: const EdgeInsets.only(left: 16, right: 25),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                constraints: const BoxConstraints(maxWidth: 240),
                child: RichText(
                  text: TextSpan(
                    text: '$title1\n',
                    style: grenTextStyle.copyWith(
                        fontSize: 15, fontWeight: regular, color: colortitle1),
                    children: [
                      TextSpan(
                        text: title2,
                        style: blackRegulerTextStyle.copyWith(
                            fontSize: 15, color: blackColor),
                      )
                    ],
                  ),
                ),
              ),
              Spacer(),
              Text(
                jam,
                style: subTitleTextStyle,
              )
            ],
          ),
        ),
      ),
    );
  }
}
