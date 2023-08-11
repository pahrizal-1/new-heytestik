import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/etalase_controller.dart';
import 'package:heystetik_mobileapps/core/currency_format.dart';
import 'package:heystetik_mobileapps/models/medicine.dart';
import 'package:heystetik_mobileapps/pages/solution/view_detail_obat_page.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

import '../../../../controller/customer/solution/medicine_controller.dart';
import '../../../../controller/doctor/consultation/consultation_controller.dart';
import '../../../../core/global.dart';
import '../../../../theme/theme.dart';
import '../../../../widget/alert_dialog.dart';
import '../../../../widget/loading_widget.dart';

class RecomendationMedicine extends StatefulWidget {
  const RecomendationMedicine({super.key});

  @override
  State<RecomendationMedicine> createState() => _RecomendationMedicineState();
}

class _RecomendationMedicineState extends State<RecomendationMedicine> {
  final ScrollController scrollController = ScrollController();
  final MedicineController solutionController = Get.put(MedicineController());
  final DoctorConsultationController stateDoctor =
      Get.put(DoctorConsultationController());
  int page = 1;
  List<MedicineModel> medicines = [];
  List toogle = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      medicines.addAll(await solutionController.getMedicine(context, page));

      setState(() {});
    });
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool isTop = scrollController.position.pixels == 0;
        if (!isTop) {
          page += 1;
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
            medicines
                .addAll(await solutionController.getMedicine(context, page));
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
                if (stateDoctor.listObat.isNotEmpty &&
                    stateDoctor.notesMedicine.isNotEmpty) {
                  Navigator.pop(context, 'refresh');
                } else {
                  showDialog(
                    context: context,
                    builder: (context) => AlertWidget(
                        subtitle: 'Silahkan Pilih Terlebih Dahulu)'),
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
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 22, right: 22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      Container(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: medicines.length,
                          itemBuilder: (ctx, index) {
                            String? img;
                            for (var i in medicines[index].media) {
                              img = i;
                            }
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 29),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 8),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 80,
                                          width: 80,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 0.5, color: borderColor),
                                            image: DecorationImage(
                                              image: medicines[index]
                                                      .media
                                                      .isNotEmpty
                                                  ? NetworkImage(
                                                          '${Global.FILE}/${img}')
                                                      as ImageProvider
                                                  : AssetImage(
                                                      'assets/images/penting1.png'),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                constraints:
                                                    const BoxConstraints(
                                                        maxWidth: 150),
                                                child: RichText(
                                                  text: TextSpan(
                                                      text:
                                                          medicines[index].name,
                                                      style: grenTextStyle
                                                          .copyWith(
                                                              fontSize: 15)),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                medicines[index].description,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: subTitleTextStyle,
                                              ),
                                              const SizedBox(
                                                height: 9,
                                              ),
                                              Text(
                                                'Penggunaan:  ${medicines[index].doses}',
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: subTitleTextStyle,
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                'Rp.' +
                                                    medicines[index]
                                                        .price
                                                        .toString(),
                                                style: blackTextStyle.copyWith(
                                                    fontSize: 13),
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
                                                // var dv = json.decode(medicines[index].toString());
                                                print(medicines[index]);
                                                if (toogle.contains(index)) {
                                                  toogle.remove(index);
                                                  stateDoctor.listObat
                                                      .removeAt(index);
                                                  stateDoctor.notesMedicine
                                                      .removeAt(stateDoctor
                                                              .notesMedicine
                                                              .length -
                                                          1);
                                                } else {
                                                  toogle.add(index);
                                                  stateDoctor.listObat.add({
                                                    'id': medicines[index].id,
                                                    'name':
                                                        medicines[index].name,
                                                    'image': medicines[index].media,
                                                    'penggunaan':
                                                        medicines[index].doses,
                                                    'harga':
                                                        medicines[index].price,
                                                  });
                                                  stateDoctor.notesMedicine.add(
                                                      TextEditingController());
                                                }
                                                // if (toogle.contains(index)) {
                                                //   toogle.remove(index);
                                                //   stateDoctor.listObat
                                                //       .remove(medicines[index]);
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
                                              decoration: BoxDecoration(
                                                  color: toogle.contains(index)
                                                      ? whiteColor
                                                      : greenColor,
                                                  borderRadius:
                                                      BorderRadius.circular(9),
                                                  border: Border.all(
                                                      color: greenColor)),
                                              child: toogle.contains(index)
                                                  ? Center(
                                                      child: Text(
                                                        '-',
                                                        style: grenTextStyle
                                                            .copyWith(
                                                                fontSize: 20),
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
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
