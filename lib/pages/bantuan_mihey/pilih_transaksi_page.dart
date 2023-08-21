import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

class PilihTranskasiMinheyPage extends StatelessWidget {
  const PilihTranskasiMinheyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: whiteColor,
        title: Padding(
          padding: const EdgeInsets.only(left: 6),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset(
                  'assets/icons/danger-icons.png',
                  width: 15,
                ),
              ),
              const SizedBox(
                width: 18,
              ),
              Text(
                'Pilih transaksi',
                style: blackHigtTextStyle.copyWith(fontSize: 20),
              ),
            ],
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(56.0),
          child: Container(
            padding:
                const EdgeInsets.only(left: 25, right: 25, bottom: 10, top: 10),
            height: 56.0,
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(
                  color: fromCssColor('#CCCCCC'),
                ),
                borderRadius: BorderRadius.circular(35),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 10,
                    ),
                    child: Image.asset(
                      'assets/icons/search1.png',
                      width: 10,
                    ),
                  ),
                  Container(
                    transform: Matrix4.translationValues(0, -2, 0),
                    constraints: const BoxConstraints(maxWidth: 250),
                    child: TextFormField(
                      onEditingComplete: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => TreatmentSearch(
                        //         search: searchController.text),
                        //   ),
                        // );
                        // page = 1;
                        // treatments.clear();
                        // search = searchController.text;
                        // treatments.addAll(await stateTreatment.getAllTreatment(context, page, search: search));
                        // setState(() {});
                      },
                      style: const TextStyle(
                          fontSize: 15, fontFamily: "ProximaNova"),
                      decoration: InputDecoration(
                        hintText: "Cari Transaksi",
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          fontFamily: "ProximaNova",
                          color: fromCssColor(
                            '#9B9B9B',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 25,
          right: 25,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.only(top: 16, bottom: 16),
                    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(color: borderColor),
                    ),
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '12 Jun 2023',
                            style: blackRegulerTextStyle.copyWith(fontSize: 10),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: Color(0xff24A7A0).withOpacity(0.2),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 4, horizontal: 8),
                            child: Text(
                              'Selesai',
                              style: grenTextStyle.copyWith(fontSize: 10),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 48,
                            width: 48,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                    'assets/images/penting1.png',
                                  ),
                                  fit: BoxFit.fill),
                            ),
                          ),
                          SizedBox(
                            width: 14,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Teenderm Hydra 40ml',
                                style: blackTextStyle.copyWith(fontSize: 13),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              RichText(
                                text: TextSpan(
                                  text: '1 Barang',
                                  style:
                                      subTitleTextStyle.copyWith(fontSize: 12),
                                  children: [
                                    TextSpan(
                                      text: ' +2 barang lainnya',
                                      style:
                                          grenTextStyle.copyWith(fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              RichText(
                                text: TextSpan(
                                  text: 'Total :',
                                  style: blackRegulerTextStyle.copyWith(
                                      fontSize: 12),
                                  children: [
                                    TextSpan(
                                      text: ' Rp915.000',
                                      style: grenTextStyle.copyWith(
                                        fontSize: 12,
                                        color: Color(
                                          0xffF76707,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ]),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
