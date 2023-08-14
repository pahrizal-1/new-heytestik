import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/pages/doctorpage/doctor_schedule_page.dart/chat_doctor/filter2_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/card_widget.dart';

class FilterTambahObat extends StatelessWidget {
  const FilterTambahObat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
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
                    size: 22,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Filter",
                  style: TextStyle(
                    fontFamily: 'ProximaNova',
                    fontWeight: bold,
                    fontSize: 20,
                    color: blackColor,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                transform: Matrix4.translationValues(0, -5, 0),
                child: Divider(
                  thickness: 1,
                ),
              ),
              Text(
                "Golongan Obat",
                style: TextStyle(
                  fontFamily: "Proximanova",
                  fontSize: 20,
                  letterSpacing: 1,
                  fontWeight: bold,
                  color: blackColor,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Wrap(
                runSpacing: 12,
                children: [
                  CardFilter(
                    title: "Obat Keras (Merah)",
                    width: 150,
                  ),
                  CardFilter(
                    title: "Obat Keras (Hijau)",
                    width: 150,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  CardFilter(title: "Surgical")
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Golongan Obat",
                style: TextStyle(
                  fontFamily: "Proximanova",
                  fontSize: 20,
                  letterSpacing: 1,
                  fontWeight: bold,
                  color: blackColor,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Wrap(
                children: [
                  CardFilter(title: "Tablet"),
                  SizedBox(
                    width: 5,
                  ),
                  CardFilter(title: "Oles")
                ],
              ),
              SizedBox(
                height: 39,
              ),
              Text(
                "Kemasan",
                style: TextStyle(
                  fontFamily: "Proximanova",
                  fontSize: 20,
                  letterSpacing: 1,
                  fontWeight: bold,
                  color: blackColor,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Wrap(
                children: [
                  CardFilter(title: "Botol"),
                  SizedBox(
                    width: 5,
                  ),
                  CardFilter(title: "Brister")
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Range Harga",
                style: TextStyle(
                  fontFamily: "Proximanova",
                  fontSize: 20,
                  letterSpacing: 0.5,
                  fontWeight: bold,
                  color: blackColor,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 30,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          fillColor: greenColor,
                          hoverColor: greenColor,
                          hintText: 'Min.',
                          hintStyle:
                              TextStyle(color: subgreyColor, fontSize: 12),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: greenColor,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(7)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                          ),
                          contentPadding: const EdgeInsets.all(12),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 13,
                  ),
                  Text(
                    'hingga',
                    style: subGreyTextStyle,
                  ),
                  SizedBox(
                    width: 13,
                  ),
                  Expanded(
                    child: Container(
                      height: 30,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          fillColor: greenColor,
                          hoverColor: greenColor,
                          hintText: 'Max',
                          hintStyle:
                              TextStyle(color: subgreyColor, fontSize: 12),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: greenColor,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(7)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                          ),
                          contentPadding: const EdgeInsets.all(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 115,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 150,
                    height: 35,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: TextButton.styleFrom(
                        side: BorderSide(color: greenColor, width: 2),
                        backgroundColor: whiteColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        "Batal",
                        style: TextStyle(
                          fontSize: 13,
                          color: greenColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    height: 35,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Filter2Page(),
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: greenColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        "Tampilkan",
                        style: TextStyle(
                          fontSize: 13,
                          color: whiteColor,
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
