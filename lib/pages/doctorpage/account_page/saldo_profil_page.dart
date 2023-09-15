import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/convert_date.dart';
import 'package:heystetik_mobileapps/core/currency_format.dart';
import 'package:heystetik_mobileapps/pages/doctorpage/account_page/penarikan_dana_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

import 'package:heystetik_mobileapps/widget/button_widget.dart';

import '../../../controller/doctor/profile/profile_controller.dart';
import '../../../widget/loading_widget.dart';

class SaldoProfilPage extends StatefulWidget {
  const SaldoProfilPage({super.key});

  @override
  State<SaldoProfilPage> createState() => _SaldoProfilPageState();
}

class _SaldoProfilPageState extends State<SaldoProfilPage> {
  final DoctorProfileController state = Get.put(DoctorProfileController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      state.getUserBalance();
      state.getWithDraw(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        titleSpacing: 0,
        backgroundColor: greenColor,
        automaticallyImplyLeading: false,
        title: Padding(
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
                'Saldo Saya',
                style: whiteTextStyle.copyWith(fontWeight: bold, fontSize: 20),
              ),
            ],
          ),
        ),
      ),
      body: Obx(
        () => LoadingWidget(
          isLoading: state.isLoading.value,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 16, left: 25, right: 25),
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
                                text: " Pada Tanggal 25 Setiap Bulannya",
                                style: blackHigtTextStyle.copyWith(
                                    fontSize: 13, color: Color(0xFF6B6B6B)),
                                children: [
                                  TextSpan(
                                    text: " Ke rekening bank Yang Tersimpan.",
                                    style: greyTextStyle.copyWith(fontSize: 13),
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
                    height: 21,
                  ),
                  Container(
                    height: 97,
                    width: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: whiteColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade600,
                          spreadRadius: 0.2,
                          blurRadius: 0.1,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            'Saldo Saya',
                            style: blackTextStyle.copyWith(
                                fontSize: 15, fontWeight: regular),
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Obx(
                          () => Center(
                            child: Text(
                              CurrencyFormat.convertToIdr(
                                state.saldo.value.balance,
                                0,
                              ),
                              style: TextStyle(
                                  fontFamily: 'ProximaNova',
                                  fontSize: 20,
                                  fontWeight: bold,
                                  color: blackColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 9,
                  ),
                  ButtonGreenWidget(
                    title: 'Tarik Saldo',
                    onPressed: () async {
                      String refresh = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PenarikanDana()));
                      if (refresh == 'refresh') {
                        setState(() {
                          state.listWithDraw;
                          state.listWithDrawHistory;
                          state.saldo.value.balance;
                          print('refr');
                        });
                      }
                    },
                  ),

                  const SizedBox(
                    height: 48,
                  ),
                  Text(
                    'Riwayat Saldo Saya',
                    style: blackHigtTextStyle.copyWith(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: state.listWithDraw.length,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: ((context, index) {
                            return _penarikandana(index);
                          }))),
                  // _penarikandana(),
                  // const SizedBox(
                  //   height: 19,
                  // ),
                  // _penarikandana(),
                  // const SizedBox(
                  //   height: 19,
                  // ),
                  // _penarikandana(),
                  // const SizedBox(
                  //   height: 19,
                  // ),
                  // _penarikandana(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Column _penarikandana(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Penarikan Saldo',
              style: blackTextStyle.copyWith(fontSize: 15),
            ),
            const Spacer(),
            Text(
              // 'Berhasil',
              state.listWithDraw[index]['status'] ?? '',
              style: grenTextStyle.copyWith(fontSize: 12),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          "-Rp${state.listWithDraw[index]['amount']}",
          style: TextStyle(color: redColor, fontSize: 13, fontWeight: bold),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          // 'Withdrawal (BCA - 0212871964 - Risty Hafinah)',
          state.listWithDraw[index]['notes'] ?? '',
          style: subTitleTextStyle,
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: state.listWithDrawHistory.length,
              itemBuilder: (context, i) {
                return Row(
                  children: [
                    Text(
                      ConvertDate.transactionDate(
                        state.listWithDrawHistory[i]['created_at'].toString(),
                      ),
                      // '*25-01-2023, 17:30 WIB : Processed\n*25-01-2023, 17:45 WIB : Completed',
                      style: subTitleTextStyle,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      state.listWithDrawHistory[i]['status'],
                      style: subTitleTextStyle,
                    ),
                  ],
                );
              }),
        ),
        const SizedBox(
          height: 19,
        ),
        const Divider(
          thickness: 1,
        )
      ],
    );
  }
}
