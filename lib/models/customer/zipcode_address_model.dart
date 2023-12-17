// ignore_for_file: file_names

class ZipcodeAddressModel {
  bool? success;
  String? message;
  List<Data>? data;

  ZipcodeAddressModel({this.success, this.message, this.data});

  ZipcodeAddressModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? province;
  String? city;
  String? subdistrict;
  String? village;
  String? zipCode;
  String? fullZipCode;

  Data(
      {this.province,
      this.city,
      this.subdistrict,
      this.village,
      this.zipCode,
      this.fullZipCode});

  Data.fromJson(Map<String, dynamic> json) {
    province = json['province'];
    city = json['city'];
    subdistrict = json['subdistrict'];
    village = json['village'];
    zipCode = json['zip_code'];
    fullZipCode = json['full_zip_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['province'] = province;
    data['city'] = city;
    data['subdistrict'] = subdistrict;
    data['village'] = village;
    data['zip_code'] = zipCode;
    data['full_zip_code'] = fullZipCode;
    return data;
  }
}
