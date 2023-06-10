import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

class RekomendasiSkincare3Page extends StatelessWidget {
  const RekomendasiSkincare3Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: greenColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: 20,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Edit Template Skincare",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'ProximaNova',
                    fontWeight: bold,
                    fontSize: 16,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
            InkWell(
              child: Text(
                "SIMPAN",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'ProximaNova',
                  fontWeight: bold,
                  fontSize: 14,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Judul Resep",
                style: TextStyle(
                  fontFamily: "ProximaNova",
                  fontSize: 14,
                  letterSpacing: 0.2,
                  fontWeight: FontWeight.w400,
                  color: fromCssColor("#A3A3A3"),
                ),
              ),
              SizedBox(
                child: TextField(
                  style: TextStyle(
                    fontFamily: "ProximaNova",
                    fontSize: 16,
                    fontWeight: bold,
                    letterSpacing: 0.2,
                    color: fromCssColor(
                        "#323232"), // Ubah dengan warna teks yang diinginkan
                  ),
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: fromCssColor("#A3A3A3"),
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "Resep Rekomendasi",
                style: TextStyle(
                  fontFamily: "ProximaNova",
                  fontSize: 14,
                  letterSpacing: 0.2,
                  fontWeight: FontWeight.w400,
                  color: fromCssColor("#A3A3A3"),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ListView.builder(
                shrinkWrap: true,
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 15,
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
                                border: Border.all(
                                    width: 0.5, color: fromCssColor('#E9E9E9')),
                                image: DecorationImage(
                                  image:
                                      AssetImage("assets/images/produk1.png"),
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
                                  constraints:
                                      const BoxConstraints(maxWidth: 200),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          // color: Colors.amberAccent,
                                          constraints: const BoxConstraints(
                                              maxWidth: 80),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 12),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
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
                                border:
                                    Border.all(color: fromCssColor("#A3A3A3")),
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                        SizedBox(
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
            ],
          ),
        ),
      ),
    );
  }
}
