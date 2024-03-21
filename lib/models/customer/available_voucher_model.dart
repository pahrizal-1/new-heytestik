class AvailableVoucherModel {
  bool? success;
  String? message;
  Data? data;

  AvailableVoucherModel({this.success, this.message, this.data});

  AvailableVoucherModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = this.success;
    data['message'] = this.message;
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
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    return data;
  }
}

class Data2 {
  int? id;
  String? type;
  String? name;
  String? periodStart;
  String? periodEnd;
  bool? repeatNextMonth;
  dynamic repeatThroughout;
  String? targetVoucher;
  String? code;
  String? promotionType;
  int? freeShippingAmount;
  String? discountType;
  int? discountFixAmount;
  int? discountPercentage;
  int? minimumPurchase;
  int? quota;
  String? targetBuyer;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  dynamic description;
  int? discountPercentageMaximumAmount;

  Data2(
      {this.id,
      this.type,
      this.name,
      this.periodStart,
      this.periodEnd,
      this.repeatNextMonth,
      this.repeatThroughout,
      this.targetVoucher,
      this.code,
      this.promotionType,
      this.freeShippingAmount,
      this.discountType,
      this.discountFixAmount,
      this.discountPercentage,
      this.minimumPurchase,
      this.quota,
      this.targetBuyer,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.description,
      this.discountPercentageMaximumAmount});

  Data2.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    name = json['name'];
    periodStart = json['period_start'];
    periodEnd = json['period_end'];
    repeatNextMonth = json['repeat_next_month'];
    repeatThroughout = json['repeat_throughout'];
    targetVoucher = json['target_voucher'];
    code = json['code'];
    promotionType = json['promotion_type'];
    freeShippingAmount = json['free_shipping_amount'];
    discountType = json['discount_type'];
    discountFixAmount = json['discount_fix_amount'];
    discountPercentage = json['discount_percentage'];
    minimumPurchase = json['minimum_purchase'];
    quota = json['quota'];
    targetBuyer = json['target_buyer'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    description = json['description'];
    discountPercentageMaximumAmount =
        json['discount_percentage_maximum_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['type'] = this.type;
    data['name'] = this.name;
    data['period_start'] = this.periodStart;
    data['period_end'] = this.periodEnd;
    data['repeat_next_month'] = this.repeatNextMonth;
    data['repeat_throughout'] = this.repeatThroughout;
    data['target_voucher'] = this.targetVoucher;
    data['code'] = this.code;
    data['promotion_type'] = this.promotionType;
    data['free_shipping_amount'] = this.freeShippingAmount;
    data['discount_type'] = this.discountType;
    data['discount_fix_amount'] = this.discountFixAmount;
    data['discount_percentage'] = this.discountPercentage;
    data['minimum_purchase'] = this.minimumPurchase;
    data['quota'] = this.quota;
    data['target_buyer'] = this.targetBuyer;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['description'] = this.description;
    data['discount_percentage_maximum_amount'] =
        this.discountPercentageMaximumAmount;
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
    data['page'] = this.page;
    data['take'] = this.take;
    data['itemCount'] = this.itemCount;
    data['pageCount'] = this.pageCount;
    data['hasPreviousPage'] = this.hasPreviousPage;
    data['hasNextPage'] = this.hasNextPage;
    return data;
  }
}
