import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:heystetik_mobileapps/widget/card_tittle_filter.dart';
import 'package:heystetik_mobileapps/widget/card_widget.dart';
import 'package:heystetik_mobileapps/widget/text_form_widget.dart';

import '../pages/chat_customer/search_klink_page.dart';
import '../theme/theme.dart';
import 'button_widget.dart';

class MoreDialogFilter extends StatefulWidget {
  const MoreDialogFilter({super.key});

  @override
  State<MoreDialogFilter> createState() => _MoreDialogFilterState();
}

class _MoreDialogFilterState extends State<MoreDialogFilter> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AlertDialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(0),
        alignment: Alignment.center,
        content: Container(
          height: 600,
          color: whiteColor,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 35),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back_outlined,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Filter',
                      style: blackTextStyle.copyWith(fontSize: 20),
                    )
                  ],
                ),
                const SizedBox(
                  height: 43,
                ),
                Text(
                  'Urutkan',
                  style: blackTextStyle.copyWith(fontSize: 15),
                ),
                const SizedBox(
                  height: 10,
                ),
                Wrap(
                  direction: Axis.horizontal,
                  children: const [CardTitle()],
                ),
                const SizedBox(
                  height: 43,
                ),
                Text(
                  'Pilihan Klinik',
                  style: blackTextStyle.copyWith(fontSize: 15),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    CardSearch(
                      title: 'Promo',
                    ),
                    CardSearch(
                      title: 'Buka Sekarang',
                    ),
                  ],
                ),
                const SizedBox(
                  height: 43,
                ),
                Text(
                  'Pilihan Klinik',
                  style: blackTextStyle.copyWith(fontSize: 15),
                ),
                const SizedBox(
                  height: 10,
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
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SearchKlinkPage(),
                            ),
                          );
                        },
                        child: Container(
                          height: 50,
                          // width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: whiteColor,
                            border: Border.all(color: greenColor),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Center(
                            child: Text('Batal',
                                style:
                                    TextStyle(color: greenColor, fontSize: 15)),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SearchKlinkPage(),
                            ),
                          );
                        },
                        child: Container(
                          height: 50,
                          // width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: greenColor,
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Center(
                            child: Text(
                              'Tampilkan',
                              style: TextStyle(color: whiteColor, fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
