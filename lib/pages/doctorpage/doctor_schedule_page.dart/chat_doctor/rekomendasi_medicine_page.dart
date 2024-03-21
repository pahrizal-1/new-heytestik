import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/drug_controller.dart';
import 'package:heystetik_mobileapps/models/drug_model.dart' as Drug;
import 'package:heystetik_mobileapps/widget/filter_tambah_obat.dart';
import 'package:provider/provider.dart';

import '../../../../controller/doctor/consultation/consultation_controller.dart';
import '../../../../core/global.dart';
import '../../../../theme/theme.dart';
import '../../../../widget/alert_dialog.dart';
import '../../../../widget/card_widget.dart';
import '../../../../widget/loading_widget.dart';

class RecomendationDrug extends StatefulWidget {
  const RecomendationDrug({super.key});

  @override
  State<RecomendationDrug> createState() => _RecomendationDrugState();
}

class _RecomendationDrugState extends State<RecomendationDrug> {
  final ScrollController scrollController = ScrollController();
  final DrugController solutionController = Get.put(DrugController());
  final DoctorConsultationController stateDoctor = Get.put(DoctorConsultationController());
  TextEditingController searchController = TextEditingController();

  int page = 1;
  List<Drug.Data2> drugs = [];
  List toogle = [];
  bool isSelcted = false;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      context.read<DrugController>().refreshDrug(
            context,
          );
    });
    scrollController.addListener(() async {
      context.read<DrugController>().loadMoreDrug(
            context,
            scrollController,
          );
    });
    setState(() {});

    print('testing ');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                toogle = [];
                stateDoctor.listObat = [];
                solutionController.minPriceController.clear();
                solutionController.maxPriceController.clear();
                solutionController.toggleGolonganObat = [];
                solutionController.toggleBentukObat = [];
                solutionController.toggleKemasanObat = [];
                solutionController.filterGolonganObat = [];
                solutionController.filterBentukObat = [];
                solutionController.filterKemasanObat = [];
                Navigator.pop(
                  context,
                );
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
              'TAMBAH OBAT',
              style: blackHigtTextStyle.copyWith(fontSize: 20),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                if (stateDoctor.listObat.isNotEmpty && stateDoctor.notesMedicine.isNotEmpty) {
                  Navigator.pop(context);
                } else {
                  showDialog(
                    context: context,
                    builder: (context) => AlertWidget(subtitle: 'Silahkan Pilih Terlebih Dahulu)'),
                  );
                }
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
          isLoading: solutionController.isLoading.value,
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
                            controller: searchController,
                            onFieldSubmitted: (v) {
                              if (searchController.text == '') {
                                setState(() {
                                  context.read<DrugController>().refreshDrug(context, search: '');
                                });
                              } else {
                                setState(() {
                                  context.read<DrugController>().refreshDrug(context, search: searchController.text);
                                });
                              }
                            },
                            decoration: InputDecoration(
                              isDense: true,
                              fillColor: Color(0xffF1F1F1),
                              filled: true,
                              contentPadding: EdgeInsets.only(right: 18),
                              hintText: 'Cari Indikasi / Nama Obat / Kandungan',
                              prefixIcon: Icon(
                                Icons.search,
                                color: greyColor,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
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
                                builder: (context) => const FilterTambahObat(),
                              ),
                            ).then((value) {
                              context.read<DrugController>().refreshDrug(
                                    context,
                                    minPrice: solutionController.minPriceController.text.isEmpty ? null : int.parse(solutionController.minPriceController.text),
                                    maxPrice: solutionController.maxPriceController.text.isEmpty ? null : int.parse(solutionController.maxPriceController.text),
                                    category: solutionController.filterKemasanObat,
                                    classification: solutionController.filterGolonganObat,
                                    form: solutionController.filterBentukObat,
                                  );
                            });
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
                    searchController.text == ''
                        ? SizedBox()
                        : Container(
                            height: 35,
                            // width: 130,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color: greenColor.withOpacity(0.2),
                              border: Border.all(
                                color: greenColor,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(searchController.text),
                                  // SizedBox(
                                  //   width: 10,
                                  // ),
                                  IconButton(
                                    iconSize: 14,
                                    onPressed: () {
                                      if (searchController.text == '') {
                                        setState(() {
                                          context.read<DrugController>().refreshDrug(
                                                context,
                                                search: '',
                                              );
                                        });
                                      } else {
                                        setState(() {
                                          context.read<DrugController>().refreshDrug(
                                                context,
                                                search: '',
                                              );
                                          searchController.clear();
                                        });
                                      }
                                    },
                                    icon: Icon(
                                      Icons.close,
                                    ),
                                  ),
                                  // Spacer(),
                                  // Container(),
                                ],
                              ),
                            ),
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
                                isSelcted = !isSelcted;
                              },
                            );
                          },
                          child: Text(
                            searchController.text,
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
                    padding: const EdgeInsets.only(left: 22, right: 22),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        Consumer<DrugController>(
                          builder: (_, state, __) {
                            return Container(
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: ClampingScrollPhysics(),
                                itemCount: state.hasMore.value ? state.listOfDrug.length + 1 : state.listOfDrug.length + 0,
                                itemBuilder: (ctx, index) {
                                  // String? img;
                                  // for (var i
                                  //     in drugs[index].mediaProducts!.length) {
                                  //   img = i;
                                  // }
                                  if (index < state.listOfDrug.length) {
                                    return Padding(
                                      padding: const EdgeInsets.only(bottom: 29),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              color: borderColor,
                                              width: 0.3,
                                            ),
                                            borderRadius: BorderRadius.circular(7)),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  height: 75,
                                                  width: 75,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(width: 0.5, color: borderColor),
                                                    image: DecorationImage(
                                                      image: state.listOfDrug[index].mediaProducts!.isNotEmpty ? NetworkImage('${Global.FILE}/${state.listOfDrug[index].mediaProducts![0].media?.path}') as ImageProvider : AssetImage('assets/images/penting1.png'),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 8,
                                                ),
                                                Container(
                                                  constraints: const BoxConstraints(maxWidth: 180),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      RichText(
                                                        text: TextSpan(text: state.listOfDrug[index].name, style: grenTextStyle.copyWith(fontSize: 15)),
                                                      ),
                                                      const SizedBox(
                                                        height: 2,
                                                      ),
                                                      Text(
                                                        'Cleanser',
                                                        maxLines: 2,
                                                        overflow: TextOverflow.ellipsis,
                                                        style: subTitleTextStyle,
                                                      ),
                                                      Text(
                                                        'Penggunaan: Pagi & Malam',
                                                        maxLines: 2,
                                                        overflow: TextOverflow.ellipsis,
                                                        style: subTitleTextStyle,
                                                      ),
                                                      const SizedBox(
                                                        height: 4,
                                                      ),
                                                      Text(
                                                        'Rp.' + state.listOfDrug[index].price.toString(),
                                                        style: blackTextStyle.copyWith(fontSize: 13),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const Spacer(),
                                                InkWell(
                                                  onTap: () {
                                                    print(index);
                                                    setState(
                                                      () {
                                                        // var dv = json.decode(state.listOfDrug[index].toString());
                                                        print(state.listOfDrug[index]);
                                                        if (toogle.contains(index)) {
                                                          toogle.remove(index);
                                                          stateDoctor.listObat.removeAt(index);
                                                          stateDoctor.notesMedicine.removeAt(stateDoctor.notesMedicine.length - 1);
                                                        } else {
                                                          print(state.listOfDrug[index].mediaProducts?[0].media?.path);
                                                          toogle.add(index);
                                                          stateDoctor.listObat.add({
                                                            'id': state.listOfDrug[index].id,
                                                            'name': state.listOfDrug[index].name,
                                                            'image': state.listOfDrug[index].mediaProducts?[0].media?.path,
                                                            'penggunaan': state.listOfDrug[index].drugDetail?.specificationDose ?? '-',
                                                            'harga': state.listOfDrug[index].price,
                                                          });
                                                          stateDoctor.notesMedicine.add(TextEditingController());
                                                        }
                                                        // if (toogle.contains(index)) {
                                                        //   toogle.remove(index);
                                                        //   stateDoctor.listObat
                                                        //       .remove(solutionController.listOfDrug[index]);
                                                        //   stateDoctor.notesSkincare
                                                        //       .removeAt(stateDoctor
                                                        //               .notesSkincare
                                                        //               .length -
                                                        //           1);
                                                        //   stateDoctor.listItemCount!
                                                        //       .removeAt(stateDoctor
                                                        //               .listItemCount!
                                                        //               .length -
                                                        //           1);
                                                        //   print(stateDoctor
                                                        //       .listItemCount!
                                                        //       .toString());
                                                        // } else {
                                                        //   toogle.add(index);
                                                        //   stateDoctor.listObat.add(
                                                        //       state.solutionSkincare[
                                                        //               index]
                                                        //           .toJson());
                                                        //   stateDoctor.notesSkincare.add(
                                                        //       TextEditingController());
                                                        //   stateDoctor.listItemCount =
                                                        //       List.generate(
                                                        //           state.solutionSkincare
                                                        //               .length,
                                                        //           (_) => 1);
                                                        //   print(stateDoctor
                                                        //       .listItemCount!
                                                        //       .toString());
                                                        // }
                                                      },
                                                    );
                                                  },
                                                  child: Container(
                                                      height: 29,
                                                      width: 40,
                                                      decoration: BoxDecoration(color: toogle.contains(index) ? whiteColor : greenColor, borderRadius: BorderRadius.circular(9), border: Border.all(color: greenColor)),
                                                      child: toogle.contains(index)
                                                          ? Center(
                                                              child: Text(
                                                                '-',
                                                                style: grenTextStyle.copyWith(fontSize: 20),
                                                              ),
                                                            )
                                                          : Icon(
                                                              Icons.add,
                                                              color: whiteColor,
                                                            )),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  } else {
                                    return Center(
                                      child: SizedBox(),
                                    );
                                  }
                                },
                              ),
                            );
                          },
                        )
                      ],
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
