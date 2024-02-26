// ignore_for_file: use_build_context_synchronously, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/location_permission.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/models/customer/zipcode_address_model.dart'
    as Zipcode;
import 'package:heystetik_mobileapps/models/customer/address_by_id_model.dart'
    as ByID;
import 'package:heystetik_mobileapps/models/customer/city_address_model.dart'
    as City;
import 'package:heystetik_mobileapps/models/customer/list_address_model.dart';
import 'package:heystetik_mobileapps/models/customer/province_address_model.dart'
    as Province;
import 'package:heystetik_mobileapps/models/customer/subdistrict_address_model.dart'
    as Sub;

import 'package:heystetik_mobileapps/service/customer/address/address_service.dart';
import 'package:heystetik_mobileapps/widget/snackbar_widget.dart';

class AddressController extends StateClass {
  TextEditingController searchController = TextEditingController();
  TextEditingController recipientName = TextEditingController();
  TextEditingController recipientPhone = TextEditingController();
  TextEditingController labelAddress = TextEditingController();
  TextEditingController completeAddress = TextEditingController();
  TextEditingController noteForCourier = TextEditingController();
  RxString pinpointAddress = ''.obs;
  RxDouble pinpointLatitude = 0.0.obs;
  RxDouble pinpointLongitude = 0.0.obs;

  RxBool isChange = false.obs;

  Rx<ListAddressModel> data = ListAddressModel().obs;
  RxList<Data> filterData = List<Data>.empty().obs;

  RxList<Province.Data> province = List<Province.Data>.empty().obs;
  RxList<City.Data> city = List<City.Data>.empty().obs;
  RxList<Sub.Data> subdistrict = List<Sub.Data>.empty().obs;
  RxList<Zipcode.Data> zipcode = List<Zipcode.Data>.empty().obs;

  RxString? prov = "".obs;
  RxString? kot = "".obs;
  RxString? kec = "".obs;
  RxString? desa = "".obs;
  RxString? kodePos = "".obs;

  Rx<ByID.AddressByIdModel> detail = ByID.AddressByIdModel().obs;

  RxBool isLoadingCheck = false.obs;
  RxBool isLoadingDelete = false.obs;

