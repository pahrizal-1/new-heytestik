import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/medicine_controller.dart';
import 'package:heystetik_mobileapps/pages/solution/obat_solutions_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/models/medicine.dart' as Medicine;

class ObatSearch extends StatefulWidget {
  const ObatSearch({
    super.key,
    required this.search,
  });

  final String search;

  @override
  State<ObatSearch> createState() => _ObatSearchState();
}

class _ObatSearchState extends State<ObatSearch> {
  final MedicineController state = Get.put(MedicineController());
  final ScrollController scrollController = ScrollController();
  late TextEditingController searchController = TextEditingController();

  int page = 1;
  late String localSearch;
  List<Medicine.Data2> medicines = [];

  @override
  void initState() {
    searchController = TextEditingController(text: widget.search);
    localSearch = widget.search;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      medicines.addAll(
        await state.getMedicine(context, page, search: localSearch),
      );
      setState(() {});
    });
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool isTop = scrollController.position.pixels == 0;
        if (!isTop) {
          page += 1;
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
            medicines.addAll(
                await state.getMedicine(context, page, search: localSearch));
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
      backgroundColor: const Color(0xffFFFFFF),
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
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
              const SizedBox(
                width: 7,
              ),
              Expanded(
                child: Container(
                  height: 35,
                  decoration: BoxDecoration(
                    color: Color(0xffF1F1F1),
                    border: Border.all(
                      color: fromCssColor("#CCCCCC"),
                    ),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 10,
                        ),
                        child: Image.asset(
                          'assets/icons/search1.png',
                          width: 10,
                        ),
                      ),
                      Container(
                        transform: Matrix4.translationValues(0, -2, 0),
                        constraints: const BoxConstraints(maxWidth: 250),
                        child: TextFormField(
                          controller: searchController,
                          onEditingComplete: () async {
                            print("INI GW KLIK");
                            page = 1;
                            medicines.clear();
                            localSearch = searchController.text;
                            medicines.addAll(await state.getMedicine(
                                context, page,
                                search: localSearch));
                            print(medicines);
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
            ],
          ),
        ),
      ),
      body: medicines.isEmpty
          ? Center(
              child: Text(
                'Tidak ada produk obat',
                style: TextStyle(
                  fontWeight: bold,
                  fontFamily: 'ProximaNova',
                  fontSize: 20,
                ),
              ),
            )
          : SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 12, left: 25, right: 25),
                    child: Wrap(
                      runSpacing: 12,
                      spacing: 12,
                      children: medicines.map((medicine) {
                        return KonsultasiProduk(
                          medicine: medicine,
                        );
                      }).toList(),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
