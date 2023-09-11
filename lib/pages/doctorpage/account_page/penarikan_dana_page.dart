import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:heystetik_mobileapps/pages/doctorpage/account_page/rekening_bank_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

import '../../../controller/doctor/profile/bank_doctor_controller.dart';
import '../../../controller/doctor/profile/profile_controller.dart';
import '../../../models/doctor/bank_doctor_model.dart';
import '../../../widget/loading_widget.dart';

class PenarikanDana extends StatefulWidget {
  const PenarikanDana({super.key});

  @override
  State<PenarikanDana> createState() => _PenarikanDanaState();
}

class _PenarikanDanaState extends State<PenarikanDana> {
  final BankDoctorController stateBank = Get.put(BankDoctorController());
  final DoctorProfileController state = Get.put(DoctorProfileController());
  int? groupBank;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      state.getUserBalance();
      stateBank.selectListBank(context);
    });
  }

  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          backgroundColor: greenColor,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context, 'refresh');
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        size: 22,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Penarikan Saldo',
                      style: whiteTextStyle.copyWith(
                          fontWeight: bold, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: Obx(() => LoadingWidget(
              isLoading: state.isLoading.value,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 16, left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/icons/alert-circle1.png',
                                width: 27,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Text.rich(
                                  TextSpan(
                                    text: 'Sekarang kamu Bisa Tarik saldo',
                                    style: greyTextStyle.copyWith(fontSize: 13),
                                    children: [
                                      TextSpan(
                                        text:
                                            " Pada Tanggal 25 Setiap Bulannya",
                                        style: blackHigtTextStyle.copyWith(
                                            fontSize: 13,
                                            color: Color(0xFF6B6B6B)),
                                        children: [
                                          TextSpan(
                                            text:
                                                " Ke rekening bank Yang Tersimpan.",
                                            style: greyTextStyle.copyWith(
                                                fontSize: 13),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 39,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Saldo',
                                style:
                                    blackHigtTextStyle.copyWith(fontSize: 20),
                              ),
                              Obx(
                                () => Text(
                                  'Rp ${state.saldo.value.balance}',
                                  style: TextStyle(
                                    fontFamily: 'ProximaNova',
                                    fontSize: 20,
                                    fontWeight: bold,
                                    color: greyColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Nominal Penarikan',
                                style: blackHigtTextStyle.copyWith(
                                    fontSize: 12, fontWeight: regular),
                              ),
                              InkWell(
                                onTap: (){
                                  print('ini ketarik semua ${state.saldo.value.balance}');
                                  state.nominalPenarikan.text = state.saldo.value.balance.toString();
                                },
                                child: Text(
                                  'Tarik Semua',
                                  style: grenTextStyle.copyWith(fontSize: 12),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            controller: state.nominalPenarikan,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 15, left: 0),
                              fillColor: greenColor,
                              hoverColor: greenColor,
                              prefixIcon: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 11),
                                child: Text(
                                  'Rp',
                                  style: blackHigtTextStyle.copyWith(
                                      fontSize: 20, color: greyColor),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: greenColor),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            'Min. penarikan Rp10.000',
                            style: subTitleTextStyle,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Divider(
                      thickness: 5,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 16, left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Rekening Tujuan',
                            style: blackHigtTextStyle.copyWith(
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          // Container(
                          //   child: ListView.builder(
                          //       shrinkWrap: true,
                          //       itemCount: stateBank.filterData.length,
                          //       itemBuilder: (context, index) {
                          //         return Column(
                          //           crossAxisAlignment:
                          //               CrossAxisAlignment.start,
                          //           children: [
                          //             Row(
                          //               children: [
                          //                 Expanded(
                          //                   child: Column(
                          //                     crossAxisAlignment:
                          //                         CrossAxisAlignment.start,
                          //                     children: [
                          //                       Text(
                          //                         '${stateBank.filterData[index].bank?.name}',
                          //                         style: blackRegulerTextStyle
                          //                             .copyWith(
                          //                           fontSize: 12,
                          //                           color: blackColor,
                          //                         ),
                          //                       ),
                          //                       SizedBox(
                          //                         height: 3,
                          //                       ),
                          //                       Text(
                          //                         '${stateBank.filterData[index].accountNumber} - ${stateBank.filterData[index].name?.toUpperCase()}',
                          //                         style: subTitleTextStyle
                          //                             .copyWith(
                          //                           fontSize: 12,
                          //                           color: Color(
                          //                             0xff6B6B6B,
                          //                           ),
                          //                         ),
                          //                       )
                          //                     ],
                          //                   ),
                          //                 ),
                          //                 Radio(
                          //                   focusColor: greenColor,
                          //                   hoverColor: greenColor,
                          //                   activeColor: greenColor,
                          //                   value: index,
                          //                   groupValue: groupBank,
                          //                   toggleable: true,
                          //                   onChanged: (val) {
                          //                     setState(() {
                          //                       groupBank = val;
                          //                       print(val);
                          //                       if (val != null) {
                          //                         state.bankId = stateBank
                          //                             .filterData[index].id;
                          //                       } else {
                          //                         state.bankId = null;
                          //                       }
                          //                       print(stateBank
                          //                           .filterData[index].id);
                          //                       // if (val != null) {
                          //                       //   state.dataRating = 2;
                          //                       // } else {
                          //                       //   state.dataRating = null;
                          //                       // }
                          //                     });
                          //                   },
                          //                 ),
                          //               ],
                          //             ),
                          //             SizedBox(
                          //               height: 10,
                          //             )
                          //           ],
                          //         );
                          //       }),
                          // ),
                          FutureBuilder(
                            future: stateBank.listBank(context),
                            builder: (context,
                                AsyncSnapshot<BankDoctorModel?> snapshot) {
                              print(snapshot.connectionState);
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                  child: SizedBox(
                                    height: 30,
                                    width: 30,
                                    child: CircularProgressIndicator(
                                      color: greenColor,
                                    ),
                                  ),
                                );
                              }
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                if (snapshot.hasData) {
                                  return Obx(
                                    () => Container(
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          itemCount:
                                              stateBank.filterData.length,
                                          itemBuilder: (context, index) {
                                            return Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            '${stateBank.filterData[index].bank?.name}',
                                                          ),
                                                          Text(
                                                            '${stateBank.filterData[index].accountNumber}\n${stateBank.filterData[index].name?.toUpperCase()}',
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    Radio(
                                                      value: index,
                                                      groupValue: groupBank,
                                                      toggleable: true,
                                                      onChanged: (val) {
                                                        setState(() {
                                                          groupBank = val;
                                                          print(val);
                                                          if (val != null) {
                                                            state.bankId =
                                                                stateBank
                                                                    .filterData[
                                                                        index]
                                                                    .id;
                                                          } else {
                                                            state.bankId = null;
                                                          }
                                                          print(stateBank
                                                              .filterData[index]
                                                              .id);
                                                          // if (val != null) {
                                                          //   state.dataRating = 2;
                                                          // } else {
                                                          //   state.dataRating = null;
                                                          // }
                                                        });
                                                      },
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 9,
                                                ),
                                                Divider(
                                                  thickness: 2,
                                                  color: Colors.grey,
                                                ),
                                                SizedBox(
                                                  height: 9,
                                                ),
                                              ],
                                            );
                                          }),
                                    ),
                                  );
                                } else {
                                  return Center(
                                    child: Text(
                                      'Tidak ada data',
                                      style: TextStyle(
                                        fontWeight: bold,
                                        fontFamily: 'ProximaNova',
                                        fontSize: 20,
                                      ),
                                    ),
                                  );
                                }
                              } else {
                                return Text(
                                    'Connection State: ${snapshot.connectionState}');
                              }
                            },
                          ),
                          // InkWell(
                          //   onTap: () {
                          //     setState(() {
                          //       isSelected = !isSelected;
                          //     });
                          //   },
                          //   child: Row(
                          //     children: [
                          //       Column(
                          //         crossAxisAlignment: CrossAxisAlignment.start,
                          //         children: const [
                          //           Text(
                          //             'PT. BCA (BANK CENTRAL ASIA) TBK',
                          //           ),
                          //           Text('0212871964 - Risty Hafinah')
                          //         ],
                          //       ),
                          //       const Spacer(),
                          //       Icon(
                          //         isSelected
                          //             ? Icons.radio_button_on
                          //             : Icons.circle_outlined,
                          //         color: isSelected ? greenColor : blackColor,
                          //       )
                          //     ],
                          //   ),
                          // ),
                          const SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () async {
                              String refresh = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RekeningBankPage(),
                                ),
                              );
                              if (refresh == 'refresh') {
                                setState(() {
                                  stateBank.filterData;
                                });
                              }
                            },
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/icons/pensil.png',
                                  width: 15,
                                ),
                                SizedBox(
                                  width: 14,
                                ),
                                Text(
                                  'Atur Rekening',
                                  style: grenTextStyle.copyWith(fontSize: 15),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 19,
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: 5,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 16, left: 25, right: 25),
                      child: Column(
                        children: [
                          Text(
                            'Dengan klik tombol di bawah, kamu telah setuju dengan ketentuan penarikan saldo.',
                            style: subTitleTextStyle,
                          ),
                          const SizedBox(
                            height: 19,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 40,
                            child: TextButton(
                              onPressed: () {
                                state.saveBank(context);
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: greenColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text(
                                'Tarik Saldo',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: whiteColor,
                                  fontWeight: bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 39,
                    ),
                  ],
                ),
              ),
            )));
  }
}