  listAddress(BuildContext context) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      data.value = await AddressService().listAddress();
      filterData.value = data.value.data!;
      filterData.refresh();
    });
    isLoading.value = false;
  }

  Future<dynamic> getProvince(BuildContext context) async {
    // isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var res = await AddressService().getProvince();
      province.value = res.data!;
    });
    // isLoading.value = false;
  }

  Future<dynamic> getCity(BuildContext context, String province) async {
    // isLoadingCity.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var res = await AddressService().getCity(province);
      city.value = res.data!;
    });
    // isLoadingCity.value = false;
    return data;
  }

  Future<dynamic> getSubdistrict(
      BuildContext context, String province, String city) async {
    // isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var res = await AddressService().getSubdistrict(province, city);
      subdistrict.value = res.data!;
    });
    // isLoading.value = false;
  }

  Future<dynamic> getZipcode(BuildContext context, String province, String city,
      String subdistrict) async {
    // isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var res = await AddressService().getZipcode(province, city, subdistrict);
      zipcode.value = res.data!;
    });
    // isLoading.value = false;
  }

  onChangeFilterText(String value) {
    filterData.value = data.value.data!.where((element) {
      return element.recipientName!
              .toLowerCase()
              .contains(value.toLowerCase()) ||
          element.labelAddress!.toLowerCase().contains(value.toLowerCase()) ||
          element.completeAddress!.toLowerCase().contains(value.toLowerCase());
    }).toList();
  }

  findAddress(BuildContext context, int id) async {
    // isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      detail.value = await AddressService().findAddress(id);
      print(detail.value.data!);
      if (detail.value.success! && detail.value.message == 'Success') {
        recipientName.text = detail.value.data?.recipientName ?? '-';
        recipientPhone.text = detail.value.data?.recipientPhone ?? '-';
        pinpointLatitude.value = detail.value.data?.pinpointLatitude ?? 0.0;
        pinpointLongitude.value = detail.value.data?.pinpointLongitude ?? 0.0;
        pinpointAddress.value = detail.value.data?.pinpointAddress ?? '-';
        labelAddress.text = detail.value.data?.labelAddress ?? '-';
        completeAddress.text = detail.value.data?.completeAddress ?? '-';
        noteForCourier.text = detail.value.data?.noteForCourier ?? '-';
        prov?.value = detail.value.data?.province ?? '-';
        kot?.value = detail.value.data?.city ?? '-';
        kec?.value = detail.value.data?.subdistrict ?? '-';
        desa?.value = detail.value.data?.village ?? '-';
        kodePos?.value =
            '${detail.value.data?.village} - ${detail.value.data?.zipCode}';
      }
    });
    // isLoading.value = false;
  }

  Future<void> getCurrentPosition(BuildContext context) async {
    isLoadingCheck.value = true;
    final hasPermission = await locationPermission(context);
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      pinpointLatitude.value = position.latitude;
      print('pinpointLatitude ${pinpointLatitude.value}');
      pinpointLongitude.value = position.longitude;
      print('pinpointLongitude ${pinpointLongitude.value}');

      // getAddressFromLatLng(position);
    }).catchError((e) {
      debugPrint('error euy $e');
    });
    isLoadingCheck.value = false;
  }

  // INI GA KEPAKE, KARENA UDAH DI HANDEL SAMA MAPS

  // Future getAddressFromLatLng(Position position) async {
  //   await placemarkFromCoordinates(
  //           pinpointLatitude.value, pinpointLongitude.value)
  //       .then((List<Placemark> placemarks) {
  //     Placemark place = placemarks[0];
  //     pinpointAddress.value =
  //         '${place.street}, ${place.subLocality}, ${place.locality}, ${place.subAdministrativeArea}, ${place.country}, ${place.postalCode}';
  //   }).catchError((e) {
  //     debugPrint('error euy $e');
  //   });
  // }

  clearForm() {
    recipientName.clear();
    recipientPhone.clear();
    labelAddress.clear();
    completeAddress.clear();
    noteForCourier.clear();
    pinpointAddress.value = '';
    pinpointLatitude.value = 0.0;
    pinpointLongitude.value = 0.0;
    prov?.value = '';
    kot?.value = '';
    kec?.value = '';
    kodePos?.value = '';
    desa?.value = '';
    province.clear();
    city.clear();
    subdistrict.clear();
    zipcode.clear();
  }

  saveddress(BuildContext context) async {
    isMinorLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      if (recipientName.text.isEmpty) {
        throw ErrorConfig(
          cause: ErrorConfig.userInput,
          message: 'Nama lengkap harus diisi',
        );
      }
      if (recipientPhone.text.isEmpty) {
        throw ErrorConfig(
          cause: ErrorConfig.userInput,
          message: 'Nomor hp harus diisi',
        );
      }
      if (pinpointLatitude.value == 0.0) {
        throw ErrorConfig(
          cause: ErrorConfig.userInput,
          message: 'Pin point latitude harus diisi',
        );
      }
      if (pinpointLongitude.value == 0.0) {
        throw ErrorConfig(
          cause: ErrorConfig.userInput,
          message: 'Pin point longitude harus diisi',
        );
      }
      if (pinpointAddress.value.isEmpty) {
        throw ErrorConfig(
          cause: ErrorConfig.userInput,
          message: 'Pin point address harus diisi',
        );
      }
      if (prov!.value.isEmpty) {
        throw ErrorConfig(
          cause: ErrorConfig.userInput,
          message: 'Provinsi harus diisi',
        );
      }
      if (kot!.value.isEmpty) {
        throw ErrorConfig(
          cause: ErrorConfig.userInput,
          message: 'Kab/Kota harus diisi',
        );
      }
      if (kec!.value.isEmpty) {
        throw ErrorConfig(
          cause: ErrorConfig.userInput,
          message: 'Kecamatan harus diisi',
        );
      }
      if (kodePos!.value.isEmpty) {
        throw ErrorConfig(
          cause: ErrorConfig.userInput,
          message: 'Kode Pos harus diisi',
        );
      }
      if (labelAddress.text.isEmpty) {
        throw ErrorConfig(
          cause: ErrorConfig.userInput,
          message: 'Label alamat harus diisi',
        );
      }
      if (completeAddress.text.isEmpty) {
        throw ErrorConfig(
          cause: ErrorConfig.userInput,
          message: 'Alamat lengkap harus diisi',
        );
      }
      // if (noteForCourier.text.isEmpty) {
      //   throw ErrorConfig(
      //     cause: ErrorConfig.userInput,
      //     message: 'Catatan harus diisi',
      //   );
      // }

      var req = {
        "recipient_name": recipientName.text,
        "recipient_phone": recipientPhone.text,
        "province": prov?.value,
        "city": kot?.value,
        "subdistrict": kec?.value,
        "village": kodePos?.value,
        "zip_code": kodePos?.value,
        "pinpoint_latitude": pinpointLatitude.value,
        "pinpoint_longitude": pinpointLongitude.value,
        "pinpoint_address": pinpointAddress.value,
        "complete_address": completeAddress.text,
        "label_address": labelAddress.text,
        "note_for_courier": noteForCourier.text,
        "main_address": false
      };
      print('req $req');

      detail.value = await AddressService().saveAddress(req);
      print(detail.value.data!);

      if (detail.value.success != true && detail.value.message != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: detail.value.message.toString(),
        );
      }

      SnackbarWidget.getSuccessSnackbar(
        context,
        'Berhasil',
        'Alamat berhasil disimpan',
      );
      Get.back(result: true);
      await listAddress(context);
      await Future.delayed(const Duration(seconds: 1));
      clearForm();
    });
    isMinorLoading.value = false;
  }

  updateAddress(BuildContext context, int id) async {
    isMinorLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      if (recipientName.text.isEmpty) {
        throw ErrorConfig(
          cause: ErrorConfig.userInput,
          message: 'Nama lengkap harus diisi',
        );
      }
      if (recipientPhone.text.isEmpty) {
        throw ErrorConfig(
          cause: ErrorConfig.userInput,
          message: 'Nomor hp harus diisi',
        );
      }
      if (pinpointLatitude.value == 0.0) {
        throw ErrorConfig(
          cause: ErrorConfig.userInput,
          message: 'Pin point latitude harus diisi',
        );
      }
      if (pinpointLongitude.value == 0.0) {
        throw ErrorConfig(
          cause: ErrorConfig.userInput,
          message: 'Pin point longitude harus diisi',
        );
      }
      if (pinpointAddress.value.isEmpty) {
        throw ErrorConfig(
          cause: ErrorConfig.userInput,
          message: 'Pin point address harus diisi',
        );
      }
      if (prov!.value.isEmpty) {
        throw ErrorConfig(
          cause: ErrorConfig.userInput,
          message: 'Provinsi harus diisi',
        );
      }
      if (kot!.value.isEmpty) {
        throw ErrorConfig(
          cause: ErrorConfig.userInput,
          message: 'Kab/Kota harus diisi',
        );
      }
      if (kec!.value.isEmpty) {
        throw ErrorConfig(
          cause: ErrorConfig.userInput,
          message: 'Kecamatan harus diisi',
        );
      }
      if (kodePos!.value.isEmpty) {
        throw ErrorConfig(
          cause: ErrorConfig.userInput,
          message: 'Kode Pos harus diisi',
        );
      }
      if (labelAddress.text.isEmpty) {
        throw ErrorConfig(
          cause: ErrorConfig.userInput,
          message: 'Label alamat harus diisi',
        );
      }
      if (completeAddress.text.isEmpty) {
        throw ErrorConfig(
          cause: ErrorConfig.userInput,
          message: 'Alamat lengkap harus diisi',
        );
      }
      // if (noteForCourier.text.isEmpty) {
      //   throw ErrorConfig(
      //     cause: ErrorConfig.userInput,
      //     message: 'Catatan harus diisi',
      //   );
      // }

      var req = {
        "recipient_name": recipientName.text,
        "recipient_phone": recipientPhone.text,
        "province": prov?.value,
        "city": kot?.value,
        "subdistrict": kec?.value,
        "village": kodePos?.value,
        "zip_code": kodePos?.value,
        "pinpoint_latitude": pinpointLatitude.value,
        "pinpoint_longitude": pinpointLongitude.value,
        "pinpoint_address": pinpointAddress.value,
        "complete_address": completeAddress.text,
        "label_address": labelAddress.text,
        "note_for_courier": noteForCourier.text,
        "main_address": false
      };
      print('req $req');

      detail.value = await AddressService().updateAddress(id, req);
      print(detail.value.data!);
      if (detail.value.success != true && detail.value.message != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: detail.value.message.toString(),
        );
      }
      SnackbarWidget.getSuccessSnackbar(
        context,
        'Berhasil',
        'Alamat berhasil diubah',
      );
      Get.back();
      await listAddress(context);
      await Future.delayed(const Duration(seconds: 1));
      clearForm();
    });
    isMinorLoading.value = false;
  }

  mainAddress(BuildContext context, int id, Data data) async {
    isMinorLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      await findAddress(context, id);
      var req = {
        "recipient_name": recipientName.text,
        "recipient_phone": recipientPhone.text,
        "province": prov?.value,
        "city": kot?.value,
        "subdistrict": kec?.value,
        "village": desa?.value,
        "zip_code": kodePos?.value,
        "pinpoint_latitude": pinpointLatitude.value,
        "pinpoint_longitude": pinpointLongitude.value,
        "pinpoint_address": pinpointAddress.value,
        "complete_address": completeAddress.text,
        "label_address": labelAddress.text,
        "note_for_courier": noteForCourier.text,
        "main_address": true
      };
      print('req $req');
      detail.value = await AddressService().updateAddress(id, req);
      print(detail.value.data!);
      if (detail.value.success != true && detail.value.message != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: detail.value.message.toString(),
        );
      }
      SnackbarWidget.getSuccessSnackbar(
        context,
        'Berhasil',
        'Berhasil diubah menjadi alamat utama',
      );
      Get.back();
      await listAddress(context);
      await Future.delayed(const Duration(seconds: 1));
    });
    isMinorLoading.value = false;
  }

  deleteAddress(BuildContext context, int id) async {
    isLoadingDelete.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      detail.value = await AddressService().deleteAddress(id);
      print(detail.value.data!);
      if (detail.value.success != true && detail.value.message != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: detail.value.message.toString(),
        );
      }
      SnackbarWidget.getSuccessSnackbar(
        context,
        'Berhasil',
        'Alamat berhasil dihapus',
      );
      Get.back();
      await listAddress(context);
      await Future.delayed(const Duration(seconds: 1));
    });
    isLoadingDelete.value = false;
  }
}
