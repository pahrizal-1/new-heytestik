// ignore_for_file: use_build_context_synchronously, deprecated_member_use, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/transaction/order/order_consultation_controller.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/riwayat_medis_page.dart';
import 'package:heystetik_mobileapps/pages/tabbar/tabbar_customer.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/alert_dialog.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';
import 'package:percent_indicator/percent_indicator.dart';

class PertanyaanAwalPage extends StatefulWidget {
  final int? interestConditionId;
  final String title;
  const PertanyaanAwalPage({
    required this.interestConditionId,
    required this.title,
    super.key,
  });

  @override
  State<PertanyaanAwalPage> createState() => _PertanyaanAwalPageState();
}

class _PertanyaanAwalPageState extends State<PertanyaanAwalPage> {
  final OrderConsultationController state =
      Get.put(OrderConsultationController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await state.getInterestConditionById(
        context,
        widget.interestConditionId!.toInt(),
        widget.title,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: greenColor,
        title: Row(
          children: [
            Obx(
              () => Text(state.title.value),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TabBarCustomer(),
                  ),
                );
              },
              child: Image.asset(
                'assets/icons/icon-home-chat.png',
                width: 18,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
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
                    child: state.listQuestion.isEmpty
                        ? Container()
                        : Obx(
                            () => LinearPercentIndicator(
                              linearStrokeCap: LinearStrokeCap.butt,
                              animation: true,
                              lineHeight: 5,
                              percent: 1.0 /
                                  ((state.listQuestion.length + 1) -
                                      state.index.value),
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
                        Obx(
                          () => RichText(
                            text: TextSpan(
                              text: state.subtitle.value,
                              style: TextStyle(
                                fontFamily: 'ProximaNova',
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: fromCssColor('#24A7A0'),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Obx(
                          () => RichText(
                            text: TextSpan(
                              text: state.question.value,
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
                        // JIKA DESKRIPSI
                        if (state.typeAnswer.value == 'description')
                          Container(
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              border: Border.all(
                                color: fromCssColor('#CCCCCC'),
                                width: 1,
                              ),
                            ),
                            child: TextField(
                              controller: state.listsAnswer[state.index.value]
                                  ['answer_description'],
                              maxLines: null,
                              onChanged: (value) {
                                if (state
                                        .listsAnswer[state.index.value]
                                            ['answer_description']
                                        .text !=
                                    '') {
                                  state.listsAnswer[state.index.value]
                                          ['interest_condition_question_id'] =
                                      state.listQuestion[state.index.value].id;
                                } else {
                                  state.listsAnswer[state.index.value]
                                      ['interest_condition_question_id'] = 0;
                                }
                              },
                              decoration: const InputDecoration(
                                hintText: 'Boleh sebutkan Disini ya :)',
                                hintStyle: TextStyle(
                                  fontSize: 15,
                                  height: 1.3,
                                  fontFamily: 'ProximaNova',
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(10),
                              ),
                            ),
                          )
                        else
                          // JIKA BUKAN DESKRIPSI
                          state.totalAnswer.isEmpty
                              ? Container()
                              : ListView.builder(
                                  shrinkWrap: true,
                                  keyboardDismissBehavior:
                                      ScrollViewKeyboardDismissBehavior.onDrag,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount:
                                      state.totalAnswer[state.index.value] ?? 0,
                                  itemBuilder: (BuildContext context, int i) {
                                    return InkWell(
                                      onTap: () async {
                                        selectAnswer(i);
                                      },
                                      child: Obx(
                                        () => Container(
                                          margin:
                                              const EdgeInsets.only(bottom: 10),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(7),
                                            color: state.answerSelect[state
                                                        .index
                                                        .value]['answer'] ==
                                                    state
                                                        .listQuestion[
                                                            state.index.value]
                                                        .interestConditionsAnswer?[
                                                            i]
                                                        .name
                                                ? fromCssColor('#24A7A0')
                                                : Colors.transparent,
                                            border: Border.all(
                                              color: fromCssColor('#CCCCCC'),
                                              width: 1,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Row(
                                              children: [
                                                Obx(
                                                  () => Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 10),
                                                    child: Icon(
                                                      (state.answerSelect[state
                                                                      .index
                                                                      .value]
                                                                  ['answer'] ==
                                                              state
                                                                  .listQuestion[
                                                                      state
                                                                          .index
                                                                          .value]
                                                                  .interestConditionsAnswer?[
                                                                      i]
                                                                  .name
                                                          ? Icons
                                                              .radio_button_on
                                                          : Icons
                                                              .circle_outlined),
                                                      size: 20,
                                                      color: state.answerSelect[state
                                                                      .index
                                                                      .value][
                                                                  'answer'] ==
                                                              state
                                                                  .listQuestion[
                                                                      state
                                                                          .index
                                                                          .value]
                                                                  .interestConditionsAnswer?[
                                                                      i]
                                                                  .name
                                                          ? Colors.white
                                                          : fromCssColor(
                                                              '#323232'),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Obx(
                                                    () => RichText(
                                                      maxLines: 3,
                                                      text: TextSpan(
                                                        text: state
                                                            .listQuestion[state
                                                                .index.value]
                                                            .interestConditionsAnswer?[
                                                                i]
                                                            .name
                                                            .toString(),
                                                        style: TextStyle(
                                                          fontFamily:
                                                              'ProximaNova',
                                                          color: state.answerSelect[
                                                                          state.index.value]
                                                                      [
                                                                      'answer'] ==
                                                                  state
                                                                      .listQuestion[state
                                                                          .index
                                                                          .value]
                                                                      .interestConditionsAnswer?[
                                                                          i]
                                                                      .name
                                                              ? Colors.white
                                                              : Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 14,
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
                                    );
                                  },
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
                          title: 'Lanjut',
                          onPressed: () {
                            if (state.index.value <
                                (state.listQuestion.length - 1)) {
                              print('terus nambah');
                              state.index.value += 1;
                              // CHANGE TEXT TITLE
                              changeText();
                            }
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
                                  // CHANGE TEXT TITLE
                                  changeText();
                                  if (state.index.value >= 1) {
                                    print('terus kurang');
                                    state.index.value -= 1;
                                    // CHANGE TEXT TITLE
                                    changeText();
                                  } else {
                                    print('abis');
                                  }
                                },
                              ),
                            ),
                            const SizedBox(
                              width: spaceWidth,
                            ),
                            Expanded(
                              child: ButtonGreenWidget(
                                title: 'Lanjut',
                                onPressed: () async {
                                  if (state.index.value <
                                      (state.listQuestion.length - 1)) {
                                    state.index.value += 1;
                                    // CHANGE TEXT TITLE
                                    changeText();
                                  } else {
                                    await showDialog(
                                      context: context,
                                      builder: (context) =>
                                          AlertConfirmationWidget(
                                        subtitle:
                                            'Apakah anda sudah yakin? Jika sudah yakin kita lanjut ke langkah berikutnya',
                                        action: () async {
                                          Get.back();
                                          Get.to(
                                            RiwayatMedis7Page(
                                              interestConditionId: widget
                                                  .interestConditionId!
                                                  .toInt(),
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  }
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

  changeText() {
    // TITLE PAGE
    if (state.listQuestion[state.index.value].type == 'medis') {
      state.title.value = 'Riwayat Medis';
      state.subtitle.value = 'Informasi Kesehatan';
    } else {
      state.title.value = 'Pertanyaan Awal';
      state.subtitle.value = 'Data Umum';
    }

    // QUESTION
    state.question.value =
        state.listQuestion[state.index.value].name.toString();
    // TYPE ANSWER
    state.typeAnswer.value =
        state.listQuestion[state.index.value].typeAnswer.toString();
  }

  selectAnswer(int i) {
    var idQuestion = state.listQuestion[state.index.value].id;
    var question = state.listQuestion[state.index.value].name;
    var answer = state
        .listQuestion[state.index.value].interestConditionsAnswer?[i].name
        .toString();
    var idAnswer =
        state.listQuestion[state.index.value].interestConditionsAnswer?[i].id;

    setState(() {
      state.answerSelect[state.index.value]['idQuestion'] = idQuestion;
      state.answerSelect[state.index.value]['question'] = question;
      state.answerSelect[state.index.value]['idAnswer'] = idAnswer;
      state.answerSelect[state.index.value]['answer'] = answer;
      state.answerSelect[state.index.value]['isIconSelected'] = true;
    });

    // PARAM REQUEST
    state.listsAnswer[state.index.value]['interest_condition_answer_id'] =
        idAnswer;
    state.listsAnswer[state.index.value]['interest_condition_question_id'] =
        idQuestion;
  }
}
