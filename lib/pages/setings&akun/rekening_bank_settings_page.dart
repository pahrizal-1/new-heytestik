import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/account/bank_controller.dart';
import 'package:heystetik_mobileapps/models/customer/bank_model.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/tambah_bank_customer.dart';
import 'package:heystetik_mobileapps/widget/alert_dialog_ulasan.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';

import '../../theme/theme.dart';
import '../../widget/text_form_widget.dart';

class RekeningBankSettings extends StatefulWidget {
  RekeningBankSettings({super.key});

  @override
  State<RekeningBankSettings> createState() => _RekeningBankSettingsState();
}

class _RekeningBankSettingsState extends State<RekeningBankSettings> {
  final BankController state = Get.put(BankController());
  @override
  void initState() {
    super.initState();
    state.selectListBank(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: const EdgeInsets.only(left: 6),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: blackColor,
                ),
              ),
              const SizedBox(
                width: 11,
              ),
              Expanded(
                child: Text(
                  'Rekening Bank',
                  style: blackTextStyle.copyWith(
                    fontSize: 20,
                  ),
                ),
              )
            ],
          ),
        ),
        actions: [
          Image.asset(
            'assets/icons/alert-new.png',
            width: 22,
            height: 22,
          ),
          const SizedBox(
            width: 26,
          ),
        ],
      ),
      body: Padding(
        padding: lsymetric.copyWith(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Kamu bisa simpan maksimal 3 rekening bank',
              style: blackHigtTextStyle.copyWith(fontSize: 15),
            ),
            Text(
              'Saldo Heystetik kamu bisa ditarik ke rekening ini.',
              style: blackRegulerTextStyle,
            ),
            const SizedBox(
              height: 32,
            ),
            Expanded(
              child: FutureBuilder(
                future: state.listBank(context),
                builder: (context, AsyncSnapshot<BankModel?> snapshot) {
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
                                      children: [
                                        // Image.asset(
                                        //   'assets/images/logo-bca.png',
                                        //   width: 50,
                                        // ),
                                        // const SizedBox(
                                        //   width: 14,
                                        // ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${state.filterData[index].bank?.name}',
                                              style: blackHigtTextStyle
                                                  .copyWith(fontSize: 13),
                                            ),
                                            Text(
                                              '${state.filterData[index].accountNumber}',
                                              style: blackRegulerTextStyle
                                                  .copyWith(color: blackColor),
                                            ),
                                            Text(
                                              'a.n ${state.filterData[index].name?.toUpperCase()}',
                                              style: blackRegulerTextStyle
                                                  .copyWith(color: blackColor),
                                            )
                                          ],
                                        ),
                                        const Spacer(),
                                        Column(
                                          children: [
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
                                              child: Image.asset(
                                                'assets/icons/trash.png',
                                                width: 20,
                                                height: 20,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            InkWell(
                                              onTap: () async {
                                                Get.to(TambahBankCustomerPage(
                                                  id: state
                                                      .filterData[index].id!
                                                      .toInt(),
                                                  isUpdate: true,
                                                ));
                                              },
                                              child: Image.asset(
                                                'assets/icons/edit.png',
                                                width: 20,
                                                height: 20,
                                                color: greenColor,
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
            const Spacer(),
            ButtonGreenWidget(
              title: 'Tambah Rekening Lain',
              onPressed: () async {
                // clear search
                state.clearForm();
                Get.to(TambahBankCustomerPage());
              },
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
