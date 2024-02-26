class SubdistrictAddressModel {
  bool? success;
  String? message;
  List<Data>? data;

  SubdistrictAddressModel({this.success, this.message, this.data});

  SubdistrictAddressModel.fromJson(Map<String, dynamic> json) {
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

  Data({this.province, this.city, this.subdistrict});

  Data.fromJson(Map<String, dynamic> json) {
    province = json['province'];
    city = json['city'];
    subdistrict = json['subdistrict'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['province'] = province;
    data['city'] = city;
    data['subdistrict'] = subdistrict;
    return data;
  }
}
