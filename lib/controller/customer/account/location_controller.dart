// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/local_storage.dart';
import 'package:heystetik_mobileapps/core/location_permission.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/models/customer/customer_location_model.dart';
import 'package:heystetik_mobileapps/service/customer/address/address_service.dart';

class LocationController extends StateClass {
  Rx<CustomerLocationModel> location = CustomerLocationModel().obs;
  RxBool isSwitch = false.obs;
  RxDouble latitude = 0.0.obs;
  RxDouble longitude = 0.0.obs;
  RxString address = ''.obs;
  RxString myAddress = ''.obs;
  RxString city = ''.obs;
  var myLocation;

  initMyLocation(BuildContext context) async {
    isLoading.value = true;
    myLocation = await LocalStorage().getLocation();
    print("ADA DISINI");
    print(myLocation);
    print('masuk ${myLocation['city']}');
    print('masuk ${myLocation['address']}');

    if (myLocation['city'] == '' ||
        myLocation['city'] == '-' ||
        myLocation['address'] == '' ||
        myLocation['address'] == '-') {
      isSwitch.value = false;

      print('masuk 1');
    } else {
      print('masuk 2');
      isSwitch.value = true;
    }
    isLoading.value = false;
  }

  initgetCurrentPosition(BuildContext context) async {
    await getCurrentPosition(context);
    await getLocation(context);
  }

  Future<void> getCurrentPosition(BuildContext context) async {
    isLoading.value = true;
    final hasPermission = await locationPermission(context);
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      latitude.value = position.latitude;
      print('latitude ${latitude.value}');
      longitude.value = position.longitude;
      print('longitude ${longitude.value}');

      getAddressFromLatLng(context, position);
    }).catchError((e) {
      debugPrint('error euy getCurrentPosition $e');
    });
    isLoading.value = false;
  }

  Future getAddressFromLatLng(BuildContext context, Position position) async {
    await placemarkFromCoordinates(latitude.value, longitude.value)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      address.value =
          '${place.street}, ${place.subLocality}, ${place.locality}, ${place.subAdministrativeArea}, ${place.country}, ${place.postalCode}';
      city.value = place.subAdministrativeArea.toString();
      LocalStorage().setLocation(
        location: {
          'city': city.value,
          'address': address.value,
        },
      );

      createLocation(context);
    }).catchError((e) {
      debugPrint('error euy getAddressFromLatLng $e');
    });
  }

  createLocation(BuildContext context) async {
    // isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var data = {
        'latitude': latitude.value,
        'longitude': longitude.value,
        'address': address.value,
      };
      print('data $data');
      location.value = await AddressService().createLocation(data);
    });
    // isLoading.value = false;
  }

  getLocation(BuildContext context) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      location.value = await AddressService().getLocation();

      if (location.value.success != true &&
          location.value.message != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: location.value.message.toString(),
        );
      }

      // SET MYLOCATION
      myAddress.value = location.value.data!.address ?? '';
    });
    isLoading.value = false;
  }
}
