import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/doctor/treatment_recommendation/treatment_recommendation_controller.dart';
import '../../theme/theme.dart';
import '../../widget/loading_widget.dart';

class AddTreatmentPage extends StatefulWidget {
  const AddTreatmentPage({super.key});

  @override
  State<AddTreatmentPage> createState() => AddTreatmentPageState();
}

class AddTreatmentPageState extends State<AddTreatmentPage> {
  final TreatmentRecommendationController state =
      Get.put(TreatmentRecommendationController());

  List dataClinic = [];
  var clinickName;
  String selectedText = "";
  List<dynamic> listOFSelectedItem = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      state.getClinick(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: greenColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      state.nameController.clear();
                      state.costController.clear();
                      state.recoveryTimeController.clear();
                      state.typeController.clear();

                      dataClinic = [];
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      size: 20,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Tambah Template Treatmen',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'ProximaNova',
                      fontWeight: bold,
                      fontSize: 18,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  print('clinic ' + dataClinic.toString());
                  Navigator.pop(context, 'refresh');
                  setState(() {
                    state.dataTreatmentItems.add(
                      {
                        'name': state.nameController.text,
                        'cost': state.costController.text,
                        'recovery_time': state.recoveryTimeController.text,
                        'type': state.typeController.text,
                        'clinics': [
                          for (var i in dataClinic)
                            {
                              "clinic_id": i['id'],
                            }
                        ]
                      },
                    );
                    state.dataTreatmentItemsById.add(
                      {
                        'name': state.nameController.text,
                        'cost': state.costController.text,
                        'recovery_time': state.recoveryTimeController.text,
                        'type': state.typeController.text,
                        "clinics": [
                          for (var i in dataClinic)
                            {
                              'clinic': {
                                'id': i['id'],
                              }
                            },
                        ]
                      },
                    );
                  });
                  state.nameController.clear();
                  state.costController.clear();
                  state.recoveryTimeController.clear();
                  state.typeController.clear();
                },
                child: Text(
                  'Tambah',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'ProximaNova',
                    fontWeight: bold,
                    fontSize: 14,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Obx(() => LoadingWidget(
              isLoading: state.isLoading.value,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Text(
                      'Nama Treatment',
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.only(
                        bottom: 10.0,
                      ),
                      child: Opacity(
                          opacity: 0.7,
                          child: TextFormField(
                            controller: state.nameController,
                            style: TextStyle(
                              fontSize: 18.0,
                              height: 1.1,
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                              hintText: 'Peeling',
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              filled: true,
                            ),
                          )),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Harga Treatment',
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.only(
                        bottom: 10.0,
                      ),
                      child: Opacity(
                          opacity: 0.7,
                          child: TextFormField(
                            controller: state.costController,
                            style: TextStyle(
                              fontSize: 18.0,
                              height: 1.1,
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                              hintText: '100000 - 200000',
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              filled: true,
                            ),
                          )),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Waktu Pemulihan',
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.only(
                        bottom: 10.0,
                      ),
                      child: Opacity(
                          opacity: 0.7,
                          child: TextFormField(
                            controller: state.recoveryTimeController,
                            style: TextStyle(
                              fontSize: 18.0,
                              height: 1.1,
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                              hintText: '2 - 3 hari',
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              filled: true,
                            ),
                          )),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Tipe Treatment',
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.only(
                        bottom: 10.0,
                      ),
                      child: Opacity(
                          opacity: 0.7,
                          child: TextFormField(
                            controller: state.typeController,
                            style: TextStyle(
                              fontSize: 18.0,
                              height: 1.1,
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                              hintText: 'Non Surgical',
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              filled: true,
                            ),
                          )),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Klinik',
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueGrey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          borderRadius: BorderRadius.circular(12),
                          isExpanded: true,
                          items: state.clinics.map((value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value.name ?? ''),
                            );
                          }).toList(),
                          hint: Text('Pilih Klinik'),
                          onChanged: (newVal) {
                            setState(() {
                              dataClinic
                                  .add({'id': newVal!.id, 'name': newVal.name});
                              // for (var i in dataClinic) {
                              //   setState(() {
                              //     clinickName = i;
                              //   });
                              // }
                            });
                            print('pra ' + dataClinic.toString());
                            print('praaa ' + newVal!.id.toString());
                          },
                          // value: dataClinic.map((e) {
                          // value: dataClinic.map((e) => e['name']),
                          //   clinickName = e;
                          // }),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (var i in dataClinic)
                            Container(
                              height: 90,
                              // width: 107,
                              margin: EdgeInsets.only(
                                bottom: 10,
                                right: 10,
                              ),
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromRGBO(36, 167, 160, 0.1),
                                  border: Border.all(
                                    color: greenColor,
                                  ),
                                  borderRadius: BorderRadius.circular(7)),
                              child: Center(
                                child: Text(i['name']),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }
}
