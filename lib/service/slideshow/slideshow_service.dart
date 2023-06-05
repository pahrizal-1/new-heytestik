import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/core/networking_config.dart';
import 'package:heystetik_mobileapps/core/provider_class.dart';

class SlideShowService extends ProviderClass {
  SlideShowService()
      : super(networkingConfig: NetworkingConfig(baseUrl: Global.BASE_API));

  Future<dynamic> getSlideShow() async {
    var response = await networkingConfig.doGet(
      "/slideshow_banner",
    );

    return response;
  }
}
