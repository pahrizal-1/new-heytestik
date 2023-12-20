class ShippingMethodModel {
  bool? success;
  String? message;
  List<Data>? data;

  ShippingMethodModel({this.success, this.message, this.data});

  ShippingMethodModel.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? name;
  String? description;
  String? info;
  String? provider;
  int? price;
  bool? isActive;

  Data(
      {this.id,
      this.name,
      this.description,
      this.info,
      this.provider,
      this.price,
      this.isActive});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    info = json['info'];
    provider = json['provider'];
    price = json['price'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['info'] = info;
    data['provider'] = provider;
    data['price'] = price;
    data['is_active'] = isActive;
    return data;
  }
}
