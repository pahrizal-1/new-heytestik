import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import 'package:heystetik_mobileapps/widget/shimmer_widget.dart';

class ShimmerStream extends StatelessWidget {
  const ShimmerStream({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: shimmerWidget(
            child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 17,
            top: 16,
            bottom: 18,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 35,
                width: 350,
                decoration: BoxDecoration(
                    color: greyColor, borderRadius: BorderRadius.circular(10)),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 15,
                      decoration: BoxDecoration(
                          color: greyColor,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  SizedBox(
                    width: 28,
                  ),
                  Expanded(
                    child: Container(
                      height: 15,
                      decoration: BoxDecoration(
                          color: greyColor,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  SizedBox(
                    width: 28,
                  ),
                  Expanded(
                    child: Container(
                      height: 15,
                      decoration: BoxDecoration(
                          color: greyColor,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  SizedBox(
                    width: 28,
                  ),
                  Expanded(
                    child: Container(
                      height: 15,
                      decoration: BoxDecoration(
                          color: greyColor,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 26,
              ),
              Row(
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: greyColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(
                    width: 11,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 10,
                        width: 100,
                        color: greyColor,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Container(
                        height: 10,
                        width: 100,
                        color: greyColor,
                      ),
                    ],
                  ),
                  const Spacer(),
                  Icon(
                    Icons.more_horiz,
                    color: subgreyColor,
                    size: 24,
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                height: 10,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: greyColor, borderRadius: BorderRadius.circular(10)),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                height: 10,
                width: 40,
                decoration: BoxDecoration(
                    color: greyColor, borderRadius: BorderRadius.circular(10)),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Container(
                    height: 10,
                    width: 60,
                    decoration: BoxDecoration(
                        color: greyColor,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  Spacer(),
                  Icon(Icons.comment_outlined)
                ],
              ),
              SizedBox(
                height: 20,
              ),
              dividergrey(),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: greyColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(
                    width: 11,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 10,
                        width: 100,
                        color: greyColor,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Container(
                        height: 10,
                        width: 100,
                        color: greyColor,
                      ),
                    ],
                  ),
                  const Spacer(),
                  Icon(
                    Icons.more_horiz,
                    color: subgreyColor,
                    size: 24,
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                height: 10,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: greyColor, borderRadius: BorderRadius.circular(10)),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                height: 10,
                width: 40,
                decoration: BoxDecoration(
                    color: greyColor, borderRadius: BorderRadius.circular(10)),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Container(
                    height: 10,
                    width: 60,
                    decoration: BoxDecoration(
                        color: greyColor,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  Spacer(),
                  Icon(Icons.comment_outlined)
                ],
              ),
              SizedBox(
                height: 20,
              ),
              dividergrey(),
            ],
          ),
        )),
      ),
    );
  }
}
