// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:heystetik_mobileapps/controller/customer/account/my_journey_controller.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';
import '../../theme/theme.dart';
import '../../widget/appar_cutome.dart';
import '../../widget/text_form_widget.dart';
import 'package:heystetik_mobileapps/models/customer/concern_model.dart';

class PilihSkinGoals extends StatefulWidget {
  const PilihSkinGoals({super.key});

  @override
  State<PilihSkinGoals> createState() => _PilihSkinGoalsState();
}

class _PilihSkinGoalsState extends State<PilihSkinGoals> {
  final MyJourneyController state = Get.put(MyJourneyController());
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      state.getConcern(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustome(
        colorIcons: blackColor,
        colorTitle: blackColor,
        title: 'Pilih Skin Goal',
        bgColor: whiteColor,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, top: 7),
        child: Obx(
          () => LoadingWidget(
            isLoading: state.isLoading.value,
            child: Stack(
              children: [
                Positioned(
                    top: 65,
                    left: 6,
                    child: Text(
                      'Semoga aku bisa bebas dari....',
                      style: grenTextStyle.copyWith(
                          fontSize: 16, fontStyle: FontStyle.italic),
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 90),
                  child: Obx(
                    () => state.filterData.isEmpty
                        ? const Center(
                            child: Text(
                              'Skin Goal Tidak Di Temukan',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          )
                        : GroupedListView<Data2, String>(
                            elements: state.filterData.value.toList(),
                            groupBy: (element) => element.segment.toString(),
                            groupComparator: (value1, value2) =>
                                value2.compareTo(value1),
                            order: GroupedListOrder.DESC,
                            useStickyGroupSeparators: true,
                            groupSeparatorBuilder: (String value) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                value,
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            itemBuilder: (c, element) {
                              return PilihSkinGoalMyJourney(
                                interestConditionId: element.id,
                                title: element.name.toString(),
                                img:
                                    '${Global.FILE}/${element.mediaConcern?.media?.path}',
                              );
                            },
                          ),
                  ),
                ),
                SearchTextField(
                  title: 'Cari skin goal kamu',
                  controller: state.searchController,
                  onChange: (value) {
                    state.onChangeFilterText(value);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PilihSkinGoalMyJourney extends StatelessWidget {
  final int? interestConditionId;
  final String title;
  final String img;
  PilihSkinGoalMyJourney({
    super.key,
    required this.interestConditionId,
    required this.title,
    required this.img,
  });
  final MyJourneyController state = Get.put(MyJourneyController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: InkWell(
        onTap: () {
          state.concern.value = title;
          state.concernId.value = interestConditionId!;
          Navigator.pop(context);
        },
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 47,
                  width: 60,
                  decoration: BoxDecoration(
                    color: const Color(0xffD9D9D9),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                        img,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 13,
                ),
                Text(
                  title,
                  style: blackTextStyle,
                ),
                const Spacer(),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                ),
              ],
            ),
            Divider(
              color: greyColor,
              thickness: 0.5,
            ),
          ],
        ),
      ),
    );
  }
}
