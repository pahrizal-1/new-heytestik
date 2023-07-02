import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';

import '../../theme/theme.dart';
import '../../widget/pencarian_search_widget.dart';

class DaftarAlamatPage extends StatelessWidget {
  const DaftarAlamatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: const EdgeInsets.only(left: 6, right: 6),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: blackColor,
                ),
              ),
              const SizedBox(
                width: 11,
              ),
              Expanded(
                child: Text(
                  'Daftar Alamat',
                  style: blackTextStyle.copyWith(
                    fontSize: 20,
                  ),
                ),
              ),
              Text(
                'Tambah Alamat',
                style: grenTextStyle.copyWith(fontSize: 15),
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: lsymetric,
        child: ListView(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(color: borderColor),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Center(
                      child: TextField(
                        autofocus: true,
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(13),
                            child: Image.asset(
                              'assets/icons/search1.png',
                              width: 12,
                              color: blackColor,
                            ),
                          ),
                          hintText: 'Cari Alamat',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 21,
            ),
            Container(
              padding: const EdgeInsets.only(top: 14, bottom: 21),
              width: 340,
              decoration: BoxDecoration(
                color: subgreenColor,
                borderRadius: BorderRadius.circular(7),
                border: Border.all(color: greenColor),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 12,
                        width: 11,
                        decoration: BoxDecoration(
                          color: greenColor,
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(7),
                            bottomRight: Radius.circular(7),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 11,
                      ),
                      Text(
                        'Rumah',
                        style: blackHigtTextStyle.copyWith(fontSize: 13),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 1),
                        decoration: BoxDecoration(
                          color: greenColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          'Utama',
                          style: whiteTextStyle.copyWith(fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 22, right: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Rina Rasmalina',
                          style: blackHigtTextStyle.copyWith(fontSize: 15),
                        ),
                        Text(
                          'Jalan Sultan Iskandar Muda, no 7A & 7B, RT.9/RW.9, South Kebayoran Lama, Kebayoran Lama, Jakarta 12240',
                          style: blackRegulerTextStyle.copyWith(fontSize: 13),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'assets/icons/map-green.png',
                              width: 20,
                              height: 20,
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Text(
                              'Sudah Pinpoint',
                              style: blackHigtTextStyle.copyWith(fontSize: 13),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 40,
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              side: BorderSide(color: borderColor, width: 1),
                              backgroundColor: whiteColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text('Ubah Alamat',
                                style:
                                    blackHigtTextStyle.copyWith(fontSize: 15)),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 11),
              padding: const EdgeInsets.only(top: 14, bottom: 21),
              width: 340,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(7),
                border: Border.all(color: borderColor),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 12,
                        width: 11,
                        decoration: BoxDecoration(
                          color: greenColor,
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(7),
                            bottomRight: Radius.circular(7),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 11,
                      ),
                      Text(
                        'Kantor',
                        style: blackHigtTextStyle.copyWith(fontSize: 13),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 1),
                        decoration: BoxDecoration(
                          color: greenColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          'Utama',
                          style: whiteTextStyle.copyWith(fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 22, right: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Rina Rasmalina',
                          style: blackHigtTextStyle.copyWith(fontSize: 15),
                        ),
                        Text(
                          'Jalan Sultan Iskandar Muda, no 10RT.9/RW.9, South Kebayoran Lama, Kebayoran Lama, Jakarta 12240',
                          style: blackRegulerTextStyle.copyWith(fontSize: 13),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'assets/icons/map-green.png',
                              width: 20,
                              height: 20,
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Text(
                              'Sudah Pinpoint',
                              style: blackHigtTextStyle.copyWith(fontSize: 13),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 40,
                                child: TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                    side: BorderSide(
                                        color: borderColor, width: 1),
                                    backgroundColor: whiteColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: Text('Ubah Alamat',
                                      style: blackHigtTextStyle.copyWith(
                                          fontSize: 15)),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Container(
                              height: 40,
                              width: 46,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                border: Border.all(color: borderColor),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                    context: context,
                                    backgroundColor: Colors.white,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadiusDirectional.only(
                                        topEnd: Radius.circular(25),
                                        topStart: Radius.circular(25),
                                      ),
                                    ),
                                    builder: (context) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 29, vertical: 42),
                                      child: Wrap(
                                        children: [
                                          Row(
                                            children: [
                                              InkWell(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Image.asset(
                                                    'assets/icons/danger-icons.png',
                                                    width: 14,
                                                  )),
                                              const SizedBox(
                                                width: 11,
                                              ),
                                              Text(
                                                'Pilihan Lainnya',
                                                style: blackHigtTextStyle
                                                    .copyWith(fontSize: 20),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 50,
                                          ),
                                          Text(
                                            'Pilih & Jadikan Alamat Utama',
                                            style: blackHigtTextStyle.copyWith(
                                                fontSize: 18),
                                          ),
                                          const SizedBox(
                                            height: 25,
                                          ),
                                          dividergrey(),
                                          const SizedBox(
                                            height: 25,
                                          ),
                                          Text(
                                            'Hapus Alamat',
                                            style: blackHigtTextStyle.copyWith(
                                                fontSize: 18),
                                          ),
                                          const SizedBox(
                                            height: 25,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                icon: Icon(
                                  Icons.more_horiz_outlined,
                                  color: greyColor,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
