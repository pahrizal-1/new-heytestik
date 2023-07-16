class TransactionHistoryModel {
  bool? success;
  String? message;
  Data? data;

  TransactionHistoryModel({this.success, this.message, this.data});

  TransactionHistoryModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Data2>? data;
  Meta? meta;

  Data({this.data, this.meta});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data2>[];
      json['data'].forEach((v) {
        data!.add(Data2.fromJson(v));
      });
    }
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class Data2 {
  String? id;
  int? customerId;
  int? medicalHistoryId;
  int? duration;
  int? totalFee;
  int? totalDiscount;
  int? totalPaid;
  int? paymentMethodId;
  String? paymentStatus;
  String? status;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  PaymentMethod? paymentMethod;

  Data2(
      {this.id,
      this.customerId,
      this.medicalHistoryId,
      this.duration,
      this.totalFee,
      this.totalDiscount,
      this.totalPaid,
      this.paymentMethodId,
      this.paymentStatus,
      this.status,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.paymentMethod});

  Data2.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    medicalHistoryId = json['medical_history_id'];
    duration = json['duration'];
    totalFee = json['total_fee'];
    totalDiscount = json['total_discount'];
    totalPaid = json['total_paid'];
    paymentMethodId = json['payment_method_id'];
    paymentStatus = json['payment_status'];
    status = json['status'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    paymentMethod = json['payment_method'] != null
        ? PaymentMethod.fromJson(json['payment_method'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['customer_id'] = customerId;
    data['medical_history_id'] = medicalHistoryId;
    data['duration'] = duration;
    data['total_fee'] = totalFee;
    data['total_discount'] = totalDiscount;
    data['total_paid'] = totalPaid;
    data['payment_method_id'] = paymentMethodId;
    data['payment_status'] = paymentStatus;
    data['status'] = status;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    if (paymentMethod != null) {
      data['payment_method'] = paymentMethod!.toJson();
    }
    return data;
  }
}

class PaymentMethod {
  int? id;
  String? name;
  String? method;
  String? type;
  dynamic accountNumber;
  bool? isActive;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  PaymentMethod(
      {this.id,
      this.name,
      this.method,
      this.type,
      this.accountNumber,
      this.isActive,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  PaymentMethod.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    method = json['method'];
    type = json['type'];
    accountNumber = json['account_number'];
    isActive = json['is_active'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['method'] = method;
    data['type'] = type;
    data['account_number'] = accountNumber;
    data['is_active'] = isActive;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}

class Meta {
  int? page;
  int? take;
  int? itemCount;
  int? pageCount;
  bool? hasPreviousPage;
  bool? hasNextPage;

  Meta(
      {this.page,
      this.take,
      this.itemCount,
      this.pageCount,
      this.hasPreviousPage,
      this.hasNextPage});

  Meta.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    take = json['take'];
    itemCount = json['itemCount'];
    pageCount = json['pageCount'];
    hasPreviousPage = json['hasPreviousPage'];
    hasNextPage = json['hasNextPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    data['take'] = take;
    data['itemCount'] = itemCount;
    data['pageCount'] = pageCount;
    data['hasPreviousPage'] = hasPreviousPage;
    data['hasNextPage'] = hasNextPage;
    return data;
  }
}
