import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/models/customer/treatmet_model.dart';
import 'package:heystetik_mobileapps/pages/doctorpage/doctor_schedule_page.dart/chat_doctor/catatan_produk_docter1_page.dart';
import 'package:heystetik_mobileapps/pages/doctorpage/doctor_schedule_page.dart/chat_doctor/filter_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/card_widget.dart';

import '../../../../controller/customer/solution/treatment_controller.dart';
import '../../../../widget/loading_widget.dart';

class TambahTreatment extends StatefulWidget {
  const TambahTreatment({super.key});

  @override
  State<TambahTreatment> createState() => _TambahTreatmentState();
}

class _TambahTreatmentState extends State<TambahTreatment> {
  final TreatmentController stateTreatment = Get.put(TreatmentController());
  final ScrollController scrollController = ScrollController();

  bool isSelected = false;
  int page = 1;
  List<Data2> treatments = [];
  String? search;
  int activeIndex = 0;

  Map<String, dynamic> filter = {};

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      treatments.addAll(await stateTreatment.getAllTreatment(
        context,
        page,
        search: search,
        filter: filter,
      ));
      setState(() {});
    });
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool isTop = scrollController.position.pixels == 0;
        if (!isTop) {
          page += 1;
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
            treatments.addAll(await stateTreatment.getAllTreatment(
              context,
              page,
              search: search,
              filter: filter,
            ));
            setState(() {});
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: blackColor,
                size: 24,
              ),
            ),
            const SizedBox(
              width: 9,
            ),
            Text(
              'TAMBAH TREATMENT',
              style: blackHigtTextStyle.copyWith(fontSize: 20),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text(
                'Simpan',
                style: grenTextStyle.copyWith(fontSize: 15),
              ),
            )
          ],
        ),
        elevation: 0,
        backgroundColor: whiteColor,
      ),
      body: Obx(
        () => LoadingWidget(
          isLoading: stateTreatment.isLoading.value,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 22, right: 22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              isDense: true,
                              fillColor: Color(0xffF1F1F1),
                              filled: true,
                              contentPadding: EdgeInsets.only(
                                right: 18,
                                top: 0,
                                bottom: 11,
                              ),
                              hintText: 'Indikasi',
                              prefixIcon: Icon(
                                Icons.search,
                                color: greyColor,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const FilterPage(),
                              ),
                            );
                          },
                          child: Image.asset(
                            'assets/icons/corong.png',
                            width: 20,
                            height: 18,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        CardSearch(
                          title: 'Jerawat',
                        ),
                        SizedBox(
                          width: 11,
                        ),
                        CardSearch(
                          title: 'Kulit Kusam',
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Sort by',
                          style: greyTextStyle.copyWith(fontWeight: bold),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () {
                            setState(
                              () {
                                isSelected = !isSelected;
                              },
                            );
                          },
                          child: Text(
                            'Brand',
                            style: blackTextStyle.copyWith(fontWeight: bold),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 17,
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 150,
                left: 0,
                right: 0,
                bottom: 0,
                child: SingleChildScrollView(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 22, right: 22, bottom: 20),
                    child: ListView.builder(
                      shrinkWrap: true,
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: treatments.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: borderColor, width: 0.2),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 11, bottom: 15, left: 12, right: 12),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          constraints:
                                              BoxConstraints(maxWidth: 160),
                                          child: RichText(
                                            text: TextSpan(
                                              text: treatments[index].name,
                                              style: TextStyle(
                                                fontFamily: 'ProximaNova',
                                                color: greenColor,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                height: 1.1,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: 75,
                                              child: Text(
                                                'Cost',
                                                style: TextStyle(
                                                  fontFamily: 'ProximaNova',
                                                  fontSize: 12,
                                                  height: 1.3,
                                                  letterSpacing: 0.5,
                                                  color: fromCssColor(
                                                    '#9B9B9B',
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Container(
                                              // color: Colors.amberAccent,

                                              child: Text(
                                                treatments[index]
                                                    .price
                                                    .toString(),
                                                style: TextStyle(
                                                  fontFamily: 'ProximaNova',
                                                  fontSize: 12,
                                                  height: 1.3,
                                                  letterSpacing: 0.5,
                                                  color: fromCssColor(
                                                    '#9B9B9B',
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: 75,
                                              child: Text(
                                                'Recov. Time',
                                                style: TextStyle(
                                                  fontFamily: 'ProximaNova',
                                                  fontSize: 12,
                                                  height: 1.3,
                                                  letterSpacing: 0.5,
                                                  color: fromCssColor(
                                                    '#9B9B9B',
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Container(
                                              // color: Colors.amberAccent,

                                              child: Text(
                                                '',
                                                style: TextStyle(
                                                  fontFamily: 'ProximaNova',
                                                  fontSize: 12,
                                                  height: 1.3,
                                                  letterSpacing: 0.5,
                                                  color: fromCssColor(
                                                    '#9B9B9B',
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: 75,
                                              child: Text(
                                                'Type',
                                                style: TextStyle(
                                                  fontFamily: 'ProximaNova',
                                                  fontSize: 12,
                                                  height: 1.3,
                                                  letterSpacing: 0.5,
                                                  color: fromCssColor(
                                                    '#9B9B9B',
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Container(
                                              // color: Colors.amberAccent,

                                              child: Text(
                                                treatments[index]
                                                    .treatmentType
                                                    .toString(),
                                                style: TextStyle(
                                                  fontFamily: 'ProximaNova',
                                                  fontSize: 12,
                                                  height: 1.3,
                                                  letterSpacing: 0.5,
                                                  color: fromCssColor(
                                                    '#9B9B9B',
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          isSelected = !isSelected;
                                        });
                                      },
                                      child: Container(
                                          height: 29,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              color: isSelected
                                                  ? whiteColor
                                                  : greenColor,
                                              borderRadius:
                                                  BorderRadius.circular(9),
                                              border: Border.all(
                                                  color: greenColor)),
                                          child: isSelected
                                              ? Center(
                                                  child: Text(
                                                    '-',
                                                    style: grenTextStyle
                                                        .copyWith(fontSize: 20),
                                                  ),
                                                )
                                              : Icon(
                                                  Icons.add,
                                                  color: whiteColor,
                                                )),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 10)
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
