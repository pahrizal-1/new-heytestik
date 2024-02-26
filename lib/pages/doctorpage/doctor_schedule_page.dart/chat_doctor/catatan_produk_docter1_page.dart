import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:heystetik_mobileapps/pages/doctorpage/doctor_schedule_page.dart/chat_doctor/tambahan_skin_care_page.dart';

import '../../../../theme/theme.dart';

class CatatanDocter1 extends StatefulWidget {
  const CatatanDocter1({super.key});

  @override
  State<CatatanDocter1> createState() => _CatatanDocter1State();
}

class _CatatanDocter1State extends State<CatatanDocter1> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: greenColor,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
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
                  'Catatan Doctor',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'ProximaNova',
                    fontWeight: bold,
                    fontSize: 20,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
            InkWell(
              child: Text(
                'SIMPAN',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'ProximaNova',
                  fontWeight: bold,
                  fontSize: 15,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'dila btw - ',
                    style: blackHigtTextStyle.copyWith(fontSize: 15),
                  ),
                  Text('22 tahun')
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                thickness: 1,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Apakah Profilmu Sudah Benar',
                style: blackTextStyle.copyWith(fontSize: 15),
              ),
              Text(
                'Verifikasi berdasarkan nama, jenis kelamin, dan usia.',
                style: subTitleTextStyle.copyWith(fontSize: 15),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        isSelected = true;
                      });
                    },
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          color: isSelected ? greenColor : whiteColor,
                          border: Border.all(
                            color: subTitleColor,
                          ),
                          shape: BoxShape.circle),
                    ),
                  ),
                  const SizedBox(
                    width: 13,
                  ),
                  const Text('Iya'),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        isSelected = false;
                      });
                    },
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          color: isSelected ? whiteColor : greenColor,
                          border: Border.all(
                            color: subTitleColor,
                          ),
                          shape: BoxShape.circle),
                    ),
                  ),
                  SizedBox(
                    width: 13,
                  ),
                  Text('Tidak'),
                ],
              ),
              const SizedBox(
                height: 31,
              ),
              Text(
                'Gejala*',
                style: blackTextStyle,
              ),
              const SizedBox(
                height: 11,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 17),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: whiteColor,
                  border: Border.all(color: const Color(0xffCCCCCC), width: 1),
                ),
                child: Text(
                  'Konsultasi, kulit abu-abu, dan timbul jerawat akibat penggunaan kosmetik.',
                  style: blackTextStyle.copyWith(fontSize: 15, fontWeight: regular),
                ),
              ),
              const SizedBox(
                height: 11,
              ),
              Text(
                'Kemungkinan Diagnosis*',
                style: blackTextStyle,
              ),
              const SizedBox(
                height: 11,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 17),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: whiteColor,
                  border: Border.all(color: const Color(0xffCCCCCC), width: 1),
                ),
                child: Text(
                  'Acne',
                  style: blackTextStyle.copyWith(fontSize: 15, fontWeight: regular),
                ),
              ),
              const SizedBox(
                height: 11,
              ),
              Text(
                'Diagnosis Sekunder (Opsional)',
                style: blackTextStyle,
              ),
              const SizedBox(
                height: 11,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 17),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: whiteColor,
                  border: Border.all(color: const Color(0xffCCCCCC), width: 1),
                ),
                child: Text(
                  '',
                  style: blackTextStyle.copyWith(fontSize: 15, fontWeight: regular),
                ),
              ),
              SizedBox(
                height: 27,
              ),
              Divider(
                thickness: 1,
              ),
              SizedBox(
                height: 17,
              ),
              ListView.builder(
                shrinkWrap: true,
                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                border: Border.all(width: 0.5, color: greenColor),
                                image: DecorationImage(
                                  image: AssetImage("assets/images/produk1.png"),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  constraints: const BoxConstraints(maxWidth: 200),
                                  child: RichText(
                                    text: TextSpan(
                                      text: "Teenderm gel sensitive 150 ml",
                                      style: TextStyle(
                                        fontFamily: 'ProximaNova',
                                        color: greenColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        height: 1.1,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Penggunaan",
                                      style: TextStyle(
                                        fontFamily: 'ProximaNova',
                                        fontSize: 12,
                                        height: 1.3,
                                        letterSpacing: 0.5,
                                        color: fromCssColor(
                                          '#9B9B9B',
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          // color: Colors.amberAccent,
                                          constraints: const BoxConstraints(maxWidth: 80),
                                          child: Text(
                                            "Pagi & Malam",
                                            style: TextStyle(
                                              fontFamily: 'ProximaNova',
                                              fontSize: 12,
                                              height: 1.3,
                                              letterSpacing: 0.5,
                                              color: fromCssColor(
                                                '#9B9B9B',
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "2 kali / hari",
                                          style: TextStyle(
                                            fontFamily: 'ProximaNova',
                                            fontSize: 12,
                                            height: 1.3,
                                            letterSpacing: 0.5,
                                            color: fromCssColor(
                                              '#9B9B9B',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Rp250.000",
                                      style: TextStyle(
                                        fontFamily: 'ProximaNova',
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.5,
                                        color: fromCssColor(
                                          '#323232',
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 60,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 40,
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "Catatan",
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: greenColor,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: greenColor,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintText: "Cleanser",
                              contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              labelStyle: TextStyle(
                                color: fromCssColor("#A3A3A3"),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/icons/trash.png"),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 30,
                              width: 80,
                              decoration: BoxDecoration(
                                border: Border.all(color: fromCssColor("#A3A3A3")),
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "-",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: bold,
                                        fontFamily: "ProximaNova",
                                        color: fromCssColor("#A3A3A3"),
                                      ),
                                    ),
                                    Text(
                                      "1",
                                      style: TextStyle(
                                        fontFamily: "ProximaNova",
                                        fontSize: 13,
                                        color: fromCssColor("#323232"),
                                      ),
                                    ),
                                    Text(
                                      "+",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: bold,
                                        fontFamily: "ProximaNova",
                                        color: greenColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 48,
                          child: Center(
                            child: Divider(thickness: 1.5),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 45,
                decoration: BoxDecoration(border: Border.all(color: greenColor), borderRadius: BorderRadius.circular(7)),
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TambahanSkinCare(),
                      ),
                    );
                  },
                  child: Text(
                    "+ Tambah Skincare",
                    style: grenTextStyle.copyWith(fontSize: 13),
                  ),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Text(
                'Rekomendasi Treatment',
                style: blackHigtTextStyle.copyWith(fontSize: 20),
              ),
              const SizedBox(
                height: 16,
              ),
              ListView.builder(
                shrinkWrap: true,
                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  constraints: BoxConstraints(maxWidth: 160),
                                  child: RichText(
                                    text: TextSpan(
                                      text: 'Peeling',
                                      style: TextStyle(
                                        fontFamily: 'ProximaNova',
                                        color: greenColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        height: 1.1,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 75,
                                      child: Text(
                                        "Cost",
                                        style: TextStyle(
                                          fontFamily: 'ProximaNova',
                                          fontSize: 12,
                                          height: 1.3,
                                          letterSpacing: 0.5,
                                          color: fromCssColor(
                                            '#9B9B9B',
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      // color: Colors.amberAccent,

                                      child: Text(
                                        'Rp100K-Rp600K',
                                        style: TextStyle(
                                          fontFamily: 'ProximaNova',
                                          fontSize: 12,
                                          height: 1.3,
                                          letterSpacing: 0.5,
                                          color: fromCssColor(
                                            '#9B9B9B',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 75,
                                      child: Text(
                                        "Recov. Time",
                                        style: TextStyle(
                                          fontFamily: 'ProximaNova',
                                          fontSize: 12,
                                          height: 1.3,
                                          letterSpacing: 0.5,
                                          color: fromCssColor(
                                            '#9B9B9B',
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      // color: Colors.amberAccent,

                                      child: Text(
                                        '2-4 hari',
                                        style: TextStyle(
                                          fontFamily: 'ProximaNova',
                                          fontSize: 12,
                                          height: 1.3,
                                          letterSpacing: 0.5,
                                          color: fromCssColor(
                                            '#9B9B9B',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 75,
                                      child: Text(
                                        "Type",
                                        style: TextStyle(
                                          fontFamily: 'ProximaNova',
                                          fontSize: 12,
                                          height: 1.3,
                                          letterSpacing: 0.5,
                                          color: fromCssColor(
                                            '#9B9B9B',
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      // color: Colors.amberAccent,

                                      child: Text(
                                        'Non-Surgical',
                                        style: TextStyle(
                                          fontFamily: 'ProximaNova',
                                          fontSize: 12,
                                          height: 1.3,
                                          letterSpacing: 0.5,
                                          color: fromCssColor(
                                            '#9B9B9B',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: 'Lihat daftar klinik',
                                    style: TextStyle(
                                      fontFamily: 'ProximaNova',
                                      color: greenColor,
                                      fontSize: 13,
                                      height: 1.1,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/icons/trash.png"),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 35,
                        child: Center(
                          child: Divider(
                            thickness: 1,
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 45,
                decoration: BoxDecoration(border: Border.all(color: greenColor), borderRadius: BorderRadius.circular(7)),
                child: OutlinedButton(
                  onPressed: null,
                  child: Text(
                    "+ Tambah Treatment",
                    style: grenTextStyle.copyWith(fontSize: 13),
                  ),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
