import 'package:dio/dio.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:ua_client_hints/ua_client_hints.dart';
import 'local_storage.dart';

class NetworkingConfig {
  NetworkingConfig({required this.baseUrl}) {
    dio = Dio(BaseOptions(baseUrl: baseUrl));
  }

  final String baseUrl;
  String auth = '';

  late Dio dio;

  preparation() async {
    if (auth.isNotEmpty) {
      dio.options.headers['authorization'] = auth;
    }
  }

  doGet(
    String endpoint, {
    Map<String, dynamic> params = const {},
    Map<String, dynamic> headers = const {},
  }) async {
    try {
      await preparation();
      var response = await dio.get(
        endpoint,
        queryParameters: params,
        options: Options(
          headers: headers,
        ),
      );
      return response.data;
    } catch (error) {
      throw handleError(error);
    }
  }

  doPost(
    String endpoint, {
    dynamic data,
    Map<String, dynamic> params = const {},
    Map<String, dynamic> headers = const {},
  }) async {
    try {
      await preparation();
      var response = await dio.post(
        endpoint,
        queryParameters: params,
        data: data,
        options: Options(
          headers: headers,
        ),
      );
      return response.data;
    } catch (error) {
      throw handleError(error);
    }
  }

  doPostByMap(
    String endpoint, {
    dynamic data,
    Map<String, dynamic> params = const {},
    Map<String, dynamic> headers = const {},
  }) async {
    try {
      await preparation();
      var response = await dio.post(
        endpoint,
        queryParameters: params,
        data: FormData.fromMap(data),
        options: Options(
          headers: headers,
        ),
      );
      return response.data;
    } catch (error) {
      throw handleError(error);
    }
  }

  doUpdateByMap(
    String endpoint, {
    dynamic data,
    Map<String, dynamic> headers = const {},
  }) async {
    try {
      await preparation();
      var response = await dio.patch(
        Uri.encodeFull(Global.BASE_API + endpoint),
        data: FormData.fromMap(data),
        options: Options(
          headers: headers,
        ),
      );
      return response.data;
    } catch (error) {
      throw handleError(error);
    }
  }

  doUpdateByMapWithFiles(
    String endpoint, {
    dynamic data,
    String? nama,
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
    Map<String, dynamic> headers = const {},
  }) async {
    try {
      await preparation();
      var response = await dio.patch(
        Uri.encodeFull(Global.BASE_API + endpoint),
        data: FormData.fromMap({
          'fullname': nama,
          'email': email,
          'specialist': spesialis,
          'no_phone': noHp,
          'gender': gender,
          'dob': date!.toIso8601String(),
          'sip': sip,
          'str': str,
          'education': education,
          'practice_location': practice,
          'files': await MultipartFile.fromFile(imgFile),
        }),
        options: Options(
          headers: headers,
        ),
      );
      return response.data;
    } catch (error) {
      throw handleError(error);
    }
  }

  doUpdate(
    String endpoint,
    dynamic data,
  ) async {
    try {
      await preparation();
      var response = await dio.patch(
        Uri.encodeFull(Global.BASE_API + endpoint),
        data: data,
        options: Options(
          headers: {
            'authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
            'User-Agent': await userAgent(),
          },
        ),
      );
      return response.data;
    } catch (error) {
      throw handleError(error);
    }
  }

  doUpdateFinish(
    String endpoint,
  ) async {
    try {
      await preparation();
      var response = await dio.patch(
        Uri.encodeFull(Global.BASE_API + endpoint),
        options: Options(
          headers: {
            'authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
            'User-Agent': await userAgent(),
          },
        ),
      );
      return response.data;
    } catch (error) {
      throw handleError(error);
    }
  }

  // doUpdate(
  //   String endpoint, {
  //   dynamic data,
  //   Map<String, dynamic> params = const {},
  //   Map<String, dynamic> headers = const {},
  // }) async {
  //   try {
  //     await preparation();
  //     var response = await dio.patch(
  //       endpoint,
  //       queryParameters: params,
  //       data: data,
  //       options: Options(
  //         headers: headers,
  //         validateStatus: (statusCode) {
  //           debugPrint('status code $statusCode');
  //           if (statusCode == null) {
  //             debugPrint('status code null');
  //             return false;
  //           }

  //           debugPrint('status code statusCode >= 200 && statusCode < 300');
  //           return statusCode >= 200 && statusCode < 300;
  //         },
  //       ),
  //     );
  //     return response.data;
  //   } catch (error) {
  //     throw handleError(error);
  //   }
  // }

  doUpload(String endpoint) {}

  doPatch(String endpoint,
      {dynamic data,
      Map<String, dynamic> params = const {},
      Map<String, dynamic> headers = const {},
      bool checkLogin = true}) async {
    try {
      await preparation();
      var response = await dio.patch(
        endpoint,
        queryParameters: params,
        data: data,
        options: Options(
          headers: headers,
        ),
      );
      return response.data;
    } catch (error) {
      throw handleError(error);
    }
  }

  doDelete(String endpoint,
      {dynamic data,
      Map<String, dynamic> params = const {},
      Map<String, dynamic> headers = const {},
      bool checkLogin = true}) async {
    try {
      await preparation();
      var response = await dio.delete(
        endpoint,
        queryParameters: params,
        data: data,
        options: Options(
          headers: headers,
        ),
      );
      return response.data;
    } catch (error) {
      throw handleError(error);
    }
  }
}
