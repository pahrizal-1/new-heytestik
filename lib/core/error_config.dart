// ignore_for_file: prefer_single_quotes

import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/pages/auth/login_page.dart';
import 'package:heystetik_mobileapps/widget/alert_dialog.dart';
import 'package:heystetik_mobileapps/widget/snackbar_widget.dart';

class ErrorConfig implements Exception {
  String cause;
  String message;
  ErrorConfig({required this.cause, required this.message});

  // Error causes
  static const userInput = 'error_user_input';
  static const userUnauthorized = 'error_user_unauthorized';
  static const appNoInternet = 'error_app_no_internet';
  static const appPermissionUnknow = 'error_app_permission_unknow';
  static const appPermissionCameraDenied = 'error_app_permission_camera_denied';
  static const appPermissionLocationDenied =
      'error_app_permission_location_denied';
  static const networkRequestUnknow = 'error_network_request_unknow';
  static const networkRequest400 = 'error_network_request_bad_request';
  static const networkRequest401 = 'error_network_request_unauthorized';
  static const networkRequest403 = 'error_network_request_forbidden';
  static const networkRequest404 = 'error_network_request_not_found';
  static const networkRequest500 = 'error_network_request_internal_server';
  static const networkRequest502 = 'error_network_request_bad_gateway';
  static const networkRequest503 = 'error_network_request_service_unavailable';
  static const networkRequest504 = 'error_network_request_timeout';

  static const locationNotFound = 'error_location_not_found';
  static const locationMocked = 'error_location_mocked';

  static const developerMode = 'error_using_developer_mode';

  static const anotherUnknow = 'error_another_unknow';
  static const anotherCustom = 'error_another_custom';

  // Error flag
  static const anySolve = 'any_solve';
  static const lightSolve = 'light_solve';
  static const heavySolve = 'heavy_solve';

  static logError(dynamic object) {
    if (kDebugMode) {
      log('\x1B[31m${object.toString()}\x1B[0m');
      log('Error ini di log dari [ErrorConfig] Heystetik Mobile Apps app\nTetap Semangat 👍 semoga Allah mudahkan ✨');
    }
  }

  static ErrorConfig findDioError(DioError dioError) {
    String? message;
    if (dioError.response?.data['ket'] != null) {
      message = dioError.response?.data['ket'].toString();
    } else if (dioError.response?.data['error'] != null) {
      message = dioError.response?.data['error'].toString();
    } else if (dioError.response?.data['message'] != null) {
      message = dioError.response?.data['message'].toString();
    } else if (dioError.response?.data['status'] != null) {
      message = dioError.response?.data['status'].toString();
    }

    switch (dioError.response?.statusCode) {
      case 400:
        return ErrorConfig(
            cause: ErrorConfig.networkRequest400,
            message: message ?? 'Bad Request');
      case 401:
        return ErrorConfig(
            cause: ErrorConfig.networkRequest401,
            message: message ?? 'Network request error without any response');
      case 403:
        return ErrorConfig(
            cause: ErrorConfig.networkRequest403,
            message: message ?? 'Network request error without any response');
      case 404:
        return ErrorConfig(
            cause: ErrorConfig.networkRequest404,
            message: message ?? 'Network request error without any response');
      case 500:
        return ErrorConfig(
            cause: ErrorConfig.networkRequest500,
            message: message ?? 'Network request error without any response');
      case 502:
        return ErrorConfig(
            cause: ErrorConfig.networkRequest502,
            message: message ?? 'Network request error without any response');
      case 503:
        throw ErrorConfig(
            cause: ErrorConfig.networkRequest503,
            message: message ?? 'Network request error without any response');
      case 504:
        return ErrorConfig(
            cause: ErrorConfig.networkRequest504,
            message: message ?? 'Network request error without any response');
      default:
        return ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: message ?? 'Please check your internet connection again',
        );
    }
  }

  static doAndSolveCatchInContext(
    BuildContext context,
    Function action, {
    String flag = anySolve,
  }) async {
    try {
      await action();
    } catch (error) {
      // Solve error
      handleError(error, context: context);
    }
  }
}

/// Menghandle Error dan mereturn error itu kembali dalam format [ErrorConfig], error yang di return bisa diolah kembali sendiri
ErrorConfig handleError(
  dynamic error, {
  BuildContext? context,
}) {
  ErrorConfig returnedError = ErrorConfig(
      cause: ErrorConfig.anotherUnknow, message: 'Error tidak diketahui');

  if (error.runtimeType == DioError) {
    DioError dioError = error;
    // Log error info
    var errorInfo = dioError.error;
    var dioMessage = dioError.message;
    var requestPath =
        "${dioError.requestOptions.baseUrl}${dioError.requestOptions.path}";
    var response = dioError.response;
    var status = dioError.response?.statusCode;
    ErrorConfig.logError(
        'Heystetik Mobile Apps Error [DioError] : \n  error : $errorInfo\n  type : ${dioError.type}\n  message : $dioMessage\n  request path : $requestPath\n  response : $response, status : $status');
    error = ErrorConfig.findDioError(error);
  }

  // Handle with context
  if (error.runtimeType == ErrorConfig) {
    returnedError = error;

    var message = error.message;
    var cause = error.cause;
    ErrorConfig.logError(
        'Heystetik Mobile Apps Error [ErrorConfig] : \n  cause : $cause\n  message : $message');

    if (context == null) {
      return returnedError;
    }

    switch ((error as ErrorConfig).cause) {
      case ErrorConfig.userInput:
        // showDialog(
        //   context: context,
        //   builder: (context) => AlertWidget(subtitle: error.message),
        // );

        SnackbarWidget.getErrorSnackbar(context, 'Info', error.message);
        break;
      case ErrorConfig.userUnauthorized:
        // go to login page when user unauthorized
        Get.offAll(() => const LoginPage());
        break;
      case ErrorConfig.appNoInternet:
        // No internet issue
        break;
      case ErrorConfig.appPermissionUnknow:
        // DialogWidget.getDialogWidget(
        //     context, [const Text("Unknow Permission Error")]);
        break;
      case ErrorConfig.appPermissionCameraDenied:
        // show permission dialog
        // Get.offAll(() => const NoPermissionPage());
        break;
      case ErrorConfig.appPermissionLocationDenied:
        // Show permission dialog
        // Get.offAll(() => const NoPermissionPage());
        break;
      case ErrorConfig.locationNotFound:
        // SnackbarWidget.getErrorSnackbar(
        //     "Error location not found", error.message);
        break;
      case ErrorConfig.locationMocked:
        // SnackbarWidget.getErrorSnackbar(
        //     "Error, you probably using mocked location", error.message);
        break;
      case ErrorConfig.networkRequest401:
        // go to login page when user unauthorized
        Get.offAll(() => const LoginPage());
        break;
      case ErrorConfig.networkRequest404:
        showDialog(
          context: context,
          builder: (context) => AlertWidget(subtitle: error.message),
        );
        break;
      case ErrorConfig.networkRequest400:
        showDialog(
          context: context,
          builder: (context) => AlertWidget(subtitle: error.message),
        );
        break;
      case ErrorConfig.networkRequest500:
        showDialog(
          context: context,
          builder: (context) => AlertWidget(subtitle: error.message),
        );
        break;
      case ErrorConfig.networkRequest502:
        showDialog(
          context: context,
          builder: (context) => AlertWidget(subtitle: error.message),
        );
        break;
      default:
        showDialog(
          context: context,
          builder: (context) => AlertWidget(subtitle: error.message),
        );
        break;
    }
  }
  return returnedError;
}
