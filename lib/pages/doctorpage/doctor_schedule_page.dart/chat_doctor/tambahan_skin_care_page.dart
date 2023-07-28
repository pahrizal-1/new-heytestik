import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/pages/doctorpage/doctor_schedule_page.dart/chat_doctor/catatan_produk_docter1_page.dart';

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
      backgroundColor: whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: blackColor,
                size: 24,
              ),
            ),
            const SizedBox(
              width: 9,
            ),
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
                      child: TextFormField(
                        decoration: InputDecoration(
                          isDense: true,
                          fillColor: Color(0xffF1F1F1),
                          filled: true,
                          contentPadding: EdgeInsets.only(right: 18),
                          hintText: 'Indikasi',
                          prefixIcon: Icon(
                            Icons.search,
                            color: greyColor,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
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
                        height: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                const Row(
                  children: [
                    CardSearch(
                      title: 'Jerawat',
                    ),
                    SizedBox(
                      width: 11,
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
                const SizedBox(
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
                      physics: const NeverScrollableScrollPhysics(),
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
                      physics: const NeverScrollableScrollPhysics(),
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
