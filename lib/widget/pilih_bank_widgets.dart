import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/widget/text_form_widget.dart';
import '../controller/customer/account/bank_controller.dart';
import '../theme/theme.dart';

class FilterTambahbank extends StatefulWidget {
  const FilterTambahbank({super.key});

  @override
  State<FilterTambahbank> createState() => _FilterTambahbankState();
}

class _FilterTambahbankState extends State<FilterTambahbank> {
  final BankController state = Get.put(BankController());
  @override
  void initState() {
    super.initState();
    state.selectListBank(context);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60, left: 33, right: 33),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        'assets/icons/danger-icons.png',
                        width: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 17,
                    ),
                    Text(
                      'Pilih Nama Bank',
                      style: blackHigtTextStyle.copyWith(fontSize: 20),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 22,
                ),
                SearchTextField(
                  title: 'Cari Bank',
                  controller: state.searchController,
                  onChange: (value) {
                    state.onChangeFilterText(value);
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Obx(
                  () => state.filterSelect.isEmpty
                      ? Padding(
                          padding: const EdgeInsets.only(top: paddingL),
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
                          keyboardDismissBehavior:
                              ScrollViewKeyboardDismissBehavior.onDrag,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.filterSelect.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                InkWell(
                                  onTap: () {
                                    state.bankId.value =
                                        state.filterSelect[index].id!.toInt();
                                    state.bankName.text = state
                                        .filterSelect[index].name!
                                        .toString();

                                    // FOR BACK
                                    Get.back();
                                  },
                                  child: Text(
                                    '${state.filterSelect[index].name}',
                                    style: blackHigtTextStyle.copyWith(
                                        fontSize: 14),
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                const Divider(
                                  thickness: 2,
                                )
                              ],
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
