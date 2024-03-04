// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/drug_controller.dart';
import 'package:heystetik_mobileapps/models/drug_model.dart' as Drug;
import 'package:heystetik_mobileapps/widget/drug_widget.dart';
import 'package:heystetik_mobileapps/widget/filter_concern.dart';
import 'package:heystetik_mobileapps/widget/filter_drug.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import '../../theme/theme.dart';

class DrugSearchPage extends StatefulWidget {
  String? searchParam;
  int? idConcern;
  DrugSearchPage({this.searchParam, this.idConcern, super.key});

  @override
  State<DrugSearchPage> createState() => _DrugSearchPageState();
}

class _DrugSearchPageState extends State<DrugSearchPage> {
  TextEditingController searchController = TextEditingController();
  final DrugController state = Get.put(DrugController());
  bool isSelecteTampilan = true;
  final ScrollController scrollController = ScrollController();
  int page = 1;
  List<Drug.Data2> drugs = [];
  String? search;
  Map<String, dynamic> filter = {};

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      searchController = TextEditingController(text: widget.searchParam);
      search = widget.searchParam;
      if (widget.idConcern is int) {
        filter['concern_ids[]'] = [widget.idConcern];
      }
      drugs.addAll(await state.getDrug(
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
            drugs.addAll(await state.getDrug(
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                size: 24,
                color: blackColor,
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 13, right: 14),
                height: 35,
                decoration: BoxDecoration(
                  color: subwhiteColor,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Center(
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/icons/search1.png',
                        width: 10,
                        color: blackColor,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        transform: Matrix4.translationValues(0, -2, 0),
                        constraints: const BoxConstraints(maxWidth: 250),
                        child: TextFormField(
                          controller: searchController,
                          onEditingComplete: () async {
                            page = 1;
                            search = searchController.text;
                            drugs.clear();
                            drugs.addAll(
                              await state.getDrug(
                                context,
                                page,
                                search: search,
                                filter: filter,
                              ),
                            );
                            setState(() {});
                          },
                          style: const TextStyle(
                              fontSize: 15, fontFamily: "ProximaNova"),
                          decoration: InputDecoration(
                            hintText: "Cari Obat",
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              fontFamily: "ProximaNova",
                              color: fromCssColor(
                                '#9B9B9B',
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
          ],
        ),
      ),
      body: ListView(
        children: [
          StickyHeader(
            header: Container(
              padding: const EdgeInsets.only(top: 10, bottom: 9),
              child: Column(
                children: [
                  const SizedBox(
                    height: 17,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: lsymetric,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (filter.isNotEmpty)
                            InkWell(
                              onTap: () async {
                                filter.clear();
                                drugs.clear();
                                page = 1;
                                drugs.addAll(
                                  await state.getDrug(
                                    context,
                                    page,
                                    search: search,
                                    filter: filter,
                                  ),
                                );
                                setState(() {});
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 5),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: greenColor,
                                  ),
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: Icon(
                                  Icons.close,
                                  color: greenColor,
                                ),
                              ),
                            ),
                          InkWell(
                            onTap: () async {
                              showModalBottomSheet(
                                isDismissible: false,
                                context: context,
                                backgroundColor: Colors.white,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadiusDirectional.only(
                                    topEnd: Radius.circular(25),
                                    topStart: Radius.circular(25),
                                  ),
                                ),
                                builder: (context) => FilterAllDrug(),
                              ).then((value) async {
                                if (value == null) return;

                                filter['display[]'] = value['display'];
                                filter['category[]'] = value['category'];
                                drugs.clear();
                                page = 1;
                                drugs.addAll(
                                  await state.getDrug(
                                    context,
                                    page,
                                    search: search,
                                    filter: filter,
                                  ),
                                );
                                setState(() {});
                              });
                            },
                            child: Image.asset(
                              'assets/icons/filters.png',
                              width: 78,
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              showModalBottomSheet(
                                isDismissible: false,
                                context: context,
                                backgroundColor: Colors.white,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadiusDirectional.only(
                                    topEnd: Radius.circular(25),
                                    topStart: Radius.circular(25),
                                  ),
                                ),
                                builder: (context) => FilterConcern(),
                              ).then((value) async {
                                if (value == null) return;

                                filter['concern_ids[]'] = value['concern_ids'];
                                drugs.clear();
                                page = 1;
                                drugs.addAll(
                                  await state.getDrug(
                                    context,
                                    page,
                                    search: search,
                                    filter: filter,
                                  ),
                                );
                                setState(() {});
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(left: 9),
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 6, bottom: 6),
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                border: Border.all(color: borderColor),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('Etalase Treatment'),
                                  SizedBox(
                                    width: 9,
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_down,
                                    size: 15,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            content: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
              child: drugs.isEmpty
                  ? Center(
                      child: Text(
                        'Belum ada obat',
                        style: TextStyle(
                          fontFamily: 'ProximaNova',
                          fontSize: 20,
                        ),
                      ),
                    )
                  : Wrap(
                      children: drugs.map((drug) {
                        return DrugWidget(
                          drug: drug,
                        );
                      }).toList(),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
