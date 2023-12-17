import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/core/local_storage.dart';
import 'package:heystetik_mobileapps/core/networking_config.dart';
import 'package:heystetik_mobileapps/core/provider_class.dart';
import 'package:heystetik_mobileapps/models/customer/zipcode_address_model.dart';
import 'package:heystetik_mobileapps/models/customer/address_by_id_model.dart';
import 'package:heystetik_mobileapps/models/customer/city_address_model.dart';
import 'package:heystetik_mobileapps/models/customer/customer_location_model.dart';
import 'package:heystetik_mobileapps/models/customer/list_address_model.dart';
import 'package:heystetik_mobileapps/models/customer/province_address_model.dart';
import 'package:heystetik_mobileapps/models/customer/subdistrict_address_model.dart';
import 'package:ua_client_hints/ua_client_hints.dart';

class AddressService extends ProviderClass {
  AddressService()
      : super(networkingConfig: NetworkingConfig(baseUrl: Global.BASE_API));

  Future<ListAddressModel> listAddress() async {
    var response = await networkingConfig.doGet(
      '/user-address',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    return ListAddressModel.fromJson(response);
  }

  Future<ProvinceAddressModel> getProvince() async {
    var response = await networkingConfig.doGet(
      '/user-address/shipping/province',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    return ProvinceAddressModel.fromJson(response);
  }

  Future<CityAddressModel> getCity(String province) async {
    var response = await networkingConfig.doGet(
      '/user-address/shipping/city?province=$province',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    return CityAddressModel.fromJson(response);
  }

  Future<SubdistrictAddressModel> getSubdistrict(
      String province, String city) async {
    var response = await networkingConfig.doGet(
      '/user-address/shipping/subdistrict?province=$province&city=$city',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    return SubdistrictAddressModel.fromJson(response);
  }

  Future<ZipcodeAddressModel> getZipcode(
      String province, String city, String subdistrict) async {
    var response = await networkingConfig.doGet(
      '/user-address/shipping/zip-code?province=$province&city=$city&subdistrict=$subdistrict',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    return ZipcodeAddressModel.fromJson(response);
  }

  Future<AddressByIdModel> saveAddress(dynamic data) async {
    var response = await networkingConfig.doPost(
      '/user-address',
      data: data,
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    return AddressByIdModel.fromJson(response);
  }

  Future<AddressByIdModel> findAddress(int id) async {
    var response = await networkingConfig.doGet(
      '/user-address/$id',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    return AddressByIdModel.fromJson(response);
  }

  Future<AddressByIdModel> updateAddress(int id, dynamic data) async {
    var response = await networkingConfig.doPatch(
      '/user-address/$id',
      data: data,
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    return AddressByIdModel.fromJson(response);
  }

  Future<AddressByIdModel> deleteAddress(int id) async {
    var response = await networkingConfig.doDelete(
      '/user-address/$id',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    return AddressByIdModel.fromJson(response);
  }

  Future<CustomerLocationModel> createLocation(dynamic data) async {
    var response = await networkingConfig.doPost(
      '/user-location',
      data: data,
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    return CustomerLocationModel.fromJson(response);
  }

  Future<CustomerLocationModel> getLocation() async {
    var response = await networkingConfig.doGet(
      '/user-location',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    return CustomerLocationModel.fromJson(response);
  }
}
