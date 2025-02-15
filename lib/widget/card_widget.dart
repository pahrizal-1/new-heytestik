// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import '../theme/theme.dart';

class CardSkinGoals extends StatefulWidget {
  final String title;
  final double width;

  final bool checked;
  const CardSkinGoals({
    this.width = double.infinity,
    super.key,
    required this.checked,
    required this.title,
  });

  @override
  State<CardSkinGoals> createState() => _CardSkinGoalsState();
}

class _CardSkinGoalsState extends State<CardSkinGoals> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 5, right: 5),
      decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: widget.checked ? greenColor : greyColor)),
      height: 40,
      width: widget.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            widget.checked
                ? Icons.check_circle_rounded
                : Icons.add_circle_outline,
            size: 16,
            color: widget.checked ? greenColor : greyColor,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              widget.title,
              style: TextStyle(
                  letterSpacing: 0.5,
                  fontSize: 11,
                  fontFamily: 'ProximaNova',
                  color: widget.checked ? greenColor : const Color(0xff323232),
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

// class CardSkinGoals extends StatefulWidget {
//   final String title;
//   final double width;
//   final int? type;

//   const CardSkinGoals({
//     this.width = double.infinity,
//     super.key,
//     required this.title,
//     this.type,
//   });

//   @override
//   State<CardSkinGoals> createState() => _CardSkinGoalsState();
// }

// class _CardSkinGoalsState extends State<CardSkinGoals> {
//   final InterestController state = Get.put(InterestController());
//   bool isIconSelected1 = false;
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         setState(() {
//           isIconSelected1 = !isIconSelected1;
//         });

//         if (widget.type == 1) {
//           if (isIconSelected1) {
//             var adaGak = state.faceCorrective.firstWhereOrNull(
//               (element) => element == widget.title,
//             );

//             print("adaGak $adaGak");

//             if (adaGak == null) {
//               state.faceCorrective.add(widget.title);
//             }
//           } else {
//             state.faceCorrective.remove(widget.title);
//           }
//         }

//         if (widget.type == 2) {
//           if (isIconSelected1) {
//             var adaGak = state.bodyCorrective.firstWhereOrNull(
//               (element) => element == widget.title,
//             );

//             print("adaGak $adaGak");
//             if (adaGak == null) {
//               state.bodyCorrective.add(widget.title);
//             }
//           } else {
//             state.bodyCorrective.remove(widget.title);
//           }
//         }

//         if (widget.type == 3) {
//           if (isIconSelected1) {
//             var adaGak = state.augmentation.firstWhereOrNull(
//               (element) => element == widget.title,
//             );

//             print("adaGak $adaGak");
//             if (adaGak == null) {
//               state.augmentation.add(widget.title);
//             }
//           } else {
//             state.augmentation.remove(widget.title);
//           }
//         }
//       },
//       child: Container(
//         padding: const EdgeInsets.only(left: 5, right: 5),
//         decoration: BoxDecoration(
//             color: whiteColor,
//             borderRadius: BorderRadius.circular(10),
//             border:
//                 Border.all(color: isIconSelected1 ? greenColor : greyColor)),
//         height: 40,
//         width: widget.width,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Icon(
//               isIconSelected1
//                   ? Icons.check_circle_rounded
//                   : Icons.add_circle_outline,
//               size: 16,
//               color: isIconSelected1 ? greenColor : greyColor,
//             ),
//             const SizedBox(width: 8),
//             Expanded(
//               child: Text(
//                 widget.title,
//                 style: TextStyle(
//                     letterSpacing: 0.5,
//                     fontSize: 11,
//                     fontFamily: 'ProximaNova',
//                     color:
//                         isIconSelected1 ? greenColor : const Color(0xff323232),
//                     fontWeight: FontWeight.bold),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class CardSkincare extends StatelessWidget {
  final String title;
  const CardSkincare({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 5),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      height: 45,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(7),
      ),
      child: Text(
        title,
        style: blackHigtTextStyle.copyWith(fontWeight: regular, fontSize: 13),
      ),
    );
  }
}

class CardSearch extends StatefulWidget {
  final String title;
  final Function()? onTap;
  const CardSearch({
    Key? key,
    required this.title,
    this.onTap,
  }) : super(key: key);

  @override
  State<CardSearch> createState() => _CardSearchState();
}

