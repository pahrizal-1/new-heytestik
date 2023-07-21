import 'package:dio/dio.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/core/local_storage.dart';
import 'package:heystetik_mobileapps/core/networking_config.dart';
import 'package:heystetik_mobileapps/core/provider_class.dart';
import 'package:heystetik_mobileapps/models/customer/payment_method_model.dart';
import 'package:heystetik_mobileapps/models/customer/transaction_history_consultation_model.dart';

class TransactionService extends ProviderClass {
  TransactionService()
      : super(networkingConfig: NetworkingConfig(baseUrl: Global.BASE_API));

  Future<PaymentMethodModel> paymentMethod() async {
    var response = await networkingConfig.doGet(
      '/payment-method',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}'
      },
    );
    return PaymentMethodModel.fromJson(response);
  }

  Future<dynamic> order(dynamic data) async {
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
        'Content-type': 'multipart/form-data'
      },
    );
    return response;
  }

  Future<TransactionHistoryConsultationModel> historyConsultation() async {
    var response = await networkingConfig.doGet(
      '/transaction/consultation?page=1&take=100&order=desc&search',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}'
      },
    );
    return TransactionHistoryConsultationModel.fromJson(response);
  }
}
