import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/interest_conditions/interest_conditions_controller.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/chat_page.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';
import '../../theme/theme.dart';
import '../../widget/text_form_widget.dart';

class SelectConditionsPage extends StatefulWidget {
  const SelectConditionsPage({super.key});

  @override
  State<SelectConditionsPage> createState() => _SelectConditionsPageState();
}

class _SelectConditionsPageState extends State<SelectConditionsPage> {
  final InterestConditionsController state =
      Get.put(InterestConditionsController());

  @override
  void initState() {
    super.initState();
    get(context);
  }

  get(BuildContext context) async {
    await state.getInterestConditions(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back)),
        backgroundColor: greenColor,
        title: const Text('Pilih Kodisi'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, top: 13),
        child: Obx(
          () => LoadingWidget(
            isLoading: state.isLoading.value,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SearchTextField(
                    title: 'Cari Kodisi',
                    controller: state.searchController,
                    onChange: (value) {
                      state.onChangeFilterText(value);
                    },
                  ),
                  const SizedBox(
                    height: 18,
                  ),

                  for (int i = 0; i < state.filterData.length; i++)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // state.filterData[i].interestConditionsCategoryId == 1
                        //     ? Text(
                        //         state.filterData[i].category!.name.toString(),
                        //         style: blackTextStyle.copyWith(fontSize: 18),
                        //       )
                        //     : Container(),
                        // const SizedBox(
                        //   height: 18,
                        // ),
                        KorektifWajahPage(
                          title: state.filterData[i].name.toString(),
                          img: 'assets/images/pelkhitam.png',
                        ),
                      ],
                    ),
                  // Text(
                  //   'Korektif Wajah',
                  //   style: blackTextStyle.copyWith(fontSize: 18),
                  // ),
                  // const SizedBox(
                  //   height: 18,
                  // ),
                  // const KorektifWajahPage(
                  //   title: 'Bekas Flek Hitam & Melasma',
                  //   img: 'assets/images/pelkhitam.png',
                  // ),
                  // const KorektifWajahPage(
                  //   title: 'Berawat',
                  //   img: 'assets/images/pelkhitam.png',
                  // ),
                  // const KorektifWajahPage(
                  //   title: 'kusam',
                  //   img: 'assets/images/pelkhitam.png',
                  // ),
                  // const KorektifWajahPage(
                  //   title: 'Bekas Jerawat',
                  //   img: 'assets/images/pelkhitam.png',
                  // ),
                  // const KorektifWajahPage(
                  //   title: 'Bekas Flek Hitam & Melasma',
                  //   img: 'assets/images/pelkhitam.png',
                  // ),
                  // const SizedBox(
                  //   height: 18,
                  // ),
                  // Text(
                  //   'Korektif Wajah',
                  //   style: blackTextStyle.copyWith(fontSize: 18),
                  // ),
                  // const SizedBox(
                  //   height: 18,
                  // ),
                  // const KorektifWajahPage(
                  //   title: 'Bekas Flek Hitam & Melasma',
                  //   img: 'assets/images/pelkhitam.png',
                  // ),
                  // const KorektifWajahPage(
                  //   title: 'Bekas Flek Hitam & Melasma',
                  //   img: 'assets/images/pelkhitam.png',
                  // ),
                  // const KorektifWajahPage(
                  //   title: 'Bekas Flek Hitam & Melasma',
                  //   img: 'assets/images/pelkhitam.png',
                  // ),
                  // const SizedBox(
                  //   height: 18,
                  // ),
                  // Text(
                  //   'Augmentation Wajah & Tubuh',
                  //   style: blackTextStyle.copyWith(fontSize: 18),
                  // ),
                  // const SizedBox(
                  //   height: 18,
                  // ),
                  // const KorektifWajahPage(
                  //   title: 'Bekas Flek Hitam & Melasma',
                  //   img: 'assets/images/pelkhitam.png',
                  // ),
                  // const KorektifWajahPage(
                  //   title: 'Bekas Flek Hitam & Melasma',
                  //   img: 'assets/images/pelkhitam.png',
                  // ),
                  // const KorektifWajahPage(
                  //   title: 'Bekas Flek Hitam & Melasma',
                  //   img: 'assets/images/pelkhitam.png',
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class KorektifWajahPage extends StatelessWidget {
  final String title;
  final String img;
  const KorektifWajahPage({
    super.key,
    required this.title,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ChatPage(),
            ),
          );
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
