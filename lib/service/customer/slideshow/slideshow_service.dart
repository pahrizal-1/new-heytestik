import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/core/networking_config.dart';
import 'package:heystetik_mobileapps/core/provider_class.dart';
import 'package:heystetik_mobileapps/models/customer/banne_model.dart';
import 'package:ua_client_hints/ua_client_hints.dart';

class SlideShowService extends ProviderClass {
  SlideShowService()
      : super(networkingConfig: NetworkingConfig(baseUrl: Global.BASE_API));

  Future<BannerModel> getSlideShow() async {
    var response = await networkingConfig.doGet(
      '/slideshow_banner',
      headers: {
        'User-Agent': await userAgent(),
      },
    );

    return BannerModel.fromJson(response);
  }
}