class _CardSearchState extends State<CardSearch> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            widget.onTap == null ? () {} : widget.onTap!();
            setState(
              () {
                isSelected = !isSelected;
              },
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            height: 30,
            decoration: BoxDecoration(
              color: isSelected
                  ? const Color.fromRGBO(36, 167, 160, 0.2)
                  : whiteColor,
              borderRadius: BorderRadius.circular(7),
              border: Border.all(
                color: isSelected ? greenColor : const Color(0xffCCCCCC),
              ),
            ),
            child: Row(
              children: [
                Text(
                  widget.title,
                  style: subGreyTextStyle.copyWith(
                      fontSize: 15,
                      color: isSelected ? greenColor : const Color(0Xff9B9B9B)),
                ),
                SizedBox(
                  width: 3,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Image.asset(
                    'assets/icons/danger-icons.png',
                    width: 8,
                    height: 8,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CardBankPengriman extends StatefulWidget {
  const CardBankPengriman({
    super.key,
  });

  @override
  State<CardBankPengriman> createState() => _CardBankPengrimanState();
}

class _CardBankPengrimanState extends State<CardBankPengriman> {
  int isSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 18),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          isSelected = 0;
                        });
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/logo-bca.png',
                            width: 52,
                          ),
                          const SizedBox(
                            width: 19,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'BCA Virtual Account',
                                style: blackTextStyle.copyWith(fontSize: 15),
                              ),
                              Text(
                                'Biaya Pembayaran Rp3.000',
                                style: subTitleTextStyle,
                              )
                            ],
                          ),
                          const Spacer(),
                          Icon(
                            isSelected == 0
                                ? Icons.radio_button_on
                                : Icons.circle_outlined,
                            color: isSelected == 0
                                ? greenColor
                                : const Color(0xFF323232),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Divider(
                      thickness: 2,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 22,
              ),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        isSelected = 1;
                      });
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/logo-bni.png',
                          width: 52,
                        ),
                        const SizedBox(
                          width: 19,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'BNI Virtual Account',
                              style: blackTextStyle.copyWith(fontSize: 15),
                            ),
                            Text(
                              'Biaya Pembayaran Rp3.000',
                              style: subTitleTextStyle,
                            )
                          ],
                        ),
                        const Spacer(),
                        Icon(
                          isSelected == 1
                              ? Icons.radio_button_on
                              : Icons.circle_outlined,
                          color: isSelected == 1
                              ? greenColor
                              : const Color(0xFF323232),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                ],
              ),
              const SizedBox(
                height: 22,
              ),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        isSelected = 2;
                      });
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/logo-bri.png',
                          width: 52,
                        ),
                        const SizedBox(
                          width: 19,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'BRI Virtual Account',
                              style: blackTextStyle.copyWith(fontSize: 15),
                            ),
                            Text(
                              'Biaya Pembayaran Rp3.000',
                              style: subTitleTextStyle,
                            )
                          ],
                        ),
                        const Spacer(),
                        Icon(
                          isSelected == 2
                              ? Icons.radio_button_on
                              : Icons.circle_outlined,
                          color: isSelected == 2
                              ? greenColor
                              : const Color(0xFF323232),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ],
          ),
        ),
        const dividergreen(),
        const SizedBox(
          height: 22,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Transfer Bank (Verifikasi Manual)',
                style: blackHigtTextStyle.copyWith(fontSize: 18),
              ),
              const SizedBox(
                height: 31,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    isSelected = 3;
                  });
                },
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icons/mandiri-icons.png',
                      width: 52,
                    ),
                    const SizedBox(
                      width: 19,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Transfer Bank MANDIRI',
                          style: blackTextStyle.copyWith(fontSize: 15),
                        ),
                        Text(
                          'Biaya Pembayaran Rp3.000',
                          style: subTitleTextStyle,
                        )
                      ],
                    ),
                    const Spacer(),
                    Icon(
                      isSelected == 3
                          ? Icons.radio_button_on
                          : Icons.circle_outlined,
                      color: isSelected == 3
                          ? greenColor
                          : const Color(0xFF323232),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
///////////////////////////////////////////////////////////

class CardFilter extends StatefulWidget {
  final String title;
  final double? width;
  const CardFilter({
    Key? key,
    required this.title,
    this.width = 90,
  }) : super(key: key);

  @override
  State<CardFilter> createState() => _CardFilterState();
}

class _CardFilterState extends State<CardFilter> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          setState(
            () {
              isSelected = !isSelected;
            },
          );
        },
        child: Container(
          margin: EdgeInsets.only(right: 6),
          padding: EdgeInsets.symmetric(vertical: 6),
          width: widget.width,
          decoration: BoxDecoration(
            color: isSelected
                ? const Color.fromRGBO(36, 167, 160, 0.2)
                : whiteColor,
            borderRadius: BorderRadius.circular(7),
            border: Border.all(
              color: isSelected ? greenColor : const Color(0xffCCCCCC),
            ),
          ),
          child: Center(
            child: Text(
              widget.title,
              style: subGreyTextStyle.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: isSelected ? greenColor : const Color(0Xff9B9B9B)),
            ),
          ),
        ),
      ),
    );
  }
}

class CardImage extends StatefulWidget {
  final String imageBrand;
  const CardImage({Key? key, required this.imageBrand}) : super(key: key);

  @override
  _CardImageState createState() => _CardImageState();
}

class _CardImageState extends State<CardImage> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(7),
          border: Border.all(
            color: isSelected ? Colors.green : const Color(0xffCCCCCC),
          ),
        ),
        child: Center(
          child: Container(
            height: 31,
            width: 60,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(widget.imageBrand), fit: BoxFit.fill),
            ),
          ),
        ),
      ),
    );
  }
}
