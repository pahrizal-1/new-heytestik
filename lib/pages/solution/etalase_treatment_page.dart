import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/etalase_controller.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import 'package:heystetik_mobileapps/models/customer/concern_model.dart';
import '../../theme/theme.dart';

class EtalaseTreatMentPage extends StatefulWidget {
  const EtalaseTreatMentPage({super.key});

  @override
  State<EtalaseTreatMentPage> createState() => _EtalaseTreatMentPageState();
}

class _EtalaseTreatMentPageState extends State<EtalaseTreatMentPage> {
  final EtalaseController state = Get.put(EtalaseController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await state.getConcern(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: const EdgeInsets.only(left: 6),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: blackColor,
                ),
              ),
              const SizedBox(
                width: 11,
              ),
              Text(
                'Etalase Treatment',
                style: blackHigtTextStyle.copyWith(fontSize: 20),
              )
            ],
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(56.0),
          child: Container(
            padding:
                const EdgeInsets.only(left: 25, right: 25, bottom: 10, top: 10),
            height: 56.0,
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(
                  color: fromCssColor('#CCCCCC'),
                ),
                borderRadius: BorderRadius.circular(35),
              ),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 10,
                  ),
                  child: Image.asset(
                    'assets/icons/search1.png',
                    width: 10,
                  ),
                ),
                Expanded(
                  child: Container(
                    transform: Matrix4.translationValues(0, -3, 0),
                    child: TextFormField(
                      controller: state.searchController,
                      onChanged: (value) {
                        state.onChangeFilterText(value);
                      },
                      style: const TextStyle(
                          fontSize: 15, fontFamily: 'ProximaNova'),
                      decoration: InputDecoration(
                        hintText: 'Cari Treatment',
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          fontFamily: 'ProximaNova',
                          color: fromCssColor(
                            '#9B9B9B',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          InkWell(
            onTap: () {
              Get.back(result: "semua");
            },
            child: Padding(
              padding: lsymetric.copyWith(top: 18, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Semua Treatment',
                    style: blackHigtTextStyle.copyWith(fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
          dividergrey(),
          InkWell(
            onTap: () {
              Get.back(result: "diskon");
            },
            child: Padding(
              padding: lsymetric.copyWith(top: 18, bottom: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Diskon',
                    style: blackHigtTextStyle.copyWith(fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
          dividergrey(),
          const SizedBox(
            height: 18,
          ),
          Padding(
            padding: lsymetric,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bedasarkan Gejala',
                  style: blackHigtTextStyle.copyWith(fontSize: 18),
                ),
                const SizedBox(
                  height: 14,
                ),
                Obx(
                  () => state.filterData.isEmpty
                      ? const Center(
                          child: Text(
                            'Belum ada data',
                             style: TextStyle(
                              fontFamily: 'ProximaNova',
                              fontSize: 20,
                            ),
                          ),
                        )
                      : Container(
                          child: GroupedListView<Data2, String>(
                            shrinkWrap: true,
                            elements: state.filterData.toList(),
                            groupBy: (element) => element.segment.toString(),
                            groupComparator: (value1, value2) =>
                                value2.compareTo(value1),
                            order: GroupedListOrder.ASC,
                            useStickyGroupSeparators: true,
                            groupSeparatorBuilder: (String value) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                value,
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            itemBuilder: (c, element) {
                              return InkWell(
                                onTap: () {
                                  var param = [element.id, element.name];
                                  Get.back(result: param);
                                  state.searchController.clear();
                                  state.onChangeFilterText("");
                                  setState(() {});
                                },
                                child: CardEtalase(
                                  interestConditionId: element.id,
                                  title: element.name.toString(),
                                  img:
                                      '${Global.FILE}/${element.mediaConcern!.media!.path}',
                                ),
                              );
                            },
                          ),
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CardEtalase extends StatelessWidget {
  final int? interestConditionId;
  final String title;
  final String img;
  const CardEtalase({
    super.key,
    required this.interestConditionId,
    required this.title,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
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
              // const Spacer(),
              // const Icon(
              //   Icons.arrow_forward_ios_rounded,
              // ),
            ],
          ),
          Divider(
            color: greyColor,
            thickness: 0.5,
          ),
        ],
      ),
    );
  }
}
