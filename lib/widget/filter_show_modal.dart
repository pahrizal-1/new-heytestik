import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/card_widget.dart';

class FilterShowModal extends StatelessWidget {
  const FilterShowModal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 36, bottom: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Filter',
            style: blackHigtTextStyle.copyWith(fontSize: 20),
          ),
          const SizedBox(
            height: 31,
          ),
          Text(
            'Pilihan Klinik',
            style: blackTextStyle.copyWith(fontSize: 15),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: const [
              CardSearch(
                title: 'Promo',
              ),
              SizedBox(
                width: 10,
              ),
              CardSearch(
                title: 'Buka Sekarang',
              ),
            ],
          ),
          const SizedBox(
            height: 28,
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    fillColor: greenColor,
                    hoverColor: greenColor,
                    hintText: 'Min.',
                    hintStyle: TextStyle(color: subgreyColor, fontSize: 12),
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
              const SizedBox(
                width: 13,
              ),
              Text(
                'hingga',
                style: subGreyTextStyle,
              ),
              const SizedBox(
                width: 13,
              ),
              Expanded(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    fillColor: greenColor,
                    hoverColor: greenColor,
                    hintText: 'Max',
                    hintStyle: TextStyle(color: subgreyColor, fontSize: 12),
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
            ],
          ),
          const SizedBox(
            height: 29,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 165,
                    decoration: BoxDecoration(
                        border: Border.all(color: greenColor),
                        borderRadius: BorderRadius.circular(7)),
                    height: 50,
                    child: Center(
                      child: Text(
                        'Batal',
                        style: grenTextStyle.copyWith(
                            fontSize: 15, fontWeight: bold),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    width: 165,
                    decoration: BoxDecoration(
                        color: greenColor,
                        border: Border.all(color: greenColor),
                        borderRadius: BorderRadius.circular(7)),
                    height: 50,
                    child: Center(
                      child: Text(
                        'Simpan',
                        style: whiteTextStyle.copyWith(
                            fontSize: 15, fontWeight: bold),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
