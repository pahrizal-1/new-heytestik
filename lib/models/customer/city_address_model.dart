class CityAddressModel {
  bool? success;
  String? message;
  List<Data>? data;

  CityAddressModel({this.success, this.message, this.data});

  CityAddressModel.fromJson(Map<String, dynamic> json) {
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

  Data({this.province, this.city});

  Data.fromJson(Map<String, dynamic> json) {
    province = json['province'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['province'] = province;
    data['city'] = city;
    return data;
  }
}
