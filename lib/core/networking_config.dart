import 'package:dio/dio.dart';
import 'package:flutter/rendering.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';

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
          // validateStatus: (statusCode) {
          //   debugPrint('status code $statusCode');
          //   if (statusCode == null) {
          //     debugPrint('status code null');
          //     return false;
          //   }

          //   if (statusCode == 400) {
          //     // your http status code

          //     // for payment
          //     debugPrint('status code 400');
          //     return true;
          //   } else {
          //     debugPrint('status code statusCode >= 200 && statusCode < 300');
          //     return statusCode >= 200 && statusCode < 300;
          //   }
          // },
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
          validateStatus: (statusCode) {
            debugPrint('status code $statusCode');
            if (statusCode == null) {
              debugPrint('status code null');
              return false;
            }

            if (statusCode == 400) {
              // your http status code

              // for payment
              debugPrint('status code 400');
              return true;
            } else {
              debugPrint('status code statusCode >= 200 && statusCode < 300');
              return statusCode >= 200 && statusCode < 300;
            }
          },
        ),
      );
      return response.data;
    } catch (error) {
      throw handleError(error);
    }
  }

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
          // validateStatus: (statusCode) {
          //   debugPrint('status code $statusCode');
          //   if (statusCode == null) {
          //     debugPrint('status code null');
          //     return false;
          //   }

          //   debugPrint('status code statusCode >= 200 && statusCode < 300');
          //   return statusCode >= 200 && statusCode < 300;
          // },
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
          // validateStatus: (statusCode) {
          //   debugPrint('status code $statusCode');
          //   if (statusCode == null) {
          //     debugPrint('status code null');
          //     return false;
          //   }

          //   debugPrint('status code statusCode >= 200 && statusCode < 300');
          //   return statusCode >= 200 && statusCode < 300;
          // },
        ),
      );
      return response.data;
    } catch (error) {
      throw handleError(error);
    }
  }
}
