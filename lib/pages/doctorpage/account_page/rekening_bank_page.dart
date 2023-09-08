import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/doctor/profile/bank_doctor_controller.dart';
import 'package:heystetik_mobileapps/models/doctor/bank_doctor_model.dart';
import 'package:heystetik_mobileapps/pages/doctorpage/account_page/tambah_bank_doctor_page.dart';
import 'package:heystetik_mobileapps/widget/alert_dialog_ulasan.dart';

import 'package:heystetik_mobileapps/widget/button_widget.dart';

import '../../../theme/theme.dart';

class RekeningBankPage extends StatefulWidget {
  const RekeningBankPage({super.key});

  @override
  State<RekeningBankPage> createState() => _RekeningBankPageState();
}

class _RekeningBankPageState extends State<RekeningBankPage> {
  final BankDoctorController state = Get.put(BankDoctorController());
  @override
  void initState() {
    super.initState();
    state.selectListBank(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        backgroundColor: greenColor,
        title: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context, 'refresh');
                },
                child: Icon(Icons.arrow_back),
              ),
              const SizedBox(
                width: 11,
              ),
              Text(
                'Rekening Bank',
                style: whiteTextStyle.copyWith(fontWeight: bold, fontSize: 20),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 19, bottom: 50),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: state.listBank(context),
                builder: (context, AsyncSnapshot<BankDoctorModel?> snapshot) {
                  print(snapshot.connectionState);
                  if (snapshot.connectionState == ConnectionState.waiting) {
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
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      return Obx(
                        () => state.filterData.isEmpty
                            ? Center(
                                child: Text(
                                  'Tidak ada data',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: bold,
                                    fontFamily: 'ProximaNova',
                                    fontSize: 20,
                                  ),
                                ),
                              )
                            : ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: state.filterData.length,
                                itemBuilder: (BuildContext context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          constraints: const BoxConstraints(
                                              maxWidth: 230),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${state.filterData[index].bank?.name}',
                                                style: blackRegulerTextStyle
                                                    .copyWith(
                                                  fontSize: 12,
                                                  color: blackColor,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 4,
                                              ),
                                              Text(
                                                'a.n ${state.filterData[index].accountNumber}\n${state.filterData[index].name?.toUpperCase()}',
                                                style:
                                                    subTitleTextStyle.copyWith(
                                                  fontSize: 12,
                                                  color: Color(
                                                    0xff6B6B6B,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        const Spacer(),
                                        Column(
                                          children: [
                                            InkWell(
                                              onTap: () async {
                                                Get.to(TambahBankDoctorPage(
                                                  id: state
                                                      .filterData[index].id!
                                                      .toInt(),
                                                  isUpdate: true,
                                                ));
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: greenColor,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(7),
                                                ),
                                                width: 58,
                                                height: 28,
                                                child: Center(
                                                  child: Text(
                                                    'Ubah',
                                                    style: blackHigtTextStyle
                                                        .copyWith(
                                                      fontSize: 13,
                                                      color: greenColor,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            InkWell(
                                              onTap: () async {
                                                showDialog(
                                                  context: context,
                                                  builder: (context) =>
                                                      AlertInfomasi(
                                                    function: () async {
                                                      await state.deleteBank(
                                                        context,
                                                        state.filterData[index]
                                                            .id!
                                                            .toInt(),
                                                      );
                                                    },
                                                  ),
                                                );
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: borderColor,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(7),
                                                ),
                                                width: 58,
                                                height: 28,
                                                child: Center(
                                                  child: Text(
                                                    'Hapus',
                                                    style: blackHigtTextStyle
                                                        .copyWith(
                                                            fontSize: 13,
                                                            color: const Color(
                                                                0xfF6B6B6B)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  );
                                },
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
            ),
            const SizedBox(
              height: 17,
            ),
            const Divider(
              thickness: 2,
            ),
            const SizedBox(
              height: 17,
            ),
            Container(
              padding: const EdgeInsets.only(
                  left: 18, right: 50, top: 10, bottom: 10),
              height: 68,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                border: Border.all(color: greenColor),
                borderRadius: BorderRadius.circular(7),
                color: const Color.fromRGBO(36, 167, 160, 0.2),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Catatan :',
                    style: blackHigtTextStyle.copyWith(fontSize: 13),
                  ),
                  Text(
                    'Akun Rekening Bank yang aktif maksimal berjumlah 3 (tiga) buah',
                    style: blackHigtTextStyle.copyWith(
                        fontSize: 12, fontWeight: regular),
                  ),
                ],
              ),
            ),
            const Spacer(),
            ButtonGreenWidget(
              title: 'Tambah Rekening Lain',
              onPressed: () async {
                // clear search
                state.clearForm();
                String refresh = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TambahBankDoctorPage()));
                if (refresh == 'refresh') {
                  setState(() {
                    state.filterData;
                  });
                }
                // Get.to(TambahBankDoctorPage());
              },
            ),
          ],
        ),
      ),
    );
  }
}
