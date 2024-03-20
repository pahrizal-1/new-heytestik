import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/shimmer_widget.dart';

Widget shimmerSkincare(BuildContext context) {
  return shimmerWidget(
    child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: EdgeInsets.only(left: 25, top: 20),
        child: Wrap(
          spacing: 23,
          runSpacing: 12,
          children: List.generate(10, (index) {
            return Container(
              padding: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                border: Border.all(color: borderColor, width: 0.2),
                borderRadius: BorderRadius.circular(100),
              ),
              width: 150,
              child: Column(
                children: [
                  Container(
                    height: 135,
                    width: 164,
                    decoration: BoxDecoration(color: greyColor),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 11, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 4,
                        ),
                        Container(
                          height: 10,
                          width: 40,
                          decoration: BoxDecoration(
                              color: greyColor,
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Container(
                          height: 10,
                          width: 40,
                          decoration: BoxDecoration(
                              color: greyColor,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 28,
                              height: 13,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color:
                                      const Color.fromRGBO(201, 42, 42, 0.2)),
                              child: Center(
                                child: Container(
                                  height: 10,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: greyColor,
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Container(
                              height: 10,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: greyColor,
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ],
                        ),
                        Container(
                          height: 10,
                          width: 40,
                          decoration: BoxDecoration(
                              color: greyColor,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: yellowColor,
                              size: 18,
                            ),
                            Container(
                              height: 10,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: greyColor,
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Container(
                          height: 30,
                          child: TextButton(
                            onPressed: () async {},
                            style: TextButton.styleFrom(
                              backgroundColor: greenColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                '+ Keranjang',
                                style: whiteTextStyle.copyWith(fontSize: 12),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          }),
        ),
      ),
    ),
  );
}
