import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/account/location_controller.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';

class MapsWidget extends StatefulWidget {
  const MapsWidget({super.key});

  @override
  State<MapsWidget> createState() => _MapsWidgetState();
}

class _MapsWidgetState extends State<MapsWidget> {
  final LocationController state = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: OpenStreetMapSearchAndPick(
          center: LatLong(
            state.myLatitude.value != 0.0
                ? state.myLatitude.value
                : state.currentLatitude.value,
            state.myLongitude.value != 0.0
                ? state.myLongitude.value
                : state.currentLongitude.value,
          ),
          buttonColor: greenColor,
          buttonText: 'Set Current Location',
          onPicked: (pickedData) async {
            Get.back();
            print("HEHEHEHH");
            print("myAddress ${pickedData.addressName}");
            print("latitude ${pickedData.latLong.latitude}");
            print("longitude ${pickedData.latLong.longitude}");
            print("addd ${pickedData.address}");
            await state.createLocation(
              context,
              pickedData.latLong.latitude,
              pickedData.latLong.longitude,
              pickedData.addressName,
            );
          },
        ),
      ),
    );
  }
}
