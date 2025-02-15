import 'package:dio/dio.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/core/local_storage.dart';
import 'package:heystetik_mobileapps/core/networking_config.dart';
import 'package:heystetik_mobileapps/core/provider_class.dart';
import 'package:heystetik_mobileapps/models/customer/detail_transaksi_produk_model.dart';
import 'package:heystetik_mobileapps/models/customer/order_consultation_model.dart';
import 'package:heystetik_mobileapps/models/customer/order_product_model.dart';
import 'package:heystetik_mobileapps/models/customer/order_treatment_model.dart';
import 'package:heystetik_mobileapps/models/customer/payment_method_by_id_model.dart';
import 'package:heystetik_mobileapps/models/customer/payment_method_model.dart';
import 'package:heystetik_mobileapps/models/customer/shipping_method_model.dart';
import 'package:heystetik_mobileapps/models/customer/tracking_product_model.dart';
import 'package:heystetik_mobileapps/models/customer/transaction_history_consultation_model.dart';
import 'package:heystetik_mobileapps/models/customer/transaction_history_model.dart';
import 'package:heystetik_mobileapps/models/customer/transaction_history_treatment_model.dart';
import 'package:heystetik_mobileapps/models/customer/transaction_status_model.dart';
import 'package:ua_client_hints/ua_client_hints.dart';

class TransactionService extends ProviderClass {
  TransactionService()
      : super(networkingConfig: NetworkingConfig(baseUrl: Global.BASE_API));

  Future<PaymentMethodModel> paymentMethod(
      {Map<String, dynamic>? filter}) async {
    Map<String, dynamic>? params = {};
    if (filter != null) {
      params.addAll(filter);
    }
    var response = await networkingConfig.doGet(
      '/payment-method',
      params: params,
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    return PaymentMethodModel.fromJson(response);
  }

  Future<dynamic> getInvoice(String invoiceType, String transactionID) async {
    var response = await networkingConfig.doGet(
      '/invoice/$invoiceType/$transactionID/download',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
      responseType: ResponseType.bytes,
    );
    return response;
  }

  Future<PaymentMethodByIdModel> paymentMethodById(int id) async {
    print("widget.paymentMethodId $id");
    var response = await networkingConfig.doGet(
      '/payment-method/$id',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    return PaymentMethodByIdModel.fromJson(response);
  }

  Future<ShippingMethodModel> shippingMethod(dynamic data) async {
    var response = await networkingConfig.doPost(
      '/shipping/method',
      data: data,
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    return ShippingMethodModel.fromJson(response);
  }

  Future<OrderConsultationModel> orderConsultation(dynamic data) async {
    FormData formData = FormData.fromMap(data);
    for (var file in data['files']) {
      formData.files.addAll(
        [MapEntry('files', await MultipartFile.fromFile(file))],
      );
    }
    var response = await networkingConfig.doPost(
      '/transaction/consultation/order',
      data: formData,
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'Content-type': 'multipart/form-data',
        'User-Agent': await userAgent(),
      },
    );
    print('orderConsultation $response');
    return OrderConsultationModel.fromJson(response);
  }

  Future<OrderTreatmentModel> orderTreatment(dynamic data) async {
    var response = await networkingConfig.doPost(
      '/transaction/treatment/order',
      data: data,
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    print('orderTreatment $response');
    return OrderTreatmentModel.fromJson(response);
  }

  Future<OrderProductModel> orderProduct(dynamic data) async {
    var response = await networkingConfig.doPost(
      '/transaction/product/order',
      data: data,
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    print('orderProduct $response');
    return OrderProductModel.fromJson(response);
  }

  Future<TransactionHistoryModel> allHistory(
    int page, {
    String? search,
    Map<String, dynamic>? filter,
  }) async {
    Map<String, dynamic> params = {
      "page": page,
      "take": 10,
      "order": "desc",
      "search": search,
    };

    if (filter != null) {
      params.addAll(filter);
    }
    print("params $params");
    var response = await networkingConfig.doGet(
      '/transaction',
      params: params,
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    return TransactionHistoryModel.fromJson(response);
  }

  Future<TransactionStatusModel> transactionStatusConsultation(
      String orderId) async {
    var response = await networkingConfig.doGet(
      '/transaction/CONSULTATION.$orderId/status',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    return TransactionStatusModel.fromJson(response);
  }

  Future<TransactionHistoryConsultationModel> historyConsultation() async {
    var response = await networkingConfig.doGet(
      '/transaction/consultation?page=1&take=100&order=desc&search',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    return TransactionHistoryConsultationModel.fromJson(response);
  }

  Future<TransactionStatusModel> transactionStatusTreatment(
      String orderId) async {
    var response = await networkingConfig.doGet(
      '/transaction/TREATMENT.$orderId/status',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    return TransactionStatusModel.fromJson(response);
  }

  Future<TransactionHistoryTreatmentModel> historyTreatment() async {
    var response = await networkingConfig.doGet(
      '/transaction/treatment?page=1&take=100&order=desc&search',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    return TransactionHistoryTreatmentModel.fromJson(response);
  }

  Future<TransactionStatusModel> transactionStatusProduct(
      String orderId) async {
    var response = await networkingConfig.doGet(
      '/transaction/PRODUCT.$orderId/status',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    return TransactionStatusModel.fromJson(response);
  }

  Future<DetailTransaksiProdukModel> detailTransaksiProduk(
      String transactionId) async {
    var response = await networkingConfig.doGet(
      '/transaction/$transactionId/product',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    print(transactionId);
    return DetailTransaksiProdukModel.fromJson(response);
  }

  Future<TrackingProductModel> trackingProduct(String transactionId) async {
    var response = await networkingConfig.doGet(
      '/shipping/$transactionId/track',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    return TrackingProductModel.fromJson(response);
  }

  // Future<ShippingInfoModel> shippingInfo(String transactionId) async {
  //   var response = await networkingConfig.doGet(
  //     '/shipping/$transactionId/info',
  //     headers: {
  //       'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
  //       'User-Agent': await userAgent(),
  //     },
  //   );
  //   return ShippingInfoModel.fromJson(response);
  // }
}
