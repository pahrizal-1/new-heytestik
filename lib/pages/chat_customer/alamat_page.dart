// ignore_for_file: must_be_immutable, use_build_context_synchronously, invalid_use_of_protected_member, prefer_null_aware_operators

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/account/address_controller.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/appar_cutome.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';

class Alamatpage extends StatefulWidget {
  int addressId;
  String? prov;
  String? kota;
  String? kec;
  Alamatpage({
    this.addressId = 0,
    this.prov = '',
    this.kota = '',
    this.kec = '',
    super.key,
  });

  @override
  State<Alamatpage> createState() => _AlamatpageState();
}

class _AlamatpageState extends State<Alamatpage> {
  final AddressController state = Get.put(AddressController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      state.isLoading.value = true;
      state.clearForm();
      await state.getProvince(context);
      if (widget.addressId != 0) {
        await state.getCity(
          context,
          widget.prov.toString(),
        );
        await state.getSubdistrict(
          context,
          widget.prov.toString(),
          widget.kota.toString(),
        );
        await state.getZipcode(
          context,
          widget.prov.toString(),
          widget.kota.toString(),
          widget.kec.toString(),
        );
        await state.findAddress(context, widget.addressId);
      }
      state.isLoading.value = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBarCustome(
        title: 'Alamat',
        colorIcons: whiteColor,
        colorTitle: whiteColor,
        bgColor: greenColor,
      ),
      body: Obx(
        () => LoadingWidget(
          isLoading: state.isLoading.value,
          child: SingleChildScrollView(
            child: Padding(
              padding: lsymetric.copyWith(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Informasi Penerima',
                    style: blackHigtTextStyle.copyWith(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Container(
                    height: 40,
                    child: TextFormField(
                      maxLength: 30,
                      controller: state.recipientName,
                      onChanged: (value) {
                        if (state.recipientName.text.length <= 30) {
                          setState(() {});
                        }
                      },
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: 10, left: 9),
                          counterText: '',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                            borderSide: BorderSide(color: borderColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                            borderSide: BorderSide(color: borderColor),
                          ),
                          labelText: 'Nama Lengkap',
                          labelStyle: subTitleTextStyle,
                          suffix: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child:
                                Text('${state.recipientName.text.length}/30'),
                          ),
                          suffixStyle: greyTextStyle.copyWith(
                              fontSize: 12, fontWeight: regular)),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    height: 40,
                    child: TextFormField(
                      controller: state.recipientPhone,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                          borderSide: BorderSide(color: borderColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                          borderSide: BorderSide(color: borderColor),
                        ),
                        labelText: 'Nomer Hp Penerima*',
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 11),
                          child: Text(
                            '+62',
                            style: blackHigtTextStyle.copyWith(fontSize: 15),
                          ),
                        ),
                        labelStyle: subTitleTextStyle,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: spaceHeigt,
                  ),
                  Text(
                    'Informasi Alamat',
                    style: blackHigtTextStyle.copyWith(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Text(
                    'Pinpoint*',
                    style: blackTextStyle,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 18),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: borderColor,
                      ),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/maps11.svg',
                          width: 20,
                        ),
                        const SizedBox(
                          width: 18,
                        ),
                        Container(
                          constraints: const BoxConstraints(maxWidth: 160),
                          child: Obx(
                            () => Text(
                              state.pinpointAddress.value,
                              style: blackRegulerTextStyle,
                            ),
                          ),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () async {
                            if (state.pinpointAddress.value.isEmpty ||
                                state.pinpointAddress.value == '') {
                              await state.getCurrentPosition(context);
                            }
                            await _showModal(context);
                          },
                          child: Obx(
                            () => LoadingWidget(
                              isLoading: state.isLoadingCheck.value,
                              child: Text(
                                state.pinpointAddress.value.isEmpty ||
                                        state.pinpointAddress.value == ''
                                    ? 'CEK'
                                    : 'UBAH',
                                style: grenTextStyle.copyWith(fontSize: 12),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0XFFCCCCCC)),
                        borderRadius: BorderRadius.circular(7)),
                    child: DropdownButton<String?>(
                      underline: Container(),
                      value:
                          state.prov!.value.isEmpty ? null : state.prov?.value,
                      hint: Text(
                        'Provinsi',
                        style: blackTextStyle.copyWith(
                            color: const Color(0xff323232), fontWeight: medium),
                      ),
                      elevation: 0,
                      isExpanded: true,
                      items: state.province.value
                          .map<DropdownMenuItem<String>>(
                            (e) => DropdownMenuItem<String>(
                              value: e.province.toString(),
                              child: Text(
                                e.province.toString(),
                                style: blackTextStyle,
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: ((value) {
                        if (value != null) {
                          state.prov?.value = value;
                          state.kot?.value = "";
                          state.kec?.value = "";
                          state.kodePos?.value = "";
                          state.getCity(context, state.prov!.value);
                          setState(() {});
                        }
                      }),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0XFFCCCCCC)),
                        borderRadius: BorderRadius.circular(7)),
                    child: DropdownButton<String?>(
                      underline: Container(),
                      value: state.kot!.value.isEmpty ? null : state.kot?.value,
                      hint: Text(
                        'Kabupaten / Kota',
                        style: blackTextStyle.copyWith(
                            color: const Color(0xff323232), fontWeight: medium),
                      ),
                      elevation: 0,
                      isExpanded: true,
                      items: state.city.value
                          .map<DropdownMenuItem<String>>(
                            (e) => DropdownMenuItem<String>(
                              value: e.city.toString(),
                              child: Text(
                                e.city.toString(),
                                style: blackTextStyle,
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: ((value) {
                        if (value != null) {
                          state.kot?.value = value;
                          state.kec?.value = "";
                          state.kodePos?.value = "";
                          state.getSubdistrict(
                              context, state.prov!.value, state.kot!.value);
                          setState(() {});
                        }
                      }),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0XFFCCCCCC)),
                        borderRadius: BorderRadius.circular(7)),
                    child: DropdownButton<String?>(
                      underline: Container(),
                      value: state.kec!.value.isEmpty ? null : state.kec?.value,
                      hint: Text(
                        'Kecamatan',
                        style: blackTextStyle.copyWith(
                            color: const Color(0xff323232), fontWeight: medium),
                      ),
                      elevation: 0,
                      isExpanded: true,
                      items: state.subdistrict.value
                          .map<DropdownMenuItem<String>>(
                            (e) => DropdownMenuItem<String>(
                              value: e.subdistrict.toString(),
                              child: Text(
                                e.subdistrict.toString(),
                                style: blackTextStyle,
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: ((value) {
                        if (value != null) {
                          state.kec?.value = value;
                          state.kodePos?.value = "";
                          state.getZipcode(context, state.prov!.value,
                              state.kot!.value, state.kec!.value);
                          setState(() {});
                        }
                      }),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0XFFCCCCCC)),
                        borderRadius: BorderRadius.circular(7)),
                    child: DropdownButton<String?>(
                      underline: Container(),
                      value: state.kodePos!.value.isEmpty
                          ? null
                          : state.kodePos?.value,
                      hint: Text(
                        'Kode Pos',
                        style: blackTextStyle.copyWith(
                            color: const Color(0xff323232), fontWeight: medium),
                      ),
                      elevation: 0,
                      isExpanded: true,
                      items: state.zipcode.value
                          .map<DropdownMenuItem<String>>(
                            (e) => DropdownMenuItem<String>(
                              value: e.fullZipCode.toString(),
                              child: Text(
                                e.fullZipCode.toString(),
                                style: blackTextStyle,
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: ((value) {
                        if (value != null) {
                          state.kodePos?.value = value;
                          setState(() {});
                        }
                      }),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 40,
                    child: TextFormField(
                      maxLength: 30,
                      controller: state.labelAddress,
                      onChanged: (value) {
                        if (state.labelAddress.text.length <= 30) {
                          setState(() {});
                        }
                      },
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: 10, left: 9),
                          counterText: '',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                            borderSide: BorderSide(color: borderColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                            borderSide: BorderSide(color: borderColor),
                          ),
                          labelText: 'Label Alamat',
                          labelStyle: subTitleTextStyle,
                          suffix: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Text('${state.labelAddress.text.length}/30'),
                          ),
                          suffixStyle: greyTextStyle.copyWith(
                              fontSize: 12, fontWeight: regular)),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 101,
                    child: TextFormField(
                      controller: state.completeAddress,
                      maxLines: 10,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                          borderSide: BorderSide(color: borderColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                          borderSide: BorderSide(color: borderColor),
                        ),
                        labelText: 'Alamat Lengkap*',
                        labelStyle: subTitleTextStyle,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 60,
                    child: TextFormField(
                      controller: state.noteForCourier,
                      maxLength: 30,
                      onChanged: (value) {
                        if (state.noteForCourier.text.length <= 30) {
                          setState(() {});
                        }
                      },
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: 10, left: 9),
                          counterText: '',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                            borderSide: BorderSide(color: borderColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                            borderSide: BorderSide(color: borderColor),
                          ),
                          labelText: 'Catatan untuk kurir',
                          labelStyle: subTitleTextStyle,
                          suffix: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child:
                                Text('${state.noteForCourier.text.length}/30'),
                          ),
                          suffixStyle: greyTextStyle.copyWith(
                              fontSize: 12, fontWeight: regular)),
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Obx(
                    () => LoadingWidget(
                      isLoading: state.isMinorLoading.value,
                      child: ButtonGreenWidget(
                        title: 'Simpan',
                        onPressed: () async {
                          if (widget.addressId != 0) {
                            await state.updateAddress(
                                context, widget.addressId);
                            return;
                          }
                          await state.saveddress(context);
                        },
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
        ),
      ),
    );
  }

  _showModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 600,
          child: Center(
            child: OpenStreetMapSearchAndPick(
              center: LatLong(
                  state.pinpointLatitude.value, state.pinpointLongitude.value),
              buttonColor: greenColor,
              buttonText: 'Set Current Location',
              onPicked: (pickedData) {
                Navigator.pop(context);
                setState(() {
                  state.pinpointAddress.value = pickedData.addressName;
                  state.pinpointLatitude.value = pickedData.latLong.latitude;
                  state.pinpointLongitude.value = pickedData.latLong.longitude;
                });

                print("pinpointAddress ${state.pinpointAddress.value}");
                print("latitude ${state.pinpointLatitude.value}");
                print("longitude ${state.pinpointLongitude.value}");
              },
            ),
          ),
        );
      },
    );
  }
}
