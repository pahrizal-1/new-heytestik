import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/doctor/treatment_recommendation/treatment_recommendation_controller.dart';
import '../../theme/theme.dart';
import '../../widget/loading_widget.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class AddTreatmentPage extends StatefulWidget {
  const AddTreatmentPage({super.key});

  @override
  State<AddTreatmentPage> createState() => AddTreatmentPageState();
}

class AddTreatmentPageState extends State<AddTreatmentPage> {
  final TreatmentRecommendationController state =
      Get.put(TreatmentRecommendationController());

  var dataClinic;
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
                      dataClinic = '';
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
                          {
                            "clinic_id": dataClinic,
                          }
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
                              value: value.id,
                              child: Text(value.name ?? ''),
                            );
                          }).toList(),
                          hint: Text('Pilih Klinik'),
                          onChanged: (newVal) {
                            setState(() {
                              dataClinic = newVal;
                            });
                          },
                          value: dataClinic,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }
}
