import 'package:url_launcher/url_launcher.dart';

class OpenOutSide {
  static launchURL(String url) async {
    final Uri urlParse = Uri.parse(url);
    if (!await launchUrl(urlParse, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $urlParse');
    }
  }

  Future<void> openTelegram({
    required String phone,
    LaunchMode mode = LaunchMode.externalApplication,
  }) async {
    const String url = 'https://t.me/HeystetikMockOTP';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(
        Uri.parse(url),
        mode: mode,
      );
    } else {
      throw Exception('Could not launch $url');
    }
  }
}
