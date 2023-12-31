import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

FirebaseDynamicLinksPlatform dynamicLinks =
    FirebaseDynamicLinksPlatform.instance;

Future<Uri?> createDynamicLink() async {
  final DynamicLinkParameters parameters = DynamicLinkParameters(
    uriPrefix: 'https://heystetik.page.link',
    link: Uri.parse('https://www.heystetik.com/news'),
    androidParameters: const AndroidParameters(
      packageName: 'com.example.heystetik_mobileapps',
      minimumVersion: 0,
    ),
    iosParameters: const IOSParameters(
      bundleId: 'com.example.heystetik_mobileapps',
      minimumVersion: '0',
    ),
  );

  final ShortDynamicLink shortDynamicLink =
      await dynamicLinks.buildShortLink(parameters);
  print('short link');
  print(shortDynamicLink.shortUrl);
  return shortDynamicLink.shortUrl;
}

Future<Uri?> createDynamicLinkSkincare(int productId) async {
  final DynamicLinkParameters parameters = DynamicLinkParameters(
    uriPrefix: 'https://heystetik.page.link',
    link: Uri.parse('https://www.heystetik.com/skincare/$productId'),
    androidParameters: const AndroidParameters(
      packageName: 'com.example.heystetik_mobileapps',
      minimumVersion: 0,
    ),
    iosParameters: const IOSParameters(
      bundleId: 'com.example.heystetik_mobileapps',
      minimumVersion: '0',
    ),
  );
  final ShortDynamicLink shortDynamicLink =
      await dynamicLinks.buildShortLink(parameters);
  print('short link');
  print(shortDynamicLink.shortUrl);
  return shortDynamicLink.shortUrl;
}

Future<Uri?> createDynamicLinkDrug(int productId) async {
  final DynamicLinkParameters parameters = DynamicLinkParameters(
    uriPrefix: 'https://heystetik.page.link',
    link: Uri.parse('https://www.heystetik.com/drug/$productId'),
    androidParameters: const AndroidParameters(
      packageName: 'com.example.heystetik_mobileapps',
      minimumVersion: 0,
    ),
    iosParameters: const IOSParameters(
      bundleId: 'com.example.heystetik_mobileapps',
      minimumVersion: '0',
    ),
  );
  final ShortDynamicLink shortDynamicLink =
      await dynamicLinks.buildShortLink(parameters);
  print('short link');
  print(shortDynamicLink.shortUrl);
  return shortDynamicLink.shortUrl;
}
