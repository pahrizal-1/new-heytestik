import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

FirebaseDynamicLinksPlatform dynamicLinks =
    FirebaseDynamicLinksPlatform.instance;

Future<Uri?> createDynamicLinkNews() async {
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

Future<Uri?> createDynamicLinkStream(int postId) async {
  final DynamicLinkParameters parameters = DynamicLinkParameters(
    uriPrefix: 'https://heystetik.page.link',
    link: Uri.parse('https://www.heystetik.com/stream/$postId'),
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

Future<Uri?> createDynamicLinkClinic(int clinicId) async {
  final DynamicLinkParameters parameters = DynamicLinkParameters(
    uriPrefix: 'https://heystetik.page.link',
    link: Uri.parse('https://www.heystetik.com/clinic/$clinicId'),
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

Future<Uri?> createDynamicLinkTreatment(int treatmentId) async {
  final DynamicLinkParameters parameters = DynamicLinkParameters(
    uriPrefix: 'https://heystetik.page.link',
    link: Uri.parse('https://www.heystetik.com/treatment/$treatmentId'),
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
