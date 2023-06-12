import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/interest_conditions/interest_conditions_controller.dart';

import 'package:heystetik_mobileapps/pages/chat_customer/riwayat_medis7_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';

import 'package:percent_indicator/percent_indicator.dart';

import '../home/home_page.dart';

class PertanyaanAwalPage extends StatefulWidget {
  final int? id;
  const PertanyaanAwalPage({required this.id, super.key});

  @override
  State<PertanyaanAwalPage> createState() => _PertanyaanAwalPageState();
}

class _PertanyaanAwalPageState extends State<PertanyaanAwalPage> {
  bool isIconSelected1 = false;
  bool isIconSelected2 = false;
  bool isIconSelected3 = false;
  bool isIconSelected4 = false;
  final InterestConditionsController state =
      Get.put(InterestConditionsController());
  List answerSelect = [];
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      get(context);
    });
  }

  get(BuildContext context) async {
    state.isIconSelected.value = false;
    await state.getInterestConditionById(context, widget.id!.toInt());
    answerSelect = state.answerSelect1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: greenColor,
        title: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back),
            ),
            const SizedBox(
              width: 11,
            ),
            Obx(
              () => Text(state.isLoading.value
                  ? 'Pertanyaan Awal'
                  : state.question[state.index.value].type == 'medis'
                      ? 'Riwayat Medis'
                      : 'Pertanyaan Awal'),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomepageCutomer(),
                  ),
                );
              },
              child: Image.asset(
                'assets/icons/icon-home-chat.png',
                width: 18,
              ),
            )
          ],
        ),
      ),
      body: Obx(
        () => LoadingWidget(
          isLoading: state.isLoading.value,
          child: Stack(
            children: [
              Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 14, right: 14, top: 30),
                    child: Obx(
                      () => LinearPercentIndicator(
                        linearStrokeCap: LinearStrokeCap.butt,
                        animation: true,
                        lineHeight: 5,
                        percent: 1.0 /
                            ((state.question.length + 1) - state.index.value),
                        progressColor: fromCssColor('#24A7A0'),
                        backgroundColor: fromCssColor('#D9D9D9'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 13),
                        RichText(
                          text: TextSpan(
                            text: 'Data Umum',
                            style: TextStyle(
                              fontFamily: 'ProximaNova',
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: fromCssColor('#24A7A0'),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Obx(
                          () => RichText(
                            text: TextSpan(
                              text: state.question[state.index.value].name,
                              style: const TextStyle(
                                fontFamily: 'ProximaNova',
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                height: 1.2,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        if (state.question[state.index.value]
                            .interestConditionsAnswer!.isEmpty)
                          Container(
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              border: Border.all(
                                color: fromCssColor('#CCCCCC'),
                                width: 1,
                              ),
                            ),
                            child: const TextField(
                              maxLines: null,
                              decoration: InputDecoration(
                                hintText:
                                    'Boleh sebutkan alergimu disini ya :)',
                                hintStyle: TextStyle(
                                  fontSize: 14,
                                  height: 1.3,
                                  fontFamily: 'ProximaNova',
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(10),
                              ),
                            ),
                          )
                        else
                          for (int i = 0;
                              i <
                                  state.question[state.index.value]
                                      .interestConditionsAnswer!.length;
                              i++,)
                            InkWell(
                              onTap: () async {
                                print(
                                    'awal ${answerSelect[state.index.value]}');
                                var idQuestion =
                                    state.question[state.index.value].id;
                                var question =
                                    state.question[state.index.value].name;
                                var answer = state.question[state.index.value]
                                    .interestConditionsAnswer?[i].name
                                    .toString();
                                var idAnswer = state.question[state.index.value]
                                    .interestConditionsAnswer?[i].id;
                                setState(() {
                                  answerSelect[state.index.value]
                                      ['idQuestion'] = idQuestion;
                                  answerSelect[state.index.value]['question'] =
                                      question;
                                  answerSelect[state.index.value]['idAnswer'] =
                                      idAnswer;
                                  answerSelect[state.index.value]['answer'] =
                                      answer;
                                  answerSelect[state.index.value]
                                      ['isIconSelected'] = true;
                                });

                                print(
                                    'akhir ${answerSelect[state.index.value]}');
                              },
                              child: Obx(
                                () => Container(
                                  margin: const EdgeInsets.only(bottom: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: answerSelect[state.index.value]
                                                ['answer'] ==
                                            state
                                                .question[state.index.value]
                                                .interestConditionsAnswer?[i]
                                                .name
                                        ? fromCssColor('#24A7A0')
                                        : Colors.transparent,
                                    border: Border.all(
                                      color: fromCssColor('#CCCCCC'),
                                      width: 1,
                                    ),
                                  ),
                                  height: 50,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Row(
                                      children: [
                                        Obx(
                                          () => Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10),
                                            child: Icon(
                                              (answerSelect[state.index.value]
                                                          ['answer'] ==
                                                      state
                                                          .question[
                                                              state.index.value]
                                                          .interestConditionsAnswer?[
                                                              i]
                                                          .name
                                                  ? Icons.radio_button_on
                                                  : Icons.circle_outlined),
                                              size: 20,
                                              color: answerSelect[state.index
                                                          .value]['answer'] ==
                                                      state
                                                          .question[
                                                              state.index.value]
                                                          .interestConditionsAnswer?[
                                                              i]
                                                          .name
                                                  ? Colors.white
                                                  : fromCssColor('#323232'),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Obx(
                                            () => RichText(
                                              maxLines: 3,
                                              text: TextSpan(
                                                text: state
                                                    .question[state.index.value]
                                                    .interestConditionsAnswer?[
                                                        i]
                                                    .name
                                                    .toString(),
                                                style: TextStyle(
                                                  fontFamily: 'ProximaNova',
                                                  color: answerSelect[state
                                                                  .index.value]
                                                              ['answer'] ==
                                                          state
                                                              .question[state
                                                                  .index.value]
                                                              .interestConditionsAnswer?[
                                                                  i]
                                                              .name
                                                      ? Colors.white
                                                      : Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        const SizedBox(
                          height: 13,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              state.index.value == 0
                  ? Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            bottom: 60, left: 25, right: 25),
                        child: ButtonGreenWidget(
                          title: 'Simpan & Lanjut',
                          onPressed: () {
                            if (state.index.value <
                                (state.question.length - 1)) {
                              print('terus nambah');
                              state.index.value += 1;
                            } else {
                              print('abis');
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const RiwayatMedis7Page(),
                                ),
                              );
                            }

                            print('index ${state.index.value}');
                          },
                        ),
                      ),
                    )
                  : Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            bottom: 60, left: 25, right: 25),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: ButtonWhiteWidget(
                                title: 'Kembali',
                                onPressed: () {
                                  if (state.index.value >= 1) {
                                    print('terus kurang');
                                    state.index.value -= 1;
                                  } else {
                                    print('abis');
                                  }
                                  print('index ${state.index.value}');
                                },
                              ),
                            ),
                            const SizedBox(
                              width: spaceWidth,
                            ),
                            Expanded(
                              child: ButtonGreenWidget(
                                title: 'Simpan & Lanjut',
                                onPressed: () {
                                  if (state.index.value <
                                      (state.question.length - 1)) {
                                    print('terus nambah');
                                    state.index.value += 1;
                                  } else {
                                    print('abis');
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const RiwayatMedis7Page(),
                                      ),
                                    );
                                  }

                                  print('index ${state.index.value}');
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}


 // InkWell(
                        //   onTap: () {
                        //     Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (context) =>
                        //               const PertanyaanAwal2Page()),
                        //     );
                        //     setState(() {
                        //       isIconSelected2 = !isIconSelected2;
                        //       isIconSelected1 = false;
                        //       isIconSelected3 = false;
                        //       isIconSelected4 = false;
                        //     });
                        //   },
                        //   child: Container(
                        //     decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(7),
                        //       // border: OutlineInputBorder(
                        //       //   borderRadius: BorderRadius.circular(16),
                        //       //   borderSide: BorderSide.none,
                        //       // ),
                        //       color: isIconSelected2
                        //           ? fromCssColor('#24A7A0')
                        //           : Colors.transparent,
                        //       border: Border.all(
                        //         color: fromCssColor('#CCCCCC'),
                        //         width: 1,
                        //       ),
                        //     ),
                        //     height: 50,
                        //     child: Padding(
                        //       padding: const EdgeInsets.all(10),
                        //       child: Row(
                        //         children: [
                        //           Padding(
                        //             padding: const EdgeInsets.only(right: 10),
                        //             child: Icon(
                        //               (isIconSelected2
                        //                   ? Icons.radio_button_on
                        //                   : Icons.circle_outlined),
                        //               size: 20,
                        //               color: isIconSelected2
                        //                   ? Colors.white
                        //                   : fromCssColor('#323232'),
                        //             ),
                        //           ),
                        //           RichText(
                        //             text: TextSpan(
                        //               text: 'Kering',
                        //               style: TextStyle(
                        //                 fontFamily: 'ProximaNova',
                        //                 color: isIconSelected2
                        //                     ? Colors.white
                        //                     : Colors.black,
                        //                 fontWeight: FontWeight.bold,
                        //                 fontSize: 13,
                        //               ),
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // const SizedBox(
                        //   height: 13,
                        // ),
                        // InkWell(
                        //   onTap: () {
                        //     Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (context) =>
                        //               const PertanyaanAwal2Page()),
                        //     );
                        //     setState(() {
                        //       isIconSelected3 = !isIconSelected3;
                        //       isIconSelected1 = false;
                        //       isIconSelected2 = false;
                        //       isIconSelected4 = false;
                        //     });
                        //   },
                        //   child: Container(
                        //     decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(7),
                        //       color: isIconSelected3
                        //           ? fromCssColor('#24A7A0')
                        //           : Colors.transparent,
                        //       border: Border.all(
                        //         color: fromCssColor('#CCCCCC'),
                        //         width: 1,
                        //       ),
                        //     ),
                        //     height: 50,
                        //     child: Padding(
                        //       padding: const EdgeInsets.all(10),
                        //       child: Row(
                        //         children: [
                        //           Padding(
                        //             padding: const EdgeInsets.only(right: 10),
                        //             child: Icon(
                        //               (isIconSelected3
                        //                   ? Icons.radio_button_on
                        //                   : Icons.circle_outlined),
                        //               size: 20,
                        //               color: isIconSelected3
                        //                   ? Colors.white
                        //                   : fromCssColor('#323232'),
                        //             ),
                        //           ),
                        //           RichText(
                        //             text: TextSpan(
                        //               text: 'Berminyak',
                        //               style: TextStyle(
                        //                 fontFamily: 'ProximaNova',
                        //                 color: isIconSelected3
                        //                     ? Colors.white
                        //                     : Colors.black,
                        //                 fontWeight: FontWeight.bold,
                        //                 fontSize: 13,
                        //               ),
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // const SizedBox(
                        //   height: 13,
                        // ),
                        // InkWell(
                        //   onTap: () {
                        //     Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (context) =>
                        //               const PertanyaanAwal2Page()),
                        //     );
                        //     setState(() {
                        //       isIconSelected4 = !isIconSelected4;
                        //       isIconSelected1 = false;
                        //       isIconSelected2 = false;
                        //       isIconSelected3 = false;
                        //     });
                        //   },
                        //   child: Container(
                        //     decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(7),
                        //       color: isIconSelected4
                        //           ? fromCssColor('#24A7A0')
                        //           : Colors.transparent,
                        //       border: Border.all(
                        //         color: fromCssColor('#CCCCCC'),
                        //         width: 1,
                        //       ),
                        //     ),
                        //     height: 50,
                        //     child: Padding(
                        //       padding: const EdgeInsets.all(10),
                        //       child: Row(
                        //         children: [
                        //           Padding(
                        //             padding: const EdgeInsets.only(right: 10),
                        //             child: Icon(
                        //               (isIconSelected4
                        //                   ? Icons.radio_button_on
                        //                   : Icons.circle_outlined),
                        //               size: 20,
                        //               color: isIconSelected4
                        //                   ? Colors.white
                        //                   : fromCssColor('#323232'),
                        //             ),
                        //           ),
                        //           RichText(
                        //             text: TextSpan(
                        //               text: 'Kombinasi',
                        //               style: TextStyle(
                        //                 fontFamily: 'ProximaNova',
                        //                 color: isIconSelected4
                        //                     ? Colors.white
                        //                     : Colors.black,
                        //                 fontWeight: FontWeight.bold,
                        //                 fontSize: 13,
                        //               ),
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),