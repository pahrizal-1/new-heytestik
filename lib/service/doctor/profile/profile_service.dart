import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/core/local_storage.dart';
import 'package:heystetik_mobileapps/core/networking_config.dart';
import 'package:heystetik_mobileapps/core/provider_class.dart';
import 'package:ua_client_hints/ua_client_hints.dart';

import '../../../models/doctor/profile_model.dart';

class ProfileService extends ProviderClass {
  ProfileService()
      : super(networkingConfig: NetworkingConfig(baseUrl: Global.BASE_API));

  Future<ProfileModel> getProfile() async {
    var response = await networkingConfig.doGet(
      '/profile/doctor',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    var jsonResponse = ProfileModel.fromJson(response);
    return jsonResponse;
  }

  Future updateProfile(
    String nama,
    email,
    spesialis,
    noHp,
    gender,
    sip,
    str,
    education,
    practice,
    imgFile,
    DateTime? date,
  ) async {
    var response = await networkingConfig.doUpdateByMapWithFiles(
      '/profile/doctor',
      nama: nama,
      email: email,
      spesialis: spesialis,
      noHp: noHp,
      gender: gender,
      sip: sip,
      str: str,
      education: education,
      practice: practice,
      imgFile: imgFile,
      date: date,
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    return response;
  }

  Future<dynamic> closedAccount() async {
    var response = await networkingConfig.doUpdateFinish(
      '/profile/close-account',
    );

    return response;
  }
}
