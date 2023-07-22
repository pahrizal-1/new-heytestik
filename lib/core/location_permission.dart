// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:heystetik_mobileapps/widget/alert_dialog.dart';

Future<bool> locationPermission(BuildContext context) async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    showDialog(
      context: context,
      builder: (context) => AlertWidget(
          subtitle:
              'Location services are disabled. Please enable the services'),
    );
    // ScaffoldMessenger.of(context).showSnackBar(
    //   const SnackBar(
    //       content: Text(
    //           'Location services are disabled. Please enable the services')),
    // );
    return false;
  }
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      showDialog(
        context: context,
        builder: (context) =>
            AlertWidget(subtitle: 'Location permissions are denied'),
      );
      // ScaffoldMessenger.of(context).showSnackBar(
      //     const SnackBar(content: Text('Location permissions are denied')));
      return false;
    }
  }
  if (permission == LocationPermission.deniedForever) {
    showDialog(
      context: context,
      builder: (context) => AlertWidget(
          subtitle:
              'Location permissions are permanently denied, we cannot request permissions.'),
    );
    // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    //     content: Text(
    //         'Location permissions are permanently denied, we cannot request permissions.')));
    return false;
  }
  return true;
}
