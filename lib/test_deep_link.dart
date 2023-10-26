// import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
// import 'package:flutter/material.dart';

// class TestDeepLink extends StatefulWidget {
//   const TestDeepLink({super.key});

//   @override
//   State<TestDeepLink> createState() => _TestDeepLinkState();
// }

// class _TestDeepLinkState extends State<TestDeepLink> {
//   FirebaseDynamicLinksPlatform dynamicLinks =
//       FirebaseDynamicLinksPlatform.instance;

//   @override
//   void initState() {
//     super.initState();
//   }

//   Future<void> _createDynamicLink() async {
//     final DynamicLinkParameters parameters = DynamicLinkParameters(
//       uriPrefix: 'https://heystetik.page.link',
//       link: Uri.parse('https://www.heystetik.com/news'),
//       androidParameters: const AndroidParameters(
//         packageName: 'com.example.heystetik_mobileapps',
//         minimumVersion: 0,
//       ),
//       iosParameters: const IOSParameters(
//         bundleId: 'com.example.heystetik_mobileapps',
//         minimumVersion: '0',
//       ),
//     );

//     final ShortDynamicLink shortDynamicLink =
//         await dynamicLinks.buildShortLink(parameters);
//     print('short link');
//     print(shortDynamicLink.shortUrl);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () async {
//             await _createDynamicLink();
//           },
//           child: Text('HEHEHHEEH'),
//         ),
//       ),
//     );
//   }
// }
