// ignore_for_file: invalid_use_of_protected_member, must_be_immutable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/account/profile_controller.dart';
import 'package:heystetik_mobileapps/pages/auth/anggaran_treameant.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';
import 'package:heystetik_mobileapps/widget/card_widget.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';
import 'package:heystetik_mobileapps/widget/more_dialog_widget.dart';
import 'package:heystetik_mobileapps/widget/text_form_widget.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:heystetik_mobileapps/models/customer/lookup_skin_goals_model.dart';
import '../../controller/customer/interest/interest_controller.dart';
import '../../theme/theme.dart';
import '../../widget/timeline_widget.dart';

class SkinGloalsPilihTreamtmnet extends StatefulWidget {
  bool isContinue = false;
  bool isEdit = false;
  SkinGloalsPilihTreamtmnet(
      {this.isContinue = false, this.isEdit = false, super.key});

  @override
  State<SkinGloalsPilihTreamtmnet> createState() =>
      _SkinGloalsPilihTreamtmnetState();
}

class _SkinGloalsPilihTreamtmnetState extends State<SkinGloalsPilihTreamtmnet> {
  final InterestController state = Get.put(InterestController());
  final ProfileController stateProfile = Get.put(ProfileController());
  List<Data2>? data = [];
  List treatment = [];
  List filterTreatment = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      state.pastTreatment.value.clear();
      data?.addAll(
        await state.lookupSkinGoals(context, "SKIN_GOALS_TREATMENT_HISTORY"),
      );

      if (widget.isEdit) {
        for (int i = 0;
            i < stateProfile.skinGoalsHistoryTreatmentLength.value;
            i++) {
          state.pastTreatment.value.add(
            stateProfile.interestData.value.data!.skinGoalsHistoryTreatment![i]
                .nameHistoryTreatment
                .toString(),
          );
        }

        for (int i = 0; i < data!.length; i++) {
          var adaGak = state.pastTreatment.firstWhereOrNull(
            (item) => item == data?[i].value.toString(),
          );
          if (adaGak == null) {
            filterTreatment
                .add({'treatment': data?[i].value, 'checked': false});
            treatment.add({'treatment': data?[i].value, 'checked': false});
          } else {
            filterTreatment.add({'treatment': data?[i].value, 'checked': true});
            treatment.add({'treatment': data?[i].value, 'checked': true});
          }
        }
      } else {
        for (int i = 0; i < data!.length; i++) {
          treatment.add({'treatment': data?[i].value, 'checked': false});
          filterTreatment.add({'treatment': data?[i].value, 'checked': false});
        }
      }
      setState(() {});
    });
  }

  onChangeFilterText(String value) {
    filterTreatment = treatment.where((element) {
      return element.toString().toLowerCase().contains(value.toLowerCase());
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: GestureDetector(
              onTap: () async {
                await showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) {
                    return NantiSajaDialog();
                  },
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AnggaranTreatment(
                      isEdit: true,
                    ),
                  ),
                );
              },
              child: Image.asset(
                'assets/icons/danger-icons.png',
                width: 14,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: StickyHeader(
          header: Container(
            color: whiteColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TimeLineIdicatorPage(
                  iconColor: whiteColor,
                  secondiconColor: greenColor,
                  bgcolor: greenColor,
                  isFirst: true,
                  title: 'Nomor Hanpone',
                  img: 'assets/icons/iphone1.png',
                  width: 15,
                  iconimg: 'assets/images/check.png',
                ),
                TimeLineIdicatorPage(
                  iconColor: whiteColor,
                  secondiconColor: greenColor,
                  bgcolor: greenColor,
                  isFirst: false,
                  isLast: false,
                  title: 'Email',
                  img: 'assets/icons/email-icons.png',
                  width: 25,
                  iconimg: 'assets/images/check.png',
                ),
                TimeLineIdicatorPage(
                  iconColor: whiteColor,
                  secondiconColor: greenColor,
                  bgcolor: greenColor,
                  isFirst: false,
                  isLast: false,
                  title: 'Info Personal',
                  img: 'assets/images/iphone1.png',
                  width: 25,
                  iconimg: 'assets/images/check.png',
                ),
                TimeLineIdicatorPage(
                  iconColor: whiteColor,
                  secondiconColor: greenColor,
                  bgcolor: greenColor,
                  isFirst: false,
                  isLast: false,
                  title: 'Beauty Profile',
                  img: 'assets/icons/logo-person.png',
                  width: 20,
                  iconimg: 'assets/images/check.png',
                ),
                TimeLineIdicatorPage(
                  iconColor: greenColor,
                  secondiconColor: greenColor,
                  bgcolor: whiteColor,
                  isFirst: false,
                  isLast: true,
                  title: 'Skin Goals',
                  img: 'assets/icons/logo-person.png',
                  width: 20,
                  iconimg: 'assets/images/Vector.png',
                ),
              ],
            ),
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              dividergrey(),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: lsymetric,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Skin Goals',
                      style: blackHigtTextStyle,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      'Kamu pernah treatment apa aja?',
                      style: blackTextStyle.copyWith(fontSize: 18),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Kamu bisa pilih lebih dari satu treatment yang pernah kamu lakukan :)',
                      style: greyTextStyle.copyWith(fontSize: 12),
                    ),
                    const SizedBox(
                      height: 9,
                    ),
                    SearchTextField(
                      title: 'Cari cepat disini yuk!',
                      controller: state.searchController,
                      onChange: (value) {
                        onChangeFilterText(value);
                        setState(() {});
                      },
                    ),
                    const SizedBox(
                      height: 19,
                    ),
                    Wrap(
                      direction: Axis.horizontal,
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        for (int index = 0;
                            index < filterTreatment.length;
                            index++)
                          InkWell(
                            onTap: () {
                              var adaGak = state.pastTreatment.firstWhereOrNull(
                                (item) =>
                                    item == filterTreatment[index]['treatment'],
                              );

                              if (adaGak == null) {
                                filterTreatment[index]['checked'] = true;
                                treatment[index]['checked'] = true;
                                state.pastTreatment
                                    .add(filterTreatment[index]['treatment']);
                              } else {
                                filterTreatment[index]['checked'] = false;
                                treatment[index]['checked'] = false;
                                state.pastTreatment.remove(
                                    filterTreatment[index]['treatment']);
                              }
                              setState(() {});
                            },
                            child: CardSkinGoals(
                              checked: filterTreatment[index]['checked'],
                              title: filterTreatment[index]['treatment'],
                              width: 110,
                            ),
                          ),
                      ],
                    ),
                    SizedBox(
                      height: 39,
                    ),
                    Obx(
                      () => LoadingWidget(
                        isLoading: state.isLoading.value,
                        child: ButtonGreenWidget(
                          title: widget.isContinue ? 'Simpan' : 'Lanjut',
                          onPressed: () async {
                            await state.pastTreatmentGoals(context,
                                doInPost: () async {
                              if (widget.isContinue) {
                                Get.back(result: true);
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AnggaranTreatment(
                                      isEdit: true,
                                    ),
                                  ),
                                );
                              }
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
