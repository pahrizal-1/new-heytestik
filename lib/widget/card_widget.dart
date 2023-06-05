import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../controller/interest/interest_controller.dart';
import '../theme/theme.dart';

class CardSkinGoals extends StatefulWidget {
  final String title;
  final double width;
  final int type;

  const CardSkinGoals({
    this.width = double.infinity,
    super.key,
    required this.title,
    required this.type,
  });

  @override
  State<CardSkinGoals> createState() => _CardSkinGoalsState();
}

class _CardSkinGoalsState extends State<CardSkinGoals> {
  bool isIconSelected1 = false;
  @override
  Widget build(BuildContext context) {
    var state = Provider.of<InterestController>(context);

    return InkWell(
      onTap: () {
        setState(() {
          isIconSelected1 = !isIconSelected1;
        });

        if(widget.type == 1) {
          if(isIconSelected1) {
            state.faceCorrective.add(widget.title);
          } else {
            state.faceCorrective.remove(widget.title);
          }
        }

        if(widget.type == 2) {
          if(isIconSelected1) {
            state.bodyCorrective.add(widget.title);
          } else {
            state.bodyCorrective.remove(widget.title);
          }
        }

        if(widget.type == 3) {
          if(isIconSelected1) {
            state.augmentation.add(widget.title);
          } else {
            state.augmentation.remove(widget.title);
          }
        }

        if(widget.type == 4) {
          if(isIconSelected1) {
            state.pasTreatment.add(widget.title);
          } else {
            state.pasTreatment.remove(widget.title);
          }
        }
      },
      child: Container(
        padding: const EdgeInsets.only(left: 5, right: 5),
        decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(10),
            border:
                Border.all(color: isIconSelected1 ? greenColor : greyColor)),
        height: 40,
        width: widget.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              isIconSelected1
                  ? Icons.check_circle_rounded
                  : Icons.add_circle_outline,
              size: 16,
              color: isIconSelected1 ? greenColor : greyColor,
            ),
            const SizedBox(width: 8),
            Text(
              widget.title,
              style: TextStyle(
                  letterSpacing: 0.5,
                  fontSize: 11,
                  fontFamily: 'ProximaNova',
                  color: isIconSelected1 ? greenColor : const Color(0xff323232),
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class CardBank extends StatefulWidget {
  final String img;
  final String title;
  const CardBank({
    super.key,
    required this.img,
    required this.title,
  });

  @override
  State<CardBank> createState() => _CardBankState();
}

class _CardBankState extends State<CardBank> {
  bool isSelected = true;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                widget.img,
                width: 52,
              ),
              const SizedBox(
                width: 19,
              ),
              Text(
                widget.title,
                style: blackTextStyle.copyWith(fontSize: 15),
              ),
              const Spacer(),
              Container(
                height: 18,
                width: 18,
                decoration: isSelected
                    ? BoxDecoration(
                        color: whiteColor,
                        shape: BoxShape.circle,
                        border: Border.all(color: blackColor),
                      )
                    : BoxDecoration(
                        color: greenColor,
                        shape: BoxShape.circle,
                        border: Border.all(color: blackColor),
                      ),
              )
            ],
          ),
          const SizedBox(
            height: 27,
          ),
          const Divider(
            thickness: 2,
          )
        ],
      ),
    );
  }
}
