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
  RxString currentCity = ''.obs;
  RxString currentAddress = ''.obs;
  RxDouble currentLatitude = 0.0.obs;
  RxDouble currentLongitude = 0.0.obs;

  RxDouble myLatitude = 0.0.obs;
  RxDouble myLongitude = 0.0.obs;
  RxString myAddress = ''.obs;
  RxString myCity = ''.obs;
  var myLocation;

  initMyLocation(BuildContext context) async {
    isLoading.value = true;
    myLocation = await LocalStorage().getLocation();

    if (myLocation != "") {
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
    }
    isLoading.value = false;
  }

  Future<void> getCurrentPosition(BuildContext context) async {
    isLoading.value = true;
    final hasPermission = await locationPermission(context);
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      currentLatitude.value = position.latitude;
      print('currentLatitude ${currentLatitude.value}');
      currentLongitude.value = position.longitude;
      print('currentLongitude ${currentLongitude.value}');

      placemarkFromCoordinates(
        currentLatitude.value,
        currentLongitude.value,
      ).then((List<Placemark> placemarks) {
        Placemark place = placemarks[0];
        currentAddress.value =
            '${place.street}, ${place.subLocality}, ${place.locality}, ${place.subAdministrativeArea}, ${place.country}, ${place.postalCode}';
        currentCity.value = place.subAdministrativeArea.toString();
        print("currentAddress ${currentAddress.value}");
        print("currentCity ${currentCity.value}");
      });
    }).catchError((e) {
      debugPrint('error euy getCurrentPosition $e');
    });
    isLoading.value = false;
  }

  createLocation(
    BuildContext context,
    double lat,
    double long,
    String address,
  ) async {
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var data = {
        'latitude': lat,
        'longitude': long,
        'address': address,
      };
      print('data $data');
      location.value = await AddressService().createLocation(data);
      if (location.value.success != true &&
          location.value.message != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: location.value.message.toString(),
        );
      }
      if (location.value.data != null) {
        myLatitude.value = location.value.data!.latitude ?? 0.0;
        myLongitude.value = location.value.data!.longitude ?? 0.0;
        myAddress.value = location.value.data!.address ?? '';
        // GET CITY
        await placemarkFromCoordinates(lat, long)
            .then((List<Placemark> placemarks) {
          Placemark place = placemarks[0];
          myCity.value = place.subAdministrativeArea.toString();
          print("myCity ${myCity.value}");
          LocalStorage().setLocation(
            location: {
              'city': place.subAdministrativeArea.toString(),
              'address': currentAddress.value,
            },
          );
        }).catchError((e) {
          debugPrint('error euy placemarkFromCoordinates $e');
        });
      }
    });
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

      if (location.value.data == null) {
        print("BELUM SET LOKASI");
        await getCurrentPosition(context);
      } else {
        print("SUDAH SET LOKASI");
        myLatitude.value = location.value.data!.latitude ?? 0.0;
        myLongitude.value = location.value.data!.longitude ?? 0.0;
        myAddress.value = location.value.data!.address ?? '';
        // GET CITY
        await placemarkFromCoordinates(
          myLatitude.value,
          myLongitude.value,
        ).then((List<Placemark> placemarks) {
          Placemark place = placemarks[0];
          myCity.value = place.subAdministrativeArea.toString();
          print("myCity ${myCity.value}");
        }).catchError((e) {
          debugPrint('error euy placemarkFromCoordinates $e');
        });
      }
    });
    isLoading.value = false;
  }
}
