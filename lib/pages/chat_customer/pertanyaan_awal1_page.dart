// ignore_for_file: use_build_context_synchronously, deprecated_member_use, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/transaction/order/order_controller.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/riwayat_medis7_page.dart';
import 'package:heystetik_mobileapps/pages/tabbar/tabbar_customer.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/alert_dialog.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';

import 'package:percent_indicator/percent_indicator.dart';

class PertanyaanAwalPage extends StatefulWidget {
  final int? interestConditionId;
  const PertanyaanAwalPage({required this.interestConditionId, super.key});

  @override
  State<PertanyaanAwalPage> createState() => _PertanyaanAwalPageState();
}

class _PertanyaanAwalPageState extends State<PertanyaanAwalPage> {
  final OrderController state = Get.put(OrderController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      get(context);
    });
  }

  get(BuildContext context) async {
    await state.getInterestConditionById(
        context, widget.interestConditionId!.toInt());
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
                    builder: (context) => const TabBarCustomer(),
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
                        // JIKA DESKRIPSI
                        if (state.question[state.index.value].typeAnswer ==
                            'description')
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
                              onChanged: (value) {
                                state.listsAnswer[state.index.value]
                                    ['answer_description'] = value;
                                if (state.listsAnswer[state.index.value]
                                        ['answer_description'] !=
                                    '-') {}
                              },
                              controller: state.essayController,
                              maxLines: null,
                              decoration: const InputDecoration(
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
                          // JIKA BUKAN DESKRIPSI
                          for (int i = 0;
                              i <
                                  state.question[state.index.value]
                                      .interestConditionsAnswer!.length;
                              i++,)
                            InkWell(
                              onTap: () async {
                                selectAnswer(i);
                              },
                              child: Obx(
                                () => Container(
                                  margin: const EdgeInsets.only(bottom: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: state.answerSelect[state.index.value]
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
                                  // height: 50,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Row(
                                      children: [
                                        Obx(
                                          () => Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10),
                                            child: Icon(
                                              (state.answerSelect[state.index
                                                          .value]['answer'] ==
                                                      state
                                                          .question[
                                                              state.index.value]
                                                          .interestConditionsAnswer?[
                                                              i]
                                                          .name
                                                  ? Icons.radio_button_on
                                                  : Icons.circle_outlined),
                                              size: 20,
                                              color: state.answerSelect[state
                                                          .index
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
                                                  color: state.answerSelect[
                                                                  state.index
                                                                      .value]
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
                                  print(
                                      'answerData ke ${state.index.value + 1} ${state.listsAnswer[state.index.value]}');
                                },
                              ),
                            ),
                            const SizedBox(
                              width: spaceWidth,
                            ),
                            Expanded(
                              child: ButtonGreenWidget(
                                title: 'Simpan & Lanjut',
                                onPressed: () async {
                                  if (state.index.value <
                                      (state.question.length - 1)) {
                                    print('terus nambah');
                                    state.index.value += 1;
                                  } else {
                                    print('abis');

                                    await showDialog(
                                      context: context,
                                      builder: (context) =>
                                          AlertConfirmationWidget(
                                        subtitle:
                                            'Apakah anda sudah yakin? Jika sudah yakin kita lanjut ke langkah berikutnya',
                                        action: () async {
                                          Navigator.pop(context);
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

                                  print(
                                      'answerData ke ${state.index.value + 1} ${state.listsAnswer[state.index.value]}');
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

  selectAnswer(int i) {
    print('awal ${state.answerSelect[state.index.value]}');
    var idQuestion = state.question[state.index.value].id;
    var question = state.question[state.index.value].name;
    var answer = state
        .question[state.index.value].interestConditionsAnswer?[i].name
        .toString();
    var idAnswer =
        state.question[state.index.value].interestConditionsAnswer?[i].id;

    setState(() {
      state.answerSelect[state.index.value]['idQuestion'] = idQuestion;
      state.answerSelect[state.index.value]['question'] = question;
      state.answerSelect[state.index.value]['idAnswer'] = idAnswer;
      state.answerSelect[state.index.value]['answer'] = answer;
      state.answerSelect[state.index.value]['isIconSelected'] = true;
    });

    print('akhir ${state.answerSelect[state.index.value]}');

    // SAVE DATA TO API
    state.listsAnswer[state.index.value]['interest_condition_answer_id'] =
        idAnswer;
    state.listsAnswer[state.index.value]['interest_condition_question_id'] =
        idQuestion;
    state.listsAnswer[state.index.value]['answer_description'] =
        state.answerSelect == 'description' ? state.essayController.text : '-';
    print(
        'answerData ke ${state.index.value + 1} ${state.listsAnswer[state.index.value]}');
  }
}
