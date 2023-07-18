import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimeLineIdicatorPage extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final Color iconColor;
  final Color secondiconColor;
  final Color bgcolor;
  final String title;
  final String img;
  final double width;
  final String iconimg;
  const TimeLineIdicatorPage({
    Key? key,
    this.isFirst = false,
    this.isLast = false,
    required this.iconColor,
    required this.secondiconColor,
    required this.bgcolor,
    required this.title,
    this.width = 340,
    required this.img,
    required this.iconimg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 100,
      child: TimelineTile(
        hasIndicator: true,
        beforeLineStyle: LineStyle(color: greenColor, thickness: 4),
        axis: TimelineAxis.horizontal,
        isFirst: isFirst,
        isLast: isLast,
        endChild: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            title,
            style: blackTextStyle,
            textAlign: TextAlign.center,
          ),
        ),
        indicatorStyle: IndicatorStyle(
          color: greenColor,
          width: 50,
          height: 50,
          indicator: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: bgcolor,
                    border: Border.all(color: greenColor)),
                child: Center(
                  child: Image.asset(
                    img,
                    width: width,
                    color: iconColor,
                  ),
                ),
              ),
              Positioned(
                left: 35,
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: whiteColor,
                          border: Border.all(color: greenColor)),
                      child: Padding(
                        padding: const EdgeInsets.all(3),
                        child: Image.asset(
                          iconimg,
                          color: secondiconColor,
                        ),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TimeMoreDialogPage extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final Color iconColor;
  final Color secondiconColor;
  final Color bgcolor;
  final String title;
  final String img;
  final double width;
  final String iconimg;
  const TimeMoreDialogPage({
    Key? key,
    this.isFirst = false,
    this.isLast = false,
    required this.iconColor,
    required this.secondiconColor,
    required this.bgcolor,
    required this.title,
    this.width = 340,
    required this.img,
    required this.iconimg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 95,
        child: TimelineTile(
          hasIndicator: true,
          beforeLineStyle:
              const LineStyle(color: Color(0xffcccccc), thickness: 4),
          axis: TimelineAxis.horizontal,
          isFirst: isFirst,
          isLast: isLast,
          endChild: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              title,
              style: blackTextStyle,
              textAlign: TextAlign.center,
            ),
          ),
          indicatorStyle: IndicatorStyle(
            color: greenColor,
            width: 50,
            height: 50,
            indicator: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: bgcolor,
                      border: Border.all(color: greenColor)),
                  child: Center(
                    child: Image.asset(
                      img,
                      width: width,
                      color: iconColor,
                    ),
                  ),
                ),
                Positioned(
                  left: 35,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: whiteColor,
                            border: Border.all(color: greenColor)),
                        child: Padding(
                          padding: const EdgeInsets.all(3),
                          child: Image.asset(
                            iconimg,
                            color: secondiconColor,
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
