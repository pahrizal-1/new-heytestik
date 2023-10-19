import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';

import '../theme/theme.dart';

class PencarianPageWidget extends StatelessWidget {
  final Function()? onEditingComplete;
  final TextEditingController? searchController;

  const PencarianPageWidget({
    super.key,
    this.onEditingComplete,
    this.searchController,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: blackColor,
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  color: subwhiteColor,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Center(
                  child: TextField(
                    controller: searchController,
                    onEditingComplete: () {
                      onEditingComplete == null ? () {} : onEditingComplete!();
                      Navigator.pop(context);
                    },
                    autofocus: true,
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(14),
                        child: Image.asset(
                          'assets/icons/search1.png',
                          width: 12,
                          color: blackColor,
                        ),
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(10),
                        child: SvgPicture.asset(
                          'assets/icons/x-circle-icons.svg',
                        ),
                      ),
                      hintText: 'Search...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(26),
        child: ListView(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/search.svg',
                      width: 10,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Laser',
                      style: blackRegulerTextStyle.copyWith(color: blackColor),
                    )
                  ],
                ),
                dividergrey()
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/search.svg',
                      width: 10,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Laser',
                      style: blackRegulerTextStyle.copyWith(color: blackColor),
                    ),
                    Text(
                      ' C02',
                      style: subTitleTextStyle.copyWith(fontSize: 15),
                    )
                  ],
                ),
                dividergrey()
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            // Column(
            //   children: [
            //     Row(
            //       children: [
            //         Text(
            //           'Cari “Laser” di',
            //           style: grenTextStyle.copyWith(fontWeight: regular, fontSize: 15),
            //         ),
            //         Text(
            //           ' Klinik',
            //           style: grenTextStyle.copyWith(fontWeight: bold, fontSize: 15),
            //         ),
            //       ],
            //     ),
            //     dividergrey()
            //   ],
            // ),
            const SizedBox(
              height: 10,
            ),
            // Column(
            //   children: [
            //     Row(
            //       children: [
            //         Text(
            //           'Cari “Laser” di',
            //           style: grenTextStyle.copyWith(fontWeight: regular, fontSize: 15),
            //         ),
            //         Text(
            //           ' Treatment',
            //           style: grenTextStyle.copyWith(fontWeight: bold, fontSize: 15),
            //         ),
            //       ],
            //     ),
            //     dividergrey()
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
