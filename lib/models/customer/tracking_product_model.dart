class TrackingProductModel {
  bool? success;
  String? message;
  List<Data>? data;

  TrackingProductModel({this.success, this.message, this.data});

  TrackingProductModel.fromJson(Map<String, dynamic> json) {
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
  String? transactionProductId;
  String? status;
  String? description;
  String? date;

  Data({this.transactionProductId, this.status, this.description, this.date});

  Data.fromJson(Map<String, dynamic> json) {
    transactionProductId = json['transaction_product_id'];
    status = json['status'];
    description = json['description'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['transaction_product_id'] = transactionProductId;
    data['status'] = status;
    data['description'] = description;
    data['date'] = date;
    return data;
  }
}
