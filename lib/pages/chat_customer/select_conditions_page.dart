import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:heystetik_mobileapps/controller/customer/transaction/order/order_controller.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/chat_page.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';
import '../../theme/theme.dart';
import '../../widget/text_form_widget.dart';
import 'package:heystetik_mobileapps/models/customer/interest_conditions_model.dart';

class SelectConditionsPage extends StatefulWidget {
  const SelectConditionsPage({super.key});

  @override
  State<SelectConditionsPage> createState() => _SelectConditionsPageState();
}

class _SelectConditionsPageState extends State<SelectConditionsPage> {
  final OrderController state = Get.put(OrderController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      get(context);
    });
  }

  get(BuildContext context) async {
    await state.getInterestConditions(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: greenColor,
        title: const Text('Pilih Kondisi'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, top: 13),
        child: Obx(
          () => LoadingWidget(
            isLoading: state.isLoading.value,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 70),
                  child: Obx(
                    () => state.filterData.isEmpty
                        ? const Center(
                            child: Text(
                              'Data tidak ada',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          )
                        : GroupedListView<Data, String>(
                            elements: state.filterData.toList(),
                            groupBy: (element) =>
                                element.category!.name.toString(),
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
                              return KorektifWajahPage(
                                interestConditionId: element.id,
                                title: element.name.toString(),
                                img: 'assets/images/pelkhitam.png',
                              );
                            },
                          ),
                  ),
                ),
                SearchTextField(
                  title: 'Cari Kodisi',
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

class KorektifWajahPage extends StatelessWidget {
  final int? interestConditionId;
  final String title;
  final String img;
  const KorektifWajahPage({
    super.key,
    required this.interestConditionId,
    required this.title,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: InkWell(
        onTap: () {
          print('interestConditionId $interestConditionId');
          Get.to(ChatPage(interestConditionId: interestConditionId));
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
                      image: AssetImage(
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
