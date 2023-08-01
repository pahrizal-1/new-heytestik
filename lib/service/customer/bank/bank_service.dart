import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/core/local_storage.dart';
import 'package:heystetik_mobileapps/core/networking_config.dart';
import 'package:heystetik_mobileapps/core/provider_class.dart';
import 'package:heystetik_mobileapps/models/customer/bank_by_id_model.dart';
import 'package:heystetik_mobileapps/models/customer/bank_model.dart';
import 'package:heystetik_mobileapps/models/customer/list_bank_model.dart';
import 'package:ua_client_hints/ua_client_hints.dart';

class BankService extends ProviderClass {
  BankService()
      : super(networkingConfig: NetworkingConfig(baseUrl: Global.BASE_API));

  Future<BankModel> listBank() async {
    var response = await networkingConfig.doGet(
      '/user-bank-account',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    return BankModel.fromJson(response);
  }

  Future<BankByIdModel> saveBank(dynamic data) async {
    var response = await networkingConfig.doPost(
      '/user-bank-account',
      data: data,
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    return BankByIdModel.fromJson(response);
  }

  Future<BankByIdModel> findBank(int id) async {
    var response = await networkingConfig.doGet(
      '/user-bank-account/$id',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    return BankByIdModel.fromJson(response);
  }

  Future<ListBankModel> selectListBank() async {
    var response = await networkingConfig.doGet(
      '/bank?page=1&take=100&search&order=asc',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    return ListBankModel.fromJson(response);
  }

  Future<BankByIdModel> updateBank(int id, dynamic data) async {
    var response = await networkingConfig.doPatch(
      '/user-bank-account/$id',
      data: data,
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    return BankByIdModel.fromJson(response);
  }

  Future<BankByIdModel> deleteBank(int id) async {
    var response = await networkingConfig.doDelete(
      '/user-bank-account/$id',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    return BankByIdModel.fromJson(response);
  }
}
