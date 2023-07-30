import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/core/local_storage.dart';
import 'package:heystetik_mobileapps/core/networking_config.dart';
import 'package:heystetik_mobileapps/core/provider_class.dart';
import 'package:heystetik_mobileapps/models/customer/bank_by_id_model.dart';
import 'package:heystetik_mobileapps/models/doctor/bank_doctor_model.dart';
import 'package:heystetik_mobileapps/models/doctor/list_bank_doctor_model.dart';

class BankDoctorService extends ProviderClass {
  BankDoctorService()
      : super(networkingConfig: NetworkingConfig(baseUrl: Global.BASE_API));

  Future<BankDoctorModel> listBank() async {
    var response = await networkingConfig.doGet(
      '/user-bank-account',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}'
      },
    );
    return BankDoctorModel.fromJson(response);
  }

  Future<BankByIdModel> saveBank(dynamic data) async {
    var response = await networkingConfig.doPost(
      '/user-bank-account',
      data: data,
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
      },
    );
    return BankByIdModel.fromJson(response);
  }

  Future<BankByIdModel> findBank(int id) async {
    var response = await networkingConfig.doGet(
      '/user-bank-account/$id',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
      },
    );
    return BankByIdModel.fromJson(response);
  }

  Future<ListBankDoctorModel> selectListBank() async {
    var response = await networkingConfig.doGet(
      '/bank?page=1&take=100&search&order=asc',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}'
      },
    );
    return ListBankDoctorModel.fromJson(response);
  }

  Future<BankByIdModel> updateBank(int id, dynamic data) async {
    var response = await networkingConfig.doPatch(
      '/user-bank-account/$id',
      data: data,
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
      },
    );
    return BankByIdModel.fromJson(response);
  }

  Future<BankByIdModel> deleteBank(int id) async {
    var response = await networkingConfig.doDelete(
      '/user-bank-account/$id',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}'
      },
    );
    return BankByIdModel.fromJson(response);
  }
}
