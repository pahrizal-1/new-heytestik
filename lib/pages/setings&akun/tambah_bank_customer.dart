import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/account/bank_controller.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/kebijakan_privasi_page.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/syarat_ketentuan_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';
import 'package:heystetik_mobileapps/widget/pilih_bank_widgets.dart';

import '../../../widget/button_widget.dart';
import '../../widget/appbar_widget.dart';

class TambahBankCustomerPage extends StatefulWidget {
  final int id;
  final bool isUpdate;
  const TambahBankCustomerPage({this.id = 0, this.isUpdate = false, super.key});

  @override
  State<TambahBankCustomerPage> createState() => _TambahBankCustomerPageState();
}

class _TambahBankCustomerPageState extends State<TambahBankCustomerPage> {
  final BankController state = Get.put(BankController());

  @override
  void initState() {
    super.initState();
    if (widget.isUpdate) {
      state.findBank(context, widget.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        titleSpacing: 0,
        iconTheme: iconthemeblack(),
        backgroundColor: Colors.transparent,
        title: Text(
          widget.isUpdate ? 'Ubah Rekening' : 'Tambah Rekening',
          style: blackHigtTextStyle.copyWith(fontSize: 20),
        ),
      ),
      body: Obx(
        () => LoadingWidget(
          isLoading: state.isLoadingFind.value,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 25,
              right: 25,
              bottom: 36,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 37,
                ),
                Text(
                  'Nama Bank',
                  style: subTitleTextStyle.copyWith(fontSize: 12),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Container(
                        child: TextFormField(
                          controller: state.bankName,
                          readOnly: true,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            fillColor: greenColor,
                            hoverColor: greenColor,
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: greenColor),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          backgroundColor: Colors.white,
                          context: context,
                          isScrollControlled: true,
                          isDismissible: true,
                          builder: (BuildContext context) {
                            return DraggableScrollableSheet(
                                initialChildSize: 1, //set this as you want
                                maxChildSize: 1, //set this as you want
                                minChildSize: 1, //set this as you want
                                expand: true,
                                builder: (context, scrollController) {
                                  return FilterTambahbank(); //whatever you're returning, does not have to be a Container
                                });
                          },
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.only(
                            left: 8, right: 8, bottom: 7, top: 7),
                        decoration: BoxDecoration(
                          border: Border.all(color: subgreyColor),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Center(
                          child: Text(
                            'Pilih',
                            style: blackHigtTextStyle.copyWith(
                                fontSize: 13, color: const Color(0xfF6B6B6B)),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Nomor Rekening',
                  style: subTitleTextStyle.copyWith(fontSize: 12),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Container(
                        child: TextFormField(
                          controller: state.accountNumber,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            fillColor: greenColor,
                            hoverColor: greenColor,
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: greenColor),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    // Container(
                    //   padding: const EdgeInsets.only(
                    //       left: 8, right: 8, bottom: 7, top: 7),
                    //   decoration: BoxDecoration(
                    //     border: Border.all(color: subgreyColor),
                    //     borderRadius: BorderRadius.circular(7),
                    //   ),
                    //   child: Center(
                    //     child: Text(
                    //       'Periksa',
                    //       style: blackHigtTextStyle.copyWith(
                    //           fontSize: 13, color: const Color(0xfF6B6B6B)),
                    //     ),
                    //   ),
                    // )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Nama Rekening',
                  style: subTitleTextStyle.copyWith(fontSize: 12),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Container(
                        child: TextFormField(
                          controller: state.name,
                          decoration: InputDecoration(
                            fillColor: greenColor,
                            hoverColor: greenColor,
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: greenColor),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Text.rich(
                  TextSpan(
                    text: 'Dengan klik “Simpan”, kamu menyetujui',
                    style: greyTextStyle.copyWith(fontSize: 13),
                    children: [
                      TextSpan(
                        text: " Kebijakan Privasi",
                        recognizer: TapAndPanGestureRecognizer()
                          ..onTapDown = (route) {
                            Get.to(KebijakanPrivasiPage());
                          },
                        style: grenTextStyle.copyWith(
                          fontSize: 13,
                        ),
                        children: [
                          TextSpan(
                              text: " dan",
                              style: greyTextStyle.copyWith(fontSize: 13),
                              children: [
                                TextSpan(
                                    text: " Syarat dan Ketentuan",
                                    recognizer: TapAndPanGestureRecognizer()
                                      ..onTapDown = (route) {
                                        Get.to(SyaratKetentuanPage());
                                      },
                                    style: grenTextStyle.copyWith(fontSize: 13))
                              ]),
                        ],
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                Obx(
                  () => LoadingWidget(
                    isLoading: state.isLoading.value,
                    child: ButtonGreenWidget(
                      title: widget.isUpdate ? 'Ubah' : 'Simpan',
                      onPressed: () async {
                        if (widget.isUpdate) {
                          await state.updateBank(context, widget.id);
                        } else {
                          await state.saveBank(context);
                        }
                      },
                    ),
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
