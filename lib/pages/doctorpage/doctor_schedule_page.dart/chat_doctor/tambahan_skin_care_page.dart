import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:heystetik_mobileapps/pages/doctorpage/doctor_schedule_page.dart/chat_doctor/catatan_produk_docter1_page.dart';
import 'package:heystetik_mobileapps/pages/doctorpage/doctor_schedule_page.dart/chat_doctor/tambahan_skin_care2_page.dart';

import '../../../../theme/theme.dart';
import '../../../../widget/card_skincare.dart';
import '../../../../widget/card_widget.dart';
import 'filter_page.dart';

class TambahanSkinCare extends StatefulWidget {
  const TambahanSkinCare({super.key});

  @override
  State<TambahanSkinCare> createState() => _TambahanSkinCareState();
}

class _TambahanSkinCareState extends State<TambahanSkinCare> {
  List img = [
    'assets/images/penting1.png',
    'assets/images/penting2.png',
    'assets/images/produk.png',
    'assets/images/produk2.png'
  ];
  List name = [
    'Teenderm gel sensitive 150 ml',
    'Teenderm Aqua 200 ml',
    'Teenderm Hydra 40 ml',
    'Teenderm Hydra 40 ml'
  ];
  List harga = ['Rp250.000', 'Rp150.000', 'Rp175.000', 'Rp175.000'];
  bool isSelcted = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: blackColor,
          ),
        ),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'TAMBAH SKINCARE',
              style: blackHigtTextStyle.copyWith(fontSize: 20),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CatatanDocter1(),
                  ),
                );
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
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 22, right: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color(0xFFF1F1F1),
                            borderRadius: BorderRadius.circular(7)),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            fillColor: Color(0xfff1f1f1),
                            hintText: 'Indikasi',
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FilterPage(),
                          ),
                        );
                      },
                      child: Image.asset(
                        'assets/icons/corong.png',
                        width: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: const [
                    CardSearch(
                      title: 'Jerawat',
                    ),
                    CardSearch(
                      title: 'Kulit Kusam',
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                const Divider(
                  thickness: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Sort by',
                      style: greyTextStyle.copyWith(fontWeight: bold),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        setState(
                          () {
                            isSelcted = !isSelcted;
                          },
                        );
                      },
                      child: Text(
                        'Brand',
                        style: blackTextStyle.copyWith(fontWeight: bold),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 17,
                ),
              ],
            ),
          ),
          Positioned(
            top: 150,
            left: 0,
            right: 0,
            bottom: 0,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 22, right: 22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Teenderm',
                      style: blackTextStyle.copyWith(fontSize: 15),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 4,
                      itemBuilder: (BuildContext context, int index) {
                        return CardSkincarePrice(
                            nameTitle: name[index],
                            urlImg: img[index],
                            subTitle: 'Cleanser',
                            harga: harga[index],
                            pengguna: 'Pagi&Malam');
                      },
                    ),
                    Text(
                      'Biretix',
                      style: blackTextStyle.copyWith(fontSize: 15),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 4,
                      itemBuilder: (BuildContext context, int index) {
                        return CardSkincarePrice(
                            nameTitle: name[index],
                            urlImg: img[index],
                            subTitle: 'Cleanser',
                            harga: '',
                            pengguna: 'Pagi&Malam');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
