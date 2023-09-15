// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/account/address_controller.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/alamat_page.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';
import '../../theme/theme.dart';

class DaftarAlamatPage extends StatefulWidget {
  const DaftarAlamatPage({super.key});

  @override
  State<DaftarAlamatPage> createState() => _DaftarAlamatPageState();
}

class _DaftarAlamatPageState extends State<DaftarAlamatPage> {
  final AddressController state = Get.put(AddressController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      state.listAddress(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        titleSpacing: 0,
        iconTheme: iconthemeblack(),
        backgroundColor: Colors.transparent,
        title: Row(
          children: [
            Text(
              'Daftar Alamat',
              style: blackTextStyle.copyWith(
                fontSize: 20,
              ),
            ),
            Spacer(),
            InkWell(
              onTap: () {
                Get.to(Alamatpage());
              },
              child: Text(
                'Tambah Alamat',
                style: grenTextStyle.copyWith(fontSize: 15),
              ),
            ),
            SizedBox(
              width: 25,
            )
          ],
        ),
      ),
      body: Padding(
        padding: lsymetric,
        child: Obx(
          () => LoadingWidget(
            isLoading: state.isLoading.value,
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
                            controller: state.searchController,
                            onChanged: (value) {
                              state.onChangeFilterText(value);
                            },
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
                Obx(
                  () => state.filterData.isEmpty
                      ? Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Center(
                            child: Text(
                              'Tidak ada alamat',
                              style: TextStyle(
                                fontWeight: bold,
                                fontFamily: 'ProximaNova',
                                fontSize: 20,
                              ),
                            ),
                          ),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.filterData.length,
                          itemBuilder: (BuildContext context, index) {
                            return cardAddress(
                              context,
                              state.filterData[index].id!.toInt(),
                              state.filterData[index].labelAddress ?? '-',
                              state.filterData[index].recipientName ?? '-',
                              state.filterData[index].completeAddress ?? '-',
                              state.filterData[index].pinpointAddress ?? '-',
                              state.filterData[index].mainAddress!,
                              state.filterData[index],
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget cardAddress(
    BuildContext context,
    int addressId,
    String labelAddress,
    String recipientName,
    String completeAddress,
    String pinPointAddress,
    bool mainAddress,
    dynamic data,
  ) {
    return Container(
      margin: const EdgeInsets.only(top: 11),
      padding: const EdgeInsets.only(top: 14, bottom: 21),
      width: 340,
      decoration: BoxDecoration(
        color: mainAddress ? subgreenColor : whiteColor,
        borderRadius: BorderRadius.circular(7),
        border: Border.all(color: mainAddress ? greenColor : borderColor),
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
                labelAddress,
                style: blackHigtTextStyle.copyWith(fontSize: 13),
              ),
              const SizedBox(
                width: 6,
              ),
              mainAddress
                  ? Container(
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
                    )
                  : Container(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 22, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  recipientName,
                  style: blackHigtTextStyle.copyWith(fontSize: 15),
                ),
                Text(
                  completeAddress,
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
                          onPressed: () {
                            Get.to(Alamatpage(
                              addressId: addressId,
                            ));
                          },
                          style: TextButton.styleFrom(
                            side: BorderSide(color: borderColor, width: 1),
                            backgroundColor: whiteColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            'Ubah Alamat',
                            style: blackHigtTextStyle.copyWith(fontSize: 15),
                          ),
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
                              borderRadius: BorderRadiusDirectional.only(
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
                                            Get.back();
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
                                        style: blackHigtTextStyle.copyWith(
                                            fontSize: 20),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 50,
                                  ),
                                  Obx(
                                    () => LoadingWidget(
                                      isLoading: state.isMinorLoading.value,
                                      child: InkWell(
                                        onTap: () async {
                                          await state.mainAddress(
                                            context,
                                            addressId,
                                            data,
                                          );
                                        },
                                        child: Text(
                                          'Pilih & Jadikan Alamat Utama',
                                          style: blackHigtTextStyle.copyWith(
                                              fontSize: 18),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  dividergrey(),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  Obx(
                                    () => LoadingWidget(
                                      isLoading: state.isLoading.value,
                                      child: InkWell(
                                        onTap: () async {
                                          await state.deleteAddress(
                                            context,
                                            addressId,
                                          );
                                        },
                                        child: Text(
                                          'Hapus Alamat',
                                          style: blackHigtTextStyle.copyWith(
                                              fontSize: 18),
                                        ),
                                      ),
                                    ),
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
    );
  }
}
