// import 'package:flutter/services.dart';
// import 'package:heystetik_mobileapps/core/error_config.dart';
// import 'package:ua_client_hints/ua_client_hints.dart';

// Future<void> initPlatformState() async {
//   try {
//     final ua = await userAgent();
//     print('ua $ua');
//     UserAgentData uaData = await userAgentData();
//     print('uaData $uaData');

//     final header = await userAgentClientHintsHeader();
//     print('header $header');
//   } on PlatformException {
//     throw ErrorConfig(
//       cause: ErrorConfig.anotherUnknow,
//       message: 'Failed to get platform version.',
//     );
//   }

//   // return platformVersion;
// }
